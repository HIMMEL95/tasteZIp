package com.tasteZip.infra.modules.code;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/code/")
public class CodeController {

	@RequestMapping(value = "codeList")
	public String codeList() throws Exception {
		return "infra/xdmin/code/codeList";
	}
	
	@RequestMapping(value = "codeForm")
	public String codeForm() throws Exception {
		return "infra/xdmin/code/codeForm";
	}

	
	
	
	
	
}
