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
public class BlogController {
	
	
	@RequestMapping("/blogview")
	public String bolg(Model model) {

		
		
		return "blog";
	}
	
	@RequestMapping("/blogview2")
	public String bolgdetail(Model model) {

		
		
		return "blog-detail";
	}
	
	@RequestMapping("/cartview")
	public String cartview(Model model) {

		
		
		return "shopping-cart";
	}
	
	
	
}
