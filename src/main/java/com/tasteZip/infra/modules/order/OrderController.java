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

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tasteZip.infra.modules.member.Member;
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
    public String cartOrder(MenuVo vo, Menu dto, StoreVo sVo, Model model) throws Exception {
    	
    	
        
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
 	
    /* kakao pay s */
 	@ResponseBody
 	@RequestMapping(value = "kakaoPay")
 	public String kakaoPay(Member dto, Menu mDto, Store sDto) throws Exception {
 	   URL url = new URL("https://kapi.kakao.com/v1/payment/ready");
       HttpURLConnection conn = (HttpURLConnection) url.openConnection();
       conn.setRequestMethod("POST");
       conn.setRequestProperty("Authorization", "KakaoAK a78fdb6c8a4f829868eb0fac06685e81");
       conn.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
       conn.setDoOutput(true);
       // OutputStream으로 POST 데이터를 넘겨주겠다는 옵션.
       conn.setDoInput(true);
       // InputStream으로 서버로 부터 응답을 받겠다는 옵션.
       Map<String, String> params = new HashMap<String, String>();
       params.put("cid", "TC0ONETIME");
       params.put("partner_order_id", sDto.getIfstName());
       System.out.println("order_id : " + sDto.getIfstName());
       params.put("partner_user_id", dto.getIfmmId());
       System.out.println("user_id : " + dto.getIfmmId());
       params.put("item_name", dto.getIfmmName());
       System.out.println("name : " + dto.getIfmmName());
       params.put("quantity", "1");
       params.put("total_amount", mDto.getTotalPrice().toString());
       params.put("tax_free_amount", "0");
       params.put("approval_url", "http://localhost:8080/purchase/approve");
       params.put("cancel_url", "http://localhost:8080/purchase/selectPayment");
       params.put("fail_url", "http://localhost:8080/purchase/selectPayment");
       
       String string_params = new String();
       for (Map.Entry<String, String> elem : params.entrySet()) {
           string_params += (elem.getKey() + "=" + elem.getValue() + "&");
       }
       OutputStream give = conn.getOutputStream();
       // Request Body에 Data를 담기위해 OutputStream 객체를 생성.
       
       DataOutputStream datagiven = new DataOutputStream(give);
       //데이터의 정보를 출력하는 객체
       
       datagiven.write(string_params.getBytes());
       // Request Body에 Data 셋팅.
       
       datagiven.close(); 
       // OutputStream 종료.

       int result = conn.getResponseCode();
       // 실제 서버로 Request 요청 하는 부분. (응답 코드를 받는다. 200 성공, 나머지 에러)
       BufferedReader changer;
       if (result == 200) {
           changer = new BufferedReader((new InputStreamReader(conn.getInputStream())));
           //결과 받아서 저장
       } else {
           changer = new BufferedReader((new InputStreamReader(conn.getErrorStream())));
       }
       
       System.out.println(changer.readLine());
      
       return changer.readLine();
 	}
 	/* kakao pay e */
    
}
