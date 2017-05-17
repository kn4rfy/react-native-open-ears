/*
React Native Speech Notification Plugin
https://github.com/kn4rfy/react-native-geofence

Created by FRANCIS KNARFY ELOPRE
https://github.com/kn4rfy

MIT License
*/

'use strict';

var { DeviceEventEmitter, NativeEventEmitter, NativeModules, Alert } = require('react-native');
const RNOpenEars = NativeModules.OpenEars;
const RNOpenEarsEmitter = new NativeEventEmitter(NativeModules.OpenEars);

var OpenEars = {
    startListening: function(params) {
        RNOpenEarsEmitter.addListener('micPermissionDenied', (reminder) => {
            Alert.alert(
            'Permissions',
            'App needs Permission to use Microphone to enable Speech Recognition.',
            [
              {text: 'Settings', onPress: () => RNOpenEars.gotoSettings()},
            ]
          )
        });
        RNOpenEars.startListening(params);
    },
    stopListening: function() {
        RNOpenEarsEmitter.removeListener('micPermissionDenied', (reminder) => {});
        RNOpenEars.stopListening();
    },
    suspendRecognition: function() {
        RNOpenEars.suspendRecognition();
    },
    resumeRecognition: function() {
        RNOpenEars.resumeRecognition();
    }
};

module.exports = OpenEars;
