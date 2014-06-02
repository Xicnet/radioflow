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

	// Override back button
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

	// Server to fetch config (background image and streamURL) from
	var url = window.server + "/" + stationName + "/config.json?"+Math.random();

	// Fetch the config
	/*
	data = $.ajax({
		url: url,
		global: false,
		type: "GET",
		dataType: "json",
		async:false,
		success: function(data) {
				// Set streamURL as a global variable to be used by player
				if (data.streamurl) {
					window.streamURL = data.streamurl;
				}
				setBackgroundImage(data.image);
	                	//$("#loading").css("display", "none");
	                	$(".controls").css("display", "block");
			}
		});
	*/

	data = $.get( url, { name: "John", time: "2pm" } )
			.done(function( data ) {
				setBackgroundImage(data.image);
				setStreamURL(data.streamurl);
	                	$(".controls").css("display", "block");
			});

	// Set background image
	function setBackgroundImage(url) {
		$("div#wrapper").css({'background-image':"url('"+url+"')"});
	}
	function setStreamURL(url) {
		if (url) {
			window.streamURL = url;
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
    },
    audioToggle: function() {
	console.log("............ in audioToggle()");
	if(device.platform == "iOS") {
		player = html5audio;
		console.log("html5audio PLAYER: " + window.streamURL);
	} else {
		player = mediaAudio;
		console.log("mediaPlugin PLAYER: " + window.streamURL);
	}
	if (isPlaying || isStarting) {
		player.stop();
	} else {
		player.play();
	}   
    },
    socialLink: function() {
	    alert($(this));
    }

};


function getProgramInfo()
{
	if(window.isPlaying == false) {
		return;
	}
	if(isPlaying) {
        	var url = window.server + "/" + stationName + "/now_playing.json?"+Math.random();
        	console.log("getProgramInfo url : " + url);
	        $.getJSON(url, function(data) {
	                if(data.name) {
        	        	$('#name').html(data.name);
			}
	                if(data.presenter) {
	                	$('#presenter').html(data.presenter);
			}
	                if(data.image.length > 0) {
	                	var image = data.image_url;
				$(".program-image").attr("src", image);
	                	$(".program-image").css("display", "block");
			}
	                $(".program-info").css("display", "block");
	        });
	}
}

// Check for program info changes
var checkInterval = 1;
var timerUnit = 60000;
var timerUnit = 6000;
var interval = setInterval(getProgramInfo, timerUnit * checkInterval);

function hideProgramInfo()
{
                $(".program-info").css("display", "none");
		//$("#program-name").css("display", "none");
		//$("#program-presenter").css("display", "none");
		$(".program-image").css("display", "none");

}

$('a').on('touchstart', function(e){
	    $(this).addClass('tapped');
	    alert("pepe");
});
 
$('a').on('touchend', function(e){
	    $(this).removeClass('tapped');
	    alert("pipo");
});

