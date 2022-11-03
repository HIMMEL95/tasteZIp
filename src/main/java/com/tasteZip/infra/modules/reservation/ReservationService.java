package com.tasteZip.infra.modules.reservation;

import java.util.List;

public interface ReservationService {
	
	public List<Reservation> mypageReservationList(ReservationVo vo) throws Exception;

}
