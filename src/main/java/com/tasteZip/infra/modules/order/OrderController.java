package com.tasteZip.infra.modules.order;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/order/")
public class OrderController {
	
	@RequestMapping(value = "orderList")
	public String orderList() throws Exception {
	    return "infra/owner/order/orderList";
	}
	
}
