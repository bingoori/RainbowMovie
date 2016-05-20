package com.rainbow.web.reply;

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

@Controller
@RequestMapping("/reply")
public class ReplyController {
	private static final Logger logger = LoggerFactory.getLogger(ReplyController.class);
	@Autowired ReplyDTO reply;
	@Autowired ReplyService service;
	@Autowired MemberDTO member;
	
	@RequestMapping(value="/add", method=RequestMethod.POST)
	public String add(
			@RequestParam("movieSeq")int movieSeq,
			@RequestParam("replyContent")String replyContent,
			Model model,
			HttpSession session) {
			logger.info("=== reply add {} ===", movieSeq);
			
			// 세션에 저장되어있는 MemberDTO객체 가져오기
			member = (MemberDTO)session.getAttribute("user");
			
			// 저장할 댓글 내용 replyDTO에 저장
			reply.setWriterName(member.getName());
			reply.setReplyContent(replyContent);
			reply.setMovieSeq(movieSeq);
			
			// 댓글 디비에 저장하기
			int res = service.insert(reply);
			int seq = reply.getMovieSeq();
			String view = "";
			if (res == 1) {
				logger.info("=== 댓글 insert 성공  ===");
				// 댓글 등록 성공하면 방금 등록한 댓글을 포함한 모든 댓글을 디비에서 가져와서 다시 detail페이지로 보내야한다.
				List<ReplyDTO> list = service.getBySeq(reply);
				model.addAttribute("reply_list", list);
				
				// 해당 영화에 총 몇개의 댓글이 달렸는지 뷰에 뿌려주기 위해 댓글 개수를 구해간다.
				model.addAttribute("reply_count", service.count(reply));
				view = "redirect:/movie/movie_detail/"+seq;
			} else {
				logger.info("=== 댓글 insert 실패  ===");
				view = "redirect:/main"; // 댓글 등록 실패 시 메인 페이지로 돌아간다.
			}
			
		return view;
	}
}
