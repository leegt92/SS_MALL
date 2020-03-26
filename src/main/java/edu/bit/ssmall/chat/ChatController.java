package edu.bit.ssmall.chat;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ChatController {
	
	@RequestMapping(value = "chat", method = {RequestMethod.GET,RequestMethod.POST})
	public String chat(Model model) {

		return "chat";

	}	
}
