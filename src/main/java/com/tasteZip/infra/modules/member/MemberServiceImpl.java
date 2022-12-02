package com.tasteZip.infra.modules.member;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.tasteZip.infra.common.base.BaseServiceImpl;
import com.tasteZip.infra.common.constants.Constants;
import com.tasteZip.infra.common.util.UtilDateTime;
import com.tasteZip.infra.common.util.UtilRegMod;
import com.tasteZip.infra.common.util.UtilSecurity;
import com.tasteZip.infra.modules.chat.Chat;
import com.tasteZip.infra.modules.chat.KakaoFriends;

@Service
public class MemberServiceImpl extends BaseServiceImpl implements MemberService{

    @Autowired
    MemberDao dao;
    
    @Override
	public void setRegMod(Member dto) throws Exception {
		HttpServletRequest httpServletRequest = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		
		dto.setRegIp(UtilRegMod.getClientIp(httpServletRequest));
		dto.setRegSeq(UtilRegMod.getSessionSeq(httpServletRequest));
		dto.setRegDeviceCd(UtilRegMod.getDevice());
		dto.setRegDateTime(UtilDateTime.nowDate());
		
		dto.setModIp(UtilRegMod.getClientIp(httpServletRequest));
		dto.setModSeq(UtilRegMod.getSessionSeq(httpServletRequest));
		dto.setModDeviceCd(UtilRegMod.getDevice());
		dto.setModDateTime(UtilDateTime.nowDate());
	}
    
    @Override
    public List<Member> selectList(MemberVo vo) throws Exception {
        return dao.selecList(vo);
    }

    @Override
    public List<Member> selectListLimit5(MemberVo vo) throws Exception {
    	return dao.selectListLimit5(vo);
    }

    @Override
    public int selectOneCount(MemberVo vo) throws Exception {
        return dao.selectOneCount(vo);
    }
    
    @Override
	public int uelete(Member dto) throws Exception {
//		setRegMod(dto);
		return dao.uelete(dto);
	}
	
	@Override
	public int delete(MemberVo vo) throws Exception {
		return dao.delete(vo);
	}

    /* login s */
    @Override
    public Member loginCheck(Member dto) throws Exception {
        return dao.loginCheck(dto);
    }

    @Override
    public Member snsLoginCheck(Member dto) throws Exception {
        return dao.snsLoginCheck(dto);
    }

    @Override
    public Member xdminLoginCheck(Member dto) throws Exception {
        return dao.xdminLoginCheck(dto);
    }
    /* login e */

    /* insert & update */
    @Override
    public int memberInst(Member dto) throws Exception {
        try {
            dto.setIfmmPwd(UtilSecurity.encryptSha256(dto.getIfmmPwd()));
            dao.memberInst(dto);
            uploadFiles(dto.getProfileImage(), dto, "memberUploaded", 0);
            return 1;
        } catch (Exception e) {
            throw new Exception();
        }
    }

    @Override
    public int memberUpdt(Member dto) throws Exception {
        return dao.memberUpdt(dto);
    }
    
    @Override
    public int mypageUpdt(Member dto) throws Exception {
        return dao.mypageUpdt(dto);
    }

    /* code list */
    @Override
    public List<Member> codeGender(Member dto) throws Exception {
        return dao.codeGender(dto);
    }

    @Override
    public List<Member> codeRadio(Member dto) throws Exception {
        return dao.codeRadio(dto);
    }
    
    // selectOne
    @Override
	public Member selectOne(MemberVo vo) throws Exception{
    	return dao.selectOne(vo);
	}
    
    @Override
	public Member selectImg(MemberVo vo) throws Exception{
    	return dao.selectImg(vo);
	}
    
    /* image upload s */
    @Override
    public void uploadFiles(MultipartFile[] multipartFiles, Member dto, String tableName, int type) throws Exception {
        
        for(int j=0; j < multipartFiles.length; j++) {
                
            if(!multipartFiles[j].isEmpty()) {
            
                String className = dto.getClass().getSimpleName().toString().toLowerCase();     
                String fileName = multipartFiles[j].getOriginalFilename();
                String ext = fileName.substring(fileName.lastIndexOf(".") + 1);
                String uuid = UUID.randomUUID().toString();
                String uuidFileName = uuid + "." + ext;
                String pathModule = className;
                String nowString = UtilDateTime.nowString();
                String pathDate = nowString.substring(0,4) + "/" + nowString.substring(5,7) + "/" + nowString.substring(8,10); 
                String path = Constants.UPLOAD_PATH_PREFIX + "/" + pathModule + "/" + pathDate + "/";
                //String path = Constants.UPLOAD_PATH_PREFIX_LINUX + "/" + pathModule + "/" + pathDate + "/";
                //String path = Constants.UPLOAD_PATH_PREFIX_MAC + "/" + pathModule + "/" + pathDate + "/";
                //String path = Constants.UPLOAD_PATH_PREFIX_SERVER + "/" + pathModule + "/" + pathDate + "/";

                String pathForView = Constants.UPLOAD_PATH_PREFIX_FOR_VIEW + "/" + pathModule + "/" + pathDate + "/";
                
                System.out.println("path: " + path);
                
                File uploadPath = new File(path);
                
                if (!uploadPath.exists()) {
                    uploadPath.mkdir();
                } else {
                    // by pass
                }
                  
                multipartFiles[j].transferTo(new File(path + uuidFileName));
                
                dto.setPath(pathForView);
                dto.setOriginalName(fileName);
                dto.setUuidName(uuidFileName);
                dto.setExt(ext);
                dto.setSize(multipartFiles[j].getSize());
                
                dto.setTableName(tableName);
                dto.setType(type);
                dto.setDefaultNy(j == 0 ? 1 : 0);
                dto.setSort(j + 1);
                dto.setPseq(dto.getIfmmSeq());

                dao.insertUploaded(dto);
                j++;
            }
        }
    }
    
    @Override
    public void deleteFiles(String[] deleteSeq, String[] deletePathFile, Member dto, String tableName) throws Exception{
        
        for (int i=0; i<deleteSeq.length; i++) {
            File file = new File(Constants.UPLOAD_PATH_PREFIX_EXTERNAL + deletePathFile[i]);
            boolean result = file.delete();
            
            if(result) {
                dto.setSeq(deleteSeq[i]);
                dto.setTableName(tableName);
                dao.deleteUploaded(dto);
            }
        }
    }
    
    @Override
    public void ueleteFiles(String[] deleteSeq, String[] deletePathFile, Member dto, String tableName) throws Exception{
        
        for (int i=0; i<deleteSeq.length; i++) {
//          File file = new File(Constants.UPLOAD_PATH_PREFIX_EXTERNAL + deletePathFile[i]);
//          boolean result = file.delete();
            
//          if(result) {
                dto.setSeq(deleteSeq[i]);
                dto.setTableName(tableName);
                dao.ueleteUploaded(dto);
//          }
        }
    }
    /* image upload e */

    /* sns insert s */
    @Override
    public int snsInst(Member dto) throws Exception {
        return dao.snsInst(dto);
    }
    /* sns insert e */
    
 // id 중복체크 
 	@Override
 	public int idCheck(Member dto) {
 		return dao.idCheck(dto);
 	}
 	
 // header() 셋팅
    private HttpHeaders getHeaders(HttpServletRequest request) throws Exception {
        
        Cookie[] cookies = request.getCookies();
        String b = null;
        for (Cookie cookie: cookies) {
            System.out.println("여기?");
            if (cookie.getName().equals("kakaoToken")) {
                System.out.println("Name : " + cookie.getName());
                b = cookie.getValue();
            }
        }
        b = b.replace(":", " ");
        System.out.println("access Token : "+b);
        
        HttpHeaders headers = new HttpHeaders();
        
        return headers;
    }
    
  //결제준비
    public KakaoFriends addReady(Chat dto, HttpServletRequest req) throws Exception {
        
        MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
        
        HttpEntity<MultiValueMap<String, String>> body  = new HttpEntity<MultiValueMap<String, String>>(params, this.getHeaders(req));
        // 외부url요청 통로 열기.
        RestTemplate template = new RestTemplate();
        String url = "https://kapi.kakao.com/v1/api/talk/friends";
        // template으로 값을 보내고 받아온 ReadyResponse값 readyResponse에 저장.
        KakaoFriends KakaoFriends = template.postForObject(url, body, KakaoFriends.class);
        
        return KakaoFriends;
    }
    
    //find id & pwd
    @Override
    public Member findId(Member dto) throws Exception {
        
        Member id = dao.findId(dto);
        System.out.println("id : " + id.getIfmmId());
        
        String myId = id.getIfmmId().substring(0, id.getIfmmId().length()-3);
        int starLength = id.getIfmmId().length()- myId.length();
        
        for (int i=0; i<starLength; i++) {
            myId += "*";
        }
        
        dto.setIfmmId(myId);
        
        return dto;
    }

    @Override
    public int findPwd(Member dto) throws Exception {
        return dao.findPwd(dto);
    }

    @Override
    public int changePwd(Member dto) throws Exception {
        dto.setIfmmPwd(UtilSecurity.encryptSha256(dto.getIfmmPwd()));
        return dao.changePwd(dto);
    }
}
