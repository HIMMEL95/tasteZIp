package com.tasteZip.infra.modules.reservation;

import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping(value = "/reservation/") 
public class ReservationController {
	
	@Autowired
	ReservationServiceImpl service;
	
	// search and paging
	public void setSearchAndPaging(ReservationVo vo) throws Exception{
		vo.setParamsPaging(service.selectOneCount(vo));
		vo.setShDelNy(vo.getShDelNy() == null ? 0 : vo.getShDelNy());
		vo.setShOption(vo.getShOption() == null ? 0: vo.getShOption());
	}
	
//	@RequestMapping(value = "reservationList")
//	public String reservationList(@ModelAttribute("vo") ReservationVo vo, Model model) throws Exception {
//		
//		setSearchAndPaging(vo);
//		
//		if (vo.getTotalRows() > 0) {
//			List<Reservation> list = service.selectList(vo);
//			model.addAttribute("list", list);
//		}
//		
//	    return "infra/xdmin/reservation/reservationList";
//	}
	
	// ------------- 관리자 ---------------
	
	 public void setSearch(ReservationVo vo) throws Exception {
	        vo.setShDelNy(vo.getShDelNy() == null ? 0 : vo.getShDelNy());
	        vo.setShOption(vo.getShOption() == null ? 0 : vo.getShOption());
		 }
	 
	 @RequestMapping("excelDownload")
	   public void excelDownload(ReservationVo vo, HttpServletResponse httpServletResponse) throws Exception {
	       
	       setSearch(vo);
	       vo.setParamsPaging(service.selectOneCount(vo));

	       if (vo.getTotalRows() > 0) {
	           List<Reservation> list = service.selectList(vo);
	           
//	           Workbook workbook = new HSSFWorkbook(); // for xls
	           Workbook workbook = new XSSFWorkbook();
	           Sheet sheet = workbook.createSheet("Sheet1");
	           CellStyle cellStyle = workbook.createCellStyle();        
	           Row row = null;
	           Cell cell = null;
	           int rowNum = 0;
	           
//	           each column width setting           
	           sheet.setColumnWidth(0, 2100);
	           sheet.setColumnWidth(1, 3100);

//	           Header
	           String[] tableHeader = {"Seq", "가게이름", "메뉴이름", "예약수량", "주문자", "전화번호", "예약인원", "예약금액", "예약일", "예약시간"};

	           row = sheet.createRow(rowNum++);
	           
	           for(int i=0; i<tableHeader.length; i++) {
	               cell = row.createCell(i);
	               cellStyle.setAlignment(HorizontalAlignment.CENTER);
	               cell.setCellStyle(cellStyle);
	               cell.setCellValue(tableHeader[i]);
	           }

//	           Body
	           for (int i=0; i<list.size(); i++) {
	               row = sheet.createRow(rowNum++);
	               
//	               String type: null 전달 되어도 ok
//	               int, date type: null 시 오류 발생 하므로 null check
//	               String type 이지만 정수형 데이터가 전체인 seq 의 경우 캐스팅               
	               
	               cell = row.createCell(0);
	               cellStyle.setAlignment(HorizontalAlignment.CENTER);
	               cell.setCellStyle(cellStyle);
	               cell.setCellValue(Integer.parseInt(list.get(i).getIfrvSeq()));

	               cell = row.createCell(1);
	               cellStyle.setAlignment(HorizontalAlignment.CENTER);
	               cell.setCellStyle(cellStyle);
	               cell.setCellValue(list.get(i).getIfstName());
	               
	               cell = row.createCell(2);
	               cellStyle.setAlignment(HorizontalAlignment.CENTER);
	               cell.setCellStyle(cellStyle);
	               cell.setCellValue(list.get(i).getIfmnName());

	               cell = row.createCell(3);
	               cellStyle.setAlignment(HorizontalAlignment.CENTER);
	               cell.setCellStyle(cellStyle);
	               cell.setCellValue(list.get(i).getIfrvCount());

	               cell = row.createCell(4);
	               cellStyle.setAlignment(HorizontalAlignment.CENTER);
	               cell.setCellStyle(cellStyle);
	               cell.setCellValue(list.get(i).getIfmmName());

	               cell = row.createCell(5);
	               cellStyle.setAlignment(HorizontalAlignment.CENTER);
	               cell.setCellStyle(cellStyle);
	               cell.setCellValue(list.get(i).getIfmmPhone());

	               cell = row.createCell(6);
	               cellStyle.setAlignment(HorizontalAlignment.CENTER);
	               cell.setCellStyle(cellStyle);
	               cell.setCellValue(list.get(i).getIfrvPerson());

	               cell = row.createCell(7);
	               cellStyle.setAlignment(HorizontalAlignment.CENTER);
	               cell.setCellStyle(cellStyle);
	               cell.setCellValue(list.get(i).getIfrvPrice());

	               cell = row.createCell(8);
	               cellStyle.setAlignment(HorizontalAlignment.CENTER);
	               cell.setCellStyle(cellStyle);
	               cell.setCellValue(list.get(i).getIfrvDate());
	               
	               cell = row.createCell(9);
	               cellStyle.setAlignment(HorizontalAlignment.CENTER);
	               cell.setCellStyle(cellStyle);
	               cell.setCellValue(list.get(i).getIfrvTime());
	               
	           }

	           httpServletResponse.setContentType("ms-vnd/excel");
//	           httpServletResponse.setHeader("Content-Disposition", "attachment;filename=example.xls");    // for xls
	           httpServletResponse.setHeader("Content-Disposition", "attachment;filename=member.xlsx");

	           workbook.write(httpServletResponse.getOutputStream());
	           workbook.close();
	       }
	   }
	
	@RequestMapping(value = "xdminReservationList")
	public String xdminReservationList(@ModelAttribute("vo") ReservationVo vo, Model model) throws Exception {
		
		setSearch(vo);
		return "infra/xdmin/reservation/xdminReservationList";
	}
	
	@RequestMapping(value = "xdminReservationLita")
	public String xdminReservationLita(@ModelAttribute("vo") ReservationVo vo, Model model) throws Exception {
		
		vo.setParamsPaging(service.selectOneCount(vo));
		
		if (vo.getTotalRows() > 0) {
			List<Reservation> list = service.selectList(vo);
			model.addAttribute("list", list);
		}
		return "infra/xdmin/reservation/xdminReservationLita";
	}
	
	@RequestMapping(value = "xdminReservationForm")
 	public String xdminReservationForm(@ModelAttribute("vo") ReservationVo vo, Model model) throws Exception {
 		
		Reservation item = service.selectOne(vo);
 		model.addAttribute("item", item);
 		
		return "infra/xdmin/reservation/xdminReservationForm";
 		
 	}
	
	// ------------------------ 삭제 s ------------------------
	
	@RequestMapping(value = "reservationMultiUele")
	public String reservationMultiUele(ReservationVo vo, Reservation dto, RedirectAttributes redirectAttributes) throws Exception {
		for (String checkboxSeq : vo.getCheckboxSeqArray()) {
			dto.setIfrvSeq(checkboxSeq);
			service.uelete(dto);
		}
		redirectAttributes.addFlashAttribute("vo", vo);
		return "redirect:/reservation/xdminReservationList";
	}

	@RequestMapping(value = "reservationMultiDele")
	public String reservationMultiDele(ReservationVo vo, Reservation dto, RedirectAttributes redirectAttributes) throws Exception {
		for (String checkboxSeq : vo.getCheckboxSeqArray()) {
			vo.setIfrvSeq(checkboxSeq);
			service.delete(vo);
		}
		redirectAttributes.addFlashAttribute("vo", vo);
		return "redirect:/reservation/xdminReservationList";
	}
	
	@RequestMapping(value = "memberUele")
	public String memberUele(ReservationVo vo, Reservation dto, RedirectAttributes redirectAttributes) throws Exception {

		service.uelete(dto);
		redirectAttributes.addFlashAttribute("vo", vo);

		return "redirect:/reservation/xdminReservationList";
	}
	
	@RequestMapping(value = "memberDele")
	public String memberDele(ReservationVo vo, RedirectAttributes redirectAttributes) throws Exception {

		service.delete(vo);
		redirectAttributes.addFlashAttribute("vo", vo);

		return "redirect:/reservation/xdminReservationList";
	}
	
	 // ------------------------ 삭제 e ------------------------
	
	
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
    public String mypageReservation(@ModelAttribute("vo") ReservationVo vo, Model model, HttpSession httpSession) throws Exception {
	   
	   String seq = httpSession.getAttribute("sessSeq").toString();
	   vo.setIfmmSeq(seq);
	   
	   List<Reservation> list = service.selectListMyRV(vo);
	   model.addAttribute("list", list); 
	   
        return "infra/main/mypage/mypageReservation"; 
    }
    
    @RequestMapping(value = "mypageReservationView")
    public String mypageReservationView(@ModelAttribute("vo") ReservationVo vo, Reservation dto, Model model, HttpSession httpSession) throws Exception {
    	
    	vo.setIfrvSeq(dto.getIfrvSeq());

    	String seq = httpSession.getAttribute("sessSeq").toString();
		vo.setIfmmSeq(seq);
		
    	Reservation item = service.selectOneMyRV(vo);
    	model.addAttribute("item", item);
    	
        return "infra/main/mypage/mypageReservationView";
    }
    
    // 주문
    @RequestMapping(value = "RVInst")
    public String RVInst(@ModelAttribute("vo")ReservationVo vo, Reservation dto, Model model, HttpSession httpSession) throws Exception {
    	
    	service.insertRV(dto);
    	
    	vo.setIfrvSeq(dto.getIfrvSeq());
    	
    	String seq = httpSession.getAttribute("sessSeq").toString();
		vo.setIfmmSeq(seq);
		
    	Reservation itemRV = service.selectRV(vo);
    	model.addAttribute("itemRV", itemRV);
    	
        return "infra/main/reservation/reservationView";
    }
    
 // 주문
    @RequestMapping(value = "RVForm")
    public String RVForm(@ModelAttribute("vo")ReservationVo vo, Reservation dto, Model model, HttpSession httpSession) throws Exception {
    	
    	vo.setIfrvSeq(dto.getIfrvSeq());
    	
    	String seq = httpSession.getAttribute("sessSeq").toString();
		vo.setIfmmSeq(seq);
		
    	Reservation itemRV = service.selectRV(vo);
    	model.addAttribute("itemRV", itemRV);
    	
        return "infra/main/reservation/reservation";
    }
}
