package com.tasteZip.infra.modules.login;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tasteZip.infra.modules.member.MemberVo;
import com.tasteZip.infra.common.constants.Constants;
import com.tasteZip.infra.common.util.UtilSecurity;
import com.tasteZip.infra.modules.member.Member;
import com.tasteZip.infra.modules.member.MemberServiceImpl;

@Controller
public class LoginController {

    @Autowired
    MemberServiceImpl service;
    
    @RequestMapping(value = "signUpInst") 
    public String signUpInst(Member dto, MemberVo vo) throws Exception {
        service.memberInst(dto);
        return "redirect:/login";
    }
    
    @ResponseBody
    @RequestMapping(value = "loginCheck")
    public Map<String, Object> loginCheck(Member dto, HttpSession httpSession) throws Exception {
        Map<String, Object> returnMap = new HashMap<String, Object>();
        
        dto.setIfmmPwd(UtilSecurity.encryptSha256(dto.getIfmmPwd()));
        Member result = service.loginCheck(dto);
        
        if (result != null) {
            
            httpSession.setMaxInactiveInterval(60 * Constants.SESSION_MINUTE); // 60second * 30 = 30minute
            httpSession.setAttribute("sessSeq", result.getIfmmSeq());
            httpSession.setAttribute("sessId", result.getIfmmId());
            httpSession.setAttribute("sessName", result.getIfmmName());
            httpSession.setAttribute("sessEmail", result.getIfmmEmail());
            httpSession.setAttribute("sessUser", result.getIfmmUserDiv());
            httpSession.setAttribute("sessSns", result.getIfmmSnsDiv());
            httpSession.setAttribute("sessImg", result.getIfmmSnsImg());
    
            returnMap.put("rt", "success");
        } else {
            returnMap.put("rt", "fail");
        }
        return returnMap;
    }
    
    @ResponseBody
    @RequestMapping(value = "logoutProc")
    public Map<String, Object> logoutProc(HttpSession httpSession) throws Exception {
        Map<String, Object> returnMap = new HashMap<String, Object>();
        
        String sns = httpSession.getAttribute("sessSns").toString();
        System.out.println("test : " + sns);
        
        if (sns.equals("1")) {
            System.out.println("네이버 로그아웃 왜 안됨?");
            httpSession.invalidate();
            returnMap.put("rt", "naver");
        } else {
            httpSession.invalidate();
            returnMap.put("rt", "success");
        }

        return returnMap;
    }
}

