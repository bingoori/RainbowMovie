package com.rainbow.web.reserveSeat;

import static org.hamcrest.CoreMatchers.is;
import static org.junit.Assert.assertNotNull;
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

import com.rainbow.web.mapper.ReserveSeatMapper;

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:META-INF/*-context.xml")
public class ReserveSeatServiceImplTest {
	@Autowired ReserveSeatDTO reserveSeat;
	@Autowired SqlSession session;
	
/*	
	@Test
	public void testInsert() {
		ReserveSeatMapper mapper = session.getMapper(ReserveSeatMapper.class);
		reserveSeat.setBeginTime("09:00");
		reserveSeat.setReserveDate("2016-05-02");
		reserveSeat.setMovieTitle("시빌워");
		reserveSeat.setScreenNumber("1관");
		reserveSeat.setSeat("a1");
		
		assertThat(mapper.insert(reserveSeat), is(1));	
	}
*/
	@Test
	public void testGetList() {
		ReserveSeatMapper mapper = session.getMapper(ReserveSeatMapper.class);
		List<ReserveSeatDTO> list = new ArrayList<ReserveSeatDTO>();
		list= mapper.selectList();
	
		assertThat(list.size(), is(2));	
	}

	@Test
	public void testGetByReserve() {
		ReserveSeatMapper mapper = session.getMapper(ReserveSeatMapper.class);
		List<ReserveSeatDTO>list= new ArrayList<>();
		reserveSeat.setBeginTime("09:00");
		reserveSeat.setReserveDate("2016-05-02");
		reserveSeat.setMovieTitle("시빌워");
		reserveSeat.setScreenNumber("1관");
		list = mapper.selectByReserve(reserveSeat);
		
		assertThat(list.get(0).getMovieTitle(),is("시빌워"));
		
	}

	@Test
	public void testGetByReserveSeq() {
		ReserveSeatMapper mapper = session.getMapper(ReserveSeatMapper.class);
		reserveSeat.setReserveSeq(1);
		ReserveSeatDTO test = mapper.selectByReserveSeq(reserveSeat);
		assertThat(test.getMovieTitle(),is("시빌워"));
		
	}
	
	@Test
	public void testCount() {
		ReserveSeatMapper mapper = session.getMapper(ReserveSeatMapper.class);
		assertNotNull(mapper.count());
		
	}

	@Test
	public void testUpdate() {
		ReserveSeatMapper mapper = session.getMapper(ReserveSeatMapper.class);
	
		reserveSeat.setReserveSeq(1);
		reserveSeat.setSeat("a3");
		assertThat(mapper.update(reserveSeat),is(1));
	}
/*
	@Test
	public void testDelete() {
		ReserveSeatMapper mapper = session.getMapper(ReserveSeatMapper.class);
		reserveSeat.setReserveSeq(1);
		assertThat(mapper.delete(reserveSeat),is(1));	
	}
*/
}
