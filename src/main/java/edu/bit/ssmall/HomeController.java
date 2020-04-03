package edu.bit.ssmall;

import java.security.Principal;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import edu.bit.ssmall.service.CartService;
import edu.bit.ssmall.vo.CartViewVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	CartService cartService;
	
	@RequestMapping(value = "/kakao", method = RequestMethod.GET)
	public String kakao(Model model) {

		return "kakao";

	}	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {

		return "home";

	}	
	
	 @RequestMapping(value = "/homeview", method = RequestMethod.GET) 
	 public String home2(Model model) {
	 
	  return "home";
	 
	 
	 }
	

	@RequestMapping(value = "/AccessDenine", method = RequestMethod.GET)
	public String AccessDenine(Model model) {

		return "accessDenine";

	}
	
	@RequestMapping(value="asView", method= {RequestMethod.GET, RequestMethod.POST})
	public String asView(Model model) {

		return "as";

	}

	@ResponseBody
	@RequestMapping("miniCart")
	public ArrayList<CartViewVO> miniCart(Principal principal){
		System.out.println(cartService.miniCartInfo(principal.getName()));
		return cartService.miniCartInfo(principal.getName());
	}
}
