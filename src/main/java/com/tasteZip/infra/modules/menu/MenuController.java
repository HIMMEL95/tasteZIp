package com.tasteZip.infra.modules.menu;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/menu/")
public class MenuController {
	
	@RequestMapping(value = "menuList")
	public String menuList() throws Exception {
	    return "infra/owner/menu/menuList";
	}
	
	@RequestMapping(value = "menuForm")
	public String menuForm() throws Exception {
	    return "infra/owner/menu/menuForm";
	}

}
