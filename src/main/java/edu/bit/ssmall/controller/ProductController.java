package edu.bit.ssmall.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;


import edu.bit.ssmall.service.ProductService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class ProductController {
	
	@Autowired
	ProductService productService;

	@RequestMapping("/productView")

	public String product(Model model) {

		model.addAttribute("product", productService.selectProductList());
		
		return "product";
	}
	
	
	
}
