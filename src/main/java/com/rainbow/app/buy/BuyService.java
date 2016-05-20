package com.rainbow.app.buy;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

 
public interface BuyService {
	//C 구매내역 저장

	
	public int insertBuy(HashMap<String, String> param);
	//R 구매내역 조회
	
	public List<BuyDTO> selectBuy(int memberSeq);
	// U 구매금액 차감
	public int calcVod(HashMap<String, String> hash);
	
	// 구매내역 저장 + 구매 금액 차감 Transaction 처리 
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Throwable.class})
	public int compProcess(HashMap<String, String> param) throws SQLException;
	
}
