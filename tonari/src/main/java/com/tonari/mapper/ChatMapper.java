package com.tonari.mapper;

import java.util.List;

import com.tonari.domain.JoinRoomVO;

public interface ChatMapper {

	void createRoom();
	
	int newRoom();
	
	void joinRoom(int member_bno, int room_bno);
	
	List<JoinRoomVO> joinRoomList(int member_bno);

}
