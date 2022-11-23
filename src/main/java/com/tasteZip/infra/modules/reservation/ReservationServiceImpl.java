package com.tasteZip.infra.modules.reservation;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReservationServiceImpl implements ReservationService{
	
	@Autowired
	ReservationDao dao;
	
	
	// list
	@Override
	public List<Reservation> selectListMyRV(ReservationVo vo) throws Exception {
		return dao.selectListMyRV(vo);
	}
	
	// xdmin list
	@Override
	public List<Reservation> selectList(ReservationVo vo) throws Exception {
		return dao.selectList(vo);
	}
	
	// selectOne
	@Override
	public Reservation selectOneMyRV(ReservationVo vo) throws Exception{
		return dao.selectOneMyRV(vo);
	}
	
	
	@Override
	public Reservation selectOne(ReservationVo vo) throws Exception {
		return dao.selectOne(vo);
	}

	//selectOne count
	@Override
	public int selectOneCount(ReservationVo vo) throws Exception {
		return dao.selectOneCount(vo);
	}
	
	// uelete List
	@Override
	public int ueleteList(String ifrvSeq) throws Exception {
		return dao.ueleteList(ifrvSeq);
	}
	
	// 주문
	@Override
	public int insertRV(Reservation dto) throws Exception {
		return dao.insertRV(dto);
	}
	
	// 주문selectOne
	@Override
	public Reservation selectRV(ReservationVo vo) throws Exception{
		return dao.selectRV(vo);
	}

}
