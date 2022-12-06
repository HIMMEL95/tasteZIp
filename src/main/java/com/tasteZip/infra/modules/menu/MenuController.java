package com.tasteZip.infra.modules.menu;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
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

@Controller
@RequestMapping(value = "/menu/")
public class MenuController {
	
	@Autowired
	MenuServiceImpl service;
	
// --------------- 관리자 --------------
	@RequestMapping(value = "xdminMenuList")
	public String xdminMenuList(@ModelAttribute("vo") MenuVo vo, Model model) throws Exception {
		
		 setSearch(vo);
		return "infra/xdmin/menu/xdminMenuList";
	}
	
	@RequestMapping(value = "xdminMenuLita")
	public String xdminMenuLita(@ModelAttribute("vo") MenuVo vo, Model model) throws Exception {
		
		vo.setParamsPaging(service.selectOneCount2(vo));
		
		  if (vo.getTotalRows() > 0) { 
			  List<Menu> list = service.selectList2(vo);
			  model.addAttribute("list", list); 
		  }
		
		return "infra/xdmin/menu/xdminMenuLita";
	}
	
	@RequestMapping(value = "xdminMenuForm")
	public String xdminMenuForm(@ModelAttribute("vo") MenuVo vo, Model model) throws Exception {
		
		Menu item = service.selectOne(vo);
		model.addAttribute("item", item);
		
		return "infra/xdmin/menu/xdminMenuForm";
	}
	
	/* 다중 삭제 s */
	@RequestMapping(value = "menuMultiUele")
	public String menuMultiUele(MenuVo vo, Menu dto, RedirectAttributes redirectAttributes) throws Exception {
		for (String checkboxSeq : vo.getCheckboxSeqArray()) {
			dto.setIfmnSeq(checkboxSeq);
			service.uelete(dto);
		}
		redirectAttributes.addFlashAttribute("vo", vo);
		return "redirect:/menu/xdminMenuList";
	}

	@RequestMapping(value = "menuMultiDele")
	public String menuMultiDele(MenuVo vo, Menu dto, RedirectAttributes redirectAttributes) throws Exception {
		for (String checkboxSeq : vo.getCheckboxSeqArray()) {
			vo.setIfmnSeq(checkboxSeq);
			service.delete(vo);
		}
		redirectAttributes.addFlashAttribute("vo", vo);
		return "redirect:/menu/xdminMenuList";
	}
	/* 다중 삭제 e */
	
	@RequestMapping(value = "ownerMenuList")
	public String ownerMenuList(@ModelAttribute("vo") MenuVo vo, Model model) throws Exception {
		
		 setSearch(vo);
		return "infra/xdmin/menu/ownerMenuList";
	}
	
	@RequestMapping(value = "ownerMenuLita")
	public String ownerMenuLita(@ModelAttribute("vo") MenuVo vo, Model model) throws Exception {
		
		vo.setParamsPaging(service.selectOneCount2(vo));
		
		  if (vo.getTotalRows() > 0) { 
			  List<Menu> list = service.selectList2(vo);
			  model.addAttribute("list", list); 
		  }
		
		return "infra/xdmin/menu/ownerMenuLita";
	}
	
	@RequestMapping(value = "ownerMenuForm")
	public String ownerMenuForm(@ModelAttribute("vo") MenuVo vo, Model model) throws Exception {
		
		Menu item = service.selectMenu(vo);
		model.addAttribute("item", item);

		Menu img = service.selectImg(vo);
		model.addAttribute("img", img);
		
		return "infra/xdmin/menu/ownerMenuForm";
	}
	
	/* 다중 삭제 s */
	@RequestMapping(value = "menuOwnerMultiUele")
	public String menuOwnerMultiUele(MenuVo vo, Menu dto, RedirectAttributes redirectAttributes) throws Exception {
		for (String checkboxSeq : vo.getCheckboxSeqArray()) {
			dto.setIfmnSeq(checkboxSeq);
			service.uelete(dto);
		}
		redirectAttributes.addFlashAttribute("vo", vo);
		return "redirect:/menu/ownerMenuList";
	}

	@RequestMapping(value = "menuOwnerMultiDele")
	public String menuOwnerMultiDele(MenuVo vo, Menu dto, RedirectAttributes redirectAttributes) throws Exception {
		for (String checkboxSeq : vo.getCheckboxSeqArray()) {
			vo.setIfmnSeq(checkboxSeq);
			service.delete(vo);
		}
		redirectAttributes.addFlashAttribute("vo", vo);
		return "redirect:/menu/ownerMenuList";
	}
	/* 다중 삭제 e */
	
	@RequestMapping(value= "menuInst")
	public String menuInst(@ModelAttribute("vo") MenuVo vo, Menu dto, RedirectAttributes redirectAttributes) throws Exception {
		
		service.insert(dto);
		
		vo.setIfmnSeq(dto.getIfmnSeq());
		redirectAttributes.addFlashAttribute("vo", vo);
		
		return "redirect:/menu/ownerMenuForm";
	}

	@RequestMapping(value= "menuUpdt")
	public String MenuUpdt(@ModelAttribute("vo") MenuVo vo, Menu dto, RedirectAttributes redirectAttributes) throws Exception {
		
		service.update(dto);
		redirectAttributes.addFlashAttribute("vo", vo);
		
		return "redirect:/menu/ownerMenuForm";
	}
	
	@RequestMapping(value= "menuUele")
	public String MenuUele(@ModelAttribute("vo") MenuVo vo, Menu dto, RedirectAttributes redirectAttributes) throws Exception {
		service.uelete(dto);
		redirectAttributes.addFlashAttribute("vo", vo);
		return "redirect:/menu/ownerMenuList";
	}
	

	@RequestMapping(value= "menuDele")
	public String MenuDele(@ModelAttribute("vo") MenuVo vo, Menu dto, RedirectAttributes redirectAttributes) throws Exception {
		service.delete(vo);
		redirectAttributes.addFlashAttribute("vo", vo);
		return "redirect:/menu/ownerMenuList";
	}
	
	private void setSearch(MenuVo vo) throws Exception {
		vo.setShOption(vo.getShOption() == null ? 0: vo.getShOption());
		vo.setShDelNy(vo.getShDelNy() == null ? 0: vo.getShDelNy());
		vo.setShDateStart(vo.getShDateStart() == null || vo.getShDateStart() == "" ? null : UtilDateTime.add00TimeString(vo.getShDateStart()));
		vo.setShDateEnd(vo.getShDateEnd() == null || vo.getShDateEnd() == "" ? null : UtilDateTime.add59TimeString(vo.getShDateEnd()));
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
	
// -------------- cart ------------	
	
	/* 장바구니 구현 용 s */
    @ResponseBody
    @RequestMapping(value = "cart")
    public Map<String, Object> cart(Menu dto, MenuVo vo, HttpServletResponse response, HttpServletRequest request, HttpSession session) throws Exception {
        Map<String, Object> returnMap = new HashMap<String, Object>();
        System.out.println("seq : " + vo.getIfmnSeq());
        
        Cookie[] cookies = request.getCookies();
        String[] b = null;
        for (Cookie cookie: cookies) {
            if (cookie.getName().equals("cart")) {
                b = cookie.getValue().split(":");
            } 
           
        }
        
        if (b != null || vo.getIfmnSeq() != "") {
            System.out.println("여기1?");
            String[] str = null;
            String[] priceArr = null;
            String[] countArr = null;
            String result = "";
            String price = "";
            String count = "";
            cookies = request.getCookies();
            for (Cookie cookie: cookies) {
                if (cookie.getName().equals("cart")) {
                    result = cookie.getValue();
                } else {
                    str = vo.getIfmnSeq().split(" ");
                    priceArr = dto.getIfmnPrice().split(" ");
                    countArr = dto.getCount().split(" ");
                    for (int i=0; i<str.length; i++) {
                        if(i == str.length-1) {
                            result += str[i];
                            price += priceArr[i];
                            count += countArr[i];
                        } else {
                            result += str[i] + ":";
                            price += priceArr[i] + ":";
                            count += countArr[i] + ":";
                        }
                    }
                    break;
                }
            }
            
            System.out.println("cart : " + result);
            System.out.println("price : " + price);
            System.out.println("count : " + count);
            
            Cookie cart = new Cookie("cart", result);
            cart.setPath("http://13.209.12.239:8082/");
            cart.setMaxAge(30 * 24 * 60 * 60 * 1000);
            response.addCookie(cart);

            Cookie store = new Cookie("store", dto.getIfstSeq());
            store.setPath("http://13.209.12.239:8082/");
            store.setMaxAge(30 * 24 * 60 * 60 * 1000);
            response.addCookie(store);

            session.setAttribute("store", dto.getIfstSeq());
            
            Cookie pric = new Cookie("price", price);
            pric.setPath("http://13.209.12.239:8082/");
            pric.setMaxAge(30 * 24 * 60 * 60 * 1000);
            response.addCookie(pric);
            
            Cookie coun = new Cookie("count", count);
            coun.setPath("http://13.209.12.239:8082/");
            coun.setMaxAge(30 * 24 * 60 * 60 * 1000);
            response.addCookie(coun);
            
            returnMap.put("rt", "success");
        } else {
            System.out.println("여기2?");
            returnMap.put("rt", "fail");
        }
        
        return returnMap;
    }
    
    @ResponseBody
    @RequestMapping(value = "cartDel")
    public Map<String, Object> cartDel(Menu dto, MenuVo vo, HttpServletResponse response) throws Exception {
        Map<String, Object> returnMap = new HashMap<String, Object>();
        
        System.out.println("seq : " + vo.getIfmnSeq());
        
        String result = vo.getIfmnSeq().replace(" ", ":");
        String price = vo.getPrice().replace(" ", ":");
        String count = vo.getCount().replace(" ", ":");
        
        Cookie cart = new Cookie("cart", result);
        cart.setPath("http://13.209.12.239:8082/");
        cart.setMaxAge(30 *24 * 60 * 60 * 1000);
        response.addCookie(cart);
        
        Cookie price1 = new Cookie("price", price);
        price1.setPath("http://13.209.12.239:8082/");
        price1.setMaxAge(30 *24 * 60 * 60 * 1000);
        response.addCookie(price1);
        
        Cookie count1 = new Cookie("count", count);
        count1.setPath("http://13.209.12.239:8082/");
        count1.setMaxAge(30 *24 * 60 * 60 * 1000);
        response.addCookie(count1);
        
        returnMap.put("rt", "success");
        
        return returnMap;
    }
    /* 장바구니 구현 용 e */	
}
