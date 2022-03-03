package com.tonari.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tonari.domain.Addr_searchVO;
import com.tonari.domain.BoardVO;
import com.tonari.domain.TeacherSearch_viewVO;
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
	public List<TeacherSearch_viewVO> OrderbyList(Criteria cri) {
		List<TeacherSearch_viewVO> list = new ArrayList<TeacherSearch_viewVO>();
		switch(cri.getType()) {
		case "orderby" :
			list = mapper.OrderbyList(cri);
			break;
		case "area" :
			String gu = mapper.addr_search(cri.getKeyword());
			Addr_searchVO avo = mapper.shortarea(gu);
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
		Teacherinfo_viewVO tvo = mapper.teacherinfo(bno);
		tvo.setDate(dodate(tvo));
		return tvo;
	}
	
	@Override
	public List<Review_viewVO> review(int bno) {
		List<Review_viewVO> list = mapper.review(bno);
		for(int i =0; i<list.size();i++) {
			Review_viewVO rvo = new Review_viewVO();
			String nick = list.get(i).getNick();
			int star = list.get(i).getScore();
			rvo.setStar(star(star));
			rvo.setNick(nickname(nick));
			rvo.setContent(list.get(i).getContent());
			rvo.setMember_bno(list.get(i).getMember_bno());
			rvo.setScore(list.get(i).getScore());
			rvo.setTeacher_bno(list.get(i).getTeacher_bno());
			rvo.setReview_bno(list.get(i).getReview_bno());
			list.set(i,rvo);
		}
		return list; 
	}
	
	@Override
	public void writeReview(ReviewVO rvo) {
		String nick=mapper.getnickname(rvo.getMember_bno());
		rvo.setNick(nickname(nick));
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
	public LikeMarkVO chkLikeone(LikeMarkVO lvo) {
		return mapper.chkLikeone(lvo);
	}
	
	@Override
	public int total(Criteria cri) {
		return mapper.total(cri);
	}
	
	@Override
	public List<LikeMarkVO> chklike(LikeMarkVO lvo) {
		return mapper.chklike(lvo);
	}
	
	public String dodate(Teacherinfo_viewVO tvo) {
		int date = tvo.getDodate();
		String[] week = new String[] {"日","月","火","水","木","金","土"};
		StringBuilder sb = new StringBuilder();
		String day = "";
		sb.append(day);
		String dodate = String.format("%07d", Integer.parseInt(Integer.toBinaryString(date & 127)));
		for(int i=0; i<7;i++) {
			if(dodate.charAt(i)=='1') {
				sb.append(week[i]+"、");
			}
		}
		sb.deleteCharAt(sb.lastIndexOf("、"));
		day = sb.toString();
		return day;
	}
	
	public String nickname(String nick) {
		StringBuilder sb = new StringBuilder();
		String firstname= nick.substring(0, 1);
		nick=nick.substring(1);
		sb.setLength(0);
		sb.append(firstname);
		for(int i=0; i<nick.length();i++) sb.append("*");
		String nickname = sb.toString();
		return nickname;
	}
	
	public String star(int stars) {
		String star = "";
		StringBuilder sb = new StringBuilder();
		sb.append(star);
		for(int i = 0; i<stars;i++) {
			sb.append("<img src = '/resources/custom/images/starTeacher.png'style='width: 17px; height: 17px;'>");
		}
		for(int i=0;i<5-stars;i++) {
			sb.append("<img src = '/resources/custom/images/blackstarTeacher.png'style='width: 17px; height: 17px;'>");
		}
		star = sb.toString();
		return star;
	}
	
	@Override
	public List<TeacherSearch_viewVO> mainsearch(Criteria cri) {
		log.info("아아아아아아아아아아아"+cri.getCategory_bno());
		log.info(cri.getDong());
		return mapper.mainsearch(cri);
	}
	
	@Override
	public BoardVO viewboard(int bno) {
		return mapper.viewboard(bno);
	}
}