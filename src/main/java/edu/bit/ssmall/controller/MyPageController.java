package edu.bit.ssmall.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.bit.ssmall.service.MypageService;
import edu.bit.ssmall.service.ProductService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class MyPageController {
	
	@Autowired
	MypageService mypageService;
	
	@RequestMapping(value = "/myPage", method = RequestMethod.GET)
	public String myPage(Model model) {
		 Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		    Object principal = auth.getPrincipal();
		 
		    String name = "";
		    if(principal != null) {
		        name = auth.getName();
		    }
		    
		    try {
				int m_number = mypageService.getMnum(name);
				model.addAttribute("m_number", m_number);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		return "myPage";

	}	
	
	@RequestMapping(value = "/myPage_shoppingList", method = RequestMethod.GET)
	public String myPage_shoppingList(Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    Object principal = auth.getPrincipal();
	 
	    String name = "";
	    if(principal != null) {
	        name = auth.getName();
	    }
	    
	    try {
			int m_number = mypageService.getMnum(name);
			model.addAttribute("m_number", m_number);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return "myPage_shoppingList";

	}	
	
	@RequestMapping(value = "/myPage_orderedList", method = RequestMethod.GET)
	public String myPage_orderedList(Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    Object principal = auth.getPrincipal();
	 
	    String name = "";
	    if(principal != null) {
	        name = auth.getName();
	    }
	    
	    try {
			int m_number = mypageService.getMnum(name);
			model.addAttribute("m_number", m_number);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return "myPage_orderedList";

	}	
	
	@RequestMapping(value = "/myPage_askRequest", method = RequestMethod.GET)
	public String myPage_askRequest(Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    Object principal = auth.getPrincipal();
	 
	    String name = "";
	    if(principal != null) {
	        name = auth.getName();
	    }
	    
	    try {
			int m_number = mypageService.getMnum(name);
			model.addAttribute("m_number", m_number);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return "myPage_askRequest";

	}	
	
	@RequestMapping(value = "/myPage_askAS", method = RequestMethod.GET)
	public String myPage_askAS(Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    Object principal = auth.getPrincipal();
	 
	    String name = "";
	    if(principal != null) {
	        name = auth.getName();
	    }
	    
	    try {
			int m_number = mypageService.getMnum(name);
			model.addAttribute("m_number", m_number);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return "myPage_askAS";

	}
	
	@RequestMapping(value = "/myPage_reviseInformation", method = RequestMethod.GET)
	public String myPage_reviseInformation(Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    Object principal = auth.getPrincipal();
	 
	    String name = "";
	    if(principal != null) {
	        name = auth.getName();
	    }
	    
	    try {
			int m_number = mypageService.getMnum(name);
			model.addAttribute("m_number", m_number);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return "myPage_reviseInformation";

	}
	
	@RequestMapping(value = "/myPage_reviseInformation2")
	public String myPage_reviseInformation2(Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    Object principal = auth.getPrincipal();
	 
	    String name = "";
	    if(principal != null) {
	        name = auth.getName();
	    }
	    
	    try {
			int m_number = mypageService.getMnum(name);
			model.addAttribute("m_number", m_number);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return "myPage_reviseInformation2";

	}
	
	@RequestMapping(value = "/myPage_reviseInformation3", method = RequestMethod.GET)
	public String myPage_reviseInformation3(Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    Object principal = auth.getPrincipal();
	 
	    String name = "";
	    if(principal != null) {
	        name = auth.getName();
	    }
	    
	    try {
			int m_number = mypageService.getMnum(name);
			model.addAttribute("m_number", m_number);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return "myPage_reviseInformation3";

	}
}
