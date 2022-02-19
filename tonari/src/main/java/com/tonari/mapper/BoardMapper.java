package com.tonari.mapper;

import java.util.List;

import com.tonari.domain.Addr_searchVO;
import com.tonari.domain.CategoryVO;
import com.tonari.domain.LikeMarkVO;
import com.tonari.domain.ReviewVO;
import com.tonari.domain.Review_viewVO;
import com.tonari.domain.Teacherinfo_viewVO;
import com.tonari.util.Criteria;
import com.tonari.domain.BoardSearch_viewVO;

public interface BoardMapper {

	public List<CategoryVO> sidelist(); //사이드 바 메뉴
	public List<BoardSearch_viewVO> OrderbyList(Criteria cri);
	public Addr_searchVO shortarea(String area);//거리 순 나열
	public Teacherinfo_viewVO teacherinfo(int bno);
	public List<Review_viewVO> review(int bno);
	public void writeReview(ReviewVO rvo);
	public String getnickname(int bno);
	public void addlike(LikeMarkVO like);
	public void removelike(LikeMarkVO like);
	public List<LikeMarkVO> chkLike(LikeMarkVO lvo);
	public LikeMarkVO chkLikeone(LikeMarkVO lvo);
	
	public int total(Criteria cri);//전체 게시물 조회
	
}
