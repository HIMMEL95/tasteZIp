package com.tasteZip.infra.modules.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/member/")
public class MemberController {

    @Autowired
    MemberServiceImpl service;
    
	@RequestMapping(value = "memberList")
	public String memberList(MemberVo vo, Model model) throws Exception {
	    
	    List<Member> list = service.selectList(vo);
	    model.addAttribute("list", list);
	    return "infra/xdmin/member/memberList";
	}
	
	@RequestMapping(value = "memberForm")
	public String memberForm() throws Exception {
	    return "infra/xdmin/member/memberForm";
	}
	
	@RequestMapping(value = "mypageMemberForm")
	public String mypageMemberForm() throws Exception {
	    return "infra/main/member/mypageMemberForm"; 
	}
}
