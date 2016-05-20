package com.rainbow.web.member;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.rainbow.web.movie.MovieDTO;
import com.rainbow.web.movie.MovieService;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	@Autowired MemberDTO member;
	@Autowired MemberService service; 
	@Autowired MovieDTO movie;
	@Autowired MovieService movieService;
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public Model login(@RequestParam("id")String id, 
						@RequestParam("password")String password,
						Model model,
						HttpSession session) { 
		logger.info("로그인 컨트롤러 파라미터 ID : {}", id);
		logger.info("로그인 컨트롤러 파라미터 PW : {}", password);
		
		MemberDTO param = new MemberDTO();
		param.setId(id);
		param.setPassword(password);
		
		member = service.login(param);
		if (member.getId().equals(param.getId())) {
			logger.info("로그인 성공");
			session.setAttribute("user", member); // 로그인 성공 시 session에 로그인에 성공한 유저의 정보가 담긴 member 객체를 담는다.
			model.addAttribute("member", member); // 로그인 성공 시 다음 페이지에 request와 같은 역할을 하는 model에 member 객체를 담아 보낸다.
		} else {
			logger.info("로그인 실패");
			model.addAttribute("member", member);
		}
		return model;
	}
	
	/*@RequestMapping(value="/login", method=RequestMethod.POST)
	public String login(@RequestParam("id")String id, 
						@RequestParam("password")String password,
						Model model,
						HttpSession session) { 
		logger.info("로그인 컨트롤러 파라미터 ID : {}", id);
		logger.info("로그인 컨트롤러 파라미터 PW : {}", password);
		
		MemberDTO param = new MemberDTO();
		param.setId(id);
		param.setPassword(password);
		member = service.login(param);
		if (member.getId().equals(param.getId())) {
			logger.info("로그인 성공");
			session.setAttribute("user", member); // 로그인 성공 시 session에 로그인에 성공한 유저의 정보가 담긴 member 객체를 담는다.
			model.addAttribute("member", member); // 로그인 성공 시 다음 페이지에 request와 같은 역할을 하는 model에 member 객체를 담아 보낸다.
		} else {
			logger.info("로그인 실패");
			model.addAttribute("member", member);
		}
		return "redirect:/home/main";
	}*/
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate(); // 세션 무효화
		return "redirect:/"; // 메인화면으로 고고
	}
	
	@RequestMapping(value="/join", method=RequestMethod.POST)
	public Model join(@RequestParam("id")String id, 
			@RequestParam("password")String password,
			@RequestParam("name")String name,
			@RequestParam("birth")String birth,
			@RequestParam("addr")String addr,
			@RequestParam("email")String email,
			HttpSession session,Model model){
		
		logger.info("=== id {} ===",id);
		logger.info("=== password {} ===",password);
		logger.info("=== name {} ===",name);
		logger.info("=== birth {} ===",birth);
		logger.info("=== addr {} ===",addr);
		logger.info("=== email {} ===",email);
		
		member.setId(id);
		member.setPassword(password);
		member.setName(name);
		member.setBirth(birth);
		member.setAddr(addr);
		member.setEmail(email);
		
		if(service.getById(member) != null){
			logger.info("아이디 회원 가입 불가 ");
			model.addAttribute("result", 0);
		}else{
			int res = service.insert(member);
			
			if (res == 1) {
				logger.info("회원가입 성공");
				member.setId(null);
				member.setName("비회원");
				session.setAttribute("user", member);
				//view = "redirect:/rainbow";
			} else {
				logger.info("회원가입 실패");
				//view = "member/join_form.user";
			}	
		}
	
		return model;
	}
	
	@RequestMapping("/profile")
	public Model profile(
			HttpSession session,
			Model model) {
		MemberDTO member = (MemberDTO)session.getAttribute("user"); // 세션에 저장된 회원 정보를 담는다.
		model.addAttribute("member", member); // 세션에 저장되어있던 회원의 정보를 model에 담아 getJson에 보낸다.
		return model;
		//return "member/profile.user";
	}
	
	@RequestMapping("/update_form")
	public String update_form() {
		return "member/update_form.user";
	}
	
	@RequestMapping(value="/update", method=RequestMethod.POST)
	public void update(
			@RequestParam("id")String id,
			@RequestParam("password")String password,
			@RequestParam("addr")String addr,
			@RequestParam("email")String email,
			HttpSession session) {
		logger.info("=== id {} ===",id);
		logger.info("=== password {} ===",password);
		logger.info("=== addr {} ===",addr);
		logger.info("=== email {} ===",email);
		
		member.setId(id);
		member.setPassword(password);
		member.setAddr(addr);
		member.setEmail(email);
		
		int res = service.update(member);
		//String view = "";
		
		if (res == 1) {
			logger.info("업데이트 성공");
			member = service.getById(member);
			session.setAttribute("user", member); // 세션에 업데이트된 회원정보로 다시 넣기
			//view = "redirect:/rainbow";
		} else {
			logger.info("업데이트 실패");
			//view = "member/update_form";
		}
		//return view;
	}
	
	@RequestMapping(value="/vod_login", method=RequestMethod.POST)
	public Model vodLogin(@RequestParam("id")String id, 
						@RequestParam("password")String password,
						Model model,
						HttpSession session) { 
		logger.info("로그인 컨트롤러 파라미터 ID : {}", id);
		logger.info("로그인 컨트롤러 파라미터 PW : {}", password);
		
		MemberDTO param = new MemberDTO();
		param.setId(id);
		param.setPassword(password);
		member = service.login(param);
		if (member.getId() != null && !member.getId().equals("admin")) {
			logger.info("로그인 성공");
			session.setAttribute("user", member); // 로그인 성공 시 session에 로그인에 성공한 유저의 정보가 담긴 member 객체를 담는다.
			model.addAttribute("member", member); // 로그인 성공 시 다음 페이지에 request와 같은 역할을 하는 model에 member 객체를 담아 보낸다.
		}  
		return model;
	}
	@RequestMapping("/vod_logout")
	public String vodLogout(HttpSession session) {
				session.invalidate(); // 세션 무효화
		return "layout_vod";
	}
	@RequestMapping(value="/vod_join",method=RequestMethod.POST)
	public  String join(@RequestParam("id") String id
			, @RequestParam("password") String password
			, @RequestParam("name") String name
			, @RequestParam("email") String email
			, @RequestParam("addr") String addr
			, @RequestParam("year") String year,
			Model model){
		logger.info("=== id {} ===",id);
		logger.info("=== name {} ===",name);
		logger.info("=== email {} ===",email);
		logger.info("=== addr {} ===",addr);
		logger.info("=== year {} ===",year);
		member.setId(id);
		member.setPassword(password);
		member.setName(name);
		member.setAddr(email);
		member.setBirth(year);
		member.setEmail(email);  
		if(service.getById(member) == null){
			model = service.insert(member) == 1 ? model.addAttribute("check", 1) :model.addAttribute("check", 0);
		}
		return "layout_vod";
	}

	@RequestMapping("/cinema")
	   public Model cinema(HttpSession session, Model model) {
	      logger.info("memberController-cinema{}");
	      MemberDTO member = new MemberDTO();
	      member = (MemberDTO) session.getAttribute("user");
	      logger.info("memberController-cinema{} END",member.getName());
	      logger.info("memberController-cinema{} END",member.getEmail());
	      model.addAttribute("member",member);
	      
	      
	      return model;
	   }
	
	@RequestMapping("/memberLeave")
	public void memberLeave(
			@RequestParam("id") String id,
			HttpSession session) {
		
		member.setId(id);
		int res = service.delete(member);
		
		if (res == 1) {
			logger.info("회원 탈퇴 성공");
			member.setId(null);
			member.setName("비회원");
			session.setAttribute("user", member);
			session.invalidate();
		} else {
			logger.info("회원 탈퇴 실패");
		}
	}
}
