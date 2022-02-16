package com.tonari.service;

import java.util.List;

import com.tonari.domain.MemberAuthVO;
import com.tonari.domain.TeacherPermissionListVO;
import com.tonari.domain.TeacherVO;

public interface AdminService {
	
	//멤버리스트
	
	public List<MemberAuthVO> selectmemberlist();

	//삭제
	public boolean delete(MemberAuthVO MemberAuth);

	//강사구독승인리스트
	public List<TeacherPermissionListVO> TeacherPermissionList();
	
	//회원목록강사구독승인
	
	public int permission(int bno);
}
