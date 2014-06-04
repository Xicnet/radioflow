
var playButton;
var myaudio   = null;
var isPlaying = false;
var isWaiting = false;

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
		$(".player-container .triangle i").removeClass("fa-play").addClass("fa-circle-o-notch fa-spin");
		if(isWaiting) {
			myaudio.stop()
			return;
		}
		myaudio = null;
		myaudio = new Audio(window.streamURL);
		myaudio.play();
		if(device.platform == "Android") {
			app.addToCal();
		}

		myaudio.addEventListener("error", function() {
			 console.log('myaudio ERROR');
		}, false);
		myaudio.addEventListener("canplay", function() {
			 console.log('myaudio CAN PLAY');
		}, false);
		myaudio.addEventListener("waiting", function() {
			 //console.log('myaudio WAITING');
			 isPlaying = false;
			 isWaiting = true;
		}, false);
		myaudio.addEventListener("playing", function() {
			$(".player-container .triangle i").removeClass("fa-circle-o-notch fa-spin").addClass("fa-pause");
			 isPlaying = true;
			 isWaiting = false;
			 //stopButton.style.display = 'block';
			getProgramInfo();
		}, false);
		myaudio.addEventListener("ended", function() {
			 navigator.notification.alert('Hay problemas con tu conexión a Internet.\nIntentá nuevamente.', this.onEnded, 'Desconectado', 'OK');

		}, false);
	},
	pause: function() {
		isPlaying = false;
		myaudio.pause();
		$(".player-container .triangle i").removeClass("fa-pause").removeClass("fa-circle-o-notch fa-spin").addClass("fa-play");
	},
	stop: function() {
		$(".player-container .triangle i").removeClass("fa-pause").removeClass("fa-circle-o-notch fa-spin").addClass("fa-play");
		isPlaying = false;
		myaudio.pause();
		myaudio = null;
		myaudio = new Audio(window.streamURL);
		if(device.platform == "Android") {
			app.removeNoti();
		}
		hideProgramInfo();
	},
	onEnded: function() {
		console.log("JAJA");
		this.stop()
	}
};
