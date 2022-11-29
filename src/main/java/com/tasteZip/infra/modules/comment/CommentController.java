package com.tasteZip.infra.modules.comment;

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
import com.tasteZip.infra.modules.store.Store;
import com.tasteZip.infra.modules.store.StoreServiceImpl;
import com.tasteZip.infra.modules.store.StoreVo;

@Controller
@RequestMapping(value = "/comment/")
public class CommentController {
	
	@Autowired
	CommentServiceImpl service;
	
	@Autowired
    StoreServiceImpl sService;
	
	
	private void setSearch(CommentVo vo) throws Exception {
		vo.setParamsPaging(service.selectOneCount(vo)); 
		vo.setShDelNy(vo.getShDelNy() == null ? 0: vo.getShDelNy());
		vo.setShOption(vo.getShOption() == null ? 0: vo.getShOption());
	  }
	
	
	// 리뷰
    @RequestMapping(value = "mypageReview")
    public String mypageReview(@ModelAttribute("vo") CommentVo vo, Model model, HttpSession httpSession) throws Exception {
    	
    	String seq = httpSession.getAttribute("sessSeq").toString();
		vo.setIfmmSeq(seq);
    	
    	vo.setParamsPaging2(service.selectOneCount(vo));
    	
		List<Comment> list = service.myReview(vo);
		model.addAttribute("list", list); 
    	
        return "infra/main/mypage/mypageReview";
    }
    
    
 // 스토어 리뷰
    @RequestMapping(value = "storeComment")
    public String storeComment(@ModelAttribute("vo") CommentVo vo, StoreVo sVo, Model model, HttpSession httpSession) throws Exception {
    	
    	String seq = httpSession.getAttribute("sessSeq").toString();
		vo.setIfmmSeq(seq);
    	
    	vo.setParamsPaging2(service.selectOneCount(vo));
    	
		List<Comment> list = service.storeComment(vo);
		model.addAttribute("list", list); 
		
		Store item = sService.xdminSelectOne(sVo);
        model.addAttribute("item", item);
        
        List<Store> img = sService.selectImg(sVo);
        model.addAttribute("img", img);
    	
        return "infra/main/comment/storeComment";
    }
    
    
// 스토어 코멘트 등록
    
    @ResponseBody
    @RequestMapping(value = "commentInst")
	public Map<String, Object> commentInst(@ModelAttribute("vo")CommentVo vo, Comment dto) throws Exception {
    	
    	Map<String, Object> returnMap = new HashMap<String, Object>();
    	
    	service.regComment(dto);
    	returnMap.put("rt", "success");
    	
        return returnMap;
	}
    
    
    @ResponseBody
    @RequestMapping(value = "commentUele")
	public Map<String, Object> commentUele(@ModelAttribute("vo")CommentVo vo, Comment dto) throws Exception {
    	
    	Map<String, Object> returnMap = new HashMap<String, Object>();
    	
    	service.uelete(dto);
    	returnMap.put("rt", "success");
    	
        return returnMap;
	}
    
    
//    @RequestMapping(value= "CommentUele")
//	public String CommentUele(@ModelAttribute("vo") CommentVo vo, Comment dto, RedirectAttributes redirectAttributes) throws Exception {
//		service.uelete(dto);
//		redirectAttributes.addFlashAttribute("vo", vo);
//		return "redirect:/Comment/commentList";
//	}
	
    
//    @RequestMapping(value = "commentInst")
//	public String commentInst(@ModelAttribute("vo")CommentVo vo, Comment dto, Model model, RedirectAttributes redirectAttributes) throws Exception {
//    	
//    	service.regComment(dto);
//        redirectAttributes.addFlashAttribute("vo", vo);
//        
//        vo.setIfstSeq(vo.getIfstSeq());
//		
//        List<Comment> list = service.storeComment(vo);
//        model.addAttribute("list", list); 
//        
//        Comment item = service.xdminSelectOne(vo);
//        model.addAttribute("item", item);
//        
//        List<Comment> img = service.selectImg(vo);
//        model.addAttribute("img", img);
//
//        return "redirect:/comment/storeComment";
//	}
    
 // --------------- 관리자 --------------
    
    public void setSearchAndPaging(CommentVo vo) throws Exception{
		vo.setShDelNy(vo.getShDelNy() == null ? 0 : vo.getShDelNy());
		vo.setShOption(vo.getShOption() == null ? 0: vo.getShOption());
		vo.setShDateStart(vo.getShDateStart() == null || vo.getShDateStart() == "" ? null : UtilDateTime.add00TimeString(vo.getShDateStart()));
		vo.setShDateEnd(vo.getShDateEnd() == null || vo.getShDateEnd() == "" ? null : UtilDateTime.add59TimeString(vo.getShDateEnd()));
	}
    
    @RequestMapping(value = "xdminCommentList")
    public String xdminCommentList(@ModelAttribute("vo") CommentVo vo, Model model) throws Exception {
    	
    	setSearchAndPaging(vo);
    	return "infra/xdmin/comment/xdminCommentList";
    }
    
    @RequestMapping(value = "xdminCommentLita")
	public String xdminCommentLita(@ModelAttribute("vo") CommentVo vo, Model model) throws Exception {
		
		vo.setParamsPaging(service.selectOneCount2(vo));
		  if (vo.getTotalRows() > 0) { 
			  List<Comment> list = service.selectList2(vo);
				model.addAttribute("list", list); 
		  }
		return "infra/xdmin/comment/xdminCommentLita";
	}
    
    @RequestMapping(value = "xdminCommentForm")
	public String xdminCommentForm(@ModelAttribute("vo") CommentVo vo, Model model) throws Exception {
		
    	Comment item = service.selectOne(vo);
		model.addAttribute("item", item);
		
	    return "infra/xdmin/comment/xdminCommentForm";
	}
    
    /* 다중 삭제 s */
	@RequestMapping(value = "commentMultiUele")
	public String commentMultiUele(CommentVo vo, Comment dto, RedirectAttributes redirectAttributes) throws Exception {
		for (String checkboxSeq : vo.getCheckboxSeqArray()) {
			dto.setIfcmSeq(checkboxSeq);
			service.uelete(dto);
		}
		redirectAttributes.addFlashAttribute("vo", vo);
		return "redirect:/comment/xdminCommentList";
	}

	@RequestMapping(value = "commentMultiDele")
	public String commentMultiDele(CommentVo vo, Comment dto, RedirectAttributes redirectAttributes) throws Exception {
		for (String checkboxSeq : vo.getCheckboxSeqArray()) {
			vo.setIfcmSeq(checkboxSeq);
			service.delete(vo);
		}
		redirectAttributes.addFlashAttribute("vo", vo);
		return "redirect:/comment/xdminCommentList";
	}
	/* 다중 삭제 e */
    
    @RequestMapping("/excelDownload")
    public void excelDownload(CommentVo vo, HttpServletResponse httpServletResponse) throws Exception {
		
		 setSearch(vo);
	        vo.setParamsPaging(service.selectOneCount2(vo));

	        if (vo.getTotalRows() > 0) {
	            List<Comment> list = service.selectList2(vo);
	            
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
	        String[] tableHeader = {"Seq", "댓글", "평점", "사용자이름", "가게이름", "직성일"};

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
	            cell.setCellValue(Integer.parseInt(list.get(i).getIfcmSeq()));
	            
	            cell = row.createCell(1);
	        	cellStyle.setAlignment(HorizontalAlignment.CENTER);
	        	cell.setCellStyle(cellStyle);
	        	cell.setCellValue(list.get(i).getIfcmComment());
	        	
	            cell = row.createCell(2);
	        	cellStyle.setAlignment(HorizontalAlignment.CENTER);
	        	cell.setCellStyle(cellStyle);
	        	cell.setCellValue(list.get(i).getIfcmGrade());
	            
	            cell = row.createCell(3);
	            cellStyle.setAlignment(HorizontalAlignment.CENTER);
	            cell.setCellStyle(cellStyle);
	            cell.setCellValue(list.get(i).getIfmmName());
	            
	            cell = row.createCell(4);
	            cellStyle.setAlignment(HorizontalAlignment.CENTER);
	            cell.setCellStyle(cellStyle);
	            cell.setCellValue(list.get(i).getIfstName());
	            
	            cell = row.createCell(5);
	            cellStyle.setAlignment(HorizontalAlignment.CENTER);
	            cell.setCellStyle(cellStyle);
	            cell.setCellValue(list.get(i).getIfcmCreatedAt());
	            
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
	 
    @RequestMapping(value= "CommentUpdt")
	public String CommentUpdt(@ModelAttribute("vo") CommentVo vo, Comment dto, RedirectAttributes redirectAttributes) throws Exception {
		service.update(dto);
		
		redirectAttributes.addFlashAttribute("vo", vo);
		return "redirect:/Comment/commentList";
		
	}
	

	@RequestMapping(value= "CommentDele")
	public String CommentDele(@ModelAttribute("vo") CommentVo vo, Comment dto, RedirectAttributes redirectAttributes) throws Exception {
		service.delete(vo);
		redirectAttributes.addFlashAttribute("vo", vo);
		return "redirect:/Comment/commentList";
	}
    
}
