package com.rainbow.web.reserveSeat;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller


@RequestMapping("/reserve")
public class ReserveSeatController {
	private static final Logger logger = LoggerFactory.getLogger(ReserveSeatController.class);
	@Autowired ReserveSeatDTO reserveSeat;
	@Autowired ReserveSeatService service; 
	
	@RequestMapping("/count")
	public void count(){
		int count =service.count();
		
	}
}
