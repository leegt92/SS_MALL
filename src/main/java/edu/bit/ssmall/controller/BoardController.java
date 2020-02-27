package edu.bit.ssmall.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.bit.ssmall.service.BService;
import edu.bit.ssmall.vo.BoardVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class BoardController {
	
	
	@Autowired
	BService bservice;
	
	
	@RequestMapping("/boardnoticeView")
	public String notice(Model model) throws Exception {

		model.addAttribute("list",bservice.selectBoardList());
		
		return "boardnotice";
	}
	
	
	@RequestMapping("/content_view")
	public String content_view(HttpServletRequest request,Model model) {
		
		System.out.println("content_view()");
		
		String bId = request.getParameter("bId");
		model.addAttribute("content_view",bservice.selectBoardOne(bId));
	
		return "content_view";
		
	}

	
	
}
