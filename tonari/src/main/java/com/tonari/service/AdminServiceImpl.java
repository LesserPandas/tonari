package com.tonari.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tonari.domain.MemberAuthVO;
import com.tonari.domain.MemberVO;
import com.tonari.domain.TeacherPermissionListVO;
import com.tonari.domain.TeacherVO;
import com.tonari.mapper.AdminMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;


@Service
@AllArgsConstructor
public class AdminServiceImpl implements AdminService {

	@Setter(onMethod_= @Autowired )
	private AdminMapper mapper;
	
	@Override
	public List<MemberAuthVO> selectmemberlist() {
		
		return mapper.selectmemberlist();
	}
	
	@Override
	public boolean delete(MemberAuthVO MemberAuth) {
		
		return mapper.delete(MemberAuth) == 1;
	}
	
	@Override
	public List<TeacherPermissionListVO> TeacherPermissionList() {
		
		return mapper.TeacherPermissionList();
	}

	
	@Override
	public int permission(int bno) {
	// TODO Auto-generated method stub
		return mapper.permission(bno);
}
}
