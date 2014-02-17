	var myMedia = null;
	playing     = false;
	var streamURL;
       
	function playAudio() {
		if (!playing) {
			//var streamURL = "http://37.59.19.104:8162/;stream.nsv";
			if(device.platform == "Android") {
				myMedia = new Media(streamURL, stopAudio, null);
				app.addToCal();
			} else {
				myMedia = new Audio(streamURL, stopAudio, null);
			}
			myMedia.play();     
			document.getElementById('play').src = "img/pause.png";
			playing = true; 
			getProgramInfo();
		} else {
			/*
			hideProgramInfo();
			if(device.platform == "Android") {
				app.removeNoti();
			}
			myMedia.pause();
			myMedia.release();
			document.getElementById('play').src = "img/play.png";   
			playing = false;
			*/
			stopAudio();
		}
	}
 
	function stopAudio() {
		if(device.platform == "Android") {
			app.removeNoti();
		}
		myMedia.pause();
		hideProgramInfo();
		playing = false;
		document.getElementById('play').src = "img/play.png";   
		//document.getElementById('audio_position').innerHTML = "0.000 sec";
		myMedia.release();
	}
 
	function onDeviceReady(){
		console.log("Got device ready");
		//updateMedia();
	}
