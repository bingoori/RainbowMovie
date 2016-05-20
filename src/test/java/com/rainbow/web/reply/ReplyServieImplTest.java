package com.rainbow.web.reply;

import static org.junit.Assert.*;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.hamcrest.Matcher;
import org.hamcrest.core.Is;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.rainbow.web.mapper.ReplyMapper;
import static org.hamcrest.CoreMatchers.*;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration("classpath:META-INF/*-context.xml")
public class ReplyServieImplTest {
	@Autowired SqlSession sqlSession;
	@Autowired ReplyDTO reply;
	@Test
	public void testInsert() {
		ReplyMapper mapper = sqlSession.getMapper(ReplyMapper.class);
		reply.setWriterName("hong");
		reply.setRegTime("11111");
		reply.setReplyContent("sss");
		assertThat(mapper.insert(reply),is(1));
	}

	/*@Test
	public void testGetList() {
		  ReplyMapper mapper = sqlSession.getMapper(ReplyMapper.class);
	      List<ReplyDTO> list = new ArrayList<ReplyDTO>();
	      list = mapper.selectList();
	      assertThat(list.size(), is(not(0))); // 전체 회원 조회 시 리턴되는 값이 0이 아니면 성공(초록불) 아니면 빨간불
	}*/

	@Test
	public void testGetByReplySeq() {
		ReplyMapper mapper = sqlSession.getMapper(ReplyMapper.class);
	      List<ReplyDTO> list = new ArrayList<ReplyDTO>();
	      list = mapper.selectBySeq(reply);
	      assertThat(list.size(), is(not(0)));
	}


/*	@Test
	public void testCount() {
		ReplyMapper mapper = sqlSession.getMapper(ReplyMapper.class);
		assertNotNull(mapper.count(reply));
	}*/

	@Test
	public void testUpdate() {
		ReplyMapper mapper = sqlSession.getMapper(ReplyMapper.class);
		reply.setWriterName("hong");
		reply.setReplyContent("sss");
		assertNotNull(mapper.update(reply));
	}

	@Test
	public void testDelete() {
		ReplyMapper mapper = sqlSession.getMapper(ReplyMapper.class);
		reply.setReplySeq(1);
		assertNotNull(mapper.delete(reply));
	}


	

}
