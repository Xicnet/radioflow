	var myMedia   = null;
	var isPlaying = false;
	var streamURL;
       
	function audioToggle() {
		if (!isPlaying) {
			playAudio();
		} else {
			stopAudio();
		}
	}
 
	function playAudio() {
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
