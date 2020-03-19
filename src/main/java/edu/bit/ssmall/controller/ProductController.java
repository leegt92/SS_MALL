package edu.bit.ssmall.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import edu.bit.ssmall.service.ProductService;
import edu.bit.ssmall.vo.BoardVO;
import edu.bit.ssmall.vo.ProductImageVO;
import edu.bit.ssmall.vo.ProductReplyVO;
import edu.bit.ssmall.vo.ProductVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class ProductController {
	
	@Autowired
	ProductService productService;

	@RequestMapping("/productView")
	public String productview(HttpServletRequest request,Model model) {
		System.out.println("productview");
		model.addAttribute("product", productService.selectProductList());		
		return "product";
	}
	
	@RequestMapping("/productViewWatch")
	public String productview2(Model model) {
		model.addAttribute("product", productService.selectProductList());		
		return "productwatch";
	}
	
	@RequestMapping("/productViewWallet")
	public String productview3(Model model) {
		model.addAttribute("product", productService.selectProductList());		
		return "productwallet";
	}
	
	@ResponseBody
	@RequestMapping(value = "product_Write_reply", method = {RequestMethod.POST, RequestMethod.GET})
	public void product_Write_reply(ProductReplyVO productReplyVO, HttpServletRequest request,Model model) {
		System.out.println("/product_Write_replyAjax");		
		String p_number = request.getParameter("p_number");
		System.out.println("상품번호 확인 "+ p_number);
		model.addAttribute("productDetail", productService.selectProductOne(p_number));	
		System.out.println(productService.selectProductOne(p_number));		
		productService.productReplyWrite(productReplyVO);
		System.out.println("/product_Write_replyAjax끝");	
		
	}

	@ResponseBody
	@RequestMapping("/deleteReply")
	public void deleteReply(BoardVO boardVO, Model model,HttpServletRequest request) {
		System.out.println("/deleteReply");
		String bid = request.getParameter("bid");
		System.out.println(bid);
		productService.replyDelete(boardVO);
		System.out.println("/deleteReply끝");

	}
	@ResponseBody
	@RequestMapping("/modifyReply2")
	public void modifyReply2(BoardVO boardVO,Model model,HttpServletRequest request) {
		System.out.println("modifyReply2 시작");
		String btitle = request.getParameter("btitle");
		String bcontent = request.getParameter("bcontent");
		String bid = request.getParameter("bid");
		String p_number = request.getParameter("p_number");		
		System.out.println(btitle);
		System.out.println(bcontent);
		System.out.println(bid);
		System.out.println(p_number);		
		productService.updateBoard(btitle,bcontent,bid);
		
	}
	@RequestMapping("/productDetail")
	public String product_detail(ProductReplyVO productReplyVO, HttpServletRequest request,Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    Object principal = auth.getPrincipal();
	 
	    String name = "";
	    if(principal != "anonymousUser") {
	        name = auth.getName();
	        int m_number = productService.principalGetMid(name);//principal에서 뽑은 회원id로 회원number를 가져옴		
			model.addAttribute("principal_m_number",m_number);//가져온것을 model에 넣어서 jsp에 전달함.
	    }
	    System.out.println("principal : "+principal);
	    System.out.println("name : "+ name);
	    
		System.out.println("productDetail시작");
		String p_number = request.getParameter("p_number");
		System.out.println("상품번호 : "+p_number);
		model.addAttribute("productDetail", productService.selectProductOne(p_number));
		model.addAttribute("productAmount", productService.selectProductListAmount());
		model.addAttribute("productReply", productService.productReply(p_number));
		model.addAttribute("productNum", productService.productOne(p_number));
		
		model.addAttribute("principal_m_id",name);//principal로 받은 회원의 id. leegt92같은거.
		
		
		System.out.println("productDetail끝");
				
		
		
		return "productDetail";
	}
	@ResponseBody 
	@RequestMapping(value="product_replyAjax2", method= {RequestMethod.GET, RequestMethod.POST})
	public List<ProductReplyVO> product_replyAjax2(ProductReplyVO productReplyVO, HttpServletRequest request,Model model) {
		System.out.println("product_replyAjax2 시작");		
		String p_number = request.getParameter("p_number");
		System.out.println("상품번호 확인 : "+p_number);
		String m_number = request.getParameter("m_number");
		System.out.println("회원번호 확인 : "+m_number);
		String m_id = request.getParameter("m_id");
		System.out.println("회원아이디 확인 : "+m_id);
		String bcontent = request.getParameter("bcontent");
		System.out.println("댓글내용 확인 : "+bcontent);
		String btitle = request.getParameter("btitle");
		System.out.println("댓글제목 확인 : "+btitle);
				
		model.addAttribute("productDetail", productService.selectProductOne(p_number));
		model.addAttribute("productReply", productService.productReply(p_number));
		model.addAttribute("productNum", productService.productOne(p_number));
		System.out.println("product_replyAjax2��");
		System.out.println(productService.productReply(p_number));
		
		return productService.productReply(p_number);
	}
	/*
	@ResponseBody
	@RequestMapping("/product_replyAjax")
	public List<ProductImageVO> product_replyAjax(ProductReplyVO productReplyVO, HttpServletRequest request,Model model) {
		System.out.println("product_replyAjax����");
		String p_number = request.getParameter("p_number");
		System.out.println("product_replyAjax��");
			
		return productService.selectProductOne(p_number);
	}
	@ResponseBody
	@RequestMapping("/productView2")
	public List<ProductImageVO> productview2(HttpServletRequest request,Model model) {
		System.out.println("productview2");
		model.addAttribute("product", productService.selectProductList());		
		return productService.selectProductList();
	}*/
	
}
