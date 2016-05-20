package com.rainbow.app.vod;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.rainbow.app.buy.BuyDTO;

@Controller
@RequestMapping("/vod")
public class VodController {
	
	private static final Logger logger = LoggerFactory.getLogger(VodController.class);
	@Autowired
	VodDTO vod;
	@Autowired
	VodService service;
 

	
	@RequestMapping("/vodListAll")
	public Model vodListAll(@RequestParam(value="start",defaultValue = "0")String start,Model model) {
		vod.setStartNum(Integer.parseInt(start));
		vod.setEndNum(5);
		vod.setCount(service.count());
		model.addAttribute("page", vod);
		model.addAttribute("vod", service.getList(vod));
		return model;
	}
	
	@RequestMapping("/vodByName")
	public Model vodByName(@RequestParam("vodTitle")String vodTitle, Model model) {
		vod.setVodName(vodTitle);
		vod = service.getByName(vod);
		vod.setVodDate(vod.getVodDate().substring(0, 10));
		return model.addAttribute("vod", vod);
	}
	@RequestMapping("/search")
	public String search() {
		return "vod_search/vodSearch";
	}
	@RequestMapping("/earlySearch")
	public Model earlySearch(@RequestParam("keyword")String keyword, Model model) {
		logger.info(" === earlySearch () ===");
		return model.addAttribute("serchList",service.Search(keyword));
	}
	
	@RequestMapping("/vodLimit")
	public Model getVodLimit(Model model) {
		List<VodDTO> list1 = new ArrayList<VodDTO>();
		List<VodDTO> list2 = new ArrayList<VodDTO>();
		List<VodDTO> list3 = new ArrayList<VodDTO>();
		list1 = service.atLeastVodLimit();
		list2 = service.commonVodLimit();
		list3 = service.freeVodLimit();
		model.addAttribute("atLeast", list1);
		model.addAttribute("common", list2);
		model.addAttribute("free", list3);
		return model;
	}
	
	@RequestMapping("/vodAtLeastUn")
	public Model getVodAtLeastUn(Model model) {
		logger.info(" === VodController <> getVodatLeastUn()==="); 
		model.addAttribute("atLeast", service.atLeastVodUn()); 
		return model;
	}
	@RequestMapping("/vodCommonUn")
	public Model getVodCommonUn(Model model) {
		logger.info(" === VodController <> getVodCommonUn()==="); 
		model.addAttribute("common", service.commonVodUn()); 
		return model;
	}
	@RequestMapping("/vodFreeUn")
	public Model getVodFreeUn(Model model) {
		logger.info(" === VodController <> getVodFreeUn()==="); 
		model.addAttribute("free", service.freeVodUn()); 
		return model;
	}
	@RequestMapping("/vodMain")
	public String goMain() {
		logger.info(" === VodController <> goMain()===");  
		 return "layout_vod";
	}
	@RequestMapping("/vodDetail/{vodName}")
	public Model vodDetail(@PathVariable("vodName")String vodName,Model model) {
		logger.info(" === VodController <> vodDetail()===");  
		logger.info(" === VodController <> vodName @{}===", vodName);   
		vod.setVodName(vodName); 
		VodDTO result = service.getByName(vod);  
		 return model.addAttribute("vodInfo",result );
	}

}
