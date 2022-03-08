package com.tonari.service;

import java.util.List;

import com.tonari.domain.BoardVO;
import com.tonari.domain.BoardlistVO;
import com.tonari.domain.MailVO;
import com.tonari.domain.MemberAuthVO;
import com.tonari.domain.TeacherListVO;
import com.tonari.domain.TeacherPermissionListVO;

public interface AdminService {
	
	//멤버리스트
	
	public List<MemberAuthVO> selectmemberlist();
	//회원상세페이지
	public MemberAuthVO memberview(String name);
	
	
	public List<TeacherListVO> selectteacherlist();

	//회원삭제
	public boolean delete(MemberAuthVO MemberAuth);
	
	public boolean deleteteacherlist(int bno);
	
	//게시글삭제
	public boolean boarddelete(BoardlistVO Boardlist);
	
	//수정페이지
	public void updateboard(BoardlistVO Boardlist);
	
	public boolean updateboardpro(BoardVO board);

	
	
	
	
	//강사구독승인리스트
	public List<TeacherPermissionListVO> TeacherPermissionList();
	
	//회원목록강사구독승인	
	public int permission(int bno);

	
	//게시판 목록
	public List<BoardlistVO> selectboardlist();

	//게시글 하나 불러오기	
	public BoardVO selectBoard(int bno);
	
	//게시글쓰기
	public void insertboard(BoardVO board);

	public MemberAuthVO login(MemberAuthVO MemberAuth);

	public List<MailVO> selectMail();

	

	
}
