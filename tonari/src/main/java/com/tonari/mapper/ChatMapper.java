package com.tonari.mapper;

import java.util.List;

import com.tonari.domain.MessageVO;
import com.tonari.domain.MyJoinRoomListVO;

public interface ChatMapper {

	void createRoom();
	
	int newRoom();
	
	void joinRoom(int member_bno, int room_bno);
	
	List<MyJoinRoomListVO> myJoinRoomList(int member_bno);

	int insertMessage(MessageVO message);

	int updateMessageInRoom(MessageVO message);

	List<MessageVO> selectMessageList(int room_bno);

	MyJoinRoomListVO getRoom(int member_bno, int room_bno);
	
	

}
