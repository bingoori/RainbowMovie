package com.rainbow.web.admin;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

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
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.rainbow.app.vod.VodDTO;
import com.rainbow.app.vod.VodService;
import com.rainbow.web.movie.FileUpload;
import com.rainbow.web.movie.MovieDTO;
import com.rainbow.web.movie.MovieService;
import com.rainbow.web.reply.ReplyDTO;
import com.rainbow.web.reply.ReplyService;

@Controller
@SessionAttributes("movie")
@RequestMapping("/admin")
public class AdminController {
   private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
   @Autowired MovieDTO movie;
   @Autowired MovieService movieService;
   @Autowired ReplyDTO reply;
   @Autowired ReplyService replyService;
   @Autowired VodDTO vod;
   @Autowired VodService vodService;
  
   
// ================================= MOVIE MANAGED BY ADMIN =========================================================
   
  
   
   //========= MOVIE ADD ================
   @RequestMapping("/input")
	public String input (@RequestParam(value="title",required=false)String title,
			@RequestParam(value="rating",required=false)int rating,
			@RequestParam(value="genre",required=false)String genre,
			@RequestParam(value="openDate",required=false)String openDate,
			@RequestParam(value="grade",required=false)String grade,
			@RequestParam(value="runningtime",required=false)String runningtime,
			@RequestParam(value="director",required=false)String director,
			@RequestParam(value="actor",required=false)String actor,
			@RequestParam(value="content",required=false)String content,
			@RequestParam(value="image",required=false)MultipartFile image,
			Model model, HttpSession session){
		logger.info("====== ArticleController-input()======");
		logger.info("=== title {} ===",title);
		logger.info("=== rating {} ===",rating);
		logger.info("=== genre {} ===",genre);
		logger.info("=== openDate {} ===",openDate);
		logger.info("=== grade {} ===",grade);
		logger.info("=== runningtime {} ===",runningtime);
		logger.info("=== director {} ===",director);
		logger.info("=== actor {} ===",actor);
		logger.info("=== content {} ===",content);
		logger.info("=== image {} ===",image);
		Properties p = new Properties();
		String filePath="";
		String fileName="";
		MultipartFile uploadfile = image;
		try {
			FileInputStream file = new FileInputStream(session.getServletContext().getRealPath("/WEB-INF/classes/config/fileUpload.properties"));
			try {
				p.load(file);
				filePath = p.getProperty("fileUpload.moviePath"); 
		  	        if (uploadfile != null) {
		  	            fileName = uploadfile.getOriginalFilename() ;
		  	            try { 
		  	                File realFileUp = new File(filePath+"/" + fileName);
		  	                uploadfile.transferTo(realFileUp);
		  	            } catch (IOException e) {
		  	                e.printStackTrace();
		  	            } // try - catch
		  	        } //
				file.close();
			} catch (IOException e) { 
				logger.info("파일 업로드 경로가 잘 못 되었습니다.");
			}
		} catch (FileNotFoundException e) { 
			logger.info("파일 업로드 경로가 잘 못 되었습니다.");
		}    
		
		movie.setTitle(title);
		movie.setRating(rating);
		movie.setGenre(genre);
		movie.setOpenDate(openDate);
		movie.setGrade(grade);
		movie.setRunningtime(runningtime);
		movie.setDirector(director);
		movie.setActor(actor);
		movie.setContent(content);
		movie.setImage(fileName);
		int result = movieService.input(movie);
		String view = "";
		
		if (result == 1) {
			logger.info("영화 등록 성공!! ");
			model.addAttribute("movie", movie);
			view = "redirect:/admin/content";
		} else {
			logger.info("영화 등록 실패!! ");
			model.addAttribute("movie", "");
			view = "redirect:/admin/input";
		}
		logger.info("MYSQL이 보낸 결과 : {}",result);
		return view; 
	}
 //========= VOD ADD ================
   @RequestMapping("/vodInput")
	public Model vodInput (@RequestParam(value="vodName",required=false)String vodName,
			@RequestParam(value="vodSubTitle",required=false)String vodSubTitle,
			@RequestParam(value="vodContent",required=false)String vodContent,
			@RequestParam(value="vodPrice",required=false)String vodPrice,
			@RequestParam(value="vodCategory",required=false)String vodCategory,
			@RequestParam(value="vodTime",required=false)int vodTime,
			@RequestParam(value="vodRating",required=false)String vodRating,
			@RequestParam(value="vodUrl",required=false)String vodUrl,
			@RequestParam(value="vodDate",required=false)String vodDate,
			@RequestParam(value="vodFree",required=false)String vodFree,
			@RequestParam(value="vodGrade",required=false)String vodGrade,
			@RequestParam(value="vodActor",required=false)String vodActor,
			@RequestParam(value="vodDirector",required=false)String vodDirector,
			@RequestParam(value="vodCounty",required=false)String vodCountry,
			@RequestParam(value="image",required=false)MultipartFile image,
			Model model,HttpSession session){
		logger.info("====== ArticleController-vodInput()======");
		logger.info("=== vodName {} ===",vodName);
		logger.info("=== vodSubTitle {} ===",vodSubTitle);
		logger.info("=== vodContent {} ===",vodContent);
		logger.info("=== vodPrice {} ===",vodPrice);
		logger.info("=== vodCategory {} ===",vodCategory);
		logger.info("=== vodTime {} ===",vodTime);
		logger.info("=== vodRating {} ===",vodRating);
		logger.info("=== vodUrl {} ===",vodUrl);
		logger.info("=== vodDate {} ===",vodDate);
		logger.info("=== vodFree {} ===",vodFree);
		logger.info("=== vodGrade {} ===",vodGrade);
		logger.info("=== vodActor {} ===",vodActor);
		logger.info("=== vodDirectory {} ===",vodDirector);
		logger.info("=== vodCounty {} ===",vodCountry);
		logger.info("=== fileUpload Config Path {} ===",session.getServletContext().getRealPath("/WEB-INF/classes/config/fileUpload.properties"));
		Properties p = new Properties(); 
  		String filePath="";  
  		String fileName= ""; 
  			try {
  				FileInputStream propertyFile = new FileInputStream(session.getServletContext().getRealPath("/WEB-INF/classes/config/fileUpload.properties"));
  				try {
  					p.load(propertyFile); 
  					filePath = p.getProperty("fileUpload.vodPath");
  					fileName = image.getOriginalFilename();
  					logger.info("수정폼에서 넘어온 파일 = {}",fileName); 
  					logger.info("데이터베이스 이미지 저장 경로 : {}",filePath+"/"+vodCategory+"/"); 
  					
  					 MultipartFile uploadfile = image;
  		  	        if (uploadfile != null) {
  		  	            fileName = uploadfile.getOriginalFilename() ;
  		  	            try { 
  		  	                File file = new File(filePath+"/"+vodCategory+"/" + fileName);
  		  	                uploadfile.transferTo(file);
  		  	            } catch (IOException e) {
  		  	                e.printStackTrace();
  		  	            } // try - catch
  		  	        } //
  					propertyFile.close();
  				} catch (IOException e) { 
  					logger.info("파일 업로드 경로가 잘 못 되었습니다.");
  				} 
  			} catch (FileNotFoundException e) { 
  				logger.info("파일 업로드 경로가 잘 못 되었습니다.");
  			} 
			vod.setVodName(vodName);
			vod.setVodContentTitle(vodSubTitle);
			vod.setVodContent(vodContent);
			vod.setVodPrice(vodPrice);
			vod.setVodCategory(vodCategory);
			vod.setVodTime(vodTime);
			vod.setVodRating(vodRating);
			vod.setVodUrl(vodUrl);
			vod.setVodDate(vodDate);
			vod.setVodFree(vodFree);
			vod.setVodGrade(vodGrade);
			vod.setVodActor(vodActor);
			vod.setVodDirector(vodDirector);
			vod.setVodCountry(vodCountry);
			vod.setVodImage("/vod_image/"+vodCategory+"/"+fileName);
			
		int result = vodService.insert(vod); 
		if (result == 1) {
			logger.info("VOD 등록 성공!! ");
			model.addAttribute("vod", vod); 
		} else {
			logger.info("VOD 등록 실패!! ");
			model.addAttribute("vod", null); 
		}
		logger.info("MYSQL이 보낸 결과 : {}",result);
		return model; 
	}
   //=========== VOD UPDATE ============
   @RequestMapping(value="/vodUpdate/{vodSeq}", method=RequestMethod.POST)
  	public Model vodUpdate (@PathVariable("vodSeq")int vodSeq,@RequestParam(value="vodName",required=false)String vodName,
  			@RequestParam(value="vodSubTitle",required=false)String vodSubTitle,
  			@RequestParam(value="vodContent",required=false)String vodContent,
  			@RequestParam(value="vodPrice",required=false)String vodPrice,
  			@RequestParam(value="vodCategory",required=false)String vodCategory,
  			@RequestParam(value="vodTime",required=false)int vodTime,
  			@RequestParam(value="vodRating",required=false)String vodRating,
  			@RequestParam(value="vodUrl",required=false)String vodUrl,
  			@RequestParam(value="vodDate",required=false)String vodDate,
  			@RequestParam(value="vodFree",required=false)String vodFree,
  			@RequestParam(value="vodGrade",required=false)String vodGrade,
  			@RequestParam(value="vodActor",required=false)String vodActor,
  			@RequestParam(value="vodDirector",required=false)String vodDirector,
  			@RequestParam(value="vodCounty",required=false)String vodCountry,
  			@RequestParam(value="image",required=false)MultipartFile image,
  			Model model,HttpSession session){
  		logger.info("====== ArticleController-vodUpdate()======");
  		logger.info("=== vodSeq {} ===",vodSeq);
  		logger.info("=== vodName {} ===",vodName);
  		logger.info("=== vodSubTitle {} ===",vodSubTitle);
  		logger.info("=== vodContent {} ===",vodContent);
  		logger.info("=== vodPrice {} ===",vodPrice);
  		logger.info("=== vodCategory {} ===",vodCategory);
  		logger.info("=== vodTime {} ===",vodTime);
  		logger.info("=== vodRating {} ===",vodRating);
  		logger.info("=== vodUrl {} ===",vodUrl);
  		logger.info("=== vodDate {} ===",vodDate);
  		logger.info("=== vodFree {} ===",vodFree);
  		logger.info("=== vodGrade {} ===",vodGrade);
  		logger.info("=== vodActor {} ===",vodActor);
  		logger.info("=== vodDirectory {} ===",vodDirector);
  		logger.info("=== vodCounty {} ===",vodCountry);
  		logger.info("=== fileUpload Config Path {} ===",session.getServletContext().getRealPath("/WEB-INF/classes/config/fileUpload.properties"));
  		Properties p = new Properties(); 
  		String filePath="";  
  		String fileName= ""; 
  			try {
  				FileInputStream propertyFile = new FileInputStream(session.getServletContext().getRealPath("/WEB-INF/classes/config/fileUpload.properties"));
  				try {
  					p.load(propertyFile); 
  					filePath = p.getProperty("fileUpload.vodPath");
  					fileName = image.getOriginalFilename();
  					logger.info("수정폼에서 넘어온 파일 = {}",fileName); 
  					logger.info("데이터베이스 이미지 저장 경로 : {}",filePath+"/"+vodCategory+"/"); 
  					
  					 MultipartFile uploadfile = image;
  		  	        if (uploadfile != null) {
  		  	            fileName = uploadfile.getOriginalFilename() ;
  		  	            try { 
  		  	                File file = new File(filePath+"/"+vodCategory+"/"+ fileName);
  		  	                uploadfile.transferTo(file);
  		  	            } catch (IOException e) {
  		  	                e.printStackTrace();
  		  	            }  
  					propertyFile.close();
  				} 
  				 
  			} catch (IOException e) { 
					logger.info("파일 업로드 경로가 잘 못 되었습니다.");
  			}
  			}catch (IOException e) { 
				logger.info("파일 업로드 경로가 잘 못 되었습니다.");
				}
  			  
  			vod.setVodSeq(vodSeq);
  			vod.setVodName(vodName);
  			vod.setVodContentTitle(vodSubTitle);
  			vod.setVodContent(vodContent);
  			vod.setVodPrice(vodPrice);
  			vod.setVodCategory(vodCategory);
  			vod.setVodTime(vodTime);
  			vod.setVodRating(vodRating);
  			vod.setVodUrl(vodUrl);
  			vod.setVodDate(vodDate);
  			vod.setVodFree(vodFree);
  			vod.setVodGrade(vodGrade);
  			vod.setVodActor(vodActor);
  			vod.setVodDirector(vodDirector);
  			vod.setVodCountry(vodCountry);
  			vod.setVodImage("/vod_image/"+vodCategory+"/"+fileName);   
  		int result = vodService.update(vod); 
  		if (result == 1) {
  			logger.info("영화 수정 성공!! ");
  			model.addAttribute("vod", vod); 
  		} else {
  			logger.info("영화 수정 실패!! ");
  			model.addAttribute("vod", null); 
  		}
  		logger.info("MYSQL이 보낸 결과 : {}",result);
  		return model; 
  	}
   //===========TRANSPORTS MOVIE LIST =============
   @RequestMapping("/content")
   public Model getAdminPage(Model model){
      logger.info("===movie-list(GET)===");
		List<MovieDTO> list =  new ArrayList<MovieDTO>();
		movie.setStart(0);
		movie.setEnd(movieService.count());
		list = movieService.getList(movie);
		model.addAttribute("list",list);
      return model;
	}
   // ======== VOD DELETE ===============
   @RequestMapping("/vodDelete")
  	public Model vodDelete(@RequestParam("vodName")String vodName,
  			Model model){
  		logger.info("=== vodDelete() === {}", vodName);
  		vod.setVodName(vodName);  		
  		
  		return model.addAttribute("result",vodService.delete(vod));
  	}
   
   //========= ENTERS THE MOVIE TITLE BY SEQEUNSE============
   @RequestMapping("/update/{movieSeq}")
	public Model getBySeq(@PathVariable("movieSeq")int movieSeq, 
			Model model){
		logger.info("=== movie-getBySeq() === {}", movieSeq);
			movie.setMovieSeq(movieSeq);
			movie = movieService.getBySeq(movie);
			model.addAttribute("movie",movie);
			
		return model;
	}
  
   	//==========MOVIE UPADATE===========
   	@RequestMapping(value="/update/{movieSeq}", method=RequestMethod.POST)
	public Model  update (@PathVariable("movieSeq")int movieSeq,@RequestParam(value="title",required=false)String title,
			@RequestParam(value="rating",required=false)String rating,
			@RequestParam(value="genre",required=false)String genre,
			@RequestParam(value="openDate",required=false)String openDate,
			@RequestParam(value="grade",required=false)String grade,
			@RequestParam(value="runningtime",required=false)String runningtime,
			@RequestParam(value="director",required=false)String director,
			@RequestParam(value="actor",required=false)String actor,
			@RequestParam(value="updateContent",required=false)String content,
			@RequestParam(value="image",required=false)MultipartFile image,
			Model model,HttpSession session){
   		
		logger.info("=== movieSeq {} ===",movieSeq);
		logger.info("=== title {} ===",title);
		logger.info("=== rating {} ===",rating);
		logger.info("=== genre {} ===",genre);
		logger.info("=== openDate {} ===",openDate);
		logger.info("=== grade {} ===",grade);
		logger.info("=== runningtime {} ===",runningtime);
		logger.info("=== director {} ===",director);
		logger.info("=== actor {} ===",actor);
		logger.info("=== content {} ===",content);
		logger.info("=== image {} ===",image);
		
		
	 
		Properties p = new Properties(); 
  		String filePath="";  
  		String fileName= ""; 
  		MultipartFile uploadfile = image;
		try {
			FileInputStream file = new FileInputStream(session.getServletContext().getRealPath("/WEB-INF/classes/config/fileUpload.properties"));
			try {
				p.load(file);
				filePath = p.getProperty("fileUpload.moviePath"); 
		  	        if (uploadfile != null) {
		  	            fileName = uploadfile.getOriginalFilename() ;
		  	            try { 
		  	                File realFileUp = new File(filePath+"/" + fileName);
		  	                uploadfile.transferTo(realFileUp);
		  	            } catch (IOException e) {
		  	                e.printStackTrace();
		  	            } // try - catch
		  	        } //
				file.close();
			} catch (IOException e) { 
				logger.info("파일 업로드 경로가 잘 못 되었습니다.");
			}
		} catch (FileNotFoundException e) { 
			logger.info("파일 업로드 경로가 잘 못 되었습니다.");
		} 
  			      
		movie.setTitle(title);
		movie.setRating(Integer.parseInt(rating));
		movie.setGenre(genre);
		movie.setOpenDate(openDate);
		movie.setGrade(grade);
		movie.setRunningtime(runningtime);
		movie.setDirector(director);
		movie.setActor(actor);
		movie.setContent(content);
		movie.setImage(fileName);
		int result = movieService.update(movie);
		/*String view = "";*/
		
		if (result == 1) {
			logger.info("업데이트 성공");
			model.addAttribute("movie", movie); 
		} else {
			logger.info("업데이트 실패");
			model.addAttribute("movie",""); 
		}
		return model;
		
	}
   	
   	//=========MOVIE DELETE=========== 
   	@RequestMapping("/delete")
	public Model delete(@RequestParam("movieSeq")int movieSeq, Model model){
		logger.info("=== movie-delete() ===");
		logger.info("삭제 할 영화 번호 ={}",movie.getMovieSeq());
		/*String view = "";*/
		int result = movieService.remove(movie);
		if (result == 1) {
			model.addAttribute("movie",movie);
			logger.info("영화삭제 성공");
			/*view = "redirect:/admin/content";*/
		} else {
			logger.info("영화삭제 실패");
			/*view = "redirect:/admin/content";*/
		}
		return model;
	}	
   	
   	
   	// ================================= REPLY IS MANAGED BY ADMIN =====================================================
   	@RequestMapping("/reply_content/{movieSeq}")
   	public Model getReplyPage(@PathVariable("movieSeq")int movieSeq, Model model){
   		List<ReplyDTO> list =  new ArrayList<ReplyDTO>();
   		logger.info("댓글 영화순번 리스트 {}",movieSeq);
   		reply.setMovieSeq(movieSeq);
   		list = replyService.getBySeq(reply);
   		model.addAttribute("list", list);
   		/*return "admin/reply_content.admin";*/
   		return model;
   	}
	
   	@RequestMapping("/reply_delete")
	public Model replyDelete(@RequestParam("replySeq")int replySeq, Model model){
		logger.info("=== replys-delete() ===");
		reply.setReplySeq(replySeq);
		logger.info("삭제 할 댓글 번호 ={}"+reply.getReplySeq());
		return model.addAttribute("reply", replyService.delete(reply));
	}	
 
}