package com.rainbow.web.purchase;

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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.rainbow.web.member.MemberDTO;
import com.rainbow.web.member.MemberService;
import com.rainbow.web.movie.MovieDTO;
import com.rainbow.web.movie.MovieService;

@Controller
@RequestMapping("/purchase")
public class PurchaseController {
	private static final Logger logger = LoggerFactory.getLogger(PurchaseController.class);
	@Autowired PurchaseDTO purchase;
	@Autowired PurchaseService service;
	@Autowired MovieService movieService;
	@Autowired MemberService memberService;
	@Autowired MovieDTO movie;
	List<PurchaseDTO> reserveList;
	
	@RequestMapping("/step1")
	public void step1(Model model) {
		logger.info("purchase - step1()");
		reserveList = new ArrayList<PurchaseDTO>();
		model.addAttribute("list", movieService.getList(movie));
	}
	
	@RequestMapping(value="/step2", method=RequestMethod.POST)
	public void step2(@RequestParam("movie")String movie,
			@RequestParam("date")String date,
			@RequestParam("time")String time, 
			Model model, HttpSession session) {
		logger.info("purchase - step2()");
		logger.info("movie : {}", movie);
		logger.info("date : {}", date);
		logger.info("time : {}", time);
		
		PurchaseDTO temp = new PurchaseDTO();
		temp.setMovieTitle(movie);
		temp.setDate(date);
		temp.setBeginTime(time);
		reserveList.add(temp);
		model.addAttribute("reserveList", reserveList);
		
		purchase.setMovieTitle(movie);
		purchase.setDate(date);
		purchase.setBeginTime(time);
		model.addAttribute("purchasedSeat", service.getByReserve(purchase));
		
		logger.info("model : {}", model);
	}
	
	@RequestMapping(value="/seatSelect", method=RequestMethod.POST)
	public void seatSelect(@RequestParam("movie")String movie,
			@RequestParam("date")String date,
			@RequestParam("time")String time,
			@RequestParam("seat")String seat,
			@RequestParam("sum")int price,
			Model model, HttpSession session) {
		logger.info("purchase - step2 - seatSelect()");
		logger.info("movie : {}", movie);
		logger.info("date : {}", date);
		logger.info("time : {}", time);
		logger.info("seat : {}", seat);
		logger.info("price : {}", price);
		PurchaseDTO temp = new PurchaseDTO();
		temp.setMovieTitle(movie);
		temp.setDate(date);
		temp.setBeginTime(time);
		temp.setReserveSeat(seat);
		temp.setPurchasePrice(price);
		
		reserveList.add(temp);
		model.addAttribute("reserveList", reserveList);
		
		purchase.setMovieTitle(movie);
		purchase.setDate(date);
		purchase.setBeginTime(time);
		model.addAttribute("purchasedSeat", service.getByReserve(purchase));
		
		logger.info("model : {}", model);
	}
	
	@RequestMapping(value="/seatDelete", method=RequestMethod.POST)
	public void seatDelete(@RequestParam("movie")String movie,
			@RequestParam("date")String date,
			@RequestParam("time")String time,
			@RequestParam("seat")String seat,
			Model model, HttpSession session) {
		logger.info("purchase - step2 - seatDelete()");
		logger.info("movie : {}", movie);
		logger.info("date : {}", date);
		logger.info("time : {}", time);
		logger.info("seat : {}", seat);
	
		for (int i = 1; i < reserveList.size(); i++) {
			if(reserveList.get(i).getReserveSeat().equals(seat)) {
				reserveList.remove(i);
			}
		}
		
		model.addAttribute("reserveList", reserveList);
		
		purchase.setMovieTitle(movie);
		purchase.setDate(date);
		purchase.setBeginTime(time);
		model.addAttribute("purchasedSeat", service.getByReserve(purchase));
		
		logger.info("model : {}", model);
	}

	@RequestMapping(value="/step4", method=RequestMethod.POST)
	public void step4(@RequestParam("movie")String movie,
			@RequestParam("date")String date,
			@RequestParam("time")String time,
			@RequestParam("seat")String seat,
			@RequestParam("price")int price,
			Model model, HttpSession session) {
		logger.info("purchase - step4()");
		logger.info("movie : {}", movie);
		logger.info("date : {}", date);
		logger.info("time : {}", time);
		logger.info("seat : {}", seat);
		logger.info("price :{}",price);
	
		MemberDTO member = (MemberDTO) session.getAttribute("user");
		purchase.setMovieTitle(movie);
		purchase.setDate(date);
		purchase.setBeginTime(time);
		purchase.setReserveSeat(seat);
		purchase.setPurchasePrice(price);
		purchase.setMemberId(member.getId());
		purchase.setScreenNumber(service.getScreenNumber(purchase).getScreenNumber());
		
		//예매할 좌석 쪼갠것
		String[] selectSeat = seat.split("/");
		boolean overlapCheck = true;
		List<PurchaseDTO> purchasedList = service.getByReserve(purchase);
		String usedSeat = "";
		for (int i = 0; i < purchasedList.size(); i++) {
			usedSeat+=purchasedList.get(i).getReserveSeat()+"/";
		}
		
		List<String> overlap = new ArrayList<String>();
		String[] usedSeatList = usedSeat.split("/");
		
		for (int i = 0; i < usedSeatList.length; i++) {
			for (int j = 0; j < selectSeat.length; j++) {
				if(usedSeatList[i].equals(selectSeat[j])){
					overlapCheck = false;
					overlap.add(selectSeat[j]);
				}
			}
		}
		for (int i = 1; i < reserveList.size(); i++) {
			for (int j = 0; j < overlap.size(); j++) {
				if(reserveList.get(i).getReserveSeat().equals(overlap.get(j))) {
					reserveList.remove(i);
				}
			}
		}
		if (overlapCheck) {
			service.insert(purchase);
			
			member.setPoint((int) (purchase.getPurchasePrice() * 0.01));
			memberService.updatePoint(member);
			session.setAttribute("user", memberService.getById(member));
			
			model.addAttribute("purchaseData", purchase);
		} else {
			model.addAttribute("reserveList", reserveList);
			model.addAttribute("purchasedSeat", service.getByReserve(purchase));
		}
		model.addAttribute("overlapCheck", overlapCheck);
		
		logger.info("model : {}", model);
	}
	
	@RequestMapping("/purchase_list/{startRow}")
	public void purchase_list(@PathVariable(value="startRow")int start, Model model, HttpSession session) {
		logger.info("purchase - purchase_list()");
		
		MemberDTO member = (MemberDTO) session.getAttribute("user");
		purchase.setMemberId(member.getId());
		purchase.setStart(start);
		purchase.setEnd(5);
		model.addAttribute("purchaseList", service.getByMemberId(purchase));
		
		purchase.setCountById(service.countById(purchase));
		model.addAttribute("page", purchase);
		
		logger.info("model : {}", model);
	}
}
