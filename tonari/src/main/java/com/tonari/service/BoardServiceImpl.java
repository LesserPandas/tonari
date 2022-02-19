package com.tonari.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tonari.domain.Addr_searchVO;
import com.tonari.domain.BoardSearch_viewVO;
import com.tonari.domain.CategoryVO;
import com.tonari.domain.LikeMarkVO;
import com.tonari.domain.ReviewVO;
import com.tonari.domain.Review_viewVO;
import com.tonari.domain.Teacherinfo_viewVO;
import com.tonari.mapper.BoardMapper;
import com.tonari.util.Criteria;

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
	public List<CategoryVO> sidelist() { //사이드메뉴
		return mapper.sidelist();
	}
	
	@Override
	public List<BoardSearch_viewVO> OrderbyList(Criteria cri) {
		List<BoardSearch_viewVO> list = new ArrayList<BoardSearch_viewVO>();
		switch(cri.getType()) {
		case "orderby" :
			list = mapper.OrderbyList(cri);
			break;
		case "area" :
			Addr_searchVO avo = mapper.shortarea(cri.getKeyword());
			cri.setRank1(avo.getRank1());
			cri.setRank2(avo.getRank2());
			cri.setRank3(avo.getRank3());
			list = mapper.OrderbyList(cri);
			break;
		case "category":
			list = mapper.OrderbyList(cri);
			break;
		default:
			list = mapper.OrderbyList(cri);
			break;
		}
			return list;
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
		rvo.setNick(mapper.getnickname(rvo.getMember_bno()));
		String nick = rvo.getNick();
		System.out.println(nick);
		String firstname= nick.substring(0, 1);
		nick=nick.substring(1);
		sb.setLength(0);
		sb.append(firstname);
		for(int i=0; i<nick.length();i++) sb.append("*");
		String nickname = sb.toString();
		rvo.setNick(nickname);
		mapper.writeReview(rvo);
	}
	
	@Override
	public void addlike(LikeMarkVO like) {
		mapper.addlike(like);
	}
	
	@Override
	public void removelike(LikeMarkVO like) {
		mapper.removelike(like);
	}
	
	@Override
	public List<LikeMarkVO> chkLike(int member_bno) {
		return mapper.chkLike(member_bno);
	}
	
	@Override
	public LikeMarkVO chkLikeone(LikeMarkVO lvo) {
		return mapper.chkLikeone(lvo);
	}
	
	@Override
	public int total(Criteria cri) {
		return mapper.total(cri);
	}
	
	
}











