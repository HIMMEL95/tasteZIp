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
	public int myOrderCount(OrderVo vo) throws Exception;
	
	//selectone
	public List<Order> myPageViewMenu(OrderVo vo) throws Exception;
	public Order selectOne(OrderVo vo) throws Exception;
	
	//uele list
	public int ueleteList(String iforSeq) throws Exception;
	
	public int insertBuy(Order dto) throws Exception;
	public int insertOrder(Order dto) throws Exception;
	
	public Order payFin(OrderVo vo) throws Exception;

}

