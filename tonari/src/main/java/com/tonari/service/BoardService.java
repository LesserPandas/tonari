package com.tonari.service;

import java.util.List;

import com.tonari.domain.CategoryVO;
import com.tonari.domain.ReviewVO;
import com.tonari.domain.Review_viewVO;
import com.tonari.domain.BoardSearch_viewVO;
import com.tonari.domain.Teacherinfo_viewVO;

public interface BoardService {
	public List<CategoryVO> sidelist();
	public List<BoardSearch_viewVO> orderby(String orderby);
	public List<BoardSearch_viewVO> searchcategory(String category);
	public List<BoardSearch_viewVO> searchall(String word);
	public Teacherinfo_viewVO teacherinfo(int bno);
	public List<Review_viewVO> review(int bno);
	public void writeReview(ReviewVO rvo);
}
