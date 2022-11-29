package com.tasteZip.infra.modules.order;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.tasteZip.infra.common.util.UtilDateTime;
import com.tasteZip.infra.modules.member.Member;
import com.tasteZip.infra.modules.member.MemberVo;
import com.tasteZip.infra.modules.menu.Menu;
import com.tasteZip.infra.modules.menu.MenuServiceImpl;
import com.tasteZip.infra.modules.menu.MenuVo;
import com.tasteZip.infra.modules.store.Store;
import com.tasteZip.infra.modules.store.StoreServiceImpl;
import com.tasteZip.infra.modules.store.StoreVo;

@Controller
@RequestMapping(value = "/order/")
public class OrderController {
	
	@Autowired
	OrderServiceImpl service;
	@Autowired
	MenuServiceImpl mService;
	@Autowired
	StoreServiceImpl sService;
	
	// search and paging
	public void setSearchAndPaging(OrderVo vo) throws Exception{
		vo.setParamsPaging(service.selectOneCount(vo));
	}
	
	// xdmin list
	@RequestMapping(value = "orderList")
	public String orderList(@ModelAttribute("vo") OrderVo vo, Model model) throws Exception {
		
		setSearchAndPaging(vo);
		
		if (vo.getTotalRows() > 0) {
			List<Order> list = service.selectList(vo);
			model.addAttribute("list", list);
		}
		
	    return "infra/xdmin/order/orderList";
	}
	
	// list uelete
	
	@RequestMapping(value = "OrderUele")
	public String OrderUele(@ModelAttribute("vo") OrderVo vo, Model model) throws Exception {
		
		String returnString = "";
		
			
			for(OrderVo vItem : vo.getSeqVoList()) {
				
				service.ueleteList(vItem.getIforSeq());
				
				setSearchAndPaging(vo);
				
				if(vo.getTotalRows() > 0) {
					List<Order> list = service.selectList(vo);
					model.addAttribute("list", list);
				}

				returnString = "infra/xdmin/order/orderList";
			}
			
		
		return returnString;
	}
	
	// mypage list
    @RequestMapping(value = "mypageOrder")
    public String mypageOrder(@ModelAttribute("vo") OrderVo vo, Model model, HttpSession httpSession) throws Exception {
    	
    	String seq = httpSession.getAttribute("sessSeq").toString();
		vo.setIfmmSeq(seq);
		
		vo.setParamsPaging2(service.selectOneCount(vo));
		
		List<Order> list = service.myOrder(vo);
		model.addAttribute("list", list); 
		
        return "infra/main/mypage/mypageOrder";
    }

    @RequestMapping(value = "menuOrder")
    public String menuOrder() throws Exception {
    	return "infra/main/order/menuOrder";
    }
    
    @RequestMapping(value = "cartOrder")
    public String cartOrder(MenuVo vo, Menu dto, StoreVo sVo, Model model, HttpServletResponse response, HttpServletRequest request) throws Exception {
    	
    	Cookie[] cookies = request.getCookies();
    	String[] b = null;
    	for (Cookie cookie: cookies) {
    		if (cookie.getName().equals("cart")) {
    			b = cookie.getValue().split(":");
    		}
    	}
    	
    	String str = "";
    	for(int i=0; i<b.length;i++) {
    	    if (i == b.length-1) {
    	        str += b[i];
    	    } else {
    	        str += b[i] + ",";
    	    }
    	}
    	
    	System.out.println("str : "+ str);
     	
    	vo.setIfmnSeq(str);
    	List<Menu> list = mService.selectCart(vo);
    	model.addAttribute("list", list);
        
        Store item = sService.xdminSelectOne(sVo);
        model.addAttribute("item", item);
        
    	return "infra/main/order/cartOrder";
    }
    
    @RequestMapping(value = "mypageOrderView")
    public String mypageOrderView(@ModelAttribute("vo") OrderVo vo, Order dto, Model model, HttpSession httpSession) throws Exception {
    	
    	vo.setIforSeq(dto.getIforSeq());

    	String seq = httpSession.getAttribute("sessSeq").toString();
		vo.setIfmmSeq(seq);
		
		Order item = service.selectOne(vo);
		model.addAttribute("item", item);
    	
        return "infra/main/mypage/mypageOrderView";
    }
    
    public void setSearch(OrderVo vo) throws Exception {
        vo.setShDelNy(vo.getShDelNy() == null ? 0 : vo.getShDelNy());
        vo.setShOption(vo.getShOption() == null ? 0 : vo.getShOption());
        vo.setShDateStart(vo.getShDateStart() == null || vo.getShDateStart() == "" ? null : UtilDateTime.add00TimeString(vo.getShDateStart()));
		vo.setShDateEnd(vo.getShDateEnd() == null || vo.getShDateEnd() == "" ? null : UtilDateTime.add59TimeString(vo.getShDateEnd()));
     }
	
 // ------------------------ 관리자 ------------------------

 	@RequestMapping(value = "xdminOrderList")
 	public String xdminOrderList(@ModelAttribute("vo") OrderVo vo, Model model) throws Exception {
 		
 		setSearch(vo);
 		return "infra/xdmin/order/xdminOrderList";
 	}
 	
 	@RequestMapping(value = "xdminOrderLita")
 	public String xdminOrderLita(@ModelAttribute("vo") OrderVo vo, Model model) throws Exception {
 		
 		vo.setParamsPaging(service.xdminSelectOneCount(vo));
 		  if (vo.getTotalRows() > 0) { 
 			  List<Order> list = service.xdminSelectList(vo);
 			  model.addAttribute("list", list); 
 		  }
 		
 		return "infra/xdmin/order/xdminOrderLita";
 	}
 	
 	@RequestMapping(value = "xdminOrderForm")
 	public String xdminOrderForm(@ModelAttribute("vo") OrderVo vo, Model model) throws Exception {
 		
 		Order item = service.selectOne(vo);
 		model.addAttribute("item", item);
 		
		return "infra/xdmin/order/xdminOrderForm";
 		
 	}
 	
 	 // ------------------------ 삭제 s ------------------------
	
 		@RequestMapping(value = "orderMultiUele")
 		public String orderMultiUele(OrderVo vo, Order dto, RedirectAttributes redirectAttributes) throws Exception {

 			service.uelete(dto);
 			redirectAttributes.addFlashAttribute("vo", vo);

 			return "redirect:/order/xdminOrderList";
 		}
 		
 		@RequestMapping(value = "orderMultiDele")
 		public String orderMultiDele(OrderVo vo, RedirectAttributes redirectAttributes) throws Exception {

 			service.delete(vo);
 			redirectAttributes.addFlashAttribute("vo", vo);

 			return "redirect:/order/xdminOrderList";
 		}
 		
// 		@RequestMapping(value = "memberUele")
// 		public String memberUele(OrderVo vo, Order dto, RedirectAttributes redirectAttributes) throws Exception {
//
// 			service.uelete(dto);
// 			redirectAttributes.addFlashAttribute("vo", vo);
//
// 			return "redirect:/order/xdminMemberList";
// 		}
// 		
// 		@RequestMapping(value = "memberDele")
// 		public String memberDele(OrderVo vo, RedirectAttributes redirectAttributes) throws Exception {
//
// 			service.delete(vo);
// 			redirectAttributes.addFlashAttribute("vo", vo);
//
// 			return "redirect:/order/xdminMemberList";
// 		}
 		
 		 // ------------------------ 삭제 e ------------------------
 	
    /* kakao pay s */
    @ResponseBody
    @RequestMapping(value="kakaopayReady")
    public KakaopayReady payReady (@ModelAttribute("dto") Order dto, Model model) throws Exception {
         
        KakaopayReady kakaopayReady = service.payReady(dto);
        model.addAttribute("tid", kakaopayReady.getTid());
        
        System.out.println("카카오페이이이이" + kakaopayReady.getNext_redirect_pc_url());
        System.out.println("tid??" + kakaopayReady.getTid());
        
        return kakaopayReady;
    }
    
//    @RequestMapping(value="kakaopayApproval")
//    public String payCompleted(@RequestParam("pg_token") String pgToken, @ModelAttribute("tid") String tid,  @ModelAttribute("dto") Order dto,  Model model, HttpSession httpSession,  Menu mDto) throws Exception {
//        
//        // 카카오 결제 요청하기
//        KakaoPayApproval kakaoPayApproval = service.payApprove(tid, pgToken, dto);
//        
//        ObjectMapper objectMapper = new ObjectMapper();
//        Map<String, Object> map = objectMapper.convertValue(kakaoPayApproval, Map.class);
//        
//        for(String key : map.keySet()) {
//            String value = String.valueOf(map.get(key));
//            System.out.println("[key]: " + key + ", [value]: " + value);
//        }
//        
//        Map<String, Object> amount = new HashMap<String, Object>();
//        amount = (Map<String, Object>) map.get("amount");
//        
//        for (String key : amount.keySet()) {
//            String value = String.valueOf(amount.get(key));
//            System.out.println("[key]: " + key + ", [value]: " + value);
//        }
//        
//        dto.setIfmnName(map.get("item_name").toString());
//        dto.setTotalCount(Int amount.get("total"));
//        dto.setIfmmSeq((String)httpSession.getAttribute("sessSeq"));
//        
//        Booking booking = (Booking) httpSession.getAttribute("dtoBk");
//        
//        service.insertBooking(dto);
//        dto.setTdbkSeq(dto.getTdbkSeq());
//        
//        for(int i = 0; i < booking.getTdbsSeatNums().length; i++) {
//            dto.setTdbsSeatNum(booking.getTdbsSeatNums()[i]);
//            service.insertBookingSeat(dto);
//        }
//        
//        Booking result = service.selectListAfterPay(dto);
//        model.addAttribute("result", result);
//            
//        return "infra/booking/user/bookingResult";
//    }
    
    // 결제 취소시 실행 url
    @GetMapping("kakaopayCancel")
    public String payCancel() {
        return "redirect:/timetable/choiceMovie";
    }
    
    // 결제 실패시 실행 url        
    @GetMapping("/kakaopayFail")
    public String payFail() {
        return "redirect:/timetable/choiceMovie"; 
    }
    /* kakao pay e */
 	
}
