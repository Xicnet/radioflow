var playButton;
var myMedia   = null;
var isPlaying = false;
var isStarting = false;
 
var mediaAudio = {
	play: function() {
		console.log("streamURL in media plugin player : " + window.streamURL);
		myMedia = new Media(window.streamURL, this.stop, mediaError, mediaStatus);
		myMedia.play();     
		$(".player-control").removeClass("fa-play").addClass("fa-pause").addClass("smaller").removeClass("bigger");
		getProgramInfo();
		app.addToCal();
	},
	stop: function() {
		$(".player-control").removeClass("fa-pause").addClass("fa-play").addClass("bigger").removeClass("smaller");
		isPlaying = false;
		app.removeNoti();
		hideProgramInfo();
		myMedia.pause();
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
		window.isPlaying = false;
		isPlaying = false;
		isStarting = true;
		$("#program-info").css("visibility", "visible");
		$("#buffering").css("visibility", "visible");
		return;
	}
	if(e==2) {
		$("#buffering").css("visibility", "hidden");
		isPlaying = true; 
		isStarting = false;
		window.isPlaying = true; 
		getProgramInfo();
		return;
	}
	window.isPlaying = false;
	$("#buffering").css("visibility", "hidden");
	return;
}

function mediaError(error){
	$(".player-control").removeClass("fa-pause").addClass("fa-play");
	console.log("RNA Media Error: "+ error.message);
	window.isPlaying = false;
	isStarting = false;
	$("#buffering").css("visibility", "hidden");
	return;
}
