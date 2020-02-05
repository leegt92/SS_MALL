package edu.bit.ssmall.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.bit.ssmall.service.ProductService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class ProductController {
	
	@Inject
	ProductService productService;

	@RequestMapping("/product")
	public String product(Model model, HttpSession session) {
		
		model.addAttribute("product", productService.selectProductList());
		
		return "product";
	}
	
	@RequestMapping(value = "/product-detail", method = RequestMethod.GET)
	public String product_detail(Locale locale, Model model) {
		
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "product-detail";
	}
	
	
}
