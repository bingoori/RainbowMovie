package com.rainbow.web.admin;

import static org.hamcrest.CoreMatchers.is;
import static org.junit.Assert.*;



import org.apache.ibatis.session.SqlSession;
import org.hamcrest.Matcher;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import static org.hamcrest.CoreMatchers.*;


import com.rainbow.web.mapper.ReplyMapper;
import com.rainbow.web.reply.ReplyDTO;
@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration("classpath:META-INF/*-context.xml")
public class AdminServiceImplTest {
	@Autowired SqlSession sqlSession;
	//@Autowired MovieDTO movie;
	@Autowired ReplyDTO reply;
	
	
	/*@Test
	public void testInsert(){
		MovieMapper mapper = sqlSession.getMapper(MovieMapper.class);
		movie.setTitle("시빌워");
		movie.setRating(10);
		movie.setGenre("action");
		movie.setOpenDate("2016-04-27");
		movie.setGrade("12세");
		movie.setRunningtime("147분");
		movie.setDirector("조 루소");
		movie.setActor("크리스 에반스");
		movie.setContent("어벤저스 VS 어벤저스");
		movie.setImage("poster.jpg");
		assertThat(mapper.insert(movie), is(1));
		
	}
	@Test
	   public void testSelectList() { // SELECT * FROM RainbowMember
		  MovieMapper mapper = sqlSession.getMapper(MovieMapper.class);
	      List<MovieDTO> list = new ArrayList<MovieDTO>();
	      list = mapper.selectList();
	      assertThat(list.size(), is(not(0))); // 전체 회원 조회 시 리턴되는 값이 0이 아니면 성공(초록불) 아니면 빨간불
	   }*/
	


	

/*	@Test
	public void TestUpdate(){
		MovieMapper mapper = sqlSession.getMapper(MovieMapper.class);
		movie.setTitle("시빌워");
		movie.setRating(10);
		movie.setGenre("action");
		movie.setOpenDate("2016-04-27");
		movie.setGrade("12세");
		movie.setRunningtime("147분");
		movie.setDirector("조 루소");
		movie.setActor("크리스 에반스");
		movie.setContent("어벤저스 VS 어벤저스");
		movie.setImage("poster.jpg");
		assertNotNull(mapper.update(movie));
	}
	
	@Test
	public void testDelete() {
		MovieMapper mapper = sqlSession.getMapper(MovieMapper.class);
		movie.setMovieSeq(1);
		assertThat(mapper.insert(movie),is(1));
	}*/
	
	
	

}
