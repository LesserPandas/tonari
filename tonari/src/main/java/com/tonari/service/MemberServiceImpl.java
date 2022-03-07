package com.tonari.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tonari.domain.MemberVO;
import com.tonari.mapper.MemberMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;

@Service
@AllArgsConstructor
public class MemberServiceImpl implements MemberService {

	private MemberMapper mapper;
	
	public int emailCheck(String email) {
		return mapper.emailCheck(email);
	}
	
	public String nickCheck (String nick) {
		return mapper.nickCheck(nick);
	}
	
	@Override
	public void register(MemberVO member) {
		mapper.insert(member);
	}
	
	@Override
	public MemberVO loginCheck(MemberVO member){
		return mapper.login(member);
	}

	@Override
	public MemberVO selectMember(String nick) {
		MemberVO member = mapper.selectMember(nick);
		System.out.println(member);
		return member;
	}
	
	 @Override
	    public void studentinfoModify(MemberVO vo) {
	        mapper.studentinfoModify(vo);
	 
	    }
}
