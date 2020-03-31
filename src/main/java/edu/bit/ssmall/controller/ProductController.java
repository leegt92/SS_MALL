package edu.bit.ssmall.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import edu.bit.ssmall.service.ProductService;
import edu.bit.ssmall.vo.BoardVO;
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
	
	
	/*
	 * @RequestMapping("/productDetail") public String product_detail(ProductReplyVO
	 * productReplyVO, HttpServletRequest request,Model model) {
	 * System.out.println("/productDetail"); String p_number =
	 * request.getParameter("p_number"); // ProductImageVO productImage =
	 * productService.selectProductOne(p_number);
	 * model.addAttribute("productDetail",
	 * productService.selectProductOne(p_number));//��������,����1,2 ����. �� �� 3��
	 * ����Ʈ�ι޾��� model.addAttribute("productAmount",
	 * productService.selectProductListAmount());
	 * 
	 * model.addAttribute("productReply", productService.productReply(p_number));
	 * //model.addAttribute("product1",
	 * productService.selectProductOne2(p_number));//����1��. �� �� 1�� �Ϲ�����
	 * ����. model.addAttribute("productNum", productService.productOne(p_number));
	 * //productService.productReplyWrite(productReplyVO);
	 * System.out.println("��Ʈ�ѷ����ϳѾ");
	 * 
	 * //구매위해서 추가했음 ProductVO productVO = productService.productOne(p_number);
	 * System.out.println(productVO); model.addAttribute("product",productVO);
	 * 
	 * return "productDetail";
	 * 
	 * }
	 */
	
	@ResponseBody
	@RequestMapping(value = "product_Write_reply", method = {RequestMethod.POST, RequestMethod.GET})
	public void product_Write_reply(ProductReplyVO productReplyVO, HttpServletRequest request,Model model) {
		System.out.println("/product_Write_replyAjax");
		
		String p_number = request.getParameter("p_number");
		System.out.println("상품번호 확인 "+ p_number);
		model.addAttribute("productDetail", productService.selectProductOne(p_number));	
		System.out.println(productService.selectProductOne(p_number));
		
		productService.productReplyWrite(productReplyVO);
		System.out.println("Ajax���δ�Ʈ����Ʈ���÷���:55");
		
	}
	
	/*@RequestMapping("/product_Write_reply") ���żҰ� ajax�� ���� �ӽ� �ּ�ȭ
	public String product_Write_reply(ProductReplyVO productReplyVO, HttpServletRequest request,Model model) {
		System.out.println("/product_Write_reply");
		String p_number = request.getParameter("p_number");//null�� ����?? System.out.println(request.getParameter("p_number"))�� Ȯ����;
		System.out.println("���δ�Ʈ����Ʈ���÷���:51");
		System.out.println(request.getParameter("p_number"));
		model.addAttribute("productDetail", productService.selectProductOne(p_number));	
		System.out.println("���δ�Ʈ����Ʈ���÷���:53");
		productService.productReplyWrite(productReplyVO);
		System.out.println("���δ�Ʈ����Ʈ���÷���:55");
		return "forward:/productDetail2";
	}*/
	@ResponseBody
	@RequestMapping("/deleteReply")
	public void deleteReply(BoardVO boardVO, Model model,HttpServletRequest request) {
		System.out.println("/deleteReply����");
		String bid = request.getParameter("bid");
		System.out.println(bid);
		//String p_number = request.getParameter("p_number");	
		//model.addAttribute("productDetail", productService.selectProductOne(p_number));	
	
		//String bid = request.getParameter("bid");
		//model.addAttribute("boardNum", productService.boardOne(bid));
		productService.replyDelete(boardVO);
		System.out.println("/deleteReply��");
		//bid�� ���� ����. jsp���� �ȳѾ��. ���� bid�� �ָ� �����Ǵ°� Ȯ��. �׷��� �������� �ٽ� ���ư��� ������.
		//�� �޼ҵ� �ٽ� Ȯ��
	}
	
	/* ���� ajax�Ẹ������ �ּ�ó��
	 * public String deleteReply(BoardVO boardVO, Model model,HttpServletRequest request) {
		System.out.println("/deleteReply����");
		//String p_number = request.getParameter("p_number");	
		//model.addAttribute("productDetail", productService.selectProductOne(p_number));	
		System.out.println("bid��");
		//String bid = request.getParameter("bid");
		//model.addAttribute("boardNum", productService.boardOne(bid));
		productService.replyDelete(boardVO);
		System.out.println("/deleteReply��");
		return "forward:/productDetail2";
		//bid�� ���� ����. jsp���� �ȳѾ��. ���� bid�� �ָ� �����Ǵ°� Ȯ��. �׷��� �������� �ٽ� ���ư��� ������.
		//�� �޼ҵ� �ٽ� Ȯ��
	}*/
	
	@RequestMapping("/modifyReply")
	public String modifyReply(BoardVO boardVO, Model model) {
		System.out.println("modifyReply����");
		//productService.updateBoard(boardVO);
		return "forward:/productDetail";
	}

}
