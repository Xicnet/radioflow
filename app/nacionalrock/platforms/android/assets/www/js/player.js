	var myMedia   = null;
	var isPlaying = false;
	var streamURL;
       
	function audioToggle() {
		if (!isPlaying) {
			var streamURL = "http://5.9.56.134:8162/;stream.nsv";
			if(device.platform == "Android") {
				myMedia = new Media(streamURL, stopAudio, mediaError, mediaStatus);
				console.log(myMedia);
				app.addToCal();
			} else {
				myMedia = new Audio(streamURL, stopAudio, null);
			}
			myMedia.play();     
			document.getElementById('playButton').src = "img/pause.png";
			isPlaying = true; 
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
			isPlaying = false;
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
		isPlaying = false;
		document.getElementById('playButton').src = "img/play.png";   
		//document.getElementById('audio_position').innerHTML = "0.000 sec";
		myMedia.release();
	}
 
	function onDeviceReady(){
		console.log("RNA: Got device ready");
		//updateMedia();
	}

	function mediaStatus(e){
		console.log("RNA Media Status: "+ e);
	}

	function mediaError(error){
		console.log("RNA Media Error: "+ error);
	}
