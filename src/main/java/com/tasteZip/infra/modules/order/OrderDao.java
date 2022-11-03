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
	
	public List<Order> myOrder(OrderVo vo){ 
		return sqlSession.selectList(namespace + ".myOrder", vo);
	}
	
	public int selectOneCount(OrderVo vo) {
		return sqlSession.selectOne(namespace + ".selectOneCount", vo);
	}
	
	public Order selectOne(OrderVo vo) {
		return sqlSession.selectOne(namespace + ".selectOne", vo);
	}

}
