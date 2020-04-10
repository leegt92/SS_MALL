package edu.bit.ssmall.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import edu.bit.ssmall.service.BoardNoticeService;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/boardnotice")
public class BoardNoticeController {

	@Autowired
	BoardNoticeService boardnoticeService;
	
	@Autowired
	BoardNoticeService bservice;

	/*
	 * @RequestMapping(value = "/noticeList", method = RequestMethod.GET)//문의글들 띄워놓는
	 * 부분에 대한 컨트롤러 public String noticeList(Criteria criteria, Model model, BoardVO
	 * boardVO) { PageMaker pageMaker = new PageMaker(); pageMaker.setCri(criteria);
	 * 
	 * Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	 * Object principal = auth.getPrincipal(); String name = ""; if(principal !=
	 * null) { name = auth.getName(); }
	 * 
	 * try { int m_number = boardnoticeService.getMnum(name);
	 * model.addAttribute("m_number", m_number); int totalCount =
	 * boardnoticeService.selectAskCountBoard(m_number);
	 * pageMaker.setTotalCount(totalCount); model.addAttribute("pageMaker",
	 * pageMaker); int startNum = criteria.getStartNum(); int endNum =
	 * criteria.getEndNum(); List<BoardVO> askRequestboards =
	 * boardnoticeService.selectAskBoardListPage(m_number, startNum, endNum);
	 * model.addAttribute("askRequestboards", askRequestboards); List<BoardVO>
	 * askRequestboardsAnswers = new ArrayList<BoardVO>(); for(int i=0;
	 * i<askRequestboards.size(); i++) { BoardVO answer
	 * =boardnoticeService.getAllAskRequestAnswer(askRequestboards.get(i).getBid());
	 * askRequestboardsAnswers.add(i, answer); }
	 * model.addAttribute("askRequestboardsAnswers", askRequestboardsAnswers);
	 * 
	 * } catch (Exception e) { // TODO Auto-generated catch block
	 * e.printStackTrace(); }
	 * 
	 * return "Admin/noticeList"; }
	 * 
	 * @RequestMapping(value = "/noticeWrite", method = RequestMethod.GET)//실제로 입력하는
	 * 창 에 대한 컨트롤러 밑에꺼랑 세트 public String noticeWrite(Model model, HttpServletRequest
	 * request) { Authentication auth =
	 * SecurityContextHolder.getContext().getAuthentication(); Object principal =
	 * auth.getPrincipal();
	 * 
	 * String bTitle = request.getParameter("bTitle"); String bContent =
	 * request.getParameter("bContent"); String name = ""; if(principal != null) {
	 * name = auth.getName(); }
	 * 
	 * try { int m_number = boardnoticeService.getMnum(name);
	 * model.addAttribute("m_number", m_number); String bName =
	 * boardnoticeService.getMname(name); model.addAttribute("bName", bName);
	 * if(bTitle != null && bContent != null) { boardnoticeService.insertAsk(bName,
	 * bTitle, bContent, m_number); }
	 * 
	 * } catch (Exception e) { // TODO Auto-generated catch block
	 * e.printStackTrace(); }
	 * 
	 * return "admin/noticeWrite";
	 * 
	 * }
	 * 
	 * @RequestMapping(value = "/admin_noticeWrite_back", method =
	 * RequestMethod.GET)//이것도 입력하는 창에 대한 컨트롤러인데 입력하는 창에 대한 컨트롤러가 두개인 이유는 위에꺼랑 쌍으로
	 * 구현해야 입력직후 게시글 목록으로 돌아오는 걸 구현할 수 있어서이다. public String
	 * admin_noticeWrite_back(Criteria criteria, Model model, HttpServletRequest
	 * request, BoardVO boardVO) { PageMaker pageMaker = new PageMaker();
	 * pageMaker.setCri(criteria);
	 * 
	 * Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	 * Object principal = auth.getPrincipal();
	 * 
	 * String bTitle = request.getParameter("bTitle"); String bContent =
	 * request.getParameter("bContent"); String name = ""; if(principal != null) {
	 * name = auth.getName(); }
	 * 
	 * try { int m_number = boardnoticeService.getMnum(name);
	 * model.addAttribute("m_number", m_number); String bName =
	 * boardnoticeService.getMname(name); model.addAttribute("bName", bName);
	 * 
	 * if(bTitle != null && bContent != null) { boardnoticeService.insertAsk(bName,
	 * bTitle, bContent, m_number); } int totalCount =
	 * boardnoticeService.selectAskCountBoard(m_number);
	 * pageMaker.setTotalCount(totalCount); model.addAttribute("pageMaker",
	 * pageMaker); int startNum = criteria.getStartNum(); int endNum =
	 * criteria.getEndNum(); List<BoardVO> askRequestboards =
	 * boardnoticeService.selectAskBoardListPage(m_number, startNum, endNum);
	 * model.addAttribute("askRequestboards", askRequestboards); List<BoardVO>
	 * askRequestboardsAnswers = new ArrayList<BoardVO>(); for(int i=0;
	 * i<askRequestboards.size(); i++) { BoardVO answer
	 * =boardnoticeService.getAllAskRequestAnswer(askRequestboards.get(i).getBid());
	 * askRequestboardsAnswers.add(i, answer); }
	 * model.addAttribute("askRequestboardsAnswers", askRequestboardsAnswers);
	 * 
	 * } catch (Exception e) { // TODO Auto-generated catch block
	 * e.printStackTrace(); }
	 * 
	 * return "Admin/admin_noticeList";
	 * 
	 * }
	 * 
	 * @RequestMapping(value = "/noticeWrite2", method = RequestMethod.GET) //글 수정하는
	 * 창에 대한 컨트롤러 public String noticeWrite2(Model model, HttpServletRequest
	 * request) { Authentication auth =
	 * SecurityContextHolder.getContext().getAuthentication(); Object principal =
	 * auth.getPrincipal();
	 * 
	 * String bTitle = request.getParameter("bTitle"); String bContent =
	 * request.getParameter("bContent"); String bId = request.getParameter("bId");
	 * model.addAttribute("bId",bId); String name = ""; if(principal != null) { name
	 * = auth.getName(); }
	 * 
	 * try { int m_number = boardnoticeService.getMnum(name);
	 * model.addAttribute("m_number", m_number);
	 * 
	 * if(bTitle != null && bContent != null) {
	 * boardnoticeService.updateAskAS(bTitle, bContent, bId); }
	 * 
	 * } catch (Exception e) { // TODO Auto-generated catch block
	 * e.printStackTrace(); }
	 * 
	 * return "admin/noticeWrite2";
	 * 
	 * }
	 * 
	 * @RequestMapping(value = "/noticeWrite2_back", method =
	 * RequestMethod.GET)//위에꺼랑 세트 이것까지 구현시 수정직후 알아서 게시글로 돌아옴 public String
	 * noticeWrite2_back(Criteria criteria, Model model, HttpServletRequest request,
	 * BoardVO boardVO) { PageMaker pageMaker = new PageMaker();
	 * pageMaker.setCri(criteria);
	 * 
	 * Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	 * Object principal = auth.getPrincipal();
	 * 
	 * String bTitle = request.getParameter("bTitle"); String bContent =
	 * request.getParameter("bContent"); String bId = request.getParameter("bId");
	 * model.addAttribute("bId",bId); String name = ""; if(principal != null) { name
	 * = auth.getName(); }
	 * 
	 * try { int m_number = boardnoticeService.getMnum(name);
	 * model.addAttribute("m_number", m_number);
	 * 
	 * if(bTitle != null && bContent != null) {
	 * boardnoticeService.updateAskAS(bTitle, bContent, bId); } int totalCount =
	 * boardnoticeService.selectAskCountBoard(m_number);
	 * pageMaker.setTotalCount(totalCount); model.addAttribute("pageMaker",
	 * pageMaker); int startNum = criteria.getStartNum(); int endNum =
	 * criteria.getEndNum(); List<BoardVO> askRequestboards =
	 * boardnoticeService.selectAskBoardListPage(m_number, startNum, endNum);
	 * model.addAttribute("askRequestboards", askRequestboards); List<BoardVO>
	 * askRequestboardsAnswers = new ArrayList<BoardVO>(); for(int i=0;
	 * i<askRequestboards.size(); i++) { BoardVO answer
	 * =boardnoticeService.getAllAskRequestAnswer(askRequestboards.get(i).getBid());
	 * askRequestboardsAnswers.add(i, answer); }
	 * model.addAttribute("askRequestboardsAnswers", askRequestboardsAnswers);
	 * 
	 * } catch (Exception e) { // TODO Auto-generated catch block
	 * e.printStackTrace(); }
	 * 
	 * return "admin/noticeWrite_back";
	 * 
	 * }
	 * 
	 * @RequestMapping(value = "/delete.do", method = RequestMethod.GET) //삭제는 딱히
	 * UI가 없고 그냥 삭제 논리대로 철기하는 컨트롤러 삭제버튼 누르면 이 컨트롤러를 탄다. public String
	 * delete(Criteria criteria, Model model, HttpServletRequest request, BoardVO
	 * boardVO) { PageMaker pageMaker = new PageMaker(); pageMaker.setCri(criteria);
	 * 
	 * Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	 * Object principal = auth.getPrincipal();
	 * 
	 * String bId = request.getParameter("bId"); model.addAttribute("bId",bId);
	 * String name = ""; if(principal != null) { name = auth.getName(); }
	 * 
	 * try { int m_number = boardnoticeService.getMnum(name);
	 * model.addAttribute("m_number", m_number); int totalCount =
	 * boardnoticeService.selectAskCountBoard(m_number);
	 * pageMaker.setTotalCount(totalCount); model.addAttribute("pageMaker",
	 * pageMaker); int startNum = criteria.getStartNum(); int endNum =
	 * criteria.getEndNum(); List<BoardVO> askRequestboards =
	 * boardnoticeService.selectAskBoardListPage(m_number, startNum, endNum);
	 * model.addAttribute("askRequestboards", askRequestboards); List<BoardVO>
	 * askRequestboardsAnswers = new ArrayList<BoardVO>(); for(int i=0;
	 * i<askRequestboards.size(); i++) { BoardVO answer
	 * =boardnoticeService.getAllAskRequestAnswer(askRequestboards.get(i).getBid());
	 * askRequestboardsAnswers.add(i, answer); }
	 * model.addAttribute("askRequestboardsAnswers", askRequestboardsAnswers);
	 * 
	 * boardnoticeService.deleteAskAS(bId);
	 * 
	 * } catch (Exception e) { // TODO Auto-generated catch block
	 * e.printStackTrace(); }
	 * 
	 * return "redirect:/admin/noticeList";
	 * 
	 * 
	 * }
	 */
}
	





