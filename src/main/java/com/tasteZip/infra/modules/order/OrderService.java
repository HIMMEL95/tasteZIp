package com.tasteZip.infra.modules.order;

import java.util.List;

public interface OrderService {
	
	// myorder list
	public List<Order> myOrder(OrderVo vo) throws Exception;
	
	public List<Order> selectList(OrderVo vo) throws Exception;
	
	// xdmin list
	public List<Order> xdminSelectList(OrderVo vo) throws Exception;
	public int xdminSelectOneCount(OrderVo vo) throws Exception;
	int uelete(Order dto) throws Exception; 
	int delete(OrderVo vo) throws Exception;
	
	// selectone Count
	public int selectOneCount(OrderVo vo) throws Exception;
	
	//selectone
	public Order selectOne(OrderVo vo) throws Exception;
	
	//uele list
	public int ueleteList(String iforSeq) throws Exception;
	
	public int insertOrder(Order dto) throws Exception;

}

