package com.tasteZip.infra.modules.reservation;

import java.util.List;

import com.tasteZip.infra.modules.member.Member;
import com.tasteZip.infra.modules.member.MemberVo;

public interface ReservationService {

	// list
	public List<Reservation> selectListMyRV(ReservationVo vo) throws Exception;
	
	int uelete(Reservation dto) throws Exception; 
	int delete(ReservationVo vo) throws Exception;
	
	// xdmin list
	public List<Reservation> selectList(ReservationVo vo) throws Exception;

	// selectOne
	public Reservation selectOneMyRV(ReservationVo vo) throws Exception;

	public Reservation selectOne(ReservationVo vo) throws Exception;
	
	// selectone Count
	public int selectOneCount(ReservationVo vo) throws Exception;
	
	//uele list
	public int ueleteList(String ifrvSeq) throws Exception;
	
	// 주문
	public int insertRV(Reservation dto) throws Exception;
	// 주문 selectOne
	public Reservation selectRV(ReservationVo vo) throws Exception;
}
