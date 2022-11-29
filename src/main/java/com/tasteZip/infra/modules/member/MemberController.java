package com.tasteZip.infra.modules.member;

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

import net.nurigo.sdk.NurigoApp;
import net.nurigo.sdk.message.exception.NurigoMessageNotReceivedException;
import net.nurigo.sdk.message.model.Message;
import net.nurigo.sdk.message.service.DefaultMessageService;


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
    
    public void session(Member dto, HttpSession httpSession) {
	     httpSession.setAttribute("sessSeq", dto.getIfmmSeq());   
	     httpSession.setAttribute("sessId", dto.getIfmmId());
	     httpSession.setAttribute("sessName", dto.getIfmmName());
	     httpSession.setAttribute("sessEmail", dto.getIfmmEmail());
	 }
	
	@RequestMapping(value = "mypageMemberForm")
	public String mypageMemberForm(MemberVo vo, Member dto, Model model, HttpSession httpSession) throws Exception {
		
		String seq = (String) httpSession.getAttribute("sessSeq");
		vo.setIfmmSeq(seq);
		
		Member item = service.selectOne(vo);
		model.addAttribute("item", item);
		
		Member itemImg = service.selectImg(vo);
		model.addAttribute("itemImg", itemImg);
		
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
       vo.setShDateStart(vo.getShDateStart() == null || vo.getShDateStart() == "" ? null : UtilDateTime.add00TimeString(vo.getShDateStart()));
       vo.setShDateEnd(vo.getShDateEnd() == null || vo.getShDateEnd() == "" ? null : UtilDateTime.add59TimeString(vo.getShDateEnd()));
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
   
   @RequestMapping(value = "sideBar") 
   public String sideBar(@ModelAttribute("vo") MemberVo vo, Model model, HttpSession httpSession) throws Exception {
   	
//   	String ifmmSeq = httpSession.getAttribute("sessSeq").toString();
//		vo.setIfmmSeq(ifmmSeq);
   	
   	Member item = service.selectOne(vo);
   	model.addAttribute("item", item);
   	
       return "infra/main/resources/js/sideBar/sideBar";
   }
   
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
	
	/* 다중 삭제 s */
	@RequestMapping(value = "memberMultiUele")
	public String memberMultiUele(MemberVo vo, Member dto, RedirectAttributes redirectAttributes) throws Exception {
		for (String checkboxSeq : vo.getCheckboxSeqArray()) {
			dto.setIfmmSeq(checkboxSeq);
			service.uelete(dto);
		}
		redirectAttributes.addFlashAttribute("vo", vo);
		return "redirect:/member/xdminMemberList";
	}

	@RequestMapping(value = "memberMultiDele")
	public String memberMultiDele(MemberVo vo, Member dto, RedirectAttributes redirectAttributes) throws Exception {
		for (String checkboxSeq : vo.getCheckboxSeqArray()) {
			vo.setIfmmSeq(checkboxSeq);
			service.delete(vo);
		}
		redirectAttributes.addFlashAttribute("vo", vo);
		return "redirect:/member/xdminMemberList";
	}
	/* 다중 삭제 e */
	
	 // ------------------------ 삭제 s ------------------------
	
	@RequestMapping(value = "memberUele")
	public String memberUele(MemberVo vo, Member dto, RedirectAttributes redirectAttributes) throws Exception {

		service.uelete(dto);
		redirectAttributes.addFlashAttribute("vo", vo);

		return "redirect:/member/xdminMemberList";
	}
	
	@RequestMapping(value = "memberDele")
	public String memberDele(MemberVo vo, RedirectAttributes redirectAttributes) throws Exception {

		service.delete(vo);
		redirectAttributes.addFlashAttribute("vo", vo);

		return "redirect:/member/xdminMemberList";
	}
	
	 // ------------------------ 삭제 e ------------------------
   
	// 아이디 중복체크 
	@ResponseBody
	@RequestMapping(value = "checkId")
	public Map<String, Object> checkId(Member dto) throws Exception {

		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		int result = service.idCheck(dto);

		if (result > 0) {
			returnMap.put("rt", "fail");
		} else {
			returnMap.put("rt", "success");
		}
		return returnMap;
	}
	
	
	//SMS 인증
	@ResponseBody
	@RequestMapping(value ="checkSms")
	public Map<String,Object> checkSms (Member dto) throws Exception {
		
		System.out.println("폰 번호:" + dto.getIfmmPhone());
		
		Map<String,Object> result = new HashMap<String,Object>();
		
		//4자리 난수 생성
		String rndNo = "";
		
		for(int i = 0; i < 4; i++) {
			rndNo += (int)(Math.random()*10-1) + 1;
			System.out.println("난수: " + rndNo);
		}
		
		DefaultMessageService messageService =  NurigoApp.INSTANCE.initialize("NCSCZEGT6HK0GPVH", "XRZSRU0MPYQ3VUCPZBLDJGMMII5ZB1AN", "https://api.solapi.com"); 
		// Message 패키지가 중복될 경우 net.nurigo.sdk.message.model.Message로 치환하여 주세요
		Message message = new Message();
		message.setFrom("01052506950");
		message.setTo(dto.getIfmmPhone());
		message.setText("안녕하세요. MATZIP의 인증번호는 ["+ rndNo +"] 입니다. ");

		try {
		  // send 메소드로 ArrayList<Message> 객체를 넣어도 동작합니다!
		  messageService.send(message);
		} catch (NurigoMessageNotReceivedException exception) {
		  // 발송에 실패한 메시지 목록을 확인할 수 있습니다!
		  System.out.println(exception.getFailedMessageList());
		  System.out.println(exception.getMessage()); 
		} catch (Exception exception) {
		  System.out.println(exception.getMessage());
		}
		
		result.put("code", rndNo);
		
		return result;
	}
}
