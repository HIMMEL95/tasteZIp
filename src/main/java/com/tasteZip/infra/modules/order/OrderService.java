package com.tasteZip.infra.modules.order;

import java.util.List;

public interface OrderService {
	
	public List<Order> myOrder(OrderVo vo) throws Exception;
	public int selectOneCount(OrderVo vo) throws Exception;
	
	public Order selectOne(OrderVo vo) throws Exception;

}

