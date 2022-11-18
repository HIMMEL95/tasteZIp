package com.tasteZip.infra.modules.member;

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

import com.tasteZip.infra.common.util.UtilDateTime;

@Controller
@RequestMapping(value = "/member/")
public class MemberController {

    @Autowired
    MemberServiceImpl service;
    
    public void setSearchAndPaging(MemberVo vo) throws Exception {
        vo.setShDelNy(vo.getShDelNy() == null ? 0 : vo.getShDelNy());
        vo.setShOption(vo.getShOption() == null ? 0: vo.getShOption());
		vo.setParamsPaging(service.selectOneCount(vo)); 
		vo.setShOptionDate(vo.getShOptionDate() == null ? null : vo.getShOptionDate());
		vo.setShDateStart(vo.getShDateStart() == null || vo.getShDateStart() == "" ? null : UtilDateTime.add00TimeString(vo.getShDateStart()));
		vo.setShDateEnd(vo.getShDateEnd() == null || vo.getShDateEnd() == "" ? null : UtilDateTime.add59TimeString(vo.getShDateEnd()));
    }
	
	@RequestMapping(value = "mypageMemberForm")
	public String mypageMemberForm(MemberVo vo, Member dto, Model model, HttpSession httpSession) throws Exception {
		
		String seq = (String) httpSession.getAttribute("sessSeq");
		vo.setIfmmSeq(seq);
		
		Member item = service.selectOne(vo);
		model.addAttribute("item", item);
		
	    return "infra/main/member/mypageMemberForm"; 
	}
	
	@RequestMapping(value = "mypageUpdt")
	public String mypageUpdt(@ModelAttribute("vo") MemberVo vo, Member dto, RedirectAttributes redirectAttributes, HttpSession httpSession) throws Exception {
		
		String seq = (String) httpSession.getAttribute("sessSeq");
		
		dto.setIfmmSeq(seq);
		
		service.mypageUpdt(dto);
		
		vo.setIfmmSeq(dto.getIfmmSeq());
		redirectAttributes.addFlashAttribute("vo", vo);
		
	    return "redirect:/member/mypageMemberForm"; 
	}
	
	@RequestMapping(value = "memberInst")
	public String memberInst(Member dto) throws Exception {
	    service.memberInst(dto);
	    return "redirect:/login";
	}
	
	//excel Download
    public void setSearch(MemberVo vo) throws Exception {
       vo.setShDelNy(vo.getShDelNy() == null ? 0 : vo.getShDelNy());
       vo.setShOption(vo.getShOption() == null ? 0 : vo.getShOption());
    }
   
   @RequestMapping("excelDownload")
   public void excelDownload(MemberVo vo, HttpServletResponse httpServletResponse) throws Exception {
       
       setSearch(vo);
       vo.setParamsPaging(service.selectOneCount(vo));

       if (vo.getTotalRows() > 0) {
           List<Member> list = service.selectList(vo);
           
//           Workbook workbook = new HSSFWorkbook(); // for xls
           Workbook workbook = new XSSFWorkbook();
           Sheet sheet = workbook.createSheet("Sheet1");
           CellStyle cellStyle = workbook.createCellStyle();        
           Row row = null;
           Cell cell = null;
           int rowNum = 0;
           
//           each column width setting           
           sheet.setColumnWidth(0, 2100);
           sheet.setColumnWidth(1, 3100);

//           Header
           String[] tableHeader = {"Seq", "이름", "아이디", "생년월일", "성별", "이메일", "전화번호", "우편번호", "주소", "상세주소", "추가주소", "Sns", "이메일체크", "삭제여부", "등록일", "수정일"};

           row = sheet.createRow(rowNum++);
           
           for(int i=0; i<tableHeader.length; i++) {
               cell = row.createCell(i);
               cellStyle.setAlignment(HorizontalAlignment.CENTER);
               cell.setCellStyle(cellStyle);
               cell.setCellValue(tableHeader[i]);
           }

//           Body
           for (int i=0; i<list.size(); i++) {
               row = sheet.createRow(rowNum++);
               
//               String type: null 전달 되어도 ok
//               int, date type: null 시 오류 발생 하므로 null check
//               String type 이지만 정수형 데이터가 전체인 seq 의 경우 캐스팅               
               
               cell = row.createCell(0);
               cellStyle.setAlignment(HorizontalAlignment.CENTER);
               cell.setCellStyle(cellStyle);
               cell.setCellValue(Integer.parseInt(list.get(i).getIfmmSeq()));

               cell = row.createCell(1);
               cellStyle.setAlignment(HorizontalAlignment.CENTER);
               cell.setCellStyle(cellStyle);
               cell.setCellValue(list.get(i).getIfmmName());
               
               cell = row.createCell(2);
               cellStyle.setAlignment(HorizontalAlignment.CENTER);
               cell.setCellStyle(cellStyle);
               cell.setCellValue(list.get(i).getIfmmId());

               cell = row.createCell(3);
               cellStyle.setAlignment(HorizontalAlignment.CENTER);
               cell.setCellStyle(cellStyle);
               cell.setCellValue(list.get(i).getIfmmDob());

               cell = row.createCell(4);
               cellStyle.setAlignment(HorizontalAlignment.CENTER);
               cell.setCellStyle(cellStyle);
               cell.setCellValue(list.get(i).getIfmmGender());

               cell = row.createCell(5);
               cellStyle.setAlignment(HorizontalAlignment.CENTER);
               cell.setCellStyle(cellStyle);
               cell.setCellValue(list.get(i).getIfmmEmail());

               cell = row.createCell(6);
               cellStyle.setAlignment(HorizontalAlignment.CENTER);
               cell.setCellStyle(cellStyle);
               cell.setCellValue(list.get(i).getIfmmPhone());

               cell = row.createCell(7);
               cellStyle.setAlignment(HorizontalAlignment.CENTER);
               cell.setCellStyle(cellStyle);
               cell.setCellValue(list.get(i).getIfmmZipCode());

               cell = row.createCell(8);
               cellStyle.setAlignment(HorizontalAlignment.CENTER);
               cell.setCellStyle(cellStyle);
               cell.setCellValue(list.get(i).getIfmmAddress());
               
               cell = row.createCell(9);
               cellStyle.setAlignment(HorizontalAlignment.CENTER);
               cell.setCellStyle(cellStyle);
               cell.setCellValue(list.get(i).getIfmmDetailAddress());
               
               cell = row.createCell(10);
               cellStyle.setAlignment(HorizontalAlignment.CENTER);
               cell.setCellStyle(cellStyle);
               cell.setCellValue(list.get(i).getIfmmExtraAddress());
               
               cell = row.createCell(11);
               cellStyle.setAlignment(HorizontalAlignment.CENTER);
               cell.setCellStyle(cellStyle);
               cell.setCellValue(list.get(i).getIfmmSnsDiv());
              
               cell = row.createCell(12);
               cellStyle.setAlignment(HorizontalAlignment.CENTER);
               cell.setCellStyle(cellStyle);
               cell.setCellValue(list.get(i).getIfmmEmailCheck());
               
               cell = row.createCell(13);
               cellStyle.setAlignment(HorizontalAlignment.CENTER);
               cell.setCellStyle(cellStyle);
               cell.setCellValue(list.get(i).getIfmmDelNy());
               
               cell = row.createCell(14);
               cellStyle.setAlignment(HorizontalAlignment.CENTER);
               cell.setCellStyle(cellStyle);
               cell.setCellValue(list.get(i).getIfmmCreatedAt());
              
               cell = row.createCell(15);
               cellStyle.setAlignment(HorizontalAlignment.CENTER);
               cell.setCellStyle(cellStyle);
               cell.setCellValue(list.get(i).getIfmmModifiedAt());
           }

           httpServletResponse.setContentType("ms-vnd/excel");
//           httpServletResponse.setHeader("Content-Disposition", "attachment;filename=example.xls");    // for xls
           httpServletResponse.setHeader("Content-Disposition", "attachment;filename=member.xlsx");

           workbook.write(httpServletResponse.getOutputStream());
           workbook.close();
       }
   }
   
 // ------------------------ 관리자 ------------------------
   
   @RequestMapping(value = "xdminMemberList")
	public String xdminMember(@ModelAttribute("vo") MemberVo vo, Model model) throws Exception {
		
	   setSearch(vo);
		return "infra/xdmin/member/xdminMemberList";
	}
	
	@RequestMapping(value = "xdminMemberLita")
	public String xdminMemberLita(@ModelAttribute("vo") MemberVo vo, Model model) throws Exception {
		
		vo.setParamsPaging(service.selectOneCount(vo));
		  if (vo.getTotalRows() > 0) { 
			  List<Member> list = service.selectList(vo);
			  model.addAttribute("list", list); 
		  }
		
		return "infra/xdmin/member/xdminMemberLita";
	}
	
	@RequestMapping(value = "xdminMemberForm")
	public String xdminMemberForm(@ModelAttribute("vo") MemberVo vo, Model model) throws Exception {
		
		Member item = service.selectOne(vo);
		model.addAttribute("item", item);
		
	    return "infra/xdmin/member/xdminMemberForm";
	}
   
 
}
