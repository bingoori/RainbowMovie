package com.rainbow.app.buy;

import java.util.ArrayList;
import java.util.HashMap;
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

import com.mysql.jdbc.authentication.MysqlClearPasswordPlugin;
import com.rainbow.app.vod.VodDTO;
import com.rainbow.app.vod.VodService;
import com.rainbow.web.member.MemberDTO;
import com.rainbow.web.member.MemberService;

@Controller
@RequestMapping("/buy")
public class BuyController {
	private static final Logger logger = LoggerFactory
			.getLogger(BuyController.class);
	@Autowired
	BuyDTO buy;
	@Autowired
	MemberDTO member;
	@Autowired
	BuyService service;
	@Autowired
	MemberService memberService;
	@Autowired
	VodService vodService;
	@Autowired
	VodDTO vod;

	@RequestMapping("/buyIdCheck")
	public Model buyIdCheck(Model model, HttpSession session) {
		logger.info("=== getBuy () ===");
		member = (MemberDTO) session.getAttribute("user");
		if (member.getId() != null) { 
			
			model.addAttribute("CheckId", member); 
		} else {
			model.addAttribute("CheckId", null);
		}

		return model;
	}

	@RequestMapping("/vodBuy")
	public Model getBuy(@RequestParam("memSeq") String memSeq,
			@RequestParam("vodPrice") String vodPrice,
			@RequestParam("memcash") String memcash,
			@RequestParam("vodTitle") String vodName, Model model,
			HttpSession session) {
		logger.info("=== vodBuy () ===");
		member = (MemberDTO) session.getAttribute("user");
		int calc = (Integer.parseInt(memcash) - Integer.parseInt(vodPrice));
		HashMap<String, String> param = new HashMap<String, String>();
		param.put("memSeq", memSeq);
		param.put("memId", member.getId());
		param.put("vodTitle", vodName);
		param.put("price", Integer.toString(calc));
		if (calc > 0) {
			if (service.insertBuy(param) != 0) {
				if (memberService.calcVod(param) != 0) {
					model.addAttribute("success", 1);
				}
			}
		} else {
			model.addAttribute("success", 0);
		}
		return model;
	}

	@RequestMapping(value = "/vodPurchase", method = RequestMethod.POST)
	public Model vodPurchase(HttpSession session, Model model) {
		logger.info(" === VodController <> vodPurchse()===");
		List<BuyDTO> list = new ArrayList<BuyDTO>();
		List<VodDTO> vodList = new ArrayList<VodDTO>();
		member = (MemberDTO) session.getAttribute("user");
		list = service.selectBuy(member.getMemberSeq());
		for (int i = 0; i < list.size(); i++) {
			vod.setVodName(list.get(i).getVodName());
			vodList.add(vodService.getByName(vod));
		} 
		return model.addAttribute("purchase", vodList);
	}

}
