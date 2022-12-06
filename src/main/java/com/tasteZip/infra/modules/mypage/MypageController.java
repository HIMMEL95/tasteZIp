package com.tasteZip.infra.modules.mypage;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tasteZip.infra.modules.member.Member;
import com.tasteZip.infra.modules.member.MemberServiceImpl;
import com.tasteZip.infra.modules.member.MemberVo;
import com.tasteZip.infra.modules.order.Order;
import com.tasteZip.infra.modules.order.OrderServiceImpl;
import com.tasteZip.infra.modules.order.OrderVo;
import com.tasteZip.infra.modules.store.Store;
import com.tasteZip.infra.modules.store.StoreServiceImpl;
import com.tasteZip.infra.modules.store.StoreVo;


@Controller
@RequestMapping(value = "/mypage/")
public class MypageController {
	
	@Autowired
	MypageServiceImpl service;
	
	@Autowired
    MemberServiceImpl mService;
	
	@Autowired
    StoreServiceImpl sService;

	@Autowired
	OrderServiceImpl oService;
	
	// 메인	
	@RequestMapping(value = "mypageMain")
	public String mypageMain(@ModelAttribute("vo")MemberVo vo, Model model, OrderVo ovo, HttpSession httpSession) throws Exception {
		
		String seq = (String) httpSession.getAttribute("sessSeq");
		vo.setIfmmSeq(seq);
		
		Member itemImg = mService.selectImg(vo);
		model.addAttribute("itemImg", itemImg);
		
		ovo.setParamsPaging(oService.myOrderCount(ovo));
		
		List<Order> list = oService.myOrderMain(ovo);
		model.addAttribute("list", list);
		
	    return "infra/main/mypage/mypageMain";
	}

	@RequestMapping(value = "mypageBucket")
	public String mypageBucket(@ModelAttribute("vo") MypageVo vo, Mypage dto, Model model, HttpSession httpSession) throws Exception {
		
		String seq = httpSession.getAttribute("sessSeq").toString();
		vo.setIfmmSeq(seq);
		
		List<Mypage> list = service.bucketList(vo);
		model.addAttribute("list", list);
		
		return "infra/main/mypage/mypageBucket";
	}
	
	
	 @RequestMapping(value = "mypageFavorite") 
     public String mypageFavorite(@ModelAttribute("vo") StoreVo vo, Store dto, MemberVo mvo, Model model, HttpSession httpSession) throws Exception {
         
    	try {
			String seq = (String) httpSession.getAttribute("sessSeq");
			vo.setIfmmSeq(seq);
		} catch (Exception e) {
		}
    	 
    	vo.setParamsPaging(sService.selectOneCountFv(vo));
    	
    	String seq = (String) httpSession.getAttribute("sessSeq");
    	mvo.setIfmmSeq(seq);
    	
    	Member itemImg = mService.selectImg(mvo);
		model.addAttribute("itemImg", itemImg);
    	
    	List<Store> favorite = sService.selectListFv(vo);
 	    model.addAttribute("favorite", favorite); 
 	    
    	return "infra/main/mypage/mypageFavorite";
    }

}
