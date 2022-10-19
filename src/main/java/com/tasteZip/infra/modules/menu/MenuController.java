package com.tasteZip.infra.modules.menu;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/menu/")
public class MenuController {
	
	@RequestMapping(value = "ownerMenuList")
	public String ownerMenuList() throws Exception {
	    return "infra/xdmin/menu/ownerMenuList";
	}
	
	@RequestMapping(value = "ownerMenuForm")
	public String ownerMenuForm() throws Exception {
	    return "infra/xdmin/menu/ownerMenuForm";
	}

}
