package edu.bit.ssmall.controller;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import edu.bit.ssmall.service.ProductService;
import edu.bit.ssmall.vo.ProductImageVO;


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
	
	
	@RequestMapping("/productDetail")
	public String product_detail(HttpServletRequest request,Model model) {
		System.out.println("/productDetail");
		String p_number = request.getParameter("p_number");
//		ProductImageVO productImage  = productService.selectProductOne(p_number);
		model.addAttribute("productDetail", productService.selectProductOne(p_number));//��������,����1,2 ����. �� �� 3�� ����Ʈ�ι޾���
		model.addAttribute("productAmount", productService.selectProductListAmount());
		//model.addAttribute("product1", productService.selectProductOne2(p_number));//����1��. �� �� 1�� �Ϲ����� ����.
		System.out.println("��Ʈ�ѷ����ϳѾ");
		return "productDetail";
	}
	
	
}
