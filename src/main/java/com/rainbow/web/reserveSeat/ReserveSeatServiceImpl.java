package com.rainbow.web.reserveSeat;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rainbow.web.mapper.ReserveSeatMapper;

@Service
public class ReserveSeatServiceImpl implements ReserveSeatService{
	private static final Logger logger = LoggerFactory.getLogger(ReserveSeatServiceImpl.class);
	@Autowired SqlSession sqlSession; 
	@Autowired ReserveSeatDTO reserveSeat;
	
	@Override
	public int insert(ReserveSeatDTO reserveSeat) {
		// C 예매좌석 등록  
		logger.info("ReserveSeatServie - insert() 진입 후 ");
		ReserveSeatMapper mapper = sqlSession.getMapper(ReserveSeatMapper.class);
		return mapper.insert(reserveSeat);
	}
		
		@Override
	public List<ReserveSeatDTO> getList() {
		// R 모든 예매 좌석 조회
		logger.info("ReserveSeatServie - getList() 진입 후 ");
		ReserveSeatMapper mapper = sqlSession.getMapper(ReserveSeatMapper.class);
		return mapper.selectList();
	}

	@Override
	public List<ReserveSeatDTO> getByReserve(ReserveSeatDTO reserveSeat) {
		// R 영화이름&날짜&시작시간&상영관으로 좌석 조회
		logger.info("ReserveSeatServie - getByReserve() 진입 후 ");
		ReserveSeatMapper mapper = sqlSession.getMapper(ReserveSeatMapper.class);
		return mapper.selectByReserve(reserveSeat);
	}

	@Override
	public ReserveSeatDTO getByReserveSeq(ReserveSeatDTO reserveSeat) {
		// R 아이디로 좌석 조회
		logger.info("ReserveSeatServie - getById() 진입 후 ");
		ReserveSeatMapper mapper = sqlSession.getMapper(ReserveSeatMapper.class);
		return mapper.selectByReserveSeq(reserveSeat);
	}

	@Override
	public int count() {
		// R 예약된 좌석 수 카운트
		logger.info("ReserveSeatServie - count() 진입 후 ");
		ReserveSeatMapper mapper = sqlSession.getMapper(ReserveSeatMapper.class);
		System.out.println("mapper.count()실행 : "+mapper.count());
		
		return mapper.count();
	}

	@Override
	public int update(ReserveSeatDTO reserveSeat) {
		// U 예약된 좌석 수정
		logger.info("ReserveSeatServie - update() 진입 후 ");
		ReserveSeatMapper mapper = sqlSession.getMapper(ReserveSeatMapper.class);
		return mapper.update(reserveSeat);
	}

	@Override
	public int delete(ReserveSeatDTO reserveSeat) {
		// D 예약된 좌석 삭제
		logger.info("ReserveSeatServie - delete() 진입 후 ");
		ReserveSeatMapper mapper = sqlSession.getMapper(ReserveSeatMapper.class);
		return mapper.delete(reserveSeat);
	}

	@Override
	public int deleteBySeat(ReserveSeatDTO reserveSeat) {
		// D 선택한 좌석 삭제
		logger.info("ReserveSeatServie - deleteBySeat() 진입 후 ");
		ReserveSeatMapper mapper = sqlSession.getMapper(ReserveSeatMapper.class);
		return mapper.deleteBySeat(reserveSeat);
	}

}
