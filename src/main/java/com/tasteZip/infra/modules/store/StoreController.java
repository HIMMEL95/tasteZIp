package com.tasteZip.infra.modules.store;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/store/")
public class StoreController {
	
	
	//관리자 스토어
	
	@RequestMapping(value = "xdminStoreList")
	public String xdminStoreList() throws Exception {
	    return "infra/xdmin/store/storeList";
	}
	
	@RequestMapping(value = "xdminStoreForm")
	public String storeForm() throws Exception {
	    return "infra/xdmin/store/storeForm";
	}
	
	@RequestMapping(value = "storeList")
	public String storeList() throws Exception {
	    return "infra/main/store/store";
	}
	
}
