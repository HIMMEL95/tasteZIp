package com.tasteZip.infra.modules;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {

	@RequestMapping(value = "tasteMain")
	public String tasteMain() throws Exception {
		return "infra/main/user/taste_main";
	}
	
	@RequestMapping(value = "login")
	public String login() throws Exception {
		return "infra/main/user/login";
	}
	
	@RequestMapping(value = "signUp")
	public String signUp() throws Exception {
		return "infra/main/user/signUp";
	}
	
	@RequestMapping(value = "order")
	public String order() throws Exception {
	    return "infra/main/order/order";
	}
}
