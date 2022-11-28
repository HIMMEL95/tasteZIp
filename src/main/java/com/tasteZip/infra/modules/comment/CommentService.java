package com.tasteZip.infra.modules.comment;

import java.util.List;

public interface CommentService {
	
	public List<Comment> myReview(CommentVo vo) throws Exception;
	public List<Comment> storeComment(CommentVo vo) throws Exception;
	public int selectOneCount(CommentVo vo) throws Exception;
	
	
	// ------------------
	public List<Comment> selectList2(CommentVo vo) throws Exception;
    public int selectOneCount2(CommentVo vo) throws Exception;
    public Comment selectOne(CommentVo vo) throws Exception;
    
    public int regComment(Comment dto) throws Exception;
   	public int update(Comment dto) throws Exception;
   	public int uelete(Comment dto) throws Exception;
   	public int delete(CommentVo vo) throws Exception;
   	
   	// 스토어 이미지 & 정보
   	public List<Comment> selectImg(CommentVo vo) throws Exception;
    public Comment xdminSelectOne(CommentVo vo) throws Exception;
}
