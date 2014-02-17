cordova.define("org.devgirl.statusbarnotification.StatusBarNotification", function(require, exports, module) { var statusbarnotification = {
    createEvent: function(successCallback, errorCallback) {
        cordova.exec(
            successCallback, // success callback function
            errorCallback, // error callback function
            'StatusBarNotification', // mapped to our native Java class called "CalendarPlugin"
            'addCalendarEntry', // with this action name
            [{                  // and this array of custom arguments to create our entry
            }]
        ); 
    },
    removeNotification: function(successCallback, errorCallback) {
        cordova.exec(
            successCallback, // success callback function
            errorCallback, // error callback function
            'StatusBarNotification', // mapped to our native Java class called "CalendarPlugin"
            'removeNotification', // with this action name
            [{                  // and this array of custom arguments to create our entry
            }]
        ); 
    }
}
module.exports = statusbarnotification;

});
