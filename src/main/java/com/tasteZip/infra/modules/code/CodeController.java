package com.tasteZip.infra.modules.code;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping(value = "/code/")
public class CodeController {
	
	@Autowired
	CodeServiceImpl service;
	
	public void setSearchAndPaging(CodeVo vo) throws Exception{
		
		vo.setParamsPaging(service.selectOneCount(vo));
		vo.setShDelNy(vo.getShDelNy() == null ? 0 : vo.getShDelNy());
		
	}
	
	
	
	@RequestMapping(value = "codeList")
	public String codeList(@ModelAttribute("vo") CodeVo vo, Model model) throws Exception {
		
		setSearchAndPaging(vo);

		if (vo.getTotalRows() > 0) {
			List<Code> list = service.selectList(vo);
			model.addAttribute("list", list);
		}
		
		return "infra/xdmin/code/codeList";
	}
	
	@RequestMapping(value = "codeForm")
	public String codeForm(@ModelAttribute("vo") CodeVo vo, Model model) throws Exception {
		
		Code item = service.selectOne(vo);
		model.addAttribute("item", item);
		
		return "infra/xdmin/code/codeForm";
	}

	
	@RequestMapping(value = "codeInst")
	public String codeInst(CodeVo vo, Code dto, RedirectAttributes redirectAttributes) throws Exception {
		
		service.insert(dto);
		
		vo.setIfccSeq(dto.getIfccSeq());
		redirectAttributes.addFlashAttribute("vo", vo);
		
		return "redirect:/code/codeForm";
		
	}
	
	
	@RequestMapping(value = "codeUpdt")
	public String codeUpdt(CodeVo vo, Code dto, RedirectAttributes redirectAttributes) throws Exception {
		
		service.update(dto);
		redirectAttributes.addFlashAttribute("vo", vo);
		
		return "redirect:/code/codeForm";
	}
	
	
	@RequestMapping(value = "codeUele")
	public String codeUele(@ModelAttribute("vo") CodeVo vo, Code dto, Model model, RedirectAttributes redirectAttributes) throws Exception {
		
		String returnString = "";
		
		if(vo.getFormNY() == 1) { 
			// form uelete
			
			service.uelete(dto);
			redirectAttributes.addFlashAttribute("vo", vo);
			return "redirect:/code/codeList";

		} else {
			// list uelete
			
			for(CodeVo vItem : vo.getSeqVoList()) {
				
				service.ueleteList(vItem.getIfccSeq());
				
				setSearchAndPaging(vo);
				
				if(vo.getTotalRows() > 0) {
					List<Code> list = service.selectList(vo);
					model.addAttribute("list", list);
				}

				returnString = "infra/xdmin/code/codeList";
			}
			
		}
		
		return returnString;
		
	}
	
	@RequestMapping(value = "codeDele")
	public String codeDele(CodeVo vo, RedirectAttributes redirectAttributes) throws Exception {
		
		service.delete(vo);
		redirectAttributes.addFlashAttribute("vo", vo);
		return "redirect:/code/codeList";
	}
	
	
}
