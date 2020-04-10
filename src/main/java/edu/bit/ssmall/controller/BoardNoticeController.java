package edu.bit.ssmall.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import edu.bit.ssmall.noticepage.BoardNoticeSearchCriteria;
import edu.bit.ssmall.noticepage.Criteria;
import edu.bit.ssmall.noticepage.PageMaker;
import edu.bit.ssmall.service.BoardNoticeService;
import edu.bit.ssmall.vo.BoardNoticeVO;
import edu.bit.ssmall.vo.ProductVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class BoardNoticeController {

	@Autowired
	BoardNoticeService bservice;



	@RequestMapping("/boardnoticeView")
	public String notice(Model model, Criteria criteria) throws Exception {
		/* model.addAttribute("list",bservice.selectBoardList()); */

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(criteria);
		

		System.out.println(criteria.getPerPageNum());
		System.out.println(criteria.getPage());

		int startNum = criteria.getStartNum();
		int endNum = criteria.getEndNum(); 

		int totalCount = bservice.selectCountBoard();
		System.out.println("게시글갯수:" + totalCount);

		pageMaker.setTotalCount(totalCount);
		List<BoardNoticeVO> boardList = bservice.selectBoardListPage(startNum, endNum);
	
		model.addAttribute("list", boardList);
		model.addAttribute("pageMaker", pageMaker);
		
		return "boardnotice";
		
	}
	
	@RequestMapping("/boardnoticesearchView")
	public String noticesearch(Model model, BoardNoticeSearchCriteria searchcriteria,HttpServletRequest request) throws Exception {
		/* model.addAttribute("list",bservice.selectBoardList()); */

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(searchcriteria);
		

		System.out.println(searchcriteria.getPerPageNum());
		System.out.println(searchcriteria.getPage());

		int startNum = searchcriteria.getStartNum();
		int endNum = searchcriteria.getEndNum(); 
		String keyword = request.getParameter("keyword");
		System.out.println("keyword 확인 : "+keyword);
		
		int totalCount = bservice.BoardSearchCount(keyword);
		System.out.println("totalCount위");
		
		List<BoardNoticeVO> boardList = bservice.BoardSearchListPage(startNum, endNum, keyword);
	
		model.addAttribute("list", boardList);
		model.addAttribute("pageMaker", pageMaker);
		
		return "boardnotice";
		
	}

	/////////////////////////////////////////////////////////////////////
	@RequestMapping("/boardgradenoticeView")
	public String gradenotice(Model model, Criteria criteria) throws Exception {
		/* model.addAttribute("list",bservice.selectBoardList()); */

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(criteria);

		System.out.println(criteria.getPerPageNum());
		System.out.println(criteria.getPage());

		int startNum = criteria.getStartNum();
		int endNum = criteria.getEndNum();

		int totalCount = bservice.selectCountGradeBoard();
		System.out.println("게시글갯수:" + totalCount);

		pageMaker.setTotalCount(totalCount);
		List<BoardNoticeVO> boardList = bservice.selectGradeBoardListPage(startNum, endNum);
		

		model.addAttribute("gradelist", boardList);
		
		model.addAttribute("pageMaker", pageMaker);

		return "boardnotice";
	}
	
	
	@RequestMapping("/boardgradenoticesearchView")
	public String noticegradesearch(Model model, BoardNoticeSearchCriteria searchcriteria,HttpServletRequest request) throws Exception {
		/* model.addAttribute("list",bservice.selectBoardList()); */

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(searchcriteria);
		

		System.out.println(searchcriteria.getPerPageNum());
		System.out.println(searchcriteria.getPage());

		int startNum = searchcriteria.getStartNum();
		int endNum = searchcriteria.getEndNum(); 
		String keyword = request.getParameter("keyword");
		System.out.println("keyword 확인 : "+keyword);
		
		int totalCount = bservice.BoardGradeSearchCount(keyword);
		System.out.println("totalCount위");
		
		List<BoardNoticeVO> boardList = bservice.BoardGradeSearchListPage(startNum, endNum, keyword);
	
		model.addAttribute("list", boardList);
		model.addAttribute("pageMaker", pageMaker);
		
		return "boardnotice";
		
	}
	
	
	
	@RequestMapping("/content_view")
	public String content_view(HttpServletRequest request, Model model) {

		System.out.println("content_view()");

		String bId = request.getParameter("bId");
		model.addAttribute("content_view", bservice.selectBoardOne(bId));

		return "content_view";

	}
	
	

}
