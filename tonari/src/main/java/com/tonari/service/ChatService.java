package com.tonari.service;

import java.io.IOException;
import java.util.List;

import com.tonari.domain.JoinRoomVO;

public interface ChatService {
	
	public void setQueue(int bno) throws IOException;

	public void joinRoom(int sender, int receiver);
	
	public List<JoinRoomVO> joinRoomList(int loginUser);

	
}
