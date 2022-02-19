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
	@Setter(onMethod_ = @Autowired)
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
	public String loginCheck(MemberVO member){
		return mapper.login(member);
	}

}
