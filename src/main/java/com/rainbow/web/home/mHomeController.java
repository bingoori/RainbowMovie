package com.rainbow.web.home;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class mHomeController {
	private static final Logger logger = LoggerFactory.getLogger(mHomeController.class);
 
	
	@RequestMapping(value="/mobile", method=RequestMethod.GET) 
	public String home(HttpSession session) { // 어플리케이션 실행 시 체일 먼저 호출되는 메소드 (web.xml에서 설정되어있다)
		logger.info("Mobile Home Controller");
		/*session.setAttribute("user", null);*/
		return "layout_vod";
	}
	
 
}
