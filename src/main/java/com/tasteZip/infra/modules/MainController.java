package com.tasteZip.infra.modules;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tasteZip.infra.common.constants.Constants;
import com.tasteZip.infra.modules.chat.ChatServiceImpl;
import com.tasteZip.infra.modules.findWay.FindWayVo;
import com.tasteZip.infra.modules.member.Member;
import com.tasteZip.infra.modules.member.MemberServiceImpl;
import com.tasteZip.infra.modules.member.MemberVo;
import com.tasteZip.infra.modules.menu.Menu;
import com.tasteZip.infra.modules.menu.MenuServiceImpl;
import com.tasteZip.infra.modules.menu.MenuVo;
import com.tasteZip.infra.modules.store.Store;
import com.tasteZip.infra.modules.store.StoreServiceImpl;
import com.tasteZip.infra.modules.store.StoreVo;

@Controller
public class MainController {
    
    @Autowired
    MenuServiceImpl mService;
    @Autowired
    MemberServiceImpl mbService;
    @Autowired
    StoreServiceImpl sService;
    @Autowired
    ChatServiceImpl cService;

    @RequestMapping(value = "/")
    public String MatZipMain() throws Exception {
        return "infra/main/main/main";
    }
    
    @RequestMapping(value = "tasteMain")
    public String tasteMain() throws Exception {
        return "infra/main/user/taste_main";
    }
    
    @RequestMapping(value = "login")
    public String login() throws Exception {
        return "infra/main/user/login";
    }
    
    @RequestMapping(value = "signUp")
    public String signUp(Member dto, Model model) throws Exception {
        return "infra/main/user/signUp";
    }
    
//    @RequestMapping(value = "storeMain")
//    public String storeMain() throws Exception {
//        return "infra/main/store/storeMain";
//    }
    
    @RequestMapping(value = "chat")
    public String chat() throws Exception {
        return "infra/main/chat/chat";
    }

    @RequestMapping(value = "chatPre")
    public String chatPre() throws Exception {
        return "infra/main/chat/chatPre";
    }
    
    @RequestMapping(value = "chatRoom")
    public String chatRoom() throws Exception {
        return "infra/main/chat/chatRoom";
    }
    
    @RequestMapping(value = "comment")
    public String comment() throws Exception {
        return "infra/main/comment/comment";
    }
    
    @RequestMapping(value = "story")
    public String story() throws Exception {
        return "infra/main/story/story";
    }
    
    @RequestMapping(value = "storyView")
    public String storyView() throws Exception {
        return "infra/main/story/storyView";
    }
    
    @RequestMapping(value = "favorite") 
    public String favorite() throws Exception {
        return "infra/main/favorite/favorite";
    }
    
    @RequestMapping(value = "reservation") 
    public String reservation() throws Exception {
        return "infra/main/reservation/reservation";
    }
    
    @RequestMapping(value = "findWay") 
    public String findWay(@ModelAttribute("vo") FindWayVo vo) throws Exception {
        return "infra/main/findWay/findWay";
    }
    
    @RequestMapping(value = "main") 
    public String main(@ModelAttribute("vo") MenuVo vo) throws Exception {
        return "infra/main/order/main";
    }
    
    @RequestMapping(value = "storeList") 
    public String storeList(@ModelAttribute("vo") StoreVo vo, Model model) throws Exception {
    	
    	vo.setParamsPaging(sService.selectOneCount(vo));
    	
    	List<Store> store = sService.storeList(vo);
    	model.addAttribute("store", store);
    	
        return "infra/main/store/storeList";
    }
    
    @RequestMapping(value = "menu")
    public String menu(MenuVo vo, Model model, StoreVo sVo) throws Exception {
        
        List<Menu> list = mService.selectList(vo);
        model.addAttribute("list", list);
        
        List<Menu> setDiv = mService.setDiv(vo);
        model.addAttribute("setDiv", setDiv);
        
        Store item = sService.xdminSelectOne(sVo);
        model.addAttribute("item", item);
        
        List<Store> img = sService.selectImg(sVo);
        model.addAttribute("img", img);
        
        return "infra/main/order/menu";
    }
    
    // ---------------- 관리자 ---------------------
    
    @RequestMapping(value = "xdminLogin")
    public String xdminLogin() throws Exception {
    	return "infra/xdmin/home/xdminLogin";
    }
    
    @RequestMapping(value = "xdminMain")
    public String xdminMain(MemberVo vo, Model model, StoreVo svo) throws Exception {
        
        vo.setParamsPaging(mbService.selectOneCount(vo));
        
        List<Member> list = mbService.selectListLimit5(vo);
        model.addAttribute("list", list);
        
//        Member item = mbService.selectListLimit5(vo);
//        model.addAttribute("item", item);
        
        return "infra/xdmin/home/xdminMain";
    }
    
    @RequestMapping(value = "xdminMainNewStore")
    public String xdminMainNewStore(Model model, StoreVo svo) throws Exception {
    	
    	svo.setParamsPaging(sService.xdminSelectOneCount(svo));
    	
    	List<Store> sList = sService.selectListLimit5(svo);
    	model.addAttribute("sList", sList);
    	
    	return "infra/xdmin/home/xdminMainNewStore";
    }
    
    /* sns login process s */
    @ResponseBody
    @RequestMapping(value = "snsLoginProc")
    public Map<String, Object> snsLoginProc(Member dto, HttpSession httpSession) throws Exception {
        Map<String, Object> returnMap = new HashMap<String, Object>();
        
        // id 값 있는지 체크 
        Member naverLogin = mbService.snsLoginCheck(dto);
        
        if (naverLogin == null) {
            mbService.snsInst(dto);
            
            httpSession.setMaxInactiveInterval(60 * Constants.SESSION_MINUTE); // 60second * 30 = 30minute
            //session(naver.getSeq(), naver.getId(), naver.getName(), naver.getEmail(), naver.getUser_div(), naver.getSnsImg(), naver.getSns_type(), httpSession);
            session(dto, httpSession);
            returnMap.put("rt", "success");
        } else {
            
            httpSession.setMaxInactiveInterval(60 * Constants.SESSION_MINUTE); // 60second * 30 = 30minute
            //session(naverLogin.getSeq(), naverLogin.getId(), naverLogin.getName(), naverLogin.getEmail(), naverLogin.getUser_div(), naverLogin.getSnsImg(), naverLogin.getSns_type(), httpSession);
            session(naverLogin, httpSession);
            returnMap.put("rt", "success");
        }
        return returnMap;
    }
    
     public void session(Member dto, HttpSession httpSession) {
         httpSession.setAttribute("sessSeq", dto.getIfmmSeq());    
         httpSession.setAttribute("sessId", dto.getIfmmId());
         httpSession.setAttribute("sessName", dto.getIfmmName());
         httpSession.setAttribute("sessEmail", dto.getIfmmEmail());
         httpSession.setAttribute("sessUser", dto.getIfmmUserDiv());
         httpSession.setAttribute("sessImg", dto.getIfmmSnsImg());
         httpSession.setAttribute("sessSns", dto.getIfmmSnsDiv());
     }
    /* sns login process e */
    
}