var playButton;
var myMedia   = null;
var isPlaying = false;
 
var mediaAudio = {
	play: function() {
		console.log("streamURL in media plugin player : " + window.streamURL);
		myMedia = new Media(window.streamURL, this.stop, mediaError, mediaStatus);
		myMedia.play();     
		isPlaying = true; 
		playButton.src = "img/pause.png";
		getProgramInfo();
		app.addToCal();
	},
	stop: function() {
		app.removeNoti();
		hideProgramInfo();
		myMedia.pause();
		isPlaying = false;
		playButton.src = "img/play.png";   
		myMedia.release();
	}
}
 
function mediaStatus(e){
	/*
	Media.MEDIA_NONE = 0;
	Media.MEDIA_STARTING = 1;
	Media.MEDIA_RUNNING = 2;
	Media.MEDIA_PAUSED = 3;
	Media.MEDIA_STOPPED = 4;
	*/
	console.log("RNA Media Status: "+ e);
	if(e==1) {
		$("#buffering").css("display", "block");
	}
	if(e==2) {
		$("#buffering").css("display", "none");
	}
}

function mediaError(error){
	console.log("RNA Media Error: "+ error);
}
