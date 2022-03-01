<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/resources/custom/css/chat.css">


<script src="/resources/custom/js/chat.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
</head>
<body>


	<div class="container">
		<div class="row chat-window col-xs-5 col-md-3" id="chat_window"
			style="margin-left: 10px;">
			<div class="col-xs-12 col-md-12">
				<div class="panel panel-list" id="panel-list">
					<div class="panel-heading top-bar">
						<div class="col-md-1 padd-0"></div>
						<div class="col-md-10 col-xs-10">
							<h3 class="panel-title">채팅목록</h3>
						</div>

					</div>
					<div class="panel-body msg_container_base">

						<div class="row msg_container chat-now">
							<div class="col-md-12 col-xs-12">
								<div class="" onclick="chatContentPopup()">
									<span class="chat-profile col-md-1"></span>
									<p class="chat-sender">김찬호</p>
									<p class="chat-content">채팅창목록도 새로 추가했습니다.</p>
									<p class="chat-timeline">52분 전</p>
								</div>
							</div>
						</div>
						<div class="row msg_container chat-now">
							<div class="col-md-12 col-xs-12">
								<div class="" onclick="chatContentPopup()">
									<span class="chat-profile col-md-1"></span>
									<p class="chat-sender">김두홍</p>
									<p class="chat-content">관리자페이지는 별도 템플릿을 사용했습니다.</p>
									<p class="chat-timeline">1시간 전</p>
								</div>
							</div>
						</div>
						<div class="row msg_container chat-now">
							<div class="col-md-12 col-xs-12">
								<div class="" onclick="chatContentPopup()">
									<span class="chat-profile col-md-1"></span>
									<p class="chat-sender">김남현</p>
									<p class="chat-content">강사 찾기/ 정보 페이지 업데이트했습니다.</p>
									<p class="chat-timeline">하루 전</p>
								</div>
							</div>
						</div>
						<div class="row msg_container chat-now">
							<div class="col-md-12 col-xs-12">
								<div class="" onclick="chatContentPopup()">
									<span class="chat-profile col-md-1"></span>
									<p class="chat-sender">한준희</p>
									<p class="chat-content">마이페이지에서 개인정보를 확인해주세요.</p>
									<p class="chat-timeline">1분 전</p>
								</div>
							</div>
						</div>
					</div>
					<div class="panel-footer">
						<div class="input-group">
							<input id="btn-input" type="text"
								class="form-control input-sm chat_input"
								placeholder="Write your message here..." /> <span
								class="input-group-btn">
								<button class="btn btn-primary btn-sm" id="">Send</button>
							</span>
						</div>
					</div>
				</div>

				<!-- Chat -->
				<div class="panel panel-chat" id="panel-chat">
					<div class="panel-heading top-bar">
						<div class="col-md-1 padd-0">
							<button type="button" class="btn-chat btn-reset"
								onclick="chatContentPopup()" style="height: 20px;">
								<img src="/resources/custom/images/angle-left.png"
									class="arrow-left">
							</button>
						</div>
						<div class="col-md-10 col-xs-10">
							<h3 class="panel-title">김찬호</h3>
						</div>

					</div>
					<div id="panel-body" class="panel-body msg_container_base">
						<div class="row msg_container base_receive">
							<div class="col-xs-10 col-md-10">
								<div class="messages msg_receive">
									<p>tiny master db, and huge document store</p>
									<time datetime="2009-11-13T20:00">Timothy • 51 min</time>
								</div>
							</div>
						</div>
						<div class="row msg_container base_sent">
							<div class="col-xs-10 col-md-10">
								<div class="messages msg_sent">
									<p>that mongodb thing looks good.</p>
									<time datetime="2009-11-13T20:00">Timothy • 51 min</time>
								</div>
							</div>
						</div>
					</div>
					<div class="panel-footer">
						<div class="input-group">
							<input id="myMessage" type="text"
								class="form-control input-sm chat_input" placeholder="메시지 작성" />
							<span class="input-group-btn">
								<button class="btn btn-primary btn-sm" id="btn-chat"
									onclick="message_send()">Send</button>
							</span>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="btn-group dropup">
			<button type="button" class="btn-chat wh-50" onclick="chatPopup()">
				<img class="btn-chat-img" src="/resources/custom/images/chat.png">
			</button>

		</div>
	</div>
</body>

<script>


var bno = 1;

document.addEventListener("DOMContentLoaded", () => {
	var sock = null;
	var stompClient = null;
	var session = "${nowUser}";
	if (session == "") {
		console.log("로그인이 필요합니다.");
	} else {
		connect();
	} 
});

function connect(){
	sock = new SockJS("/ws");
	stompClient = Stomp.over(sock);
	
    function onError(e) {
        console.log("STOMP ERROR", e);
    }

    function onDebug(m) {
        console.log("STOMP DEBUG", m);
    }

    stompClient.debug = onDebug;
	
	stompClient.connect('rabbit', '1234', function (frame) {

        console.log('STOMP Connected');
        
        /* subscribe 설정에 따라 rabbit의 Exchange, Queue가 상당히 많이 바뀜 */
        stompClient.subscribe('/queue/chat.user.'+${nowUser.bno}, function (text) {

            const payload = JSON.parse(text.body);
			console.log("payload Content : " + payload.content);
			console.log("현재 유저번호 : " + ${nowUser.bno} + ', 닉네임 : ${nowUser.nick}');
			var message = payload.content;
			
            var className1 = payload.bno == ${nowUser.bno} ? 'base_sent' : 'base_receive';
            var className2 = payload.bno == ${nowUser.bno} ? 'msg_sent' : 'msg_receive';
            
            const html = '<div class="row msg_container '+ className1+'">'
						+ '<div class="col-md-10 col-xs-10 ">'
						+ '<div class="messages '+className2+'">'
						+ '<p>'+message+'</p>'
						+ '<time datetime="">Timothy • 51 min</time>'
						+ '</div></div></div>';
			console.log(html);
			
			const below = document.getElementById("panel-body");
			below.insertAdjacentHTML('beforeend', html); // 맨 아래 채팅 추가
			below.scrollTop = below.scrollHeight; // 자동 하단 스크롤
 
            //밑의 인자는 Queue 생성 시 주는 옵션
            //auto-delete : Consumer가 없으면 스스로 삭제되는 Queue
            //durable : 서버와 연결이 끊겨도 메세지를 저장하고 있음
            //exclusive : 동일한 이름의 Queue 생길 수 있음
        },{'auto-delete':false, 'durable':true, 'exclusive':false});

    }, onError, '/');
};

function message_send() {
	console.log('sending...');
	var bno = ${nowUser.bno};
	var myMessage = document.getElementById('myMessage').value;
	var chat = {
	    bno: bno,
	    content: myMessage, 
	    date: new Date()
	};
	stompClient.send('/pub/send.message.'+${nowUser.bno}, {}, JSON.stringify(chat));
	document.getElementById('myMessage').value = "";
};

// 엔터키액션
document.getElementById('myMessage').addEventListener('keydown',function(event){
    if(event.keyCode == 13){
   		event.preventDefault();
        document.getElementById('btn-chat').click();
    }
});

</script>

</html>