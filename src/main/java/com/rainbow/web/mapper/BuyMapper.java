package com.rainbow.web.mapper;

import java.util.HashMap;
import java.util.List;

import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.rainbow.app.buy.BuyDTO;

public interface BuyMapper {
	// C 구매내역 저장
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Throwable.class})
		public int addBuy(HashMap<String,String> param);
	// R구매내역 조회
		public List<BuyDTO> getBuy(int memberSeq);
	// U 구매금액 차감
		public int sellVod(int cac);
}
