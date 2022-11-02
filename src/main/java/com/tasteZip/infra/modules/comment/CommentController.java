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
	
	
	  private void setSearchAndPaging(CommentVo vo) throws Exception {
		  vo.setIfcmDelNy(vo.getIfcmDelNy() == null ? 0: vo.getIfcmDelNy());
		  vo.setParamsPaging(service.selectOneCount(vo)); 
	  }
	 
	
	@RequestMapping(value = "commentList")
	public String reviewList() throws Exception {
	    return "infra/xdmin/comment/commentList";
	}
	
	// 리뷰
    @RequestMapping(value = "mypageReview")
    public String mypageReview(@ModelAttribute("vo") CommentVo vo, Model model) throws Exception {
    	
		setSearchAndPaging(vo);
		
		List<Comment> list = service.myReview(vo);
		model.addAttribute("list", list); 
    	
        return "infra/main/mypage/mypageReview";
    }
    
}
