package com.tonari.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.tonari.domain.MessageVO;
import com.tonari.domain.MyJoinRoomListVO;

public interface ChatMapper {

	void createRoom();
	
	int newRoom();
	
	void joinRoom(@Param("member_bno") int member_bno, @Param("room_bno") int room_bno);
	
	List<MyJoinRoomListVO> myJoinRoomList(int member_bno);

	int insertMessage(MessageVO message);

	int updateMessageInRoom(MessageVO message);

	List<MessageVO> selectMessageList(int room_bno);

	MyJoinRoomListVO getRoom(@Param("member_bno") int member_bno, @Param("room_bno") int room_bno);

	int checkRoom(@Param("sender") int sender, @Param("receiver") int receiver);

	void deleteRoom(@Param("sender") int sender, @Param("room") int room);

}
