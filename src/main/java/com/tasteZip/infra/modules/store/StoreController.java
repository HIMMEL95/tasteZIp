package com.tasteZip.infra.modules.store;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/store/")
public class StoreController {
	
	@Autowired
	StoreServiceImpl service;
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
	public String storeList(StoreVo vo, Model model) throws Exception {
	    
	    vo.setParamsPaging(service.selectOneCount(vo));
	    List<Store> list = service.selectList(vo);
	    model.addAttribute("list", list);
	    
	    return "infra/main/store/store";
	}
	
}
