package com.tonari.service;

import java.io.IOException;
import java.util.List;

import com.tonari.domain.MessageVO;
import com.tonari.domain.MyJoinRoomListVO;

public interface ChatService {
	
	public void setQueue(int bno) throws IOException;

	public int joinRoom(int sender, int receiver);
	
	public List<MyJoinRoomListVO> myJoinRoomList(int loginUser);

	public boolean storeMessage(MessageVO message);

	public List<MessageVO> getMessageList(int room);

	public MyJoinRoomListVO getRoom(int me, int room);

	public boolean checkRoom(int me, int you);

	public void deleteRoom(int me, int room);

	public String getImage(int member_bno);

	
}
