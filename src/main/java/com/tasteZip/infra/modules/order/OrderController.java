package com.tasteZip.infra.modules.order;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tasteZip.infra.modules.menu.Menu;
import com.tasteZip.infra.modules.menu.MenuServiceImpl;
import com.tasteZip.infra.modules.menu.MenuVo;

@Controller
@RequestMapping(value = "/order/")
public class OrderController {
	
	@Autowired
	OrderServiceImpl service;
	@Autowired
	MenuServiceImpl mService;
	
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
    public String cartOrder(MenuVo vo, Menu dto, Model model) throws Exception {
        
        List<Menu> list = mService.selectCart(vo, dto);
        model.addAttribute("list", list);
        
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
    
}
