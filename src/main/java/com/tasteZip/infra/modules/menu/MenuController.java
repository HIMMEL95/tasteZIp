package com.tasteZip.infra.modules.menu;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/menu/")
public class MenuController {
	
	@Autowired
	MenuServiceImpl service;
	
// --------------- 관리자 --------------
	@RequestMapping(value = "menuList")
	public String menuList(@ModelAttribute("vo") MenuVo vo, Model model) throws Exception {
		
		vo.setParamsPaging2(service.selectOneCount2(vo));
		
		List<Menu> list2 = service.selectList2(vo);
		model.addAttribute("list", list2); 
		
		return "infra/xdmin/menu/menuList";
	}
	
	@RequestMapping(value = "menuForm")
	public String menuForm() throws Exception {
		return "infra/xdmin/menu/menuForm";
	}
	
// -------------- 가게 주인 ------------	
	@RequestMapping(value = "ownerMenuList")
	public String ownerMenuList() throws Exception {
	    return "infra/xdmin/menu/ownerMenuList";
	}
	
	@RequestMapping(value = "ownerMenuForm")
	public String ownerMenuForm() throws Exception {
	    return "infra/xdmin/menu/ownerMenuForm";
	}
	
	

}
