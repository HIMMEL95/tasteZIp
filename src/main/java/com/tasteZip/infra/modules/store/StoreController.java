package com.tasteZip.infra.modules.store;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/store/")
public class StoreController {
	
	@RequestMapping(value = "storeList")
	public String storeList() throws Exception {
	    return "infra/owner/store/storeList";
	}
	
	@RequestMapping(value = "storeForm")
	public String storeForm() throws Exception {
	    return "infra/owner/store/storeForm";
	}
	
}
