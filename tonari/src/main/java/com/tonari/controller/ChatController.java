package com.tonari.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;
import com.tonari.config.ChatConstants;
import com.tonari.domain.MemberVO;
import com.tonari.domain.MessageVO;
import com.tonari.domain.MyJoinRoomListVO;
import com.tonari.service.ChatService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@RestController
@RequestMapping("/chat/*")
@AllArgsConstructor
public class ChatController {

	private RabbitTemplate template;
	private ChatService service;

	// 메시지 처리
	@MessageMapping("send.message.{you}.{me}")
	public void send(MessageVO message, @DestinationVariable("you") String you, @DestinationVariable("me") String me)
			throws Exception {

		template.convertAndSend(ChatConstants.CHAT_EXCHANGE_NAME, ChatConstants.ROUTING_KEY + me, message);
		template.convertAndSend(ChatConstants.CHAT_EXCHANGE_NAME, ChatConstants.ROUTING_KEY + you, message);

		boolean result = service.storeMessage(message);
		log.info("\n************* 메시지 처리 결과 : " + result);
	}

	// 채팅방 생성 후 메시지
	@MessageMapping("enter.message.{room}.{you}.{me}")
	public void enter(@DestinationVariable("you") int you, @DestinationVariable("me") int me,
			@DestinationVariable("room") int room, MessageVO message) throws Exception {

		message.setContent("先生と話が始まりました.");
		message.setRoom_bno(room);
		message.setSender(me);
		message.setWrite_date(new Date());

		log.info(message);
		template.convertAndSend(ChatConstants.CHAT_EXCHANGE_NAME, ChatConstants.ROUTING_KEY + me, message);
		template.convertAndSend(ChatConstants.CHAT_EXCHANGE_NAME, ChatConstants.ROUTING_KEY + you, message);

		boolean result = service.storeMessage(message);
		log.info("\n************* 메시지 처리 결과 : " + result);
	}

	// 방 참가하기
	@GetMapping(value = "joinroom", produces = "application/text; charset=utf8")
	public String joinroom(HttpServletRequest request, @RequestParam("bno") int you) {
		int me = ((MemberVO) request.getSession().getAttribute("nowUser")).getBno();

		if (service.checkRoom(me, you) || me == you) {
			return null;
		} else {
			int num = service.joinRoom(me, you);

			Gson gson = new Gson();
			String result = gson.toJson(num);

			return result;
		}

	}

	@GetMapping(value = "getroom", produces = "application/text; charset=utf8")
	public String getRoom(HttpServletRequest request, @RequestParam("room") int room) {

		int me = ((MemberVO) request.getSession().getAttribute("nowUser")).getBno();
		MyJoinRoomListVO newRoom = service.getRoom(me, room);

		log.info("가져온 채팅방 정보 : " + newRoom);

		Gson gson = new Gson();
		String result = gson.toJson(newRoom);
		return result;
	}

	// 내 채팅방 리스트 가져오기
	@GetMapping(value = "myChatList", produces = "application/text; charset=utf8")
	public String myChatList(@RequestParam("bno") int bno) {

		List<MyJoinRoomListVO> myJoinRoomList = service.myJoinRoomList(bno);
		
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
		SimpleDateFormat fm_today = new SimpleDateFormat("H時m分");
		SimpleDateFormat fm_notToday = new SimpleDateFormat("M月d日");
		String today = format.format(new Date());
		for (MyJoinRoomListVO list : myJoinRoomList) {
			String sentDate = format.format(list.getWrite_date());
			if(sentDate.equals(today)) {
				list.setDateString(fm_today.format(list.getWrite_date()));
			}else {
				list.setDateString(fm_notToday.format(list.getWrite_date()));
			}
			list.setImage(service.getImage(list.getMember_bno()));
		}

		Gson gson = new Gson();
		String result = gson.toJson(myJoinRoomList);
		log.info("<Result>\n" + result);

		return result;
	}

	@GetMapping(value = "messageList", produces = "application/text; charset=utf8")
	public String messageList(@RequestParam("room") int room) {

		List<MessageVO> messageList = service.getMessageList(room);

		Gson gson = new Gson();
		String result = gson.toJson(messageList);

		return result;
	}
	
	@GetMapping(value = "deleteRoom", produces = "application/text; charset-utf8")
	public void deleteRoom(HttpServletRequest request, @RequestParam("room") int room) {
		int me = ((MemberVO) request.getSession().getAttribute("nowUser")).getBno();
		service.deleteRoom(me, room);
	}
	
	@GetMapping(value = "getBno", produces = "application/text; charset-utf8")
	public int getBno(HttpServletRequest request) {
		int me = -1;
		try {
			me = ((MemberVO) request.getSession().getAttribute("nowUser")).getBno();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return me;
	}
}
