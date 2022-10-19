package com.tasteZip.infra.modules.store;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/store/")
public class StoreController {
	
	
	//관리자 스토어
	
	
	// 오너 스토어
	
	@RequestMapping(value = "ownerStoreList")
	public String storeList() throws Exception {
	    return "infra/owner/store/storeList";
	}
	
	@RequestMapping(value = "ownerStoreForm")
	public String storeForm() throws Exception {
	    return "infra/owner/store/storeForm";
	}
	
}
