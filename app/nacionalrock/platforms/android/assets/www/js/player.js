var playButton;
var myMedia   = null;
var isPlaying = false;
var streamURL;
       
 
var mediaAudio = {
	play: function() {
		var streamURL = "http://5.9.56.134:8162/;stream.nsv";
		myMedia = new Media(streamURL, this.stop, mediaError, mediaStatus);
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
