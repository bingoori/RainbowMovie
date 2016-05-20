package com.rainbow.web.member;

import java.util.HashMap;
import java.util.List;



import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rainbow.web.mapper.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService {
	private static final Logger logger = LoggerFactory.getLogger(MemberService.class);
	@Autowired SqlSession sqlSession; 
	@Autowired MemberDTO member;
	
	@Override
	public int insert(MemberDTO member) {
		// C 회원 가입(등록)
		logger.info("MemberServie - insert() 진입 후 ");
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		return mapper.insert(member);
	}

	@Override
	public List<MemberDTO> getList() {
		// R 회원 조회
		logger.info("MemberServie - getList() 진입 후 ");
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		return mapper.selectList();
	}

	@Override
	public List<MemberDTO> getByName(MemberDTO member) {
		// R 이름으로 회원 조회 (중복 이름 허용)
		logger.info("MemberServie - getByName() 진입 후 ");
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		return mapper.selectByName(member);
	}

	@Override
	public MemberDTO login(MemberDTO member) {
		// R 로그인한 회원 조회 (로그인 체크)
		logger.info("MemberServie - login() 진입 후 ");
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		return mapper.login(member);
	}

	@Override
	public MemberDTO getById(MemberDTO member) {
		// R ID로 회원 조회
		logger.info("MemberServie - getById() 진입 후 ");
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		return mapper.selectById(member);
	}

	@Override
	public int count() {
		// R 회원 수 조회
		logger.info("MemberServie - count() 진입 후 ");
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		return mapper.count();
	}

	@Override
	public int update(MemberDTO member) {
		// U 회원 정보 수정
		logger.info("MemberServie - update() 진입 후 ");
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		return mapper.update(member);
	}

	@Override
	public int delete(MemberDTO member) {
		// D 회원 정보 삭제
		logger.info("MemberServie - delete() 진입 후 ");
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		return mapper.delete(member);
	}

	@Override
	public int calcVod(HashMap<String, String> hash) {
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		return mapper.sellVod(hash);
	}

	@Override
	public int updatePoint(MemberDTO member) {
		// U 회원 정보 수정 (포인트)
		logger.info("MemberServie - updatePoint() 진입 후 ");
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		return mapper.updatePoint(member);
	}

}
