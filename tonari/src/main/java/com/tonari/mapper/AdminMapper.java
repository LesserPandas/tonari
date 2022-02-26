package com.tonari.mapper;

import java.util.List;

import com.tonari.domain.BoardVO;
import com.tonari.domain.BoardlistVO;
import com.tonari.domain.MailVO;
import com.tonari.domain.MemberAuthVO;
import com.tonari.domain.TeacherListVO;
import com.tonari.domain.TeacherPermissionListVO;


public interface AdminMapper {

	public List<MemberAuthVO> selectmemberlist();
	
	public int delete(MemberAuthVO MemberAuth);
	
	public int deleteteacherlist(int bno);
	
	public int boarddelete(BoardlistVO Boardlist);
	
	public void updateboard(BoardlistVO boardlist);
	
	public int updateboardpro(BoardVO board);
	
	public List<TeacherPermissionListVO> TeacherPermissionList();  
	
	public int permission(int bno);
	
	
	public List<TeacherListVO> selectteacherlist();
	
	public List<BoardlistVO> selectboardlist();

	public BoardVO selectboard(int bno);
	
	public void insertboard(BoardVO board);
	
	public MemberAuthVO login(MemberAuthVO MemberAuth);

	public List<MailVO> selectMail();
	
	
	
}
