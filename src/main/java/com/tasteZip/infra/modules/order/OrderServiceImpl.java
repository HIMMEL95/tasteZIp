package com.tasteZip.infra.modules.order;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OrderServiceImpl implements OrderService{
	
	@Autowired
	OrderDao dao;

	@Override
	public List<Order> myOrder(OrderVo vo) throws Exception {
		List<Order> list = dao.myOrder(vo);
		return list;
	}
	
	// xdmin selectList
	@Override
	public List<Order> selectList(OrderVo vo) throws Exception {
		List<Order> list = dao.selectList(vo);
		return list;
	}
	
	//selectOne count
	@Override
	public int selectOneCount(OrderVo vo) throws Exception {
		return dao.selectOneCount(vo);
	}
	
	
	// selectOne
	@Override
	public Order selectOne(OrderVo vo) throws Exception {
		return dao.selectOne(vo);
	}
	
	// uelete List
	@Override
	public int ueleteList(String iforSeq) throws Exception {
		return dao.ueleteList(iforSeq);
	}

}
