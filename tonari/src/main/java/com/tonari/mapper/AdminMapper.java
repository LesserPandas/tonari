package com.tonari.mapper;

import java.util.List;

import com.tonari.domain.MemberAuthVO;
import com.tonari.domain.TeacherPermissionListVO;
import com.tonari.domain.TeacherVO;


public interface AdminMapper {

	public List<MemberAuthVO> selectmemberlist();
	
	public int delete(MemberAuthVO MemberAuth);
	
	public List<TeacherPermissionListVO> TeacherPermissionList();  
	
	public int permission(int bno);
}
