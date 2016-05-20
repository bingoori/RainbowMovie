package com.rainbow.web.member;

import static org.hamcrest.CoreMatchers.is;
import static org.hamcrest.CoreMatchers.not;
import static org.junit.Assert.assertThat;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.rainbow.web.mapper.MemberMapper;

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:META-INF/*-context.xml") 
public class MemberServiceImplTest {
	// 이 AutoWired를 쓰려면 servlet-context.xml을 인식하게 해야한다. 그래서 위에 contetConfiguration을 쓰고 servlet-context.xml을 META-INF밑으로 옮겨온다.
	@Autowired MemberDTO member;
	@Autowired SqlSession session;
	
	@Test
	public void testInsert() {
		MemberMapper mapper = session.getMapper(MemberMapper.class);
		member.setId("kim");
		member.setPassword("1");
		member.setName("김희태");
		member.setBirth("1990-10-13");
		member.setAddr("인천광역시 남동구 구월2동 구월힐스테이트 1107동 1501호");
		member.setEmail("propose0506@naver.com");
		int check = mapper.insert(member);
		assertThat(check, is(1)); // 회원가입 성공 시 리턴 값은 1(초록불) 아니면 빨간불
	}
	
	@Test
	public void testSelectList() { // SELECT * FROM RainbowMember
		MemberMapper mapper = session.getMapper(MemberMapper.class);
		List<MemberDTO> list = new ArrayList<MemberDTO>();
		list = mapper.selectList();
		assertThat(list.size(), is(not(0))); // 전체 회원 조회 시 리턴되는 값이 0이 아니면 성공(초록불) 아니면 빨간불
	}
	
	@Test
	public void testSelectByName() { // 이름으로 회원 조회 (중복허용)
		MemberMapper mapper = session.getMapper(MemberMapper.class);
		member.setName("김희태");
		List<MemberDTO> list = new ArrayList<MemberDTO>();
		list = mapper.selectByName(member);
		assertThat(list.size(), is(not(0))); // 이름으로 조회 시 리턴되는 값이 0이 아니면 성공(초록불) 아니면 빨간불
	}
	
	@Test
	public void testLogin() { // 회원 로그인 체크
		MemberMapper mapper = session.getMapper(MemberMapper.class);
		member.setId("kim");
		member.setPassword("1");
		MemberDTO check = mapper.login(member);
		assertThat(check.getId(), is(member.getId())); // 입력한 Id와 데이터베이스를 통해 가져온 ID가 같으면 로그인 성공 (초록불) 아니면 빨간불
	}
	
	@Test
	public void testSelectById() { // Id로 회원 조회
		MemberMapper mapper = session.getMapper(MemberMapper.class);
		member.setId("kim");
		MemberDTO check = mapper.selectById(member);
		assertThat(check.getId(), is(member.getId())); // 입력한 Id와 데이터베이스를 통해 가져온 ID가 같으면 로그인 성공 (초록불) 아니면 빨간불
	}
	
	@Test
	public void testCount() { // RainbowMember Count
		MemberMapper mapper = session.getMapper(MemberMapper.class);
		int count = mapper.count();
		assertThat(count, is(not(0))); // null이면 빨간불 null아니면 초록불~
	}
	
	@Test
	public void testUpdate() { // RainbowMember Update
		MemberMapper mapper = session.getMapper(MemberMapper.class);
		member.setId("kim");
		member.setPassword("2");
		member.setAddr("한빛교육센터");
		member.setEmail("propose0915@gmail.com");
		int check = mapper.update(member);
		assertThat(check, is(1)); // 업데이트 성공하면 1이 리턴됨(초록불) 아니면 빨간불
	}
	
	@Test
	public void testDelete() { // RainbowMember Delete
		MemberMapper mapper = session.getMapper(MemberMapper.class);
		member.setId("kim");
		int check = mapper.delete(member);
		assertThat(check, is(1)); // 삭제 성공하면 1이 리턴됨(초록불) 아니면 빨간불
	}
}
