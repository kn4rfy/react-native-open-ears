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
  registerVocabulary: function(params) {
    RNOpenEars.registerVocabulary(params);
  }
};

module.exports = OpenEars;
