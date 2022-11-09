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
	
	
	// 리뷰
    @RequestMapping(value = "mypageReview")
    public String mypageReview(@ModelAttribute("vo") CommentVo vo, Model model) throws Exception {
    	
    	vo.setParamsPaging2(service.selectOneCount(vo));
    	
		List<Comment> list = service.myReview(vo);
		model.addAttribute("list", list); 
    	
        return "infra/main/mypage/mypageReview";
    }
    
 // --------------- 관리자 --------------
    
    @RequestMapping(value = "commentList")
    public String commentList(@ModelAttribute("vo") CommentVo vo, Model model) throws Exception {
    	
    	vo.setParamsPaging2(service.selectOneCount2(vo)); 

		List<Comment> list = service.selectList2(vo);
		model.addAttribute("list", list); 
    	
    	return "infra/xdmin/comment/commentList";
    }
    
    
    
}
