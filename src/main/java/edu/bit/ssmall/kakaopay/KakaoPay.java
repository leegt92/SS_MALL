package edu.bit.ssmall.kakaopay;

import java.net.URI;
import java.net.URISyntaxException;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

@Service
public class KakaoPay {
	
	private static final String HOST = "https://kapi.kakao.com"; //요청할 주소 이뒤에다가 붙여야함
    private static final String AK = "fac8c363d0d2fbef0740e61e40473f64"; //adminKey
    private KakaoPayReadyVO kakaoPayReadyVO;
    private KakaoPayApprovalVO kakaoPayApprovalVO;
    private KakaoPayCancelVO kakaoPayCancelVO;
    
    Random r = new Random();
    int code = r.nextInt(4589362) + 49311; //주문번호를 랜덤으로 해서 했음
    String order_id = Integer.toString(code);
    
    //결제 준비창 띄우는것
    public String kakaoPayReady(String p_name, String totalprice, String amount, String m_id, HttpServletRequest request) throws RestClientException, URISyntaxException {
 
    	System.out.println("-----------------------------"); 
    	System.out.println("kakaoPayReady 시작");
    	System.out.println("-----------------------------");
    	
    	RestTemplate restTemplate = new RestTemplate();
 
        // 서버로 요청할 Header(결제준비) admin_key나 access_token넣어야하는데 access_token넣을때는 앞에가 Bearer
        // Host: kapi.kakao.com
        // Authorization: KakaoAK {admin_key}
        // Content-type: application/x-www-form-urlencoded;charset=utf-8
        HttpHeaders headers = new HttpHeaders();         
        headers.add("Authorization", "KakaoAK " + AK);
        headers.add("Accept", MediaType.APPLICATION_JSON_VALUE);
        headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
       
       
        // 서버로 요청할 Body
        // 필수로 O 되있는것은 다해줘야함 
        MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
        params.add("cid", "TC0ONETIME"); //가맹점 코드 테스트라 TC0ONETIME
        params.add("partner_order_id", order_id); //가맹점 주문번호
        params.add("partner_user_id", m_id); //가맹점 회원아이디 
        params.add("item_name", p_name);	//구매할 상품명
        params.add("quantity", amount); //구매할 수량
        params.add("total_amount", totalprice); //구매할 총가격
        params.add("tax_free_amount", "0"); //상품 비과세 금액
        params.add("approval_url", "http://localhost:8282/ssmall/buy/kakaoPaySuccess"); //결제 성공시 url
        params.add("cancel_url", "http://localhost:8282/ssmall/buy/kakaoPayCancel"); //결제 취소시 url
        params.add("fail_url", "http://localhost:8282/ssmall/buy/kakaoPaySuccessFail"); //결제 실패시 url
 
        HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);
        //헤더와 바디를 합친다.
        
        restTemplate.setErrorHandler(new RestTemplateErrorHandler()); //400페이지 에러 안뜨게 할수있음 
        
		kakaoPayReadyVO = restTemplate.postForObject(new URI(HOST +"/v1/payment/ready"), body, KakaoPayReadyVO.class); 
		//https://kapi.kakao.com/v1/payment/ready에 위에입력한거를 넣고 response는KakaoPayReadyVO.class로 받겠다.

		System.out.println(kakaoPayReadyVO);
		
		if(kakaoPayReadyVO.getNext_redirect_pc_url() == null) {		
			String msg = kakaoPayReadyVO.getMsg();
			System.out.println(msg);
			HttpSession session = request.getSession();
			session.setAttribute("error", "error");
			session.setAttribute("msg", msg);
			
			return null;
		}
		
		return kakaoPayReadyVO.getNext_redirect_pc_url(); //이렇게되면 결제준비창을 redirect할 주소가 나오는데 컨트롤러로 redirect해줘야함.
   
        //에러 확인해볼수있음.
		//ResponseEntity resultMap = restTemplate.exchange(new URI(HOST +"/v1/payment/ready"), HttpMethod.POST, body, Map.class);
		//System.out.println("statusCode" + resultMap.getStatusCode()); //http status code를 확인
		//System.out.println("header" + resultMap.getHeaders());  //헤더 정보 확인
		//System.out.println("body" + resultMap.getBody());  //실제 데이터 정보 확인
    
       // return "/";
        
    }
    
    //결제 승인처리
    public KakaoPayApprovalVO kakaoPayInfo(String pg_token,String p_name, String m_id, HttpServletRequest request) throws RestClientException, URISyntaxException {
    	
    	System.out.println("-----------------------------"); 
    	System.out.println("KakaoPayInfo 시작");
    	System.out.println("-----------------------------");
       
        RestTemplate restTemplate = new RestTemplate();
 
        // 서버로 요청할 Header
        // 준비랑 동일
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", "KakaoAK " + AK);
        headers.add("Accept", MediaType.APPLICATION_JSON_VALUE);
        headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
 
        // 서버로 요청할 Body
        // 결제완료를 누르면 next_pc_url에 get방식으로 pg_token이 붙여서 오는데 pg_token을 결제승인 api할때 parameter로 넘겨야한다.
        MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
        params.add("cid", "TC0ONETIME"); //가맹점 코드 10자
        params.add("tid", kakaoPayReadyVO.getTid()); //결제고유번호. 결제준비 api response에서 얻을수있다.
        params.add("partner_order_id", order_id); //가맹점 주문번호. 결제준비 api에서 요청한값과 일치해야함
        params.add("partner_user_id", m_id);//가맹점 회원아이디. 결제준비 api에서 요청한값과 일치해야함
        params.add("pg_token", pg_token);// 결제승인 요청을 인증하는 토큰
        
        HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);
       
        restTemplate.setErrorHandler(new RestTemplateErrorHandler()); //400페이지 에러 안뜨게 할수있음 
        
        kakaoPayApprovalVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/approve"), body, KakaoPayApprovalVO.class);
        // https://kapi.kakao.com/v1/payment/approve에 위에입력한거를 넣고 response는 KakaoPayApprovalVO.class로 받겠다.
        System.out.println(kakaoPayApprovalVO);
        
        if(kakaoPayApprovalVO.getCode() != null) {
        	ExtrasVO msg = kakaoPayApprovalVO.getExtras();
			System.out.println(msg);
			HttpSession session = request.getSession();
			session.setAttribute("error", "error");
			session.setAttribute("msg", msg.getMethod_result_message());
			
			return null;
        }
        
        return kakaoPayApprovalVO;
    }
    
    //구매 취소
    public KakaoPayCancelVO KakaoPayCancel(String amount, String tid, HttpServletRequest request) throws RestClientException, URISyntaxException {
    	
    	System.out.println("-----------------------------");
    	System.out.println("KakaoPayCancel 시작");
    	System.out.println("-----------------------------");

       
    	RestTemplate restTemplate = new RestTemplate();
 
        // 서버로 요청할 Header
        HttpHeaders headers = new HttpHeaders();
        
        headers.add("Authorization", "KakaoAK " + AK);     
        headers.add("Accept", MediaType.APPLICATION_JSON_VALUE);
        headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
 
        // 서버로 요청할 Body
        MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
        params.add("cid", "TC0ONETIME");
        params.add("tid", tid); //결제고유번호
        params.add("cancel_amount", amount);
        params.add("cancel_tax_free_amount", "0");

        
        HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);
        
        restTemplate.setErrorHandler(new RestTemplateErrorHandler()); //400페이지 에러 안뜨게 할수있음 
        
        	
        kakaoPayCancelVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/cancel"), body, KakaoPayCancelVO.class);
        // https://kapi.kakao.com/v1/payment/cancel에 위에입력한거를 넣고 response는 KakaoPayCancelVO.class로 받겠다.
        System.out.println("" + kakaoPayCancelVO);
         
        if(kakaoPayCancelVO.getCode() != null) {
        	ExtrasVO msg = kakaoPayCancelVO.getExtras();
			System.out.println(msg);
			HttpSession session = request.getSession();
			session.setAttribute("error", "error");
			session.setAttribute("msg", msg.getMethod_result_message());
			
			return null;
        }
        
        return kakaoPayCancelVO;
    }
    
}

