package com.tonari.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tonari.domain.PayListVO;
import com.tonari.mapper.MypageMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;

@Service
@AllArgsConstructor
public class MypageServiceImpl implements MypageService {
	@Setter(onMethod_ = @Autowired)
	private MypageMapper mapper;
	

	@Override
	public void payInfo(PayListVO pay) {
		mapper.payInsert(pay);
		
	}

}
