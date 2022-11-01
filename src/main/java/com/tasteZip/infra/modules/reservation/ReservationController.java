package com.tasteZip.infra.modules.reservation;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/reservation/")
public class ReservationController {
	
	@RequestMapping(value = "reservationList")
	public String storeList() throws Exception {
	    return "infra/xdmin/reservation/reservationList";
	}
	
   @RequestMapping(value = "mypageReservation")
    public String mypageReservation() throws Exception {
        return "infra/main/mypage/mypageReservation";
    }
    
    @RequestMapping(value = "mypageReservationView")
    public String mypageReservationView() throws Exception {
        return "infra/main/mypage/mypageReservationView";
    }
}
