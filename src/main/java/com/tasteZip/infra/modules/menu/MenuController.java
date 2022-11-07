package com.tasteZip.infra.modules.menu;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping(value = "/menu/")
public class MenuController {
	
	@Autowired
	MenuServiceImpl service;
	
// --------------- 관리자 --------------
	@RequestMapping(value = "menuList")
	public String menuList(@ModelAttribute("vo") MenuVo vo, Model model) throws Exception {
		
		vo.setParamsPaging2(service.selectOneCount2(vo)); 

		List<Menu> list = service.selectList2(vo);
		model.addAttribute("list", list); 
		
		return "infra/xdmin/menu/menuList";
	}
	
	@RequestMapping(value = "menuForm")
	public String menuForm(@ModelAttribute("vo") MenuVo vo, Model model) throws Exception {
		
		Menu item = service.selectOne(vo);
		 model.addAttribute("item", item);
		 
		return "infra/xdmin/menu/menuForm";
	}

	@RequestMapping(value= "menuUpdt")
	public String MenuUpdt(@ModelAttribute("vo") MenuVo vo, Menu dto, RedirectAttributes redirectAttributes) throws Exception {
		service.update(dto);
		
		redirectAttributes.addFlashAttribute("vo", vo);
		return "redirect:/menu/menuList";
		
	}
	
	@RequestMapping(value= "menuUele")
	public String MenuUele(@ModelAttribute("vo") MenuVo vo, Menu dto, RedirectAttributes redirectAttributes) throws Exception {
		service.uelete(dto);
		
		redirectAttributes.addFlashAttribute("vo", vo);
		return "redirect:/menu/menuList";
	}
	

	@RequestMapping(value= "menuDele")
	public String MenuDele(@ModelAttribute("vo") MenuVo vo, Menu dto, RedirectAttributes redirectAttributes) throws Exception {
		service.delete(vo);
		
		redirectAttributes.addFlashAttribute("vo", vo);
		return "redirect:/menu/menuList";
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
