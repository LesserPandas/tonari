package com.tonari.service;

import com.tonari.domain.MemberVO;

public interface MemberService {

	public int emailCheck(String email); 
	
	public void register(MemberVO member);

	public String nickCheck(String nick);
	
	public MemberVO loginCheck(MemberVO member);

	public MemberVO selectMember(String nick);

	public void studentinfoModify(MemberVO vo);

}
