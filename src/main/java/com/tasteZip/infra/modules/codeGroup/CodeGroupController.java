package com.tasteZip.infra.modules.codeGroup;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping(value = "/codeGroup/")
public class CodeGroupController {

	@Autowired
	CodeGroupServiceImpl service;
	
	// search and paging
	public void setSearchAndPaging(CodeGroupVo vo) throws Exception{
		vo.setParamsPaging(service.selectOneCount(vo));
	}
	
	// list
	@RequestMapping(value = "codeGroupList")
	public String codeGroupList(@ModelAttribute("vo") CodeGroupVo vo, Model model) throws Exception {
		
		setSearchAndPaging(vo);
		
		if (vo.getTotalRows() > 0) {
			List<CodeGroup> list = service.selectList(vo);
			model.addAttribute("list", list);
		}
		
		return "infra/xdmin/codeGroup/codeGroupList";
	}

	// form
	@RequestMapping(value = "codeGroupForm")
	public String codeGroupForm(@ModelAttribute("vo") CodeGroupVo vo, Model model) throws Exception {
		
		System.out.println("vo.getifcgSeq: " + vo.getIfcgSeq());
		CodeGroup result = service.selectOne(vo);
		model.addAttribute("item", result);
		
		return "infra/xdmin/codeGroup/codeGroupForm";
	}

	
	// insert
	@RequestMapping(value = "codeGroupInst")
	public String codeGroupInst(CodeGroupVo vo, CodeGroup dto, RedirectAttributes redirectAttributes) throws Exception {
		
		service.insert(dto);
		
		vo.setIfcgSeq(dto.getIfcgSeq());
		redirectAttributes.addFlashAttribute("vo", vo);
		
		return "redirect:/codeGroup/codeGroupForm";
	}
	

	// update
	@RequestMapping(value = "codeGroupUpdt")
	public String codeGroupUpdt(CodeGroupVo vo, CodeGroup dto, RedirectAttributes redirectAttributes) throws Exception {
		
		service.update(dto);
		redirectAttributes.addFlashAttribute("vo", vo);
		return "redirect:/codeGroup/codeGroupForm";
	}
	
	
	// uelete
	@RequestMapping(value = "codeGroupUele")
	public String codeGroupUele(@ModelAttribute("vo") CodeGroupVo vo, CodeGroup dto,  Model model, RedirectAttributes redirectAttributes) throws Exception {
		
		String returnString = "";
		
		if(vo.getFormNY() == 1) {
			// form uelete
			
			service.uelete(dto);
			redirectAttributes.addFlashAttribute("vo", vo);
			return "redirect:/codeGroup/codeGroupList";

		} else {
			// list uelete
			
			for(CodeGroupVo vItem : vo.getSeqVoList()) {
				
				service.ueleteList(vItem.getIfcgSeq());
				
				setSearchAndPaging(vo);
				
				if(vo.getTotalRows() > 0) {
					List<CodeGroup> list = service.selectList(vo);
					model.addAttribute("list", list);
				}

				returnString = "infra/xdmin/codeGroup/codeGroupList";
			}
			
		}
		
		return returnString;
	}
	
	
	// delete
	@RequestMapping(value = "codeGroupDele")
	public String codeGroupDele(CodeGroupVo vo, RedirectAttributes redirectAttributes) throws Exception {
		
		service.delete(vo);
		redirectAttributes.addFlashAttribute("vo", vo);
		return "redirect:/codeGroup/codeGroupList";
	}
	
	
}
