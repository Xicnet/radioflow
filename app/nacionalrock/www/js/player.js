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
	console.log("RNA Media Status: "+ e);
}

function mediaError(error){
	console.log("RNA Media Error: "+ error);
}
