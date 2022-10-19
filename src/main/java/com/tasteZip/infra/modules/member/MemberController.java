package com.tasteZip.infra.modules.member;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/member/")
public class MemberController {

	@RequestMapping(value = "memberList")
	public String memberList() throws Exception {
	    return "infra/xdmin/member/memberList";
	}
	
	@RequestMapping(value = "memberForm")
	public String memberForm() throws Exception {
	    return "infra/xdmin/member/memberForm";
	}
}
