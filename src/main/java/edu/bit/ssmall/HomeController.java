package edu.bit.ssmall;

import java.security.Principal;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.bit.ssmall.corona.Corona;
import edu.bit.ssmall.corona.StoresVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	Corona corona;
	
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
	
	@RequestMapping(value="corona", method= {RequestMethod.GET, RequestMethod.POST})
	public String corona(Model model, HttpServletRequest request){
		return "corona";
	}
	
	@RequestMapping(value="coronaView", method= {RequestMethod.GET, RequestMethod.POST})
	public String coronaView(Model model, HttpServletRequest request){
		
		String address = request.getParameter("address");
		
		ArrayList<StoresVO> list= corona.coronaView(address);
	
		for (int i = 0; i < list.size(); i++) {
			System.out.println(list.get(i));
		}
		model.addAttribute("list", list);
		
		return "coronaView";
	}
	
}
