
var playButton;
var myaudioURL = 'http://5.9.56.134:8162/;stream.nsv';
var myaudio    = new Audio(myaudioURL);
var isPlaying  = false;


function onError(error) 
{
	console.log(error.message);
}

function retryPlay(button) {
	html5audio.stop();
	html5audio.play();
}

function onConfirmRetry(button) {
	if (button == 1) {
		html5audio.play();
	}
}

var html5audio = {
	play: function()
	{
		isPlaying = true;
		myaudio.play();
		playButton.src = "img/pause.png";
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
			 playButton.src = "img/pause.png";

		}, false);
		myaudio.addEventListener("ended", function() {
			 navigator.notification.alert('Hay problemas con tu conexión a Internet.\nIntentá nuevamente.', this.onEnded, 'Desconectado', 'OK');

		}, false);
	},
	pause: function() {
		isPlaying = false;
		playButton.src = "img/play.png";
		myaudio.pause();
	},
	stop: function() {
		isPlaying = false;
		playButton.src = "img/play.png";
		myaudio.pause();
		myaudio = null;
		myaudio = new Audio(myaudioURL);
		if(device.platform == "Android") {
			app.removeNoti();
		}
		hideProgramInfo();
	},
	onEnded: function() {
		alert("JAJA");
		this.stop()
	}
};
