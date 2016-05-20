package com.rainbow.web.movie;

import static org.hamcrest.CoreMatchers.is;
import static org.hamcrest.CoreMatchers.not;
import static org.junit.Assert.*;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.junit.BeforeClass;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.rainbow.web.mapper.MovieMapper;

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:META-INF/*-context.xml")
public class MovieServiceImplTest {
	@Autowired SqlSession session;
	@Autowired MovieDTO movie;
	
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
	}

//	@Test
//	public void testInput() {
//		MovieMapper mapper = session.getMapper(MovieMapper.class);
//		movie.setRating(7);
//		movie.setTitle("시간이탈자");
//		movie.setGenre("스릴러");
//		movie.setOpen_date("2016-04-13");
//		movie.setGrade("15세 관람가");
//		movie.setRunningtime("107분");
//		movie.setDirector("곽재용");
//		movie.setActor("임수정");
//		movie.setContent("서로 다른 시대, 하나의 살인사건 ");
//		movie.setImage("Time_Renegades.jpg");
//		assertThat(mapper.insert(movie),is(1));
//	}

//	@Test
//	public void testGetById() {
//		fail("Not yet implemented");
//	}

//	@Test
//	public void testGetByName() {
//		MovieMapper mapper = session.getMapper(MovieMapper.class);
//		List<MovieDTO> list = new ArrayList<MovieDTO>();
//		movie.setTitle("시빌워");
//		list = mapper.selectByName(movie);
//		assertThat(list.size(), is(not(0)));
//	}

//	@Test
//	public void testGetList() {
//	MovieMapper mapper = session.getMapper(MovieMapper.class);
//	List<MovieDTO> list = new ArrayList<MovieDTO>();
//	list = mapper.selectList();
//	assertThat(list.size(), is(not(0)));	
//	}

//	@Test
//	public void testCount() {
//		MovieMapper mapper = session.getMapper(MovieMapper.class);
//		assertThat(mapper.count(), is(not(0)));
//	}

//	@Test
//	public void testUpdate() {
//		MovieMapper mapper = session.getMapper(MovieMapper.class);
//		movie.setMovieSeq(5);
//		movie.setRating(8);
//		movie.setTitle("시간이탈자");
//		movie.setGenre("스릴러");
//		movie.setOpenDate("2016-04-13");
//		movie.setGrade("15세 관람가");
//		movie.setRunningtime("107분");
//		movie.setDirector("곽재용");
//		movie.setActor("임수정");
//		movie.setContent("서로 다른 시대, 하나의 살인사건 ");
//		movie.setImage("Time_Renegades.jpg");
//		int check = mapper.update(movie);
//		assertThat(check, is(1));
//	}

	@Test
	public void testRemove() {
		MovieMapper mapper = session.getMapper(MovieMapper.class);
		movie.setMovieSeq(5);
		assertThat(mapper.delete(movie),is(1));
	}

}
