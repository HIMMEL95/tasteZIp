package com.tasteZip.infra.modules.comment;

import java.util.List;

public interface CommentService {
	
	public List<Comment> myReview(CommentVo vo) throws Exception;
	
	public int selectOneCount(CommentVo vo) throws Exception;
	
}
