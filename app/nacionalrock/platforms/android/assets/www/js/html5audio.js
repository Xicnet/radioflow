

var progressTimer;

var playButton;

function onError(error) 
{
	console.log(error.message);
}

function onConfirmRetry(button) {
	if (button == 1) {
		html5audio.play();
	}
}

function pad2(number) {
	return (number < 10 ? '0' : '') + number
}

var myaudioURL = 'http://37.59.19.104:8162/;stream.nsv';
var myaudio = new Audio(myaudioURL);
var isPlaying = false;

var html5audio = {
	play: function()
	{
		isPlaying = true;
		myaudio.play();
		document.getElementById('playButton').src = "img/pause.png";
		if(device.platform == "Android") {
			app.addToCal();
		}

		getProgramInfo();

		myaudio.addEventListener("error", function() {
			 console.log('myaudio ERROR');
		}, false);
		myaudio.addEventListener("canplay", function() {
			 console.log('myaudio CAN PLAY');
		}, false);
		myaudio.addEventListener("waiting", function() {
			 //console.log('myaudio WAITING');
			 isPlaying = false;
		}, false);
		myaudio.addEventListener("playing", function() {
			 isPlaying = true;
			 //stopButton.style.display = 'block';
			 document.getElementById('playButton').src = "img/pause.png";

		}, false);
		myaudio.addEventListener("ended", function() {
			 //console.log('myaudio ENDED');
			 html5audio.stop();
			 // navigator.notification.alert('Streaming failed. Possibly due to a network error.', null, 'Stream error', 'OK');
			 // navigator.notification.confirm(
			 //	'Streaming failed. Possibly due to a network error.', // message
			 //	onConfirmRetry,	// callback to invoke with index of button pressed
			 //	'Stream error',	// title
			 //	'Retry,OK'		// buttonLabels
			 // );
			 if (window.confirm('Streaming failed. Possibly due to a network error. Retry?')) {
			 	onConfirmRetry();
			 }
		}, false);
	},
	pause: function() {
		isPlaying = false;
		document.getElementById('playButton').src = "img/play.png";
		myaudio.pause();
	},
	stop: function() {
		isPlaying = false;
		document.getElementById('playButton').src = "img/play.png";
		myaudio.pause();
		myaudio = null;
		myaudio = new Audio(myaudioURL);
		if(device.platform == "Android") {
			app.removeNoti();
		}
		hideProgramInfo();
	}
};
