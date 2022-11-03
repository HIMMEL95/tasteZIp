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
	
	// selectOne
	@Override
	public Reservation selectOneMyRV(ReservationVo vo) throws Exception{
		return dao.selectOneMyRV(vo);
	}
}
