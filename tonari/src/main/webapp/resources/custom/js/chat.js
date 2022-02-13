$(document).on('click', '.panel-heading span.icon_minim', function(e) {
	var $this = $(this);
	if (!$this.hasClass('panel-collapsed')) {
		$this.parents('.panel').find('.panel-body').slideUp();
		$this.addClass('panel-collapsed');
		$this.removeClass('glyphicon-minus').addClass('glyphicon-plus');
	} else {
		$this.parents('.panel').find('.panel-body').slideDown();
		$this.removeClass('panel-collapsed');
		$this.removeClass('glyphicon-plus').addClass('glyphicon-minus');
	}
});
$(document).on('focus', '.panel-footer input.chat_input', function(e) {
	var $this = $(this);
	if ($('#minim_chat_window').hasClass('panel-collapsed')) {
		$this.parents('.panel').find('.panel-body').slideDown();
		$('#minim_chat_window').removeClass('panel-collapsed');
		$('#minim_chat_window').removeClass('glyphicon-plus').addClass('glyphicon-minus');
	}
});


function chatPopup() {
	var stat = document.getElementById("chat_window").style.display;
	if (stat == "block") { document.getElementById("chat_window").style.display = "none"; 
	document.getElementById("panel-chat").style.display = "none";
	}
	else { document.getElementById("chat_window").style.display = "block"; 
	document.getElementById("panel-list").style.display = "block";}
}

function chatContentPopup() {
	var list = document.getElementById("panel-list").style.display;
	var content = document.getElementById("panel-chat").style.display;
	if (content == "block") { document.getElementById("panel-chat").style.display = "none";
	document.getElementById("panel-list").style.display = "block";
	}
	else { document.getElementById("panel-chat").style.display = "block"; 
	document.getElementById("panel-list").style.display = "none";}
}