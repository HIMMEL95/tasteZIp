package com.tasteZip.infra.modules.chat;
//본인에게 맞는 package로 변경하도록 합니다.

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

@Service
public class ChatServiceImpl implements ChatService{

	@Autowired
	ChatDao dao;

	@Override
	public List<Chat> selectChatListFromOne(Integer seq) throws Exception {
		// TODO Auto-generated method stub
		List<Chat> resultList = new ArrayList<Chat>();

		//현재 로그인한 USER의 seq를 이용해 채팅방 LIST를 불러온 뒤 반복문 실행
		for(Chat chatRoom : dao.selectChatListFromOne(seq)) { 
			
			//채팅방 리스트에서 로그인한 USER의 시퀀스를 제외하고 검색하기 위해 넣어주는 과정
			chatRoom.setCuMember(seq); 
			
			//채팅방 리스트를 가져온 뒤 해당 채팅방에 연결된 USER(로그인한 USER가 아닌)의 시퀀스 추출
			Chat resultRoom = dao.selectChatWithoutLoginUser(chatRoom);
			
			//채팅방 번호 + 채팅 상대 시퀀스가 담긴 DTO를 리스트에 추가
			resultList.add(resultRoom);
		}
		
		//리스트 리턴
		return resultList;
	}

	@Override
	public Chat createChat(int chatUserA, int chatUserB) throws Exception {
		// TODO Auto-generated method stub
		Chat dto = new Chat();
		dao.insertChat(dto);
		
		dto.setCuMember(chatUserA);
		dao.insertChatUser(dto);
		
		dto.setCuMember(chatUserB);
		dao.insertChatUser(dto);
		
		return dao.selectOneChat(dto);
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
    public KakaoFriends friendReady(Chat dto, HttpServletRequest req) throws Exception {
        
        MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
        
        HttpEntity<MultiValueMap<String, String>> body  = new HttpEntity<MultiValueMap<String, String>>(params, this.getHeaders(req));
        // 외부url요청 통로 열기.
        RestTemplate template = new RestTemplate();
        String url = "https://kapi.kakao.com/v1/api/talk/friends?friend_order=favorite&limit=100&order=asc";
        // template으로 값을 보내고 받아온 ReadyResponse값 readyResponse에 저장.
        KakaoFriends KakaoFriends = template.postForObject(url, body, KakaoFriends.class);
        
        return KakaoFriends;
    }
    
}