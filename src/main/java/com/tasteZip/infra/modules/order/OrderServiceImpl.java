package com.tasteZip.infra.modules.order;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

@Service
public class OrderServiceImpl implements OrderService{
	
	@Autowired
	OrderDao dao;
	private String order_id;
	private String user_id;
	
	 @Override
	public int uelete(Order dto) throws Exception {
		return dao.uelete(dto);
	}
	
	@Override
	public int delete(OrderVo vo) throws Exception {
		return dao.delete(vo);
	}

	@Override
	public List<Order> myOrder(OrderVo vo) throws Exception {
		List<Order> list = dao.myOrder(vo);
		return list;
	}
	
	@Override
	public List<Order> myOrderMain(OrderVo vo) throws Exception {
		List<Order> list = dao.myOrderMain(vo);
		return list;
	}
	
	// xdmin selectList
	@Override
	public List<Order> xdminSelectList(OrderVo vo) throws Exception {
		List<Order> list = dao.xdminSelectList(vo);
		return list;
	}
	
	@Override
	public int xdminSelectOneCount(OrderVo vo) throws Exception {
		return dao.xdminSelectOneCount(vo);
	}
	
	@Override
	public List<Order> selectList(OrderVo vo) throws Exception {
		List<Order> list = dao.selectList(vo);
		return list;
	}
	
	//selectOne count
	@Override
	public int selectOneCount(OrderVo vo) throws Exception {
		return dao.selectOneCount(vo);
	}
	
	
	// selectOne
	@Override
	public Order selectOne(OrderVo vo) throws Exception {
		return dao.selectOne(vo);
	}
	
	@Override
    public List<Order> myPageViewMenu(OrderVo vo) throws Exception {
        return dao.myPageViewMenu(vo);
    }

    // uelete List
	@Override
	public int ueleteList(String iforSeq) throws Exception {
		return dao.ueleteList(iforSeq);
	}
	
	@Override
	public int insertBuy(Order dto) throws Exception {
	    return dao.insertBuy(dto);
	}
	
    @Override
    public int insertOrder(Order dto) throws Exception {
        return dao.insertOrder(dto);
    }
    
    @Override
    public Order payFin(OrderVo vo) throws Exception {
        return dao.payFin(vo);
    }

    @Override
    public int myOrderCount(OrderVo vo) throws Exception {
        return dao.myOrderCount(vo);
    }

    /* kakaoPay s */
    // header() 셋팅
    private HttpHeaders getHeaders() throws Exception {
        
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", "KakaoAK a78fdb6c8a4f829868eb0fac06685e81");
        headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
        
        return headers;
    }
    
    //결제준비
    public KakaoPay payReady(Order dto) throws Exception {
        
        MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
        order_id = dto.getIfstName();
        user_id = dto.getIfmmName();
        System.out.println("totalCount : " + dto.getTotalCount());
        params.add("cid", "TC0ONETIME");
        params.add("partner_order_id", dto.getIfstName());
        params.add("partner_user_id", dto.getIfmmName());
        params.add("item_name", dto.getIfmnName());
        params.add("quantity", dto.getTotalCount().toString());
        params.add("total_amount", dto.getTotalPrice().toString());
        params.add("tax_free_amount", "0");
        params.add("approval_url", "http://13.209.12.239:8082/order/kakaopayApproval");
        params.add("cancel_url", "http://13.209.12.239:8082/order/cartOrder");
        params.add("fail_url", "http://13.209.12.239:8082/order/cartOrder");
        
//        params.add("approval_url", "http://localhost:8082/order/kakaopayApproval");
//        params.add("cancel_url", "http://localhost:8082/order/cartOrder");
//        params.add("fail_url", "http://localhost:8082/order/cartOrder");
                 
        HttpEntity<MultiValueMap<String, String>> body  = new HttpEntity<MultiValueMap<String, String>>(params, this.getHeaders());
        // 외부url요청 통로 열기.
        RestTemplate template = new RestTemplate();
        String url = "https://kapi.kakao.com/v1/payment/ready";
        // template으로 값을 보내고 받아온 ReadyResponse값 readyResponse에 저장.
        KakaoPay KakaopayReady = template.postForObject(url, body, KakaoPay.class);
        
        return KakaopayReady;
    }

    //결제승인
    public KakaoPay payApprove(String tid, String pgToken, Order dto) throws Exception  {
        
        // request값 담기.
        MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
        params.add("cid", "TC0ONETIME");
        params.add("tid", tid);
        params.add("partner_order_id", order_id); // 주문명
        params.add("partner_user_id", user_id);
        params.add("pg_token", pgToken);
        
        // 하나의 map안에 header와 parameter값을 담아줌.
        HttpEntity<MultiValueMap<String, String>> requestEntity = new HttpEntity<>(params, this.getHeaders());
        
        // 외부url 통신
        RestTemplate template = new RestTemplate();
        String url = "https://kapi.kakao.com/v1/payment/approve";
        // 보낼 외부 url, 요청 메시지(header,parameter), 처리후 값을 받아올 클래스. 
        KakaoPay KakaoPayApproval = template.postForObject(url, requestEntity, KakaoPay.class);
        
        return KakaoPayApproval;

    }
	/* kakaoPay e */

}
