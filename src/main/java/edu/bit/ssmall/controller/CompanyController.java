package edu.bit.ssmall.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Handles requests for the application home page.
 */
@Controller
public class CompanyController {
	
	
	@RequestMapping("/companyView")
	public String companyView(Model model) {

		
		
		return "company";
	}

	
	
}
