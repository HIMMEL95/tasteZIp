package com.tasteZip.infra.modules.order;

import java.util.List;
import javax.annotation.Resource;
import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class OrderDao {
	
	@Inject
	@Resource(name = "sqlSession")
	private SqlSession sqlSession;
	
	private static String namespace = "com.tasteZip.infra.modules.order.OrderMapper";
	
	public int uelete(Order dto) { return sqlSession.update(namespace + ".uelete", dto); }
	public int delete(OrderVo vo) { return sqlSession.delete(namespace + ".delete", vo); }
	
	public List<Order> myOrder(OrderVo vo){ 
		return sqlSession.selectList(namespace + ".myOrder", vo);
	}
	
	public List<Order> selectList(OrderVo vo){ 
		return sqlSession.selectList(namespace + ".selectList", vo);
	}
	
	// xdmin list
	public List<Order> xdminSelectList(OrderVo vo){ 
		return sqlSession.selectList(namespace + ".xdminSelectList", vo);
	}
	
	public int xdminSelectOneCount(OrderVo vo) {
		return sqlSession.selectOne(namespace + ".xdminSelectOneCount", vo);
	}
	
	//selectone Count
	public int selectOneCount(OrderVo vo) {
		return sqlSession.selectOne(namespace + ".selectOneCount", vo);
	}
	
	//selectone
	public Order selectOne(OrderVo vo) {
		return sqlSession.selectOne(namespace + ".selectOne", vo);
	}

	//list uele
	public int ueleteList(String iforSeq) {
		return sqlSession.update(namespace + ".ueleteList", iforSeq);
	}
	
	public int insertOrder(Order dto) {
	    return sqlSession.insert(namespace + ".insertOrder", dto);
	}
	
}
