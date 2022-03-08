package com.tonari.service;

import java.util.List;


import com.tonari.domain.BoardVO;
import com.tonari.domain.CategoryVO;
import com.tonari.domain.LikeMarkVO;
import com.tonari.domain.ReviewVO;
import com.tonari.domain.Review_viewVO;
import com.tonari.domain.TeacherSearch_viewVO;
import com.tonari.domain.Teacherinfo_viewVO;
import com.tonari.util.Criteria;

public interface BoardService {
	public List<CategoryVO> sidelist();//사이드메뉴
	public List<TeacherSearch_viewVO> OrderbyList(Criteria cri); //정렬방법
	public Teacherinfo_viewVO teacherinfo(int bno); // 강사 info
	public List<Review_viewVO> review(int bno); // 리뷰 전체 읽어오기
	public void writeReview(ReviewVO rvo); // 리뷰 쓰기
	public void addlike(LikeMarkVO like); // 좋아요
	public void removelike(LikeMarkVO like); // 좋아요 취소
	public LikeMarkVO chkLikeone(LikeMarkVO lvo); // 좋아요 표시 (info)
	public List<LikeMarkVO> chklike(LikeMarkVO lvo); // 좋아요 표시 (board)
	public String dodate(Teacherinfo_viewVO tvo);
	public int total(Criteria cri);//전체 게시물 조회
	
	public List<TeacherSearch_viewVO> mainsearch(Criteria cri);
	public BoardVO viewboard(int bno);
	public List<BoardVO> listboard(int category);
}


