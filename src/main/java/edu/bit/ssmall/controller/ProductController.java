package edu.bit.ssmall.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.bit.ssmall.service.ProductService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class ProductController {
	
	@Autowired
	ProductService productService;

	@RequestMapping("/productView")
	public String product(Model model, HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		response.setContentType("image/png");
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
	
	/*
	 * @RequestMapping("/attachImage.do") public void attachImage(RMap rmap,
	 * ModelMap model,) { UMap umap = fileService.selectAttachFile(rmap, model);
	 * byte[] imageData = (byte[]) umap.get("file");
	 * response.setContentType("image/jpeg");
	 * response.getOutputStream().write(imageData);
	 */
	
}
