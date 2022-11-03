package com.tasteZip.infra.modules.comment;

import java.util.List;
import javax.annotation.Resource;
import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class CommentDao {
	
	@Inject
	@Resource(name = "sqlSession")
	private SqlSession sqlSession;
	
	private static String namespace = "com.tasteZip.infra.modules.comment.CommentMapper";
	
	public List<Comment> myReview(CommentVo vo){ 
		return sqlSession.selectList(namespace + ".myReview", vo);
	}
	
	public int selectOneCount(CommentVo vo) {
		return sqlSession.selectOne(namespace + ".selectOneCount", vo);
	}
	
}
