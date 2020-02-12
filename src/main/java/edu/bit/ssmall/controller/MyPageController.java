package edu.bit.ssmall.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.bit.ssmall.service.ProductService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class MyPageController {
	
	@Autowired
	ProductService MyPageService;
	
	@RequestMapping(value = "/myPage", method = RequestMethod.GET)
	public String myPage(Model model) {

		return "myPage";

	}	
	
	@RequestMapping(value = "/myPage_shoppingList", method = RequestMethod.GET)
	public String myPage_shoppingList(Model model) {

		return "myPage_shoppingList";

	}	
	
	@RequestMapping(value = "/myPage_orderedList", method = RequestMethod.GET)
	public String myPage_orderedList(Model model) {

		return "myPage_orderedList";

	}	
	
	@RequestMapping(value = "/myPage_askRequest", method = RequestMethod.GET)
	public String myPage_askRequest(Model model) {

		return "myPage_askRequest";

	}	
	
	@RequestMapping(value = "/myPage_askAS", method = RequestMethod.GET)
	public String myPage_askAS(Model model) {

		return "myPage_askAS";

	}
	
	@RequestMapping(value = "/myPage_reviseInformation", method = RequestMethod.GET)
	public String myPage_reviseInformation(Model model) {

		return "myPage_reviseInformation";

	}
	
	@RequestMapping(value = "/myPage_reviseInformation2", method = RequestMethod.GET)
	public String myPage_reviseInformation2(Model model) {

		return "myPage_reviseInformation2";

	}
}
