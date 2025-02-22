package com.tasteZip.infra.modules.store;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.tasteZip.infra.common.util.UtilDateTime;
import com.tasteZip.infra.modules.findWay.FindWay;
import com.tasteZip.infra.modules.findWay.FindWayServiceImpl;
import com.tasteZip.infra.modules.findWay.FindWayVo;

@Controller
@RequestMapping(value = "/store/")
public class StoreController {
	
	@Autowired
	StoreServiceImpl service;
	FindWayServiceImpl fService;
	
	public void setSearchAndPaging(StoreVo vo) throws Exception {
	    vo.setShDelNy(vo.getShDelNy() == null ? 0 : vo.getShDelNy());
	}

//	// main
//	@RequestMapping(value = "storeList")
//	public String storeList(StoreVo vo, Model model) throws Exception {
//	    
//	    vo.setParamsPaging(service.selectOneCount(vo));
//	    System.out.println("rowNumto : " + vo.getRowNumToShow());
//	    
//	    List<Store> list = service.selectList(vo);
//	    model.addAttribute("list", list);
//	    
//	    return "infra/main/store/storeList";
//	}
//	
	
	@RequestMapping(value = "storeMain")
	public String storeMain(@ModelAttribute("vo") StoreVo vo, Store dto, FindWay fdto, Model model, HttpSession httpSession) throws Exception {
		
		try {
			String seq = (String) httpSession.getAttribute("sessSeq");
			vo.setIfmmSeq(seq);
		} catch (Exception e) {
		}
		
		vo.setParamsPaging(service.selectOneCount(vo));
		
		Store item = service.storeSelectOne(vo);
	    model.addAttribute("item", item);
	    	
//	    List<FindWay> List = fService.selectList(fdto);
//	    model.addAttribute("List", List);
	    
	    List<Store> menu = service.menuList(vo);
	    model.addAttribute("menu", menu); 
	    
	    List<Store> img = service.selectImg(vo);
	    model.addAttribute("img", img);
	    
	    return "infra/main/store/storeMain";
	}
	
	@RequestMapping(value = "StoreForm")
	public String storeForm(@ModelAttribute("vo") StoreVo vo, Store dto, Model model) throws Exception {
	    
	    return "infra/xdmin/store/storeForm";
	}
	
	@RequestMapping(value = "storeInst")
	public String storeInst(Store dto, StoreVo vo, RedirectAttributes redirectAttributes) throws Exception {
	    
		service.insert(dto);
		service.insertUploaded(dto);
	    
	    vo.setIfstSeq(dto.getIfstSeq());
	    redirectAttributes.addFlashAttribute("vo", vo);
	    return "redirect:/store/ownerStoreForm";
	}

	@RequestMapping(value = "storeUpdt")
	public String storeUpdt(Store dto, StoreVo vo, RedirectAttributes redirectAttributes) throws Exception {
	    service.update(dto);
	    
	    vo.setIfstSeq(dto.getIfstSeq());
	    System.out.println("seq : " +  vo.getIfstSeq());
	    System.out.println("seq : " +  dto.getIfstSeq());
	    redirectAttributes.addFlashAttribute("vo", vo);
	    return "redirect:/store/ownerStoreForm";
	}
	
	// favorite
	@ResponseBody
	@RequestMapping(value = "favoriteInst")
	public Map<String, Object> favoriteInst(Store dto, StoreVo vo, RedirectAttributes redirectAttributes) throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		service.insertFv(dto);
	    return returnMap;
	}

	@ResponseBody
	@RequestMapping(value = "favoriteDele")
	public Map<String, Object> favoriteDele(Store dto, StoreVo vo, RedirectAttributes redirectAttributes) throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		service.deleteFv(dto);
	    return returnMap;
	}
	
	@ResponseBody
	@RequestMapping(value = "favoriteListDele")
	public Map<String, Object> favoriteListDele(Store dto, StoreVo vo, RedirectAttributes redirectAttributes) throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		service.deleteFv(dto);
    	
    	return returnMap;
	}
	
	
	
	
	@RequestMapping(value = "storeDele")
	public String storeDele(StoreVo vo) throws Exception {
	    service.delete(vo);
	    return "redirect:/store/xdminStoreList";
	}

	@RequestMapping(value = "storeUele")
	public String storeUele(Store dto) throws Exception {
	    service.uelete(dto);
	    return "redirect:/store/xdminStoreList";
	}
	
	//excel Download
	 public void setSearch(StoreVo vo) throws Exception {
        vo.setShDelNy(vo.getShDelNy() == null ? 0 : vo.getShDelNy());
        vo.setShOption(vo.getShOption() == null ? 0 : vo.getShOption());
        vo.setShDateStart(vo.getShDateStart() == null || vo.getShDateStart() == "" ? null : UtilDateTime.add00TimeString(vo.getShDateStart()));
		vo.setShDateEnd(vo.getShDateEnd() == null || vo.getShDateEnd() == "" ? null : UtilDateTime.add59TimeString(vo.getShDateEnd()));
	 }
	
	@RequestMapping("excelDownload")
    public void excelDownload(StoreVo vo, HttpServletResponse httpServletResponse) throws Exception {
        
        setSearch(vo);
        vo.setParamsPaging(service.selectOneCount(vo));

        if (vo.getTotalRows() > 0) {
            List<Store> list = service.xdminSelectList(vo);
            
//            Workbook workbook = new HSSFWorkbook(); // for xls
            Workbook workbook = new XSSFWorkbook();
            Sheet sheet = workbook.createSheet("Sheet1");
            CellStyle cellStyle = workbook.createCellStyle();        
            Row row = null;
            Cell cell = null;
            int rowNum = 0;
            
//            each column width setting           
            sheet.setColumnWidth(0, 2100);
            sheet.setColumnWidth(1, 3100);

//            Header
            String[] tableHeader = {"Seq", "이름", "전화번호", "우편번호", "주소", "상세주소", "추가주소", "정보", "길안내", "주문여부", "삭제여부", "등록일", "수정일"};

            row = sheet.createRow(rowNum++);
            
            for(int i=0; i<tableHeader.length; i++) {
                cell = row.createCell(i);
                cellStyle.setAlignment(HorizontalAlignment.CENTER);
                cell.setCellStyle(cellStyle);
                cell.setCellValue(tableHeader[i]);
            }

//            Body
            for (int i=0; i<list.size(); i++) {
                row = sheet.createRow(rowNum++);
                
//                String type: null 전달 되어도 ok
//                int, date type: null 시 오류 발생 하므로 null check
//                String type 이지만 정수형 데이터가 전체인 seq 의 경우 캐스팅               
                
                cell = row.createCell(0);
                cellStyle.setAlignment(HorizontalAlignment.CENTER);
                cell.setCellStyle(cellStyle);
                cell.setCellValue(Integer.parseInt(list.get(i).getIfstSeq()));

                cell = row.createCell(1);
                cellStyle.setAlignment(HorizontalAlignment.CENTER);
                cell.setCellStyle(cellStyle);
                cell.setCellValue(list.get(i).getIfstName());
                
                cell = row.createCell(2);
                cellStyle.setAlignment(HorizontalAlignment.CENTER);
                cell.setCellStyle(cellStyle);
                cell.setCellValue(list.get(i).getIfstPhone());

                cell = row.createCell(3);
                cellStyle.setAlignment(HorizontalAlignment.CENTER);
                cell.setCellStyle(cellStyle);
                cell.setCellValue(list.get(i).getIfstAddress());

                cell = row.createCell(4);
                cellStyle.setAlignment(HorizontalAlignment.CENTER);
                cell.setCellStyle(cellStyle);
                cell.setCellValue(list.get(i).getIfstInfo());

                cell = row.createCell(5);
                cellStyle.setAlignment(HorizontalAlignment.CENTER);
                cell.setCellStyle(cellStyle);
                cell.setCellValue(list.get(i).getIfstDirections());

                cell = row.createCell(6);
                cellStyle.setAlignment(HorizontalAlignment.CENTER);
                cell.setCellStyle(cellStyle);
                cell.setCellValue(list.get(i).getIfstOrderNy());

                cell = row.createCell(7);
                cellStyle.setAlignment(HorizontalAlignment.CENTER);
                cell.setCellStyle(cellStyle);
                cell.setCellValue(list.get(i).getIfstDelNy());

                cell = row.createCell(8);
                cellStyle.setAlignment(HorizontalAlignment.CENTER);
                cell.setCellStyle(cellStyle);
                cell.setCellValue(list.get(i).getIfstCreatedAt());
            }

            httpServletResponse.setContentType("ms-vnd/excel");
//            httpServletResponse.setHeader("Content-Disposition", "attachment;filename=example.xls");    // for xls
            httpServletResponse.setHeader("Content-Disposition", "attachment;filename=store.xlsx");

            workbook.write(httpServletResponse.getOutputStream());
            workbook.close();
        }
    }

// ------------------------ 관리자 ------------------------

	@RequestMapping(value = "xdminStoreList")
	public String xdminStoreList(@ModelAttribute("vo") StoreVo vo, Model model) throws Exception {
		
		 setSearch(vo);
		return "infra/xdmin/store/xdminStoreList";
	}
	
	@RequestMapping(value = "xdminStoreLita")
	public String xdminStoreLita(@ModelAttribute("vo") StoreVo vo, Model model) throws Exception {
		
		vo.setParamsPaging(service.xdminSelectOneCount(vo));
		
		  if (vo.getTotalRows() > 0) { 
			  List<Store> list = service.xdminSelectList(vo);
			  model.addAttribute("list", list); 
		  }
		
		return "infra/xdmin/store/xdminStoreLita";
	}
	
	@RequestMapping(value = "xdminStoreForm") 
	public String xdminStoreForm(@ModelAttribute("vo") StoreVo vo, Store dto, Model model) throws Exception {
		
		Store item = service.xdminSelectOne(vo);
	    model.addAttribute("item", item);
	   
	    List<Store> running = service.openingList(vo);
	    model.addAttribute("running", running);
	    
	    List<Store> day = service.day(dto);
	    model.addAttribute("day", day);

	    List<Store> opening = service.opening(dto);
	    model.addAttribute("opening", opening);
		
	    return "infra/xdmin/store/xdminStoreForm";
	}
	
// ------------------------ 삭제 s ------------------------
	
		@RequestMapping(value = "storeMultiUele")
		public String storeMultiUele(StoreVo vo, Store dto, RedirectAttributes redirectAttributes) throws Exception {
			for (String checkboxSeq : vo.getCheckboxSeqArray()) {
				dto.setIfstSeq(checkboxSeq);
				service.uelete(dto);
			}
			redirectAttributes.addFlashAttribute("vo", vo);
			return "redirect:/store/xdminStoreList";
		}

		@RequestMapping(value = "storeMultiDele")
		public String storeMultiDele(StoreVo vo, Store dto, RedirectAttributes redirectAttributes) throws Exception {
			for (String checkboxSeq : vo.getCheckboxSeqArray()) {
				vo.setIfstSeq(checkboxSeq);
				service.delete(vo);
			}
			redirectAttributes.addFlashAttribute("vo", vo);
			return "redirect:/store/xdminStoreList";
		}
		
		@RequestMapping(value = "memberUele")
		public String memberUele(StoreVo vo, Store dto, RedirectAttributes redirectAttributes) throws Exception {

			service.uelete(dto);
			redirectAttributes.addFlashAttribute("vo", vo);

			return "redirect:/store/xdminStore";
		}
		
		@RequestMapping(value = "memberDele")
		public String memberDele(StoreVo vo, RedirectAttributes redirectAttributes) throws Exception {

			service.delete(vo);
			redirectAttributes.addFlashAttribute("vo", vo);

			return "redirect:/store/xdminStoreList";
		}
		
 // ------------------------ 삭제 e ------------------------
		
	
// ------------------------ 사장님 ------------------------

	@RequestMapping(value = "ownerStoreList")
	public String ownerStoreList(@ModelAttribute("vo") StoreVo vo, Model model) throws Exception {
		
		 setSearch(vo);
		return "infra/xdmin/store/ownerStoreList";
	}

	@RequestMapping(value = "ownerStoreLita")
	public String ownerStoreLita(@ModelAttribute("vo") StoreVo vo, Model model) throws Exception {
		
		vo.setParamsPaging(service.xdminSelectOneCount(vo));
		
		if (vo.getTotalRows() > 0) { 
			List<Store> list = service.xdminSelectList(vo);
			model.addAttribute("list", list); 
		}
		
		return "infra/xdmin/store/ownerStoreLita";
	}
	
	@RequestMapping(value = "ownerStoreForm") 
	public String ownerStoreForm(@ModelAttribute("vo") StoreVo vo, Store dto, Model model) throws Exception {
		
		Store item = service.xdminSelectOne(vo);
		model.addAttribute("item", item);
		
		List<Store> running = service.openingList(vo);
		model.addAttribute("running", running);
		
		List<Store> day = service.day(dto);
		model.addAttribute("day", day);
		
		List<Store> opening = service.opening(dto);
		model.addAttribute("opening", opening);
		
		List<Store> img = service.selectImg(vo);
	    model.addAttribute("img", img);
	    
		return "infra/xdmin/store/ownerStoreForm";
	}
	
// ------------------------ 삭제 s ------------------------
	
			@RequestMapping(value = "ownerStoreMultiUele")
			public String ownerStoreMultiUele(StoreVo vo, Store dto, RedirectAttributes redirectAttributes) throws Exception {
				for (String checkboxSeq : vo.getCheckboxSeqArray()) {
					dto.setIfstSeq(checkboxSeq);
					service.uelete(dto);
				}
				redirectAttributes.addFlashAttribute("vo", vo);
				return "redirect:/store/ownerStoreList";
			}

			@RequestMapping(value = "ownerStoreMultiDele")
			public String ownerStoreMultiDele(StoreVo vo, Store dto, RedirectAttributes redirectAttributes) throws Exception {
				for (String checkboxSeq : vo.getCheckboxSeqArray()) {
					vo.setIfstSeq(checkboxSeq);
					service.delete(vo);
				}
				redirectAttributes.addFlashAttribute("vo", vo);
				return "redirect:/store/ownerStoreList";
			}
			
 // ------------------------ 삭제 e ------------------------
}

