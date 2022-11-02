package com.tasteZip.infra.modules.comment;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CommentServiceImpl implements CommentService{
	
	@Autowired
	CommentDao dao;

	@Override
	public List<Comment> myReview(CommentVo vo) throws Exception {
		List<Comment> list = dao.myReview(vo);
		return list;
	}

	@Override
	public int selectOneCount(CommentVo vo) throws Exception {
		return dao.selectOneCount(vo);
	}
	

	
	
	
}

