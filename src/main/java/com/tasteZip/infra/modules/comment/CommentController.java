package com.tasteZip.infra.modules.comment;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/comment/")
public class CommentController {
	
	@Autowired
	CommentServiceImpl service;
	
	@RequestMapping(value = "commentList")
	public String reviewList() throws Exception {
	    return "infra/xdmin/comment/commentList";
	}
	
	// 리뷰
    @RequestMapping(value = "mypageReview")
    public String mypageReview(@ModelAttribute("vo") CommentVo vo, Model model) throws Exception {
    	
    	System.out.println("sdsdf");
    	vo.setParamsPaging(service.selectOneCount(vo));
    	System.out.println("123123");
    	
		List<Comment> list = service.myReview(vo);
		model.addAttribute("list", list); 
    	
        return "infra/main/mypage/mypageReview";
    }
    
}
