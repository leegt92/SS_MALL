package edu.bit.ssmall.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.bit.ssmall.page.Criteria;
import edu.bit.ssmall.page.PageMaker;
import edu.bit.ssmall.service.AdminService;
import edu.bit.ssmall.vo.BuyVO;
import edu.bit.ssmall.vo.MemberVO;
import edu.bit.ssmall.vo.ProductVO;
import edu.bit.ssmall.vo.RefundVO;

@Controller
@RequestMapping("admin")
public class AdminPageController {
	
	@Autowired
	AdminService adminService;
	
	//관리자 게시판 첫 화면 여긴 통계같은거 나오면 좋을듯?
	@RequestMapping(value = "adminpage", method ={RequestMethod.GET,RequestMethod.POST})
	public String adminpage(Model model) {
		System.out.println("adminpage 시작");
		
		
		return "Admin/adminpage";

	}	
	
	//회원관리 누르면 시작
	@RequestMapping(value = "memberList",method = {RequestMethod.GET,RequestMethod.POST})
	public String memberList(Criteria criteria, Model model) {
		System.out.println("memberList 시작");
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(criteria);
		
		System.out.println("현재페이지 : "+criteria.getPage());
		System.out.println("화면에 보여질 페이지수 : "+criteria.getPerPageNum());

		int startNum = criteria.getStartNum();
		int endNum = criteria.getEndNum();

		int totalCount = adminService.countMember();
		System.out.println("회원 조회 : " + totalCount);
		
		pageMaker.setTotalCount(totalCount);
		
		List<MemberVO> member = adminService.memberList(startNum, endNum);
		System.out.println(member);

		model.addAttribute("pageMaker",pageMaker);
		model.addAttribute("member", member);
		model.addAttribute("admin", adminService.adminList());
		
		return "Admin/admin_memberList";

	}	
	
	//선택한 회원 정보
	@RequestMapping(value = "memberInfo",method = {RequestMethod.GET,RequestMethod.POST})
	public String memberInfo(Criteria criteria, Model model, HttpServletRequest request) {
		System.out.println("memberInfo 시작");			
		String m_number = request.getParameter("m_number");
	
		model.addAttribute("member",adminService.memberInfo(m_number));
		model.addAttribute("buyList", adminService.buyList(m_number));
		model.addAttribute("refundList", adminService.refundList(m_number));
		model.addAttribute("requestList", adminService.requestList(m_number));
		model.addAttribute("asList", adminService.asList(m_number));
		
		return "Admin/admin_memberInfo";
	}	
		
	//상품 목록 누르면 시작
	@RequestMapping(value = "productList", method = {RequestMethod.GET,RequestMethod.POST})
	public String productList(Criteria criteria, Model model) {
		System.out.println("productList 시작");
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(criteria);
		
		System.out.println("현재페이지 : "+criteria.getPage());
		System.out.println("화면에 보여질 페이지수 : "+criteria.getPerPageNum());

		int startNum = criteria.getStartNum();
		int endNum = criteria.getEndNum();

		int totalCount = adminService.countProduct();
		System.out.println("상품 수 : " + totalCount);
		
		pageMaker.setTotalCount(totalCount);
		
		List<ProductVO> list = adminService.productList(startNum, endNum);
		System.out.println(list);

		model.addAttribute("pageMaker",pageMaker);
		model.addAttribute("list", list);
		
		
		return "Admin/admin_productList";

	}
	
	//공지사항 관리하는 컨트롤
	@RequestMapping(value = "noticeList", method = {RequestMethod.GET,RequestMethod.POST})
	public String noticeList(Model model) {
		
		System.out.println("noticeList 시작");
		
		
		return "Admin/admin_noticeList";
	}

	//1:1문의 관리하는 컨트롤
	@RequestMapping(value = "requestList", method = {RequestMethod.GET,RequestMethod.POST})
	public String requestList(Model model) {
		System.out.println("requestList 시작");
		
		return "Admin/admin_requestList";
	}
	
	//as요청 관리하는 컨트롤
	@RequestMapping(value = "asList", method = {RequestMethod.GET,RequestMethod.POST})
	public String asList(Model model) {
		System.out.println("asList 시작");
		
		return "Admin/admin_asList";
	}

	//회원 검색
	@RequestMapping(value = "memberSearch", method = {RequestMethod.GET,RequestMethod.POST})
	public String memberSearch(Model model, HttpServletRequest request) {
		System.out.println("memberSearch 시작");
		System.out.println(request.getParameter("search"));
		String search = request.getParameter("search");
		if(search.equals("")) {
			return "redirect:/admin/memberList";
		}
		
		model.addAttribute("search", adminService.memberSearch(search));
		return "Admin/admin_memberList";
	}
	
	//상품 검색 이름이나 브랜드
	@RequestMapping(value = "productSearch", method = {RequestMethod.GET,RequestMethod.POST})
	public String productSearch(Model model, HttpServletRequest request) {
		System.out.println("productSearch 시작");
		System.out.println(request.getParameter("search"));
		String search = request.getParameter("search");
		if(search.equals("")) {
			return "redirect:/admin/productList";
		}
		model.addAttribute("search", adminService.productSearch(search));
		return "Admin/admin_productList";
	}

	@RequestMapping(value = "buyInfo", method = {RequestMethod.GET,RequestMethod.POST})
	public String buyInfo(Model model,Criteria criteria, HttpServletRequest request) {
		System.out.println("buyInfo 시작");
	
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(criteria);
		
		System.out.println("현재페이지 : "+criteria.getPage());
		System.out.println("화면에 보여질 페이지수 : "+criteria.getPerPageNum());

		int startNum = criteria.getStartNum();
		int endNum = criteria.getEndNum();
		String m_number = request.getParameter("m_number");
		
		int totalCount = adminService.countBuy(m_number);
		System.out.println("구매내역 : " + totalCount);
		
		pageMaker.setTotalCount(totalCount);
		int totalPrice = 0;
		ArrayList<BuyVO> list = adminService.buyList(m_number);
		for (int i = 0; i < list.size(); i++) {
			totalPrice += list.get(i).getB_total();
		}
	
		model.addAttribute("totalPrice", totalPrice);
		model.addAttribute("buyInfo", adminService.buyInfo(m_number, startNum, endNum));
		model.addAttribute("pageMaker", pageMaker);
		
		return "Admin/admin_memberBuyList";
	}
	
	@RequestMapping(value = "refundInfo", method = {RequestMethod.GET,RequestMethod.POST})
	public String refundInfo(Model model,Criteria criteria, HttpServletRequest request) {
		System.out.println("buyInfo 시작");
	
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(criteria);
		
		System.out.println("현재페이지 : "+criteria.getPage());
		System.out.println("화면에 보여질 페이지수 : "+criteria.getPerPageNum());

		int startNum = criteria.getStartNum();
		int endNum = criteria.getEndNum();
		String m_number = request.getParameter("m_number");
		
		int totalCount = adminService.countRefund(m_number);
		System.out.println("환불내역 : " + totalCount);
		
		pageMaker.setTotalCount(totalCount);
		
		int totalPrice = 0;
		ArrayList<RefundVO> list = adminService.refundList(m_number);
		for (int i = 0; i < list.size(); i++) {
			totalPrice += list.get(i).getR_price();
		}
	
		model.addAttribute("totalPrice", totalPrice);
		model.addAttribute("refundInfo", adminService.refundInfo(m_number, startNum, endNum));
		model.addAttribute("pageMaker", pageMaker);
		
		return "Admin/admin_memberRefundList";
	}
	
	@RequestMapping(value = "updateAutoritiy", method = {RequestMethod.GET,RequestMethod.POST})
	public String updateAutoritiy(Model model,Criteria criteria, HttpServletRequest request) {
		String m_number = request.getParameter("m_number");
		String m_authority = request.getParameter("m_authority");
		
		adminService.updateAuthority(m_number, m_authority);
		
		return "redirect:/admin/memberInfo?m_number="+m_number;
	}
	
	
	
	
}
