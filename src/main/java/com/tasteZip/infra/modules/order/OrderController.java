package com.tasteZip.infra.modules.order;

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
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.tasteZip.infra.common.util.UtilDateTime;
import com.tasteZip.infra.modules.member.Member;
import com.tasteZip.infra.modules.member.MemberServiceImpl;
import com.tasteZip.infra.modules.member.MemberVo;
import com.tasteZip.infra.modules.menu.Menu;
import com.tasteZip.infra.modules.menu.MenuServiceImpl;
import com.tasteZip.infra.modules.menu.MenuVo;
import com.tasteZip.infra.modules.store.Store;
import com.tasteZip.infra.modules.store.StoreServiceImpl;
import com.tasteZip.infra.modules.store.StoreVo;

@Controller
@RequestMapping(value = "/order/")
@SessionAttributes({"tid"})
public class OrderController {
	
	@Autowired
	OrderServiceImpl service;
	@Autowired
	MenuServiceImpl mService;
	@Autowired
	StoreServiceImpl sService;
	@Autowired 
	MemberServiceImpl mbService;
	
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
    public String mypageOrder(@ModelAttribute("vo") OrderVo vo, Model model, MemberVo mVo, HttpSession httpSession) throws Exception {
    	
    	String seq = httpSession.getAttribute("sessSeq").toString();
		vo.setIfmmSeq(seq);
		
		vo.setParamsPaging(service.myOrderCount(vo));
		
		List<Order> list = service.myOrder(vo);
		model.addAttribute("list", list); 
		
		mVo.setIfmmSeq(seq);
		Member itemImg = mbService.selectImg(mVo);
        model.addAttribute("itemImg", itemImg);
		
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
    public String mypageOrderView(Order dto, OrderVo vo, HttpSession httpSession, MemberVo mVo, Model model) throws Exception {
        
        vo.setIforSeq(dto.getIforSeq());

        String seq = httpSession.getAttribute("sessSeq").toString();
        vo.setIfmmSeq(seq);
        
        Order item = service.selectOne(vo);
        model.addAttribute("item", item);
        
        List<Order> list = service.myPageViewMenu(vo);
        model.addAttribute("list", list);
        
        mVo.setIfmmSeq(seq);
        Member itemImg = mbService.selectImg(mVo);
        model.addAttribute("itemImg", itemImg);
        
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
    public KakaoPay payReady (@ModelAttribute("dtoBk") Order dto, Model model) throws Exception {
         
        KakaoPay kakaopayReady = service.payReady(dto);
        model.addAttribute("tid", kakaopayReady.getTid());
        
        System.out.println("카카오페이이이이" + kakaopayReady.getNext_redirect_pc_url());
        System.out.println("tid??" + kakaopayReady.getTid());
        
        return kakaopayReady;
    }
    
    @RequestMapping(value="kakaopayApproval")
    public String payCompleted(@RequestParam("pg_token") String pgToken, @ModelAttribute("tid") String tid,  @ModelAttribute("dtoBk") Order dto, OrderVo vo, MemberVo mVo, Model model, HttpSession httpSession, HttpServletRequest request, HttpServletResponse response) throws Exception {
        
        KakaoPay kakaoPayApproval = service.payApprove(tid, pgToken, dto);
        // kakao approve
        //return된 객체를 map에 매핑
        ObjectMapper objectMapper = new ObjectMapper();
        Map<String, Object> map = objectMapper.convertValue(kakaoPayApproval, Map.class);
        
        for(String key : map.keySet()) {
            String value = String.valueOf(map.get(key));
            System.out.println("[key]: " + key + ", [value]: " + value);
        }
        
        System.out.println("name : " + dto.getIfmnName());
        System.out.println("price : " + dto.getTotalPrice());
        System.out.println("count : " + dto.getTotalCount());
        System.out.println("seq : " + dto.getIfmmSeq());
        
        Map<String, Object> amount = new HashMap<String, Object>();
        amount = (Map<String, Object>) map.get("amount");
        
        for (String key : amount.keySet()) {
            String value = String.valueOf(amount.get(key));
            System.out.println("[key]: " + key + ", [value]: " + value);
        }
        
        //결제 후 db에 insert
        //dto 에 받아온 정보  set
        dto.setIfmnName(map.get("item_name").toString());
        dto.setIfbyPrice((int) amount.get("total"));

        dto.setIfmmSeq((String) httpSession.getAttribute("sessSeq"));
        Order order = (Order) httpSession.getAttribute("dtoBk");
        dto.setIfbyPay(1);
        
        
        Cookie[] cookies = request.getCookies();
        String[] cart = null;
        String storeSeq = "";
        String[] count = null;
        String[] price = null;
        for (Cookie cookie: cookies) {
            if (cookie.getName().equals("cart")) {
                cart = cookie.getValue().split(":");
            }
            if (cookie.getName().equals("store")) {
                storeSeq = cookie.getValue();
            }
            if (cookie.getName().equals("count")) {
                count = cookie.getValue().split(":");
            }
            if (cookie.getName().equals("price")) {
                price = cookie.getValue().split(":");
            }
        }
        dto.setIforName(map.get("item_name").toString());
        dto.setIforPrice(amount.get("total").toString());
        dto.setIforCount(count.length);
        service.insertOrder(dto);
        dto.setIfstSeq(storeSeq);
        for (int i=0; i<cart.length; i++) {
            System.out.println("price" + price[i]);
            System.out.println("cnount" + count[i]);
            
            dto.setIfmnSeq(cart[i]);
            dto.setIfbyCount(Integer.parseInt(count[i]));
            dto.setIfbyPrice(Integer.parseInt(price[i]));
            service.insertBuy(dto);
        }
        
        Cookie cookie = new Cookie("cart", null);
        cookie.setPath("/");
        cookie.setMaxAge(0);
        cookie.setSecure(true);
        response.addCookie(cookie);
          
        Cookie store = new Cookie("store", null);
        store.setPath("/");
        store.setMaxAge(0);
        store.setSecure(true);
        response.addCookie(store);
          
        Cookie price1 = new Cookie("price", null);
        price1.setPath("/");
        price1.setMaxAge(0);
        price1.setSecure(true);
        response.addCookie(price1);
          
        Cookie count1 = new Cookie("count", null);
        count1.setPath("/");
        count1.setMaxAge(0);
        count1.setSecure(true);
        response.addCookie(count1);
 
        vo.setIforSeq(dto.getIforSeq());

        String seq = httpSession.getAttribute("sessSeq").toString();
        vo.setIfmmSeq(seq);
        
        Order item = service.payFin(vo);
        model.addAttribute("item", item);
        
        List<Order> list = service.myPageViewMenu(vo);
        model.addAttribute("list", list);
        
        mVo.setIfmmSeq(seq);
        Member itemImg = mbService.selectImg(mVo);
        model.addAttribute("itemImg", itemImg);
        
        return "infra/main/mypage/mypageOrderView";
    }
    
    // 결제 취소시 실행 url
    @GetMapping("kakaopayCancel")
    public String payCancel() {
        return "redirect:/order/cartOrder";
    }
    
    // 결제 실패시 실행 url        
    @GetMapping("/kakaopayFail")
    public String payFail() {
        return "redirect:/order/cartOrder"; 
    }
    /* kakao pay e */
 	
}
