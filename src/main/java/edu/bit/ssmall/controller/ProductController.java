package edu.bit.ssmall.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import edu.bit.ssmall.service.ProductService;
import edu.bit.ssmall.vo.BoardVO;
import edu.bit.ssmall.vo.ProductVO;


/**
 * Handles requests for the application home page.
 */
@Controller
public class ProductController {
	
	@Autowired
	ProductService productService;

	@RequestMapping("/productView")

	public String productview(Model model) {

		model.addAttribute("product", productService.selectProductList());
		
		return "product";
	}

	@RequestMapping("/productDetail")
	public String product_detail(HttpServletRequest request,Model model) {
		System.out.println("/productDetail");
		String p_number = request.getParameter("p_number");
//		ProductImageVO productImage  = productService.selectProductOne(p_number);
		model.addAttribute("productDetail", productService.selectProductOne(p_number));//��������,����1,2 ����. �� �� 3�� ����Ʈ�ι޾���
		model.addAttribute("productAmount", productService.selectProductListAmount());
		//model.addAttribute("product1", productService.selectProductOne2(p_number));//����1��. �� �� 1�� �Ϲ����� ����.
		System.out.println("��Ʈ�ѷ����ϳѾ");
		
		
		
		//구매위해서 추가했음
		ProductVO productVO = productService.productOne(p_number);
		model.addAttribute("product",productVO);
		
		return "productDetail";
	}
	
	
	
	
}
