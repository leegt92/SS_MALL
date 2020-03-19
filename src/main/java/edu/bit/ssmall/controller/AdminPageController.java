package edu.bit.ssmall.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.bit.ssmall.service.ProductService;

@RequestMapping("admin")
@Controller
public class AdminPageController {
	
	@Autowired
	ProductService adminpageService;
	
	@RequestMapping(value = "/adminpage", method = RequestMethod.GET)
	public String adminpage(Model model) {

		return "adminpage";

	}	
	
	@RequestMapping(value = "/admin_staff1", method = RequestMethod.GET)
	public String admin_staff1(Model model) {

		return "admin_menu/admin_staff1";

	}	
	
	@RequestMapping(value = "/admin_staff2", method = RequestMethod.GET)
	public String admin_staff2(Model model) {

		return "admin_menu/admin_staff2";

	}
	
	@RequestMapping(value = "/admin_staff3", method = RequestMethod.GET)
	public String admin_staff3(Model model) {

		return "admin_menu/admin_staff3";

	}
	
	@RequestMapping(value = "/admin_member1", method = RequestMethod.GET)
	public String admin_member1(Model model) {

		return "admin_menu/admin_member1";

	}	
	
	@RequestMapping(value = "/admin_member2", method = RequestMethod.GET)
	public String admin_member2(Model model) {

		return "admin_menu/admin_member2";

	}
	
	@RequestMapping(value = "/admin_member3", method = RequestMethod.GET)
	public String admin_member3(Model model) {

		return "admin_menu/admin_member3";

	}
	
	@RequestMapping(value = "/admin_board1", method = RequestMethod.GET)
	public String admin_board1(Model model) {

		return "admin_menu/admin_board1";

	}
	
	@RequestMapping(value = "/admin_board2", method = RequestMethod.GET)
	public String admin_board2(Model model) {

		return "admin_menu/admin_board2";

	}
	
	@RequestMapping(value = "/admin_board3", method = RequestMethod.GET)
	public String admin_board3(Model model) {

		return "admin_menu/admin_board3";

	}
	
	@RequestMapping(value = "/admin_product1", method = RequestMethod.GET)
	public String admin_product1(Model model) {

		return "admin_menu/admin_product1";

	}
	
	@RequestMapping(value = "/admin_product2", method = RequestMethod.GET)
	public String admin_product2(Model model) {

		return "admin_menu/admin_product2";

	}
	
	@RequestMapping(value = "/admin_product3", method = RequestMethod.GET)
	public String admin_product3(Model model) {

		return "admin_menu/admin_product3";

	}
	
	@RequestMapping(value = "/admin_AS1", method = RequestMethod.GET)
	public String admin_AS1(Model model) {

		return "admin_menu/admin_AS1";

	}
	
	@RequestMapping(value = "/admin_AS2", method = RequestMethod.GET)
	public String admin_AS2(Model model) {

		return "admin_menu/admin_AS2";

	}
	
	@RequestMapping(value = "/admin_AS3", method = RequestMethod.GET)
	public String admin_AS3(Model model) {

		return "admin_menu/admin_AS3";

	}
	
	@RequestMapping(value = "/admin_order1", method = RequestMethod.GET)
	public String admin_order1(Model model) {

		return "admin_menu/admin_order1";

	}
	
	@RequestMapping(value = "/admin_order2", method = RequestMethod.GET)
	public String admin_order2(Model model) {

		return "admin_menu/admin_order2";

	}
	
	@RequestMapping(value = "/admin_order3", method = RequestMethod.GET)
	public String admin_order3(Model model) {

		return "admin_menu/admin_order3";

	}
	
	
	
	
}
