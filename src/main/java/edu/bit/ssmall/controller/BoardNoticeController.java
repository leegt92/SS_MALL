package edu.bit.ssmall.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import edu.bit.ssmall.noticepage.Criteria;
import edu.bit.ssmall.noticepage.PageMaker;
import edu.bit.ssmall.service.BoardNoticeService;
import edu.bit.ssmall.vo.BoardNoticeVO;

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
	
	
	@RequestMapping("/content_view")
	public String content_view(HttpServletRequest request, Model model) {

		System.out.println("content_view()");

		String bId = request.getParameter("bId");
		model.addAttribute("content_view", bservice.selectBoardOne(bId));

		return "content_view";

	}

}
