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
            httpSession.setAttribute("sessPhone", result.getIfmmPhone());
    
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
        
        httpSession.invalidate();
        returnMap.put("rt", "success");

        return returnMap;
    }
    
    
    @RequestMapping(value = "findId")
	public String findId() throws Exception {
		return "infra/main/user/findId";
	}
	
    @ResponseBody
    @RequestMapping(value = "findID")
    public Map<String, Object> findID(Member dto) throws Exception {
        Map<String, Object> returnMap = new HashMap<String, Object>();
        
        Member id = service.findId(dto);

        if (id != null) {
            returnMap.put("rt", "success");
            returnMap.put("id", id);
        } else {
            returnMap.put("rt", "fail");
        }
        
        return returnMap;
    }
    
    @ResponseBody
    @RequestMapping(value = "findPwd")
    public Map<String, Object> findPwd(Member dto) throws Exception {
        Map<String, Object> returnMap = new HashMap<String, Object >();
        
        int pwd = service.findPwd(dto);
        
        if (pwd == 1) {
            returnMap.put("rt", "success");
        } else {
            returnMap.put("rt", "fail");
        }
        
        return returnMap;
    }
    
    @ResponseBody
    @RequestMapping(value = "changePwd")
    public Map<String, Object> changePwd(Member dto) throws Exception {
        Map<String, Object> returnMap = new HashMap<String, Object>();
        
        int pwd = service.findPwd(dto);
        
        if (pwd == 1) {
            returnMap.put("rt", "success");
            service.changePwd(dto);
        } else {
            returnMap.put("rt", "fail");
        }
        
        return returnMap;
    }
}

