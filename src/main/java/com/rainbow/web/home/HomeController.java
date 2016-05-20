package com.rainbow.web.home;



import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.rainbow.web.member.MemberDTO;
import com.rainbow.web.member.MemberService;
import com.rainbow.web.movie.MovieDTO;
import com.rainbow.web.movie.MovieService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@Autowired MovieDTO movie;
	@Autowired MovieService movieService;
	@Autowired MemberDTO member;
	@Autowired MemberService memberService;
	
	@RequestMapping(value="/", method=RequestMethod.GET) 
	public String home(
			Model model,
			HttpSession session) { // 어플리케이션 실행 시 체일 먼저 호출되는 메소드 (web.xml에서 설정되어있다)
		logger.info("메인 페이지 진입 체크");
		
		member.setId(null);
		member.setName("비회원");
		
		if(session.getAttribute("user") == null){
			session.setAttribute("user", member);
		}
		
		List<MovieDTO> list = new ArrayList<MovieDTO>();
		// 현재 레이팅 점수 중 가장 상위 영화 6개 메인에 뿌리기 (1920 x 616 이미지)
		movie.setStart(0);
		movie.setEnd(6);
		list = movieService.getList(movie);
		model.addAttribute("mainList", list);
				
		// 현재 레이팅 점수 중 가장 상위 영화 5개 메인에 뿌리기 (380 x 600 이미지)
		movie.setStart(0);
		movie.setEnd(6);
		list = movieService.getList(movie);
		model.addAttribute("bestList", list);
				
		// 현재 상영작 8개 메인화면에 뿌리기 (424 x 424 이미지)
		movie.setStart(0);
		movie.setEnd(8);
		list = movieService.getList(movie);
		model.addAttribute("movieList", list);
			
		return "global/main.user";
	}
}
