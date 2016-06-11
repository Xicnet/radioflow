var playButton;
var myMedia   = null;
var isPlaying = false;
var isStarting = false;
 
var mediaAudio = {
	play: function() {
		console.log("streamURL in media plugin player : " + window.streamURL);
		myMedia = new Media(window.streamURL, this.stop, mediaError, mediaStatus);
		myMedia.play();     
		getProgramInfo();
		if(device.platform == "Android") {
			app.showNotification();
		}
	},
	stop: function() {
		//$(".play-button .triangle .glyph .glyph-icon").removeClass("flaticon-pause flaticon-play").addClass("flaticon-play");
		//$(".play-button").removeClass("flaticon-pause").removeClass("flaticon-play").addClass("flaticon-play");
		$("div").removeClass('blink');
		isPlaying = false;
                app.clearNotification();
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
		//$(".player-container .triangle i").removeClass("fa-play").addClass("fa-circle-o-notch fa-spin");
		//$(".play-button .triangle .glyph .glyph-icon").removeClass("glyph-icon flaticon-play").addClass("glyph-icon flaticon-turn4 fa-spin");
		return;
	}
	if(e==2) {
		//$(".player-container .triangle i").removeClass("fa-circle-o-notch fa-spin").addClass("fa-pause");
		$(".play-button .triangle .glyph .glyph-icon").removeClass("flaticon-play").addClass("flaticon-pause");
		$("div").removeClass('blink');
		isPlaying = true; 
		isStarting = false;
		window.isPlaying = true; 
		getProgramInfo();
		return;
	}
	if(e==4) {
		$(".play-button .triangle .glyph .glyph-icon").removeClass("flaticon-pause").addClass("flaticon-play");
		$(".program-info").css("visibility", "hidden");
	}
	if(e==undefined) {
		$(".play-button").removeClass("blink");
	}
	window.isPlaying = false;
	return;
}

function mediaError(error){
	$(".play-button").removeClass("flaticon-pause").removeClass("flaticon-play");
	$("div").removeClass('blink');
	console.log("RNA Media Error: "+ error.message);
	window.isPlaying = false;
	isStarting = false;
	$("#buffering").css("display", "none");
	return;
}
