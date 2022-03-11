<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Chat</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="/resources/test/chat/style.css" rel="stylesheet">


<script
	src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>

</head>

<body>
	<div class="fabs">


		<div class="chat" id="chat-list" style="border-radius: 20px">
			<div class="chat_header">
				<div class="chat_option">
					<span class="chat_head">チャットリスト</span>
				</div>
			</div>

			<div id="chat-list-body"
				class="chat_body chat_converse chat-list-body" style="height: 459px">

				<div class="chat-row">
					<div class="chat-profile">
						<div class="chat-image"></div>
					</div>
					<div class="chat-message-body" onclick="controllChat(2)">
						<p class="chat-p chat-sender">김찬호</p>
						<p class="chat-p chat-message">보낸 메세지는 여기 출력됩니다.</p>
					</div>
					<div class="chat-timeline">
						<p class="chat-p">03/10</p>
					</div>
				</div>

			</div>
		</div>


		<div class="chat block" id="chat-room" style="border-radius: 20px">
			<div class="chat_header">
				<div class="chat_option">
					<a href="javascript:controllChat(1)"
						style="position: absolute; margin-left: 100px !important;"><img
						src="/resources/test/chat/angle-left.png"></a> <span
						class="chat_head chat_head_room" id="yourName">사람 이름</span>

				</div>

			</div>
			<div id="chat-room-body" class="chat_body chat_converse"
				style="overflow-y: scroll">
				<span class="chat_msg_item chat_msg_item_admin"> 상대 메세지</span> <span
					class="chat_msg_item chat_msg_item_user"> 내가 보낸 메세지</span>

			</div>

			<div class="fab_field">

				<a id="fab_send" class="fab"
					href="javascript:message_send(${nowUser.bno })"><img
					src="/resources/test/chat/send.png"></a>
				<textarea id="myMessage" name="chat_message"
					placeholder="Send a message" class="chat_field chat_message"></textarea>
			</div>
		</div>


		<a id="prime" class="fab chat_tab"><img
			src="/resources/test/chat/chat.png" alt="" style="margin-top: 14px;"></a>
	</div>

</body>

<script>
	window.member_bno = 0;
	window.room_bno = 0;
	window.nick = "";
	window.stat = 1;
	controllChat(-1, 0, 0, 0);
	
	$('#prime').click(function() {
		toggleFab();
	});

	//Toggle chat and links
	function toggleFab() {
		$('.prime').toggleClass('is-active');
		$('.prime').toggleClass('is-visible');
		$('#prime').toggleClass('is-float');
		$('.chat').toggleClass('is-visible');
		$('.fab').toggleClass('is-visible');
		$('#chat-list').toggleClass('chat_ani');
		controllChat(stat, 0, 0, 0);
		stat = stat * -1;
	}

	function controllChat(hide, memberBno, room, nickname) {
		switch (hide) {
		case -1:
			$('#chat-list').removeClass('block');
			$('#chat-room').removeClass('block');
			break;
		case 1:
			$('#chat-list').addClass('block');
			$('#chat-room').removeClass('block');
			getJoinRoomList(${nowUser.bno});
			break;
		case 2:
			$('#chat-list').removeClass('block');
			$('#chat-room').addClass('block');
			getMessageList(room, nickname);
			member_bno = memberBno;
			room_bno = room;
			nick = nickname;
			break;
		}
	}
	
	
	function getJoinRoomList(nowUserNum){
		document.getElementById('chat-list-body').innerText = '';
		var bno = nowUserNum;
		$.ajax({
			type : 'get',
			url : "/chat/myChatList",
			data : {
				bno: bno
			},
			dataType : 'json',
			success : function(data) {
				//let str = JSON.stringify(data); // <> parse()
				//alert(data.length);
				
				$.each(data, function(index, item) { // 데이터 =item
								
					const html =	'<div class="chat-row">' +
													'<div class="chat-profile">' +
														'<div class="chat-image"><img class="chat-image" src="' + item.image + '"></div>' +
													'</div>' +
													'<div class="chat-message-body" id="room-'+item.room_bno+'" onclick="controllChat(2,'+ item.member_bno + ',' + item.room_bno + ',\'' + item.nick + '\')">' +
														'<p class="chat-p chat-sender">' + item.nick + '</p>' +
														'<p class="chat-p chat-message">'+ item.content +'</p>' +
													'</div>' +
													'<div class="chat-timeline">' +
														'<p class="chat-p">' + item.dateString + '</p>' +
													'</div>' +
												'</div>';
				
				const below = document.getElementById("chat-list-body");
				below.insertAdjacentHTML('beforeend', html); // 맨 아래 채팅 추가
					
				
				});
				connect(bno);	
			},
			error : function() {
				alert("통신에러");
			}
		})
	}



	var sock = null;
	var stompClient = null;

	function connect(bno){
		sock = new SockJS("/ws");
		stompClient = Stomp.over(sock);
		
	    function onError(e) {
	        console.log("STOMP ERROR", e);
	    }

	    function onDebug(m) {
	        console.log("STOMP DEBUG", m);
	    }

	    //stompClient.debug = onDebug;
		
		stompClient.connect('rabbit', '1234', function (frame) {


				var str = '/queue/chat.user'.concat('.',bno);
				stompClient.subscribe(str, function (text) {

				const payload = JSON.parse(text.body);
				var content = payload.content;

				if(payload.room_bno == window.room_bno){

					var className = payload.sender == bno ? 'user' : 'admin';
					
					
					const html = '<span class="chat_msg_item chat_msg_item_'+ className +'">' + content + '</span>';
					

					const below = document.getElementById("chat-room-body");
					below.insertAdjacentHTML('beforeend', html); // 맨 아래 채팅 추가
					below.scrollTop = below.scrollHeight; // 자동 하단 스크롤
				}
				
				var roomNum = 'room-'+payload.room_bno;
				if($('#'+roomNum).children('.chat-message').text() == ""){
					newRoom(payload);
					$('#'+roomNum).children('.chat-message').text(payload.content);
				}
				$('#'+roomNum).children('.chat-message').text(payload.content);
				
				
	 
	            //밑의 인자는 Queue 생성 시 주는 옵션
	            //auto-delete : Consumer가 없으면 스스로 삭제되는 Queue
	            //durable : 서버와 연결이 끊겨도 메세지를 저장하고 있음
	            //exclusive : 동일한 이름의 Queue 생길 수 있음
	        },{'auto-delete':false, 'durable':true, 'exclusive':false});

	    }, onError, '/');
	};

	function message_send(bno) {
		var receiver = member_bno;
		var sender = bno;

		var myMessage = document.getElementById('myMessage').value;
		var chat = {
				room_bno: room_bno,
		    sender: sender,
		    content: myMessage, 
		    write_date: new Date()
		};
		stompClient.send('/chat/send.message.'+receiver+'.'+sender, {}, JSON.stringify(chat));
		document.getElementById('myMessage').value = "";
	};

	// 엔터키액션
	document.getElementById('myMessage').addEventListener('keydown',function(event){
	    if(event.keyCode == 13){
	   		event.preventDefault();
	        document.getElementById('fab_send').click();
	    }
	});

	function disconnect(){
		 if (stompClient !== null) {
		        stompClient.disconnect();
		    }
	}
	

	function getMessageList(room, nick){
/* 		var nowUserNum;
		$.ajax({
			type : 'get',
			url : "/chat/getBno",
			data : {
			},
			dataType : 'text',
			success : function(data) {
				nowUserNum = data;
			},
			error : function() {
				alert("통신에러");
			}
		})
		
		 */

		document.getElementById('chat-room-body').innerText = '';
		document.getElementById('yourName').innerText=nick;
		$.ajax({
			type : 'get',
			url : "/chat/messageList",
			data : {
				room: room
			},
			dataType : 'json',
			success : function(data) {
				let str = JSON.stringify(data); // <> parse()
				const below = document.getElementById("chat-room-body");
				$.each(data, function(index, item) { // 데이터 =item
				
					var message = item.content;
					
          var className = item.sender == ${nowUser.bno} ? 'user' : 'admin';
            
					const html = '<span class="chat_msg_item chat_msg_item_'+ className +'">' + message + '</span>';

					
					below.insertAdjacentHTML('beforeend', html); // 맨 아래 채팅 추가

				});
				below.scrollTop = below.scrollHeight; // 자동 하단 스크롤
				
			},
			error : function() {
				alert("통신에러");
			}
		})
	}


	function joinRoom(bno, nowUserNum){
		$.ajax({
			type : 'get',
			url : "/chat/joinroom",
			data : {
				bno: bno
			},
			dataType : 'json',
			success : function(data) {
				var room = JSON.stringify(data);
				stompClient.send('/chat/enter.message.'+room+'.'+ bno +'.'+ nowUserNum, {}, JSON.stringify({content:'temp', write_date: new Date()}));
				
			},
			error : function() {
				alert("통신에러");
			}
		});
	}

	function newRoom(payload){
		var data = payload;
		var room = payload.room_bno;
		var content = payload.content;
		$.ajax({
			type : 'get',
			url : "/chat/getroom",
			data : {
				room: room
			},
			dataType : 'json',
			success : function(data) {

				var payload = JSON.stringify(data);
				var item = JSON.parse(payload);
				
				const html =	'<div class="chat-row">' +
												'<div class="chat-profile">' +
												'<div class="chat-image"><img class="chat-image" src="' + item.image + '"></div>' +
												'</div>' +
												'<div class="chat-message-body" onclick="controllChat(2,' + item.member_bno + ',' + item.room_bno + ',\'' + item.nick + '\')">' +
													'<p class="chat-p chat-sender">' + item.nick + '</p>' +
													'<p class="chat-p chat-message">'+ item.content +'</p>' +
												'</div>' +
												'<div class="chat-timeline">' +
													'<p class="chat-p">' + item.dateString + '</p>' +
												'</div>' +
											'</div>';
		
					const list = document.getElementById("chat-list-body");
					list.insertAdjacentHTML('afterbegin', html); // 맨 위 채팅 추가		
					},
			error : function() {
				alert("통신에러");
			}
		})
	}
	
	
</script>

</html>