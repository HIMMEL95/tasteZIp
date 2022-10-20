package com.tasteZip.infra.modules;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MainController {

	@RequestMapping(value = "tasteMain")
	public String tasteMain() throws Exception {
		return "infra/main/user/taste_main";
	}
	
	@RequestMapping(value = "login")
	public String login() throws Exception {
		return "infra/main/user/login";
	}
	
	@RequestMapping(value = "signUp")
	public String signUp() throws Exception {
		return "infra/main/user/signUp";
	}
	
	@RequestMapping(value = "order")
	public String order() throws Exception {
	    return "infra/main/order/order";
	}
	
	@RequestMapping(value = "chat")
	public String chat() throws Exception {
	    return "infra/main/chat/chat";
	}
	
	@RequestMapping(value = "chatRoom")
	public String chatRoom() throws Exception {
	    return "infra/main/chat/chatRoom";
	}
	
	@RequestMapping(value = "comment")
	public String comment() throws Exception {
	    return "infra/main/comment/comment";
	}
	
	@RequestMapping(value = "story")
	public String story() throws Exception {
	    return "infra/main/story/story";
	}
	
	@RequestMapping(value = "favorite") 
	public String favorite() throws Exception {
	    return "infra/main/favorite/favorite";
	}
	
	@RequestMapping(value = "reservation") 
    public String reservation() throws Exception {
        return "infra/main/reservation/reservation";
    }
	
	@RequestMapping(value = "findWay") 
	public String findWay() throws Exception {
		return "infra/main/findWay/findWay";
	}
	
	@ResponseBody
	@RequestMapping(value = "test")
	public Map<String, Object> test() throws Exception{
	    Map<String, Object> returnMap = new HashMap<String, Object>();
	    
	    returnMap.put("rt", "success");
	    
	    return returnMap;
	}
	
	
}
