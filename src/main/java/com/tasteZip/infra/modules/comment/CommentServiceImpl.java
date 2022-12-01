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
	public List<Comment> storeComment(CommentVo vo) throws Exception {
		return dao.storeComment(vo);
	}
	@Override
	public int selectOneCount(CommentVo vo) throws Exception {
		return dao.selectOneCount(vo);
	}

	
	// ----------------------------    
	@Override
	public List<Comment> selectList2(CommentVo vo) throws Exception {
		return dao.selectList2(vo);
	}
	@Override
	public int selectOneCount2(CommentVo vo) throws Exception {
		return dao.selectOneCount2(vo);
	}
	@Override
	public Comment selectOne(CommentVo vo) throws Exception {
		return dao.selectOne(vo);
	}
	@Override
	public int regComment(Comment dto) throws Exception {
		return dao.regComment(dto);
	}
	@Override
	public int update(Comment dto) throws Exception {
		return dao.update(dto);
	}
	@Override
	public int uelete(Comment dto) throws Exception {
		return dao.uelete(dto);
	}
	@Override
	public int ueleteMypage(Comment dto) throws Exception {
		return dao.ueleteMypage(dto);
	}
	@Override
	public int delete(CommentVo vo) throws Exception {
		return dao.delete(vo);
	}
	
	// 스토어 이미지 & 정보
	
	@Override
	public List<Comment> selectImg(CommentVo vo) throws Exception {
		return dao.selectImg(vo);
	}
	@Override
	public Comment xdminSelectOne(CommentVo vo) throws Exception {
		return dao.xdminSelectOne(vo);
	}
	
}

