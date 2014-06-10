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
		app.addToCal();
	},
	stop: function() {
		$(".player-container .triangle .glyph .glyph-icon").removeClass("flaticon-mute4").addClass("flaticon-small31");
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
		//$(".player-container .triangle i").removeClass("fa-play").addClass("fa-circle-o-notch fa-spin");
		$(".player-container .triangle .glyph .glyph-icon").removeClass("glyph-icon flaticon-small31").addClass("glyph-icon flaticon-turn4 fa-spin");
		return;
	}
	if(e==2) {
		//$(".player-container .triangle i").removeClass("fa-circle-o-notch fa-spin").addClass("fa-pause");
		$(".player-container .triangle .glyph .glyph-icon").removeClass("flaticon-turn4 fa-spin").addClass("flaticon-mute4");
		isPlaying = true; 
		isStarting = false;
		window.isPlaying = true; 
		getProgramInfo();
		return;
	}
	if(e==4) {
		$(".program-info").css("visibility", "hidden");
	}
	window.isPlaying = false;
	return;
}

function mediaError(error){
	$(".player-control").removeClass("flaticon-mute4").addClass("flaticon-small31");
	console.log("RNA Media Error: "+ error.message);
	window.isPlaying = false;
	isStarting = false;
	$("#buffering").css("display", "none");
	return;
}
