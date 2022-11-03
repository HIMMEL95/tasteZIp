package com.tasteZip.infra.modules.reservation;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReservationServiceImpl implements ReservationService{
	
	@Autowired
	ReservationDao dao;
	
	@Override
	public List<Reservation> mypageReservationList(ReservationVo vo) throws Exception {
		return dao.mypageReservationList(vo);
	}
}
