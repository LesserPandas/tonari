package com.tonari.mapper;

import com.tonari.domain.MemberVO;

public interface MemberMapper {
	
	public int emailCheck(String email);
	
	//닉네임
	public String nickCheck(String nick);
	//
	
	public void insert(MemberVO member);
	
	// DB검색	
	public MemberVO login(MemberVO member);
	
	// 회원관리 DB검색
}
