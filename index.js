/*
  React Native Speech Notification Plugin
  https://github.com/kn4rfy/react-native-geofence

  Created by FRANCIS KNARFY ELOPRE
  https://github.com/kn4rfy

  MIT License
*/

'use strict';

var { DeviceEventEmitter, NativeModules } = require('react-native');
const RNOpenEars = NativeModules.OpenEars;

var OpenEars = {
  startListening: function(params) {
    RNOpenEars.startListening(params);
  },
  stopListening: function() {
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
