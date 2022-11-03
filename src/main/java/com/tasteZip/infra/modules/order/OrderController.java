package com.tasteZip.infra.modules.order;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/order/")
public class OrderController {
	
	@Autowired
	OrderServiceImpl service;
	
	@RequestMapping(value = "orderList")
	public String orderList() throws Exception {
	    return "infra/xdmin/order/orderList";
	}
	
    @RequestMapping(value = "mypageOrder")
    public String mypageOrder(@ModelAttribute("vo") OrderVo vo, Model model) throws Exception {
    	
		vo.setParamsPaging2(service.selectOneCount(vo));
		
		List<Order> list = service.myOrder(vo);
		model.addAttribute("list", list); 
		
        return "infra/main/mypage/mypageOrder";
    }

    @RequestMapping(value = "menuOrder")
    public String menuOrder() throws Exception {
    	return "infra/main/order/menuOrder";
    }
    
    @RequestMapping(value = "mypageOrderView")
    public String mypageOrderView(@ModelAttribute("vo") OrderVo vo, Model model) throws Exception {
    	
		Order item = service.selectOne(vo);
		model.addAttribute("item", item);
    	
        return "infra/main/mypage/mypageOrderView";
    }
	
}
