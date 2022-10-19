package com.tasteZip.infra.modules.comment;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/comment/")
public class CommentController {
	
	@RequestMapping(value = "commentList")
	public String reviewList() throws Exception {
	    return "infra/xdmin/comment/commentList";
	}
	

}
