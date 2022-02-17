package com.tonari.mapper;

import java.util.List;

import com.tonari.domain.Addr_searchVO;
import com.tonari.domain.CategoryVO;
import com.tonari.domain.ReviewVO;
import com.tonari.domain.Review_viewVO;
import com.tonari.domain.Teacherinfo_viewVO;
import com.tonari.domain.BoardSearch_viewVO;

public interface BoardMapper {

	public List<CategoryVO> sidelist(); //사이드 바 메뉴
	public List<BoardSearch_viewVO> searchBoardTeacherbno(); //신규 순
	public List<BoardSearch_viewVO> searchBoardScore(); //별점 순
	// 거리 순
	public Addr_searchVO shortarea(String orderby);
	public List<BoardSearch_viewVO> searchBoardArea(Addr_searchVO vo);
	// 거리 순
	public List<BoardSearch_viewVO> searchall(String word); //전체 조회
	public List<BoardSearch_viewVO> searchcategory(String category);//카테고리
	public Teacherinfo_viewVO teacherinfo(int bno);
	public List<Review_viewVO> review(int bno);
	public void writeReview(ReviewVO rvo);
}
