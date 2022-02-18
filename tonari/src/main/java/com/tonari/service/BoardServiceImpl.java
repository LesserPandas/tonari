package com.tonari.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tonari.domain.Addr_searchVO;
import com.tonari.domain.BoardSearch_viewVO;
import com.tonari.domain.CategoryVO;
import com.tonari.domain.ReviewVO;
import com.tonari.domain.Review_viewVO;
import com.tonari.domain.Teacherinfo_viewVO;
import com.tonari.mapper.BoardMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class BoardServiceImpl implements BoardService {
	
	@Setter(onMethod_ = @Autowired)
	private BoardMapper mapper;
	
	@Override
<<<<<<< HEAD
		public List<BoardSearch_viewVO> orderby(String orderby) { //검색
			List<BoardSearch_viewVO> list = new ArrayList<BoardSearch_viewVO>();
			switch(orderby) {
			case "teacher": //신규선생님
				 list = mapper.orderbyTeacherbno();
				break;
			case "score": //별점 점수
				list = mapper.orderbyScore();
=======
		public List<BoardSearch_viewVO> searchBoard(String orderby) { //검색
			List<BoardSearch_viewVO> list = new ArrayList<BoardSearch_viewVO>();
			switch(orderby) {
			case "teacher": //신규선생님
				 list = mapper.searchBoardTeacherbno();
				break;
			case "score": //별점 점수
				list = mapper.searchBoardScore();
>>>>>>> namhyun
				break;
			default: 
				Addr_searchVO Avo = mapper.shortarea(orderby); //지역구 rank검색
				if(Avo !=null) {
<<<<<<< HEAD
					list = mapper.orderbyArea(Avo); //지역구 순 나열
=======
					list = mapper.searchBoardArea(Avo); //지역구 순 나열
>>>>>>> namhyun
					break;
				}
			}
			return list;
		}
	
	@Override
	public List<BoardSearch_viewVO> searchcategory(String category) {
		return mapper.searchcategory(category);
	}
	
	@Override
	public List<BoardSearch_viewVO> searchall(String word) {
		return mapper.searchall(word);
	}
	
	@Override
	public List<CategoryVO> sidelist() { //사이드메뉴
		return mapper.sidelist();
	}
	
	@Override
	public Teacherinfo_viewVO teacherinfo(int bno) {
		return mapper.teacherinfo(bno);
	}
	
	@Override
	public List<Review_viewVO> review(int bno) {
		List<Review_viewVO> list = mapper.review(bno);
		return list; 
	}
	
	@Override
	public void writeReview(ReviewVO rvo) {
		StringBuilder sb = new StringBuilder();
		int score = rvo.getScore();
		String stars = "";
		sb.append(stars);
		for(int i=0; i<score;i++) sb.append("★");
		for(int i=0; i<5-score;i++) sb.append("☆");
		stars = sb.toString();
		rvo.setScorestar(stars);
		String nick=rvo.getNick();
		System.out.println(nick);
		String firstname= nick.substring(0, 1);
		nick=nick.substring(1);
		sb.setLength(0);
		sb.append(firstname);
<<<<<<< HEAD
		for(int i=0; i<nick.length();i++) sb.append("*");
=======
		for(int i=0; i<nick.length()-1;i++) sb.append("*");
>>>>>>> namhyun
		String nickname = sb.toString();
		rvo.setNick(nickname);
		mapper.writeReview(rvo);
	}

}











