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
								<button class="btn btn-primary btn-sm" id="btn-chat">Send</button>
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
					<div class="panel-body msg_container_base">
						<div class="row msg_container base_sent">
							<div class="col-md-10 col-xs-10">
								<div class="messages msg_sent">
									<p>that mongodb thing looks good, huh? tiny master db, and
										huge document store</p>
									<time datetime="2009-11-13T20:00">Timothy • 51 min</time>
								</div>
							</div>
						</div>
						<div class="row msg_container base_receive">

							<div class="col-md-10 col-xs-10">
								<div class="messages msg_receive">
									<p>that mongodb thing looks good, huh? tiny master db, and
										huge document store</p>
									<time datetime="2009-11-13T20:00">Timothy • 51 min</time>
								</div>
							</div>
						</div>
						<div class="row msg_container base_receive">

							<div class="col-xs-10 col-md-10">
								<div class="messages msg_receive">
									<p>that mongodb thing looks good, huh? tiny master db, and
										huge document store</p>
									<time datetime="2009-11-13T20:00">Timothy • 51 min</time>
								</div>
							</div>
						</div>
						<div class="row msg_container base_sent">
							<div class="col-xs-10 col-md-10">
								<div class="messages msg_sent">
									<p>that mongodb thing looks good, huh? tiny master db, and
										huge document store</p>
									<time datetime="2009-11-13T20:00">Timothy • 51 min</time>
								</div>
							</div>

						</div>
						<div class="row msg_container base_receive">

							<div class="col-xs-10 col-md-10">
								<div class="messages msg_receive">
									<p>that mongodb thing looks good, huh? tiny master db, and
										huge document store</p>
									<time datetime="2009-11-13T20:00">Timothy • 51 min</time>
								</div>
							</div>
						</div>
						<div class="row msg_container base_sent">
							<div class="col-md-10 col-xs-10 ">
								<div class="messages msg_sent">
									<p>that mongodb thing looks good, huh? tiny master db, and
										huge document store</p>
									<time datetime="2009-11-13T20:00">Timothy • 51 min</time>
								</div>
							</div>

						</div>
					</div>
					<div class="panel-footer">
						<div class="input-group">
							<input id="myMessage" type="text"
								class="form-control input-sm chat_input"
								placeholder="Write your message here..." /> <span
								class="input-group-btn">
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
	
/* 	var session = null;
	var session = "${nowUser}";
	if(session == null | session == "") {
		console.log("로그인이 필요합니다.");
	} else {
		connect();
	} */
	connect();
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
        
        var bno = 1;
        /* subscribe 설정에 따라 rabbit의 Exchange, Queue가 상당히 많이 바뀜 */
        stompClient.subscribe('/queue/chat.queue.2', function (text) {

            const payload = JSON.parse(text.body);
            console.log("payload : " + payload)
			console.log("payload Content : " + payload.content)
            /* let className = payload.nickname == nickname? 'mine' : 'yours';

            const html = `<div class="${className}">
                            <div class="nickname">${payload.nickname}</div>
                            <div class="message">${payload.message}</div>
                        </div>`

            chats.insertAdjacentHTML('beforeend', html); */
            
            //밑의 인자는 Queue 생성 시 주는 옵션
            //auto-delete : Consumer가 없으면 스스로 삭제되는 Queue
            //durable : 서버와 연결이 끊겨도 메세지를 저장하고 있음
            //exclusive : 동일한 이름의 Queue 생길 수 있음
        },{'auto-delete':false, 'durable':true, 'exclusive':false});

        //입장 메세지 전송
        stompClient.send('/pub/chat.enter', {}, JSON.stringify({
            room: bno,
            content: "",
            date: new Date()
        }));

    }, onError, '/');
};

function message_send() {
	console.log('sending...');
	var bno = 1;
	var myMessage = document.getElementById('myMessage').value;;
	var chat = {
	    room: bno,
	    content: myMessage, 
	    date: new Date()
	};
	// /app을 쓰면 서버 컨트롤러에 매핑
	// /topic을 쓰면 메세지 브로커로 매핑
	// 첫번째 인자는 보낼 주소
	// 두번째 인자는 서버로 보낼 때 추가하고 싶은 stomp 헤더
	// 세번째 인자는 서버로 보낼 때 추가하고 싶은 stomp 바디 (JSON.stringify({}))
	stompClient.send('/pub/send.message', {}, JSON.stringify(chat));
};
	
</script>

</html>