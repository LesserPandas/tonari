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
					<div id="chat_list" class="panel-body msg_container_base">

						여기에목록 출력

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
		<c:if test="${not empty nowUser }">
			<div class="btn-group dropup">
				<button type="button" class="btn-chat wh-50" onclick="chatPopup()">
					<img class="btn-chat-img" src="/resources/custom/images/chat.png">
				</button>

			</div>
		</c:if>
	</div>
</body>

<script>

var member_bno = 0;
var room_bno = 0;
var nick = "";

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
	var bno = ${nowUser.bno};
	$.ajax({
		type : 'get',
		url : "/myChatList",
		data : {
			bno: bno
		},
		dataType : 'json',
		success : function(data) {
			let str = JSON.stringify(data); // <> parse()
			$.each(data, function(index, item) { // 데이터 =item
				//alert("bno : " + item.bno + ", memberBno : " + item.member_bno + ", roomBno : " + item.room_bno); // index가 끝날때까지 
				
				
				const html = '<div class="row msg_container chat-now">'
							+'<div class="col-md-12 col-xs-12">'
							+	'<div class="" onclick="chatContentPopup('+ item.member_bno + ',' + item.room_bno + ',\'' + item.nick + '\')">'
							+		'<span class="chat-profile col-md-1"></span>'
							+	'	<p class="chat-sender">' + item.nick + '</p>'
							+	'	<p class="chat-content">채팅창목록도 새로 추가했습니다.</p>'
							+	'	<p class="chat-timeline">52분 전</p>'
							+	'</div></div></div>';
			
			const below = document.getElementById("chat_list");
			below.insertAdjacentHTML('beforeend', html); // 맨 아래 채팅 추가
				
				

			connect();	
			});
		},
		error : function() {
			alert("통신에러");
		}
	})
	
}


function chatContentPopup(memberBno, roomBno, nickname) {
	
	member_bno = memberBno;
	room_bno = roomBno;
	nick = nickname;
	
	console.log(member_bno + room_bno + nick);
	var list = document.getElementById("panel-list").style.display;
	var content = document.getElementById("panel-chat").style.display;
	if (content == "block") { document.getElementById("panel-chat").style.display = "none";
	document.getElementById("panel-list").style.display = "block";
	disconnect();
	}
	else { document.getElementById("panel-chat").style.display = "block"; 
	document.getElementById("panel-list").style.display = "none";
	}
}


var sock = null;
var stompClient = null;

function connect(){
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

        console.log('STOMP Connected');
        
        /* subscribe 설정에 따라 rabbit의 Exchange, Queue가 상당히 많이 바뀜 */
        stompClient.subscribe('/queue/chat.user.'+${nowUser.bno}, function (text) {

            const payload = JSON.parse(text.body);
			console.log("payload Content : " + payload.content);
			var message = payload.content;
			
            var className1 = payload.sender == ${nowUser.bno} ? 'base_sent' : 'base_receive';
            var className2 = payload.sender == ${nowUser.bno} ? 'msg_sent' : 'msg_receive';
            
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
	var receiver = member_bno;
	var sender = ${nowUser.bno};
	console.log("receiver : " + receiver);
	console.log('sending...');
	var myMessage = document.getElementById('myMessage').value;
	var chat = {
		room_bno: room_bno,
	    sender: sender,
	    content: myMessage, 
	    write_date: new Date()
	};
	stompClient.send('/pub/send.message.'+receiver+'.'+sender, {}, JSON.stringify(chat));
	document.getElementById('myMessage').value = "";
};

// 엔터키액션
document.getElementById('myMessage').addEventListener('keydown',function(event){
    if(event.keyCode == 13){
   		event.preventDefault();
        document.getElementById('btn-chat').click();
    }
});

function disconnect(){
	 if (stompClient !== null) {
	        stompClient.disconnect();
	    }
}

</script>

</html>