package com.rainbow.web.purchase;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rainbow.web.mapper.PurchaseMapper;
import com.rainbow.web.mapper.ReserveSeatMapper;
import com.rainbow.web.reserveSeat.ReserveSeatDTO;

@Service
public class PurchaseServiceImpl implements PurchaseService {
	private static final Logger logger = LoggerFactory.getLogger(PurchaseService.class);
	@Autowired SqlSession sqlSession;
	@Autowired PurchaseDTO purchase;
	
	@Override
	public int insert(PurchaseDTO purchase) {
		logger.info("PurchaseService - insert() 진입 후 ");
		PurchaseMapper mapper = sqlSession.getMapper(PurchaseMapper.class);
		return mapper.insert(purchase);
	}

	@Override
	public List<PurchaseDTO> getList() {
		logger.info("PurchaseService - getList() 진입 후 ");
		PurchaseMapper mapper = sqlSession.getMapper(PurchaseMapper.class);
		return mapper.selectList();
	}

	@Override
	public List<PurchaseDTO> getByMemberId(PurchaseDTO purchase) {
		logger.info("PurchaseService - getByMemberId() 진입 후 ");
		PurchaseMapper mapper = sqlSession.getMapper(PurchaseMapper.class);
		return mapper.selectByMemberId(purchase);
	}

	@Override
	public PurchaseDTO getByPurchaseSeq(PurchaseDTO purchase) {
		logger.info("PurchaseService - getByPurchaseSeq() 진입 후 ");
		PurchaseMapper mapper = sqlSession.getMapper(PurchaseMapper.class);
		return mapper.selectByPurchaseSeq(purchase);
	}

	@Override
	public int count() {
		logger.info("PurchaseService - count() 진입 후 ");
		PurchaseMapper mapper = sqlSession.getMapper(PurchaseMapper.class);
		return mapper.count();
	}

	@Override
	public int update(PurchaseDTO purchase) {
		logger.info("PurchaseService - update() 진입 후 ");
		PurchaseMapper mapper = sqlSession.getMapper(PurchaseMapper.class);
		return mapper.update(purchase);
	}

	@Override
	public int delete(PurchaseDTO purchase) {
		logger.info("PurchaseService - delete() 진입 후 ");
		PurchaseMapper mapper = sqlSession.getMapper(PurchaseMapper.class);
		return mapper.delete(purchase);
	}

	@Override
	public List<PurchaseDTO> getByReserve(PurchaseDTO purchase) {
		logger.info("PurchaseService - getByReserve() 진입 후 ");
		PurchaseMapper mapper = sqlSession.getMapper(PurchaseMapper.class);
		return mapper.selectByReserve(purchase);
	}

	@Override
	public int countById(PurchaseDTO purchase) {
		logger.info("PurchaseService - countById() 진입 후 ");
		PurchaseMapper mapper = sqlSession.getMapper(PurchaseMapper.class);
		return mapper.countById(purchase);
	}

	@Override
	public PurchaseDTO getScreenNumber(PurchaseDTO purchase) {
		logger.info("PurchaseService - getScreenNumber() 진입 후 ");
		PurchaseMapper mapper = sqlSession.getMapper(PurchaseMapper.class);
		return mapper.selectScreenNumber(purchase);
	}
}
