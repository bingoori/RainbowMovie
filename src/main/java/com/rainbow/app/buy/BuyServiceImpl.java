package com.rainbow.app.buy;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.rainbow.web.mapper.BuyMapper;
import com.rainbow.web.mapper.MemberMapper;
import com.rainbow.web.member.MemberDTO;

@Service
@Transactional
public class BuyServiceImpl implements BuyService{
	
	private static final Logger logger = LoggerFactory.getLogger(BuyServiceImpl.class);
	@Autowired SqlSession sqlSession;
	@Autowired BuyDTO vod;

	@Override
	public int insertBuy(HashMap<String,String> param) { 
		logger.info(" === insertBuy() ===");
		BuyMapper mapper = sqlSession.getMapper(BuyMapper.class);
		return mapper.addBuy(param);
	}

	@Override
	public List<BuyDTO> selectBuy(int memberSeq) { 
		logger.info(" === selectBuy() ===");
		BuyMapper mapper = sqlSession.getMapper(BuyMapper.class);  
		return mapper.getBuy(memberSeq);
	}

	@Override
	public int calcVod(HashMap<String, String> hash) {
		logger.info(" === calcVod() ===");
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);  
		return mapper.sellVod(hash);
	}

	@Override
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Throwable.class})
	public int compProcess(HashMap<String, String> param) {
		BuyMapper buyMapper = sqlSession.getMapper(BuyMapper.class);
		MemberMapper memMapper = sqlSession.getMapper(MemberMapper.class);
		HashMap<String, String> asdf = new HashMap<String, String>();
		param.put("price", "10000000000000000");
		  
	 return memMapper.sellVod(asdf);
	
	}

}
