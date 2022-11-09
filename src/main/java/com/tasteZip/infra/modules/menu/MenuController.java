package com.tasteZip.infra.modules.menu;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

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

import com.tasteZip.infra.common.util.UtilDateTime;

@Controller
@RequestMapping(value = "/menu/")
public class MenuController {
	
	@Autowired
	MenuServiceImpl service;
	
	private void setSearch(MenuVo vo) throws Exception {
		vo.setShOption(vo.getShOption() == null ? 0: vo.getShOption());
		vo.setShDelNy(vo.getShDelNy() == null ? 0: vo.getShDelNy());
		vo.setParamsPaging2(service.selectOneCount2(vo)); 
		vo.setShOptionDate(vo.getShOptionDate() == null ? null : vo.getShOptionDate());
		vo.setShDateStart(vo.getShDateStart() == null || vo.getShDateStart() == "" ? null : UtilDateTime.add00TimeString(vo.getShDateStart()));
		vo.setShDateEnd(vo.getShDateEnd() == null || vo.getShDateEnd() == "" ? null : UtilDateTime.add59TimeString(vo.getShDateEnd()));
	  }
	
// --------------- 관리자 --------------
	@RequestMapping(value = "menuList")
	public String menuList(@ModelAttribute("vo") MenuVo vo, Model model) throws Exception {
		
		vo.setParamsPaging2(service.selectOneCount2(vo)); 

		List<Menu> list = service.selectList2(vo);
		model.addAttribute("list", list); 
		
		return "infra/xdmin/menu/menuList";
	}
	
	@RequestMapping(value = "menuForm")
	public String menuForm(@ModelAttribute("vo") MenuVo vo, Model model) throws Exception {
		
		Menu item = service.selectOne(vo);
		 model.addAttribute("item", item);
		 
		return "infra/xdmin/menu/menuForm";
	}

	@RequestMapping(value= "menuUpdt")
	public String MenuUpdt(@ModelAttribute("vo") MenuVo vo, Menu dto, RedirectAttributes redirectAttributes) throws Exception {
		service.update(dto);
		
		redirectAttributes.addFlashAttribute("vo", vo);
		return "redirect:/menu/menuList";
		
	}
	
	@RequestMapping(value= "menuUele")
	public String MenuUele(@ModelAttribute("vo") MenuVo vo, Menu dto, RedirectAttributes redirectAttributes) throws Exception {
		service.uelete(dto);
		redirectAttributes.addFlashAttribute("vo", vo);
		return "redirect:/menu/menuList";
	}
	

	@RequestMapping(value= "menuDele")
	public String MenuDele(@ModelAttribute("vo") MenuVo vo, Menu dto, RedirectAttributes redirectAttributes) throws Exception {
		service.delete(vo);
		redirectAttributes.addFlashAttribute("vo", vo);
		return "redirect:/menu/menuList";
	}
	
	@RequestMapping("/excelDownload")
    public void excelDownload(MenuVo vo, HttpServletResponse httpServletResponse) throws Exception {
		
		 setSearch(vo);
	        vo.setParamsPaging(service.selectOneCount2(vo));

	        if (vo.getTotalRows() > 0) {
	            List<Menu> list = service.selectList2(vo);
	            
//	            Workbook workbook = new HSSFWorkbook(); // for xls
	            Workbook workbook = new XSSFWorkbook();
	            Sheet sheet = workbook.createSheet("Sheet1");
	            CellStyle cellStyle = workbook.createCellStyle();        
	            Row row = null;
	            Cell cell = null;
	            int rowNum = 0;
	            
//	            each column width setting           
	            sheet.setColumnWidth(0, 2100);
	            sheet.setColumnWidth(1, 3100);

//	        Header
	        String[] tableHeader = {"Seq", "이름", "가격", "정보", "세트구분", "생성일"};

	        row = sheet.createRow(rowNum++);
	        
			for(int i=0; i<tableHeader.length; i++) {
				cell = row.createCell(i);
	        	cellStyle.setAlignment(HorizontalAlignment.CENTER);
	        	cell.setCellStyle(cellStyle);
				cell.setCellValue(tableHeader[i]);
			}

//	        Body
	        for (int i=0; i<list.size(); i++) {
	            row = sheet.createRow(rowNum++);
	            
//	            String type: null 전달 되어도 ok
//	            int, date type: null 시 오류 발생 하므로 null check
//	            String type 이지만 정수형 데이터가 전체인 seq 의 경우 캐스팅	            
	            
	            cell = row.createCell(0);
	        	cellStyle.setAlignment(HorizontalAlignment.CENTER);
	        	cell.setCellStyle(cellStyle);
	            cell.setCellValue(Integer.parseInt(list.get(i).getIfmnSeq()));
	            
	            cell = row.createCell(1);
	        	cellStyle.setAlignment(HorizontalAlignment.CENTER);
	        	cell.setCellStyle(cellStyle);
	        	cell.setCellValue(list.get(i).getIfmnName());
	        	
	            cell = row.createCell(2);
	        	cellStyle.setAlignment(HorizontalAlignment.CENTER);
	        	cell.setCellStyle(cellStyle);
	        	cell.setCellValue(list.get(i).getIfmnPrice());
	            
	            cell = row.createCell(3);
	            cellStyle.setAlignment(HorizontalAlignment.CENTER);
	            cell.setCellStyle(cellStyle);
	            cell.setCellValue(list.get(i).getIfmnInfo());
	            
	            cell = row.createCell(4);
	            cellStyle.setAlignment(HorizontalAlignment.CENTER);
	            cell.setCellStyle(cellStyle);
	            cell.setCellValue(list.get(i).getIfmnSet_div());
	            
	            cell = row.createCell(5);
	            cellStyle.setAlignment(HorizontalAlignment.CENTER);
	            cell.setCellStyle(cellStyle);
	            cell.setCellValue(list.get(i).getIfmnCreatedAt());
	            
//	            cell = row.createCell(6);
//	            cellStyle.setAlignment(HorizontalAlignment.CENTER);
//	            cell.setCellStyle(cellStyle);
//	            cell.setCellValue(list.get(i).getIfmnModifiedAt());    
	            
	        }

	        httpServletResponse.setContentType("ms-vnd/excel");
//	        httpServletResponse.setHeader("Content-Disposition", "attachment;filename=example.xls");	// for xls
	        httpServletResponse.setHeader("Content-Disposition", "attachment;filename=example.xlsx");

	        workbook.write(httpServletResponse.getOutputStream());
	        workbook.close();
		}
    }
	
// -------------- 가게 주인 ------------	
	@RequestMapping(value = "ownerMenuList")
	public String ownerMenuList() throws Exception {
	    return "infra/xdmin/menu/ownerMenuList";
	}
	
	@RequestMapping(value = "ownerMenuForm")
	public String ownerMenuForm() throws Exception {
	    return "infra/xdmin/menu/ownerMenuForm";
	}
	
	

}
