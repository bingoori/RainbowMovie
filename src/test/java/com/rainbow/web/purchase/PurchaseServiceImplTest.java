package com.rainbow.web.purchase;

import static org.hamcrest.CoreMatchers.*;
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

import com.rainbow.web.mapper.PurchaseMapper;

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:META-INF/*-context.xml")
public class PurchaseServiceImplTest {
	@Autowired PurchaseDTO purchase;
	@Autowired SqlSession session;

/*	@Test
	public void testInsert() {
		PurchaseMapper mapper = session.getMapper(PurchaseMapper.class);
		purchase.setMemberId("hong");
		purchase.setMovieTitle("캡틴 아메리카: 시빌 워");
		purchase.setScreenNumber("1관");
		purchase.setBeginTime("2:00");
		purchase.setReserveSeat("A11");
		purchase.setPurchasePrice(9000);
		purchase.setAdultCount(1);
		purchase.setStudentCount(0);
		
		assertThat(mapper.insert(purchase), is(1));
	}*/

	@Test
	public void testGetList() {
		PurchaseMapper mapper = session.getMapper(PurchaseMapper.class);
		List<PurchaseDTO> list = new ArrayList<PurchaseDTO>();
		
		list = mapper.selectList();
		assertThat(list.size(), is(not(0)));
	}

	@Test
	public void testGetByMemberId() {
		PurchaseMapper mapper = session.getMapper(PurchaseMapper.class);
		List<PurchaseDTO> list = new ArrayList<PurchaseDTO>();
		
		purchase.setMemberId("hong");
		list = mapper.selectByMemberId(purchase);
		assertThat(list.size(), is(1));
	}

	@Test
	public void testGetByPurchaseSeq() {
		PurchaseMapper mapper = session.getMapper(PurchaseMapper.class);
		
		purchase.setPurchaseSeq(1);
		assertThat(mapper.selectByPurchaseSeq(purchase).getMemberId(), is("hong"));
	}
	
	@Test
	public void testCount() {
		PurchaseMapper mapper = session.getMapper(PurchaseMapper.class);
		
		assertThat(mapper.count(), is(1));
	}
	
	@Test
	public void testUpdate() {
		PurchaseMapper mapper = session.getMapper(PurchaseMapper.class);
		purchase.setMovieTitle("캡틴 아메리카: 시빌 워");
		purchase.setScreenNumber("1관");
		purchase.setBeginTime("2:00");
		purchase.setReserveSeat("A21");
		purchase.setPurchasePrice(9000);
		purchase.setAdultCount(1);
		purchase.setStudentCount(0);
		purchase.setPurchaseSeq(1);
		
		assertThat(mapper.update(purchase), is(1));
	}

/*	@Test
	public void testDelete() {
		PurchaseMapper mapper = session.getMapper(PurchaseMapper.class);
		purchase.setPurchaseSeq(1);
		assertThat(mapper.delete(purchase), is(1));
	}*/
}
