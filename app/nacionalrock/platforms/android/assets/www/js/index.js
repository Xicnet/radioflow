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
	var id = 1, dialog;
	//StatusBar.hide();

	// Override back button
	document.addEventListener("backbutton", ShowExitDialog, false);
	$('.play-button').on('tap', onTapPlayHandler);
	function onTapPlayHandler() {
		$(this).find('.glyph-icon').addClass('blink');
	}

	$('.links').on('tap', onTapHandler);
	function onTapHandler() {
		$(this).find('.glyph-icon').addClass('blink');
		setTimeout(function(){ $('div').removeClass('blink');}, 2000);
	}

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

	$.ajaxSetup({
		timeout: 3000, 
		retryAfter:7000
	});

	function getConfig(){
		$.ajax({
			url: url,
			global: false,
			type: "GET",
			dataType: "json",
			async:true,
		})
		.success(function(data){
			//alert('Ajax request worked');
			appSetup(data);
		})
		.error(function(){
			setTimeout (getConfig, $.ajaxSetup().retryAfter);
		});
	}

	function appSetup(config) {
		// Set streamURL as a global variable to be used by player
		if (config.streamurl) {
			window.streamURL = config.streamurl;
		}
		if (config.facebook) {
			window.facebook = config.facebook;
		}
		if (config.twitter) {
			window.twitter = config.twitter;
		}
		if (config.web) {
			window.web = config.web;
		}
		if (config.email) {
			window.email = config.email;
		}
		setBackgroundImage(config.image);
		if (config.logourl) {
			setLogoImage(config.logourl);
		}
               	$("#wrapper").css("display", "block");
               	$("#loading").css("display", "none");
	}
	getConfig();


	// Set background image
	function setBackgroundImage(url) {
		$("html").css({'background-image':"url('"+url+"')"});
	}
	function setLogoImage(url) {
		$(".logo").attr('src', url);
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
    notificationCallback: function () {
            window.plugins.toast.showShortBottom("Gracias por escucharnos! Volvé pronto ;-)");
    },
    showNotification: function() {
	var success = function() { console.log("Notification successfully added"); };
        var error = function(message) { console.log("Oopsie! " + message); };
        //statusbarnotification.createEvent(success, error);
        cordova.plugins.notification.local.schedule({
            id: 1,
            text: 'Program info here',
            autoClear: false,
            ongoing: true,
            icon: 'http://3.bp.blogspot.com/-Qdsy-GpempY/UU_BN9LTqSI/AAAAAAAAAMA/LkwLW2yNBJ4/s1600/supersu.png',
            smallIcon: 'res://cordova',
            sound: null,
            data: { test: 1 }
        });
    },

    clearNotification: function() {
	var success = function() { console.log("Notification successfully added"); };
	var success = function(message) { console.log("Remove noti"); };
	var error = function(message) { console.log("Oopsie! " + message); };
       	//statusbarnotification.removeNotification(success, error);
        cordova.plugins.notification.local.clear(1, this.notificationCallback);
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
                                $('#program-name').css("visibility", "visible");
			} else {
                                $('#program-name').css("visibility", "hidden");
			}
                        if(data.presenter) {
                                $('#presenter').html(data.presenter);
                                $('#program-presenter').css("visibility", "visible");
                        } else {
                                $('#program-presenter').css("visibility", "hidden");
                        }
	                if(data.show_labels) {
	                	$('.infopanel-label').css("display", "inline");
			} else {
	                	$('.infopanel-label').css("display", "none");
			}
	                if(data.image.length > 0) {
	                	var image = data.image_url;
				$(".program-image").attr("src", image);
	                	$(".program-image").css("visibility", "visible");
			}
	                $(".program-info").css("visibility", "visible");
			$(".infopanel-container").css("visibility", "visible");
	        });
	}
}

// Check for program info changes
var checkInterval = 1;
var timerUnit = 60000;
var interval = setInterval(getProgramInfo, timerUnit * checkInterval);

function hideProgramInfo()
{
                $(".infopanel-container").css("visibility", "hidden");
                $(".program-info").css("visibility", "hidden");
		$(".program-image").css("visibility", "hidden");
		$('#program-name').css("visibility", "hidden");
		$('#program-presenter').css("visibility", "hidden");
}


function buildContact(contact)
{
	if(contact.indexOf("http://") == 0) {
		return contact;
	} else {
		return "mailto:" + contact;
	}
}
