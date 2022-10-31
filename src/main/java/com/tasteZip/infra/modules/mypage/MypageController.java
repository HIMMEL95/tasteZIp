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
	
	
	// 주문
	@RequestMapping(value = "mypageOrder")
	public String mypageOrder() throws Exception {
	    return "infra/main/mypage/mypageOrder";
	}
	
	@RequestMapping(value = "mypageOrderView")
	public String mypageOrderView() throws Exception {
	    return "infra/main/mypage/mypageOrderView";
	}
	
	
	// 리뷰
	@RequestMapping(value = "mypageReview")
	public String mypageReview() throws Exception {
	    return "infra/main/mypage/mypageReview";
	}
	
	
	// 스토리
	@RequestMapping(value = "mypageStory")
	public String mypageStory() throws Exception {
	    return "infra/main/mypage/mypageStory";
	}

	@RequestMapping(value = "mypageReservation")
	public String mypageReservation() throws Exception {
		return "infra/main/mypage/mypageReservation";
	}
	
	@RequestMapping(value = "mypageReservationView")
	public String mypageReservationView() throws Exception {
		return "infra/main/mypage/mypageReservationView";
	}
	
	@RequestMapping(value = "mypageBucket")
	public String mypageBucket() throws Exception {
		return "infra/main/mypage/mypageBucket";
	}
	
	
		

}
