package com.tonari.service;

import java.io.IOException;
import java.util.List;

import com.tonari.domain.MessageVO;
import com.tonari.domain.MyJoinRoomListVO;

public interface ChatService {
	
	public void setQueue(int bno) throws IOException;

	public MyJoinRoomListVO joinRoom(int sender, int receiver);
	
	public List<MyJoinRoomListVO> myJoinRoomList(int loginUser);

	public boolean storeMessage(MessageVO message);

	public List<MessageVO> getMessageList(int room);

	
}
