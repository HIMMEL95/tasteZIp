package com.tasteZip.infra.modules.codeGroup;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/codeGroup/")
public class codeGroupController {

	@RequestMapping(value = "codeGroupList")
	public String codeGroupList() throws Exception {
		return "infra/xdmin/codeGroup/codeGroupList";
	}
	
	@RequestMapping(value = "codeGroupForm")
	public String codeGroupForm() throws Exception {
		return "infra/xdmin/codeGroup/codeGroupForm";
	}
}
