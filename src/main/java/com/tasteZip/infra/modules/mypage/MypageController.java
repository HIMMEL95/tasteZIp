package com.tasteZip.infra.modules.mypage;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/mypage/")
public class MypageController {
	
	// 메인	
	@RequestMapping(value = "mypageMain")
	public String mypageMain() throws Exception {
	    return "infra/main/mypage/mypageMain";
	}

	@RequestMapping(value = "mypageBucket")
	public String mypageBucket() throws Exception {
		return "infra/main/mypage/mypageBucket";
	}

}
