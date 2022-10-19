package com.tasteZip.infra.modules.store;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/store/")
public class StoreController {
	
	
	//관리자 스토어
	
	@RequestMapping(value = "xdminStoreList")
	public String storeList() throws Exception {
	    return "infra/xdmin/store/storeList";
	}
	
	@RequestMapping(value = "xdminStoreForm")
	public String storeForm() throws Exception {
	    return "infra/xdmin/store/storeForm";
	}
	
	// 오너 스토어
	
	@RequestMapping(value = "ownerStoreList")
	public String ownerStoreList() throws Exception {
	    return "infra/owner/store/ownerStoreList";
	}
	
	@RequestMapping(value = "ownerStoreForm")
	public String ownerStoreForm() throws Exception {
	    return "infra/owner/store/ownerStoreForm";
	}
	
}
