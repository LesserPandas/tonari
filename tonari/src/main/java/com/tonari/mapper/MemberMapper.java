package com.tonari.mapper;

import com.tonari.domain.MemberVO;

public interface MemberMapper {
	
	public int emailCheck(String email);
	
	//닉네임
	public String nickCheck(String nick);
	
	//회원가입 등록(memberController에서 사용)
	public void insert(MemberVO member);
	
	
	
	// DB검색	
	public MemberVO login(MemberVO member);

	public MemberVO selectMember(String nick);

	
	
	
	
	
	

	public void studentinfoModify(MemberVO vo);

	
	
	// 회원관리 DB검색
	
	
	
	

}
