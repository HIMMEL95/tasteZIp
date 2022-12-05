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


@Controller
@RequestMapping(value = "/mypage/")
public class MypageController {
	
	@Autowired
	MypageServiceImpl service;
	
	@Autowired
    MemberServiceImpl mService;
	
	// 메인	
	@RequestMapping(value = "mypageMain")
	public String mypageMain(MemberVo vo, Model model, HttpSession httpSession) throws Exception {
		
		String seq = (String) httpSession.getAttribute("sessSeq");
		vo.setIfmmSeq(seq);
		
		Member itemImg = mService.selectImg(vo);
		model.addAttribute("itemImg", itemImg);
		
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

}
