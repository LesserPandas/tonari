package com.tonari.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tonari.domain.BoardVO;
import com.tonari.domain.BoardlistVO;
import com.tonari.domain.MailVO;
import com.tonari.domain.MemberAuthVO;
import com.tonari.domain.TeacherListVO;
import com.tonari.domain.TeacherPermissionListVO;
import com.tonari.mapper.AdminMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;

@Service
@AllArgsConstructor
public class AdminServiceImpl implements AdminService {

	@Setter(onMethod_ = @Autowired)
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
	public boolean boarddelete(BoardlistVO Boardlist) {
		// TODO Auto-generated method stub
		return mapper.boarddelete(Boardlist) == 1;
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

	@Override
	public List<TeacherListVO> selectteacherlist() {
		// TODO Auto-generated method stub
		return mapper.selectteacherlist();
	}

	@Override
	public List<BoardlistVO> selectboardlist() {
		// TODO Auto-generated method stub
		return mapper.selectboardlist();
	}

	@Override
	public void updateboard(BoardlistVO Boardlist) {

		mapper.updateboard(Boardlist);

	}

	@Override
	public BoardVO selectBoard(int bno) {
		return mapper.selectboard(bno);
	}

	@Override
	public boolean updateboardpro(BoardVO board) {
		// TODO Auto-generated method stub
		return mapper.updateboardpro(board) == 1;
	}

	@Override
	public void insertboard(BoardVO board) {

		mapper.insertboard(board);

	}

	@Override
	public MemberAuthVO login(MemberAuthVO MemberAuth) {
		// TODO Auto-generated method stub
		return mapper.login(MemberAuth);
	}

	@Override
	public List<MailVO> selectMail() {
		return mapper.selectMail();
	}

}