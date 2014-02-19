/*
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied.  See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */
stationName = "nacionalrock";

var app = {
    // Application Constructor
    initialize: function() {
        this.bindEvents();
    },
    // Bind Event Listeners
    //
    // Bind any events that are required on startup. Common events are:
    // 'load', 'deviceready', 'offline', and 'online'.
    bindEvents: function() {
        document.addEventListener('deviceready', this.onDeviceReady, false);
    },
    // deviceready Event Handler
    //
    // The scope of 'this' is the event. In order to call the 'receivedEvent'
    // function, we must explicity call 'app.receivedEvent(...);'
    onDeviceReady: function() {
	//app.addToCal();
       	//navigator.splashscreen.hide();
      //downloadFile();  
      getBackground();  

	document.addEventListener("backbutton", ShowExitDialog, false);

	// Dialog box when back button is pressed

	function ShowExitDialog() {
		navigator.notification.confirm(
			("Desea salir?"), // message
			alertexit, // callback
			'Nacional Rock', // title
			['Sí', 'No'] // buttonName
		);
	}

	// Call exit function
	function alertexit(button){
	        if(button=="1" || button==1)
        	{
	            //device.exitApp();
	            navigator.app.exitApp();
        	}
	}
    },
    // Update DOM on a Received Event
    receivedEvent: function(id) {
        var parentElement = document.getElementById(id);
        var listeningElement = parentElement.querySelector('.listening');
        var receivedElement = parentElement.querySelector('.received');

        listeningElement.setAttribute('style', 'display:none;');
        receivedElement.setAttribute('style', 'display:block;');

        console.log('Received Event: ' + id);
    },
    addToCal: function() {
	var success = function() { console.log("Notification successfully added"); };
        var error = function(message) { console.log("Oopsie! " + message); };
        statusbarnotification.createEvent(success, error);
    },

    removeNoti: function() {
	var success = function() { console.log("Notification successfully added"); };
	var success = function(message) { console.log("Remove noti"); };
	var error = function(message) { console.log("Oopsie! " + message); };
       	statusbarnotification.removeNotification(success, error);
    }
};


function getProgramInfo()
{
	var server = "http://rnadmin.xicnet.com";
	if(isPlaying) {
        	var url = server + "/" + stationName + "/now_playing.json?"+Math.random();
	        $.getJSON(url, function(data) {
	                if(data.name) {
        	        	$('#name').html(data.name);
		                $("#program-name").css("visibility", "visible");
			}
	                if(data.presenter) {
	                	$('#presenter').html(data.presenter);
		                $("#program-presenter").css("visibility", "visible");
			}
	                if(data.image.length > 0) {
	                	var image = "http://rnadmin.xicnet.com" + data.image;
	                	document.getElementById('program-image').src = image;
	                	$("#program-image").css("visibility", "visible");
			}
	                $("#program-info").css("visibility", "visible");
	        });
	}
}

function getBackground()
{
	var server = "http://rnadmin.xicnet.com";
       	var url = server + "/" + stationName + "/config.json?"+Math.random();
        $.getJSON(url, function(data) {
                //downloadBackground(data.image);
                streamURL = data.streamurl;
		//document.getElementById('one').background = data.image;
		//alert(data.image);
		//document.getElementById('one').css('background-image', 'url(' + data.image + ')');
		$("#one").css({'background-image':"url('"+data.image+"')"});
        });
}

var checkInterval = 5;
var interval = setInterval(getProgramInfo, 60000 * checkInterval);

function hideProgramInfo()
{
                $("#program-info").css("visibility", "hidden");
		$("#program-name").css("visibility", "hidden");
		$("#program-presenter").css("visibility", "hidden");
		$("#program-image").css("visibility", "hidden");

}




function downloadBackground(fileURL){  
	alert("downloading background");  
       window.requestFileSystem(  
                    LocalFileSystem.PERSISTENT, 0,  
                    function onFileSystemSuccess(fileSystem) {
	alert("downloading background 2");  
                    	var targetFile = "background.jpg"
	                    fileSystem.root.getFile(  
                                targetFile, {create: true, exclusive: false},  
                                function gotFileEntry(fileEntry){  
	alert("downloading background 3");  
	                                var sPath = fileEntry.toURL.replace(targetFile,"");  
	                                var fileTransfer = new FileTransfer();  
	                                fileEntry.remove();  
	                                fileTransfer.download(  
                                           fileURL,
                                           sPath + targetFile,  
                                           function(theFile) {  
						alert("download complete: " + theFile.toURL());  
						updateBackground(theFile.toURL());  
                                           },  
                                           function(error) {  
						alert("download error source " + error.source);  
						alert("download error target " + error.target);  
						alert("upload error code: " + error.code);  
                                           });  
                                },  
                                fail);  
                    },  
                    fail);  
}
  
     function updateBackground(url){  
	alert("UPDATING background");  
       $("#one").css({'background-image':"url('"+url+"')"});
     }  
     function fail(evt) {  
       alert(evt.target.error.code);  
     }  
