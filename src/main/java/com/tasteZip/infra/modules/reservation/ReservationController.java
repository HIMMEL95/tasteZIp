package com.tasteZip.infra.modules.reservation;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/reservation/")
public class ReservationController {
	
	@RequestMapping(value = "reservationList")
	public String storeList() throws Exception {
	    return "infra/owner/reservation/reservationList";
	}
}
