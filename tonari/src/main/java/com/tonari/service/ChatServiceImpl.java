package com.tonari.service;

import java.io.IOException;
import java.util.List;

import org.springframework.stereotype.Service;

import com.rabbitmq.client.Channel;
import com.tonari.config.ChatConstants;
import com.tonari.domain.MessageVO;
import com.tonari.domain.MyJoinRoomListVO;
import com.tonari.mapper.ChatMapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class ChatServiceImpl implements ChatService {

	private Channel ch;
	
	private ChatMapper mapper;

	@Override
	public void setQueue(int bno) {

		try {
			ch.queueDeclare(ChatConstants.CHAT_QUEUE_NAME + bno, true, false, false, null);
			System.out.println("큐 생성 완료!");
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				ch.queueBind(ChatConstants.CHAT_QUEUE_NAME + bno, ChatConstants.CHAT_EXCHANGE_NAME,
						ChatConstants.ROUTING_KEY + bno);
				System.out.printf("큐 : %s, 인스체인지 : %s, 라우팅 키 : %s", ChatConstants.CHAT_QUEUE_NAME + bno,
						ChatConstants.CHAT_EXCHANGE_NAME, ChatConstants.ROUTING_KEY + bno);
				System.out.println("바인딩 완료!");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	@Override
	public boolean checkRoom(int me, int you) {
		return mapper.checkRoom(me, you) > 0;
	}
	
	@Override
	public boolean storeMessage(MessageVO message) {
		int result = 0;
		result = mapper.insertMessage(message);
		result = mapper.updateMessageInRoom(message);
		return result == 1;
	}
	
	
	@Override
	public int joinRoom(int sender, int receiver) {
		mapper.createRoom();
		int room = mapper.newRoom();
		mapper.joinRoom(sender, room);
		mapper.joinRoom(receiver, room);
		return room;
	}
	
	@Override
	public List<MyJoinRoomListVO> myJoinRoomList(int loginUser) {
		return mapper.myJoinRoomList(loginUser);
	}

	@Override
	public List<MessageVO> getMessageList(int room) {
		return mapper.selectMessageList(room);
	}

	@Override
	public MyJoinRoomListVO getRoom(int sender, int room) {
		return mapper.getRoom(sender, room);
	}
	
	@Override
	public void deleteRoom(int me, int room) {
		mapper.deleteRoom(me, room);
		
	}
}
