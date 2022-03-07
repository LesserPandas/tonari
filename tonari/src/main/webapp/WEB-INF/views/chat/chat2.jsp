<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Chat</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="/resources/test/chat/style.css" rel="stylesheet">
</head>

<body>
	<div class="fabs">


		<div class="chat" id="chat-list">
			<div class="chat_header">
				<div class="chat_option">
					<span class="chat_head">チャットリスト</span> <span
						id="chat_fullscreen_loader" class="chat_fullscreen_loader"><i
						class="fullscreen zmdi zmdi-window-maximize"></i></span>
				</div>
			</div>

			<div id="chat-list-body" class="chat_body chat_converse chat_ani chat-list-body" style="height:459px">
			
				<div class="">
						<div class="chat-profile">
							<div class="chat-image"></div>
						</div>
						<div class="chat-message-body" onclick="controllChat(2)">
							<p class="chat-p chat-sender">김찬호</p>
							<p class="chat-p chat-message">보낸 메세지는 여기 출력됩니다.	</p>
						</div>
						<div class="chat-timeline">
							<p class="chat-p">03/10</p>
						</div>
				</div>
				
			</div>
		</div>


		<div class="chat" id="chat-room">
			<div class="chat_header">
				<div class="chat_option">
					<a href="javascript:controllChat(1)"><i class="zmdi zmdi-arrow-left"></i></a>
					<span class="chat_head chat_head_room">사람 이름</span> <span
						id="chat_fullscreen_loader" class="chat_fullscreen_loader"><i
						class="fullscreen zmdi zmdi-window-maximize"></i></span>

				</div>

			</div>
			<div id="chat-room-body" class="chat_body chat_converse">
				<span class="chat_msg_item chat_msg_item_admin"> 상대 메세지</span>
				<span class="chat_msg_item chat_msg_item_user">
					내가 보낸 메세지</span>

			</div>

			<div class="fab_field">

				<a id="fab_send" class="fab"><i class="zmdi zmdi-mail-send"></i></a>
				<textarea id="myMessage" name="chat_message"
					placeholder="Send a message" class="chat_field chat_message"></textarea>
			</div>
		</div>


		<a id="prime" class="fab chat_tab"><i
			class="prime zmdi zmdi-comment-outline"></i></a>
	</div>

</body>
<script src="/resources/test/chat/script.js"></script>

<script>

controllChat(0);

$('#prime').click(function() {
  toggleFab();
});


//Toggle chat and links
function toggleFab() {
  $('.prime').toggleClass('zmdi-comment-outline');
  $('.prime').toggleClass('zmdi-close');
  $('.prime').toggleClass('is-active');
  $('.prime').toggleClass('is-visible');
  $('#prime').toggleClass('is-float');
  $('.chat').toggleClass('is-visible');
  $('.fab').toggleClass('is-visible');
  
  
}

function controllChat(hide) {
    switch (hide) {
      case 0:
            $('#chat-list').css('display', 'none');
            $('#chat-room').css('display', 'none');
            break;
      case 1:
            $('#chat-list').css('display', 'block');
            $('#chat-room').css('display', 'none');
            break;
      case 2:
          $('#chat-list').css('display', 'none');
          $('#chat-room').css('display', 'block');
          break;
    }
}


</script>

</html>