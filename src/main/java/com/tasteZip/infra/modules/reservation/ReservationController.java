package com.tasteZip.infra.modules.reservation;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/reservation/") 
public class ReservationController {
	
	@Autowired
	ReservationServiceImpl service;
	
	// search and paging
	public void setSearchAndPaging(ReservationVo vo) throws Exception{
		vo.setParamsPaging(service.selectOneCount(vo));
	}
	
	@RequestMapping(value = "reservationList")
	public String reservationList(@ModelAttribute("vo") ReservationVo vo, Model model) throws Exception {
		
		setSearchAndPaging(vo);
		
		if (vo.getTotalRows() > 0) {
			List<Reservation> list = service.selectList(vo);
			model.addAttribute("list", list);
		}
		
	    return "infra/xdmin/reservation/reservationList";
	}
	
	
	@RequestMapping(value = "ReservationUele")
	public String ReservationUele(@ModelAttribute("vo") ReservationVo vo, Model model) throws Exception {
		
		String returnString = "";
		
			
			for(ReservationVo vItem : vo.getSeqVoList()) {
				
				service.ueleteList(vItem.getIfrvSeq());
				
				setSearchAndPaging(vo);
				
				if(vo.getTotalRows() > 0) {
					List<Reservation> list = service.selectList(vo);
					model.addAttribute("list", list);
				}

				returnString = "infra/xdmin/reservation/reservationList";
			}
			
		
		return returnString;
	}
	
	
   @RequestMapping(value = "mypageReservation")
    public String mypageReservation(@ModelAttribute("vo") ReservationVo vo, Model model) throws Exception {
	   
	   List<Reservation> list = service.selectListMyRV(vo);
	   model.addAttribute("list", list); 
	   
        return "infra/main/mypage/mypageReservation"; 
    }
    
    @RequestMapping(value = "mypageReservationView")
    public String mypageReservationView(@ModelAttribute("vo") ReservationVo vo, Model model) throws Exception {
    	
    	Reservation item = service.selectOneMyRV(vo);
    	model.addAttribute("item", item);
    	
        return "infra/main/mypage/mypageReservationView";
    }
}
