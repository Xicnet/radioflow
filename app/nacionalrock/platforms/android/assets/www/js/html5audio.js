
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
			 isPlaying = true;
			 isWaiting = false;
			$("#playicon").removeClass("flaticon-play").addClass("flaticon-pause");
			$(".play-button .triangle .glyph .glyph-icon").removeClass("flaticon-play").addClass("flaticon-pause");
			$("div").removeClass('blink');
			getProgramInfo();
		}, false);
		myaudio.addEventListener("ended", function() {
			 navigator.notification.alert('Hay problemas con tu conexión a Internet.\nIntentá nuevamente.', this.onEnded, 'Desconectado', 'OK');
			$(".play-button .triangle .glyph .glyph-icon").removeClass("flaticon-pause").addClass("flaticon-play");
			$("div").removeClass('blink');
			$(".program-info").css("visibility", "hidden");

		}, false);
	},
	pause: function() {
		isPlaying = false;
		myaudio.pause();
		$(".play-button .triangle .glyph .glyph-icon").removeClass("flaticon-pause").addClass("flaticon-play");
		$("div").removeClass('blink');
	},
	stop: function() {
		$(".play-button .triangle .glyph .glyph-icon").removeClass("flaticon-pause").addClass("flaticon-play");
		$("div").removeClass('blink');
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
