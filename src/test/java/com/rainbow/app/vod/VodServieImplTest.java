package com.rainbow.app.vod;

import static org.hamcrest.CoreMatchers.is;
import static org.hamcrest.CoreMatchers.not;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertThat;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.rainbow.web.mapper.VodMapper;
import com.rainbow.web.member.MemberController;
import com.rainbow.web.member.MemberDTO;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration("classpath:META-INF/*-context.xml")
public class VodServieImplTest {

	private static final Logger logger = LoggerFactory
			.getLogger(MemberController.class);
	
	@Autowired VodDTO vod;
	@Autowired
	SqlSession session;


	public void testInsert() {

		VodMapper mapper = session.getMapper(VodMapper.class);
		vod.setVodName("친구3");
		vod.setVodContent("니 내랑 부산 접수할래?");
		vod.setVodPrice("1000");
		vod.setVodCategory("느와르,액션");
		vod.setVodTime(124);
		vod.setVodRating("6.26");
		vod.setVodUrl("/youtube/friend");
		vod.setVodImage("/vod_image/noir/friend2.png");
		vod.setVodFree("n");
		vod.setVodGrade("18세이상관람가");
		vod.setVodActor("유오성,주진모");
		vod.setVodDirector("곽경택");
		vod.setVodCountry("한국");
		logger.info(" === VodServiceImplTest <> testInsert(){} ===", mapper.addMovie(vod));
		
	}
	public void testGetList() {
		VodDTO vod = new VodDTO();
		List<VodDTO> list = new ArrayList<VodDTO>();
		VodMapper mapper = session.getMapper(VodMapper.class);
		vod.setVodName("친구2");
		list = mapper.getVodList(vod);
		logger.info(" === VodServiceImplTest <> testGetList(){} ===", list.size());
		assertThat(list.size(), is(not(0)));

	}
	
	public void testGetByName() {
		VodMapper mapper = session.getMapper(VodMapper.class);
		vod.setVodName("친구2");
		vod = mapper.getByVodName(vod.getVodName());
		logger.info(" === VodServiceImplTest <> testGetByName(){} ===", vod.getVodName());
	
	}
 
	public void testVodSearch() {
		List<VodDTO> list = new ArrayList<VodDTO>();
		VodMapper mapper = session.getMapper(VodMapper.class);
		list = mapper.VodSearch("스");
		logger.info(" === VodServiceImplTest <> testVodSearch(){} ===", list.size());
	}

	@Test
	public void testVodAtLeast() {
		List<VodDTO> list = new ArrayList<VodDTO>();
		VodMapper mapper = session.getMapper(VodMapper.class);
		list = mapper.getAtLeastVodLimit();
		logger.info(" === VodServiceImplTest <> testVodAtLeast(){} ===", list.size());
	
		assertThat(list.size(), is(not(0))); // 이름으로 조회 시 리턴되는 값이 0이 아니면 성공(초록불) 아니면 빨간불
	}
 
	
	public void testVodCommon() {
		List<VodDTO> list = new ArrayList<VodDTO>();
		VodMapper mapper = session.getMapper(VodMapper.class);
		list = mapper.getCommonVodLimit();
		logger.info(" === VodServiceImplTest <> testVodCommon(){} ===", list.size());
		assertThat(list.size(), is(not(0))); // 이름으로 조회 시 리턴되는 값이 0이 아니면 성공(초록불) 아니면 빨간불
		 
	}
	
	public void testVodFree() {
		List<VodDTO> list = new ArrayList<VodDTO>();
		VodMapper mapper = session.getMapper(VodMapper.class);
		list = mapper.getFreeVodLimit();
		logger.info(" === VodServiceImplTest <> testVodFree(){} ===", list.size());
		assertThat(list.size(), is(not(0))); // 이름으로 조회 시 리턴되는 값이 0이 아니면 성공(초록불) 아니면 빨간불
	}
	public void testLogin() {
		MemberDTO check = new MemberDTO();
		VodMapper mapper = session.getMapper(VodMapper.class);
		check.setId("bingoori");
		check.setPassword("1");
		check = mapper.vodLogin(check);
		logger.info(" === VodServiceImplTest <> testLogin(){} ===",check.getId());
		assertEquals("bingoori", check.getId());
	}
	

	public void testCount() {
		VodMapper mapper = session.getMapper(VodMapper.class);
		logger.info(" === VodServiceImplTest <> testCount(){} ===", mapper.VodCount());
		
	}

	
	
	public void testUpdate() {
		
		VodMapper mapper = session.getMapper(VodMapper.class);
		vod.setVodName("친구3");
		vod = mapper.getByVodName(vod.getVodName());
		logger.info(" === VodServiceImplTest <> getByVodName(){} ===", vod);
		vod.setVodContent("니 내랑 부산 접수할랭??? 시롱");
		vod.setVodCountry("한쿡인");
		logger.info(" === VodServiceImplTest <> testUpdate(){} ===", mapper.VodUpdate(vod));
		
	}

	
	public void testDelete() {
		vod.setVodName("친구3");
		VodMapper mapper = session.getMapper(VodMapper.class);
		
		logger.info(" === VodServiceImplTest <> testDelete(){} ===", mapper.VodDelete(vod));
	}

}
