package com.tasteZip.infra.modules.mypage;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/mypage/")
public class MypageController {
	
		
	@RequestMapping(value = "mypageMain")
	public String mypageMain() throws Exception {
	    return "infra/main/mypage/mypageMain";
	}
	
	@RequestMapping(value = "mypageOrder")
	public String mypageOrder() throws Exception {
	    return "infra/main/mypage/mypageOrder";
	}
	
	@RequestMapping(value = "mypageReview")
	public String mypageReview() throws Exception {
	    return "infra/main/mypage/mypageReview";
	}
	
	@RequestMapping(value = "mypageStory")
	public String mypageStory() throws Exception {
	    return "infra/main/mypage/mypageStory";
	}
		

}
