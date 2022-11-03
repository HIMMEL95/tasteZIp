package com.tasteZip.infra.modules.mypage;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping(value = "/mypage/")
public class MypageController {
	
	@Autowired
	MypageServiceImpl service;
	
	// 메인	
	@RequestMapping(value = "mypageMain")
	public String mypageMain() throws Exception {
	    return "infra/main/mypage/mypageMain";
	}

	@RequestMapping(value = "mypageBucket")
	public String mypageBucket(@ModelAttribute("vo") MypageVo vo, Model model) throws Exception {
		
		List<Mypage> list = service.bucketList(vo);
		model.addAttribute("list", list);
		
		return "infra/main/mypage/mypageBucket";
	}

}
