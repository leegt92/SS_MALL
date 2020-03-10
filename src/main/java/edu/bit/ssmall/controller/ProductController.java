package edu.bit.ssmall.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import edu.bit.ssmall.service.ProductService;
import edu.bit.ssmall.vo.BoardVO;
import edu.bit.ssmall.vo.ProductImageVO;
import edu.bit.ssmall.vo.ProductReplyVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class ProductController {
	
	@Autowired
	ProductService productService;

	@RequestMapping("/productView")
	public String productview(HttpServletRequest request,Model model) {
		
		model.addAttribute("product", productService.selectProductList());
		
		return "product";
	}
	@RequestMapping("/productDetail")
	public String product_detail(ProductReplyVO productReplyVO, HttpServletRequest request,Model model) {
		System.out.println("/productDetail");
		String p_number = request.getParameter("p_number");
//		ProductImageVO productImage  = productService.selectProductOne(p_number);
		model.addAttribute("productDetail", productService.selectProductOne(p_number));//사진메인,서브1,2 포함. 즉 값 3개 리스트로받았음
		model.addAttribute("productAmount", productService.selectProductListAmount());
		model.addAttribute("productReply", productService.productReply(p_number));
		//model.addAttribute("product1", productService.selectProductOne2(p_number));//사진1개. 즉 값 1개 일반으로 받음.
		model.addAttribute("productNum", productService.productOne(p_number));
		//productService.productReplyWrite(productReplyVO);
		System.out.println("컨트롤러리턴넘어감");
		
		 
		return "productDetail";
	}
	@RequestMapping("/product_Write_reply")
	public String product_Write_reply(ProductReplyVO productReplyVO, HttpServletRequest request,Model model) {
		System.out.println("/product_Write_reply");
		String p_number = request.getParameter("p_number");//null임 왜지?? System.out.println(request.getParameter("p_number"))로 확인함;
		System.out.println("프로덕트라이트리플레이:51");
		System.out.println(request.getParameter("p_number"));
		model.addAttribute("productDetail", productService.selectProductOne(p_number));	
		System.out.println("프로덕트라이트리플레이:53");
		productService.productReplyWrite(productReplyVO);
		System.out.println("프로덕트라이트리플레이:55");
		return "forward:/productDetail2";
	}
	
	@RequestMapping("/deleteReply")
	public String deleteReply(BoardVO boardVO, Model model,HttpServletRequest request) {
		System.out.println("/deleteReply시작");
		//String p_number = request.getParameter("p_number");	
		//model.addAttribute("productDetail", productService.selectProductOne(p_number));	
		System.out.println("bid위");
		//String bid = request.getParameter("bid");
		//model.addAttribute("boardNum", productService.boardOne(bid));
		productService.replyDelete(boardVO);
		System.out.println("/deleteReply끝");
		return "forward:/productDetail2";
		//bid가 들어가지 않음. jsp에서 안넘어옴. 직접 bid값 주면 삭제되는거 확인. 그러나 페이지는 다시 돌아가지 못했음.
		//이 메소드 다시 확인
	}
	@RequestMapping("/modifyReply")
	public String modifyReply(BoardVO boardVO, Model model) {
		System.out.println("modifyReply시작");
		//productService.updateBoard(boardVO);
		return "forward:/productDetail";
	}
}
