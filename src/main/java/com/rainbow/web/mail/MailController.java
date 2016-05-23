package com.rainbow.web.mail;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.mail.MailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.rainbow.web.member.MemberDTO;

@Controller
@RequestMapping("/mail")
public class MailController {
	
	private static final Logger logger = LoggerFactory.getLogger(MailController.class);
	@Autowired MailService service;
	@Autowired MemberDTO member;
	
	@RequestMapping(value="/send", method=RequestMethod.POST)
	public String sendEmail(@RequestParam("email")String email,
							@RequestParam("name")String name,
							@RequestParam("contactsText")String contactsText){
		logger.info("mail 보내기.");
		String toAddr = "받는메일";
		String fromAddr = email;
 
		// email subject
		String subject = "문의 메일을 왔습니다.";
 
		// email body
		String body = "보내는 사람"+email+"\n<내 용>\n"+"=================================================\n"+ contactsText;
		service.sendMail(toAddr, fromAddr, subject, body);
		logger.info("mail 발송이후.");
		return "global/cinema.user";
	}
}
