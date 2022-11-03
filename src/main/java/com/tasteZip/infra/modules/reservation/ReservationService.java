package com.tasteZip.infra.modules.reservation;

import java.util.List;

public interface ReservationService {

	// list
	public List<Reservation> selectListMyRV(ReservationVo vo) throws Exception;

	
	// selectOne
	public Reservation selectOneMyRV(ReservationVo vo) throws Exception;
}
