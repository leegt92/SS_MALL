package edu.bit.ssmall.corona;

import java.util.ArrayList;

import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import edu.bit.ssmall.kakaopay.RestTemplateErrorHandler;

@Service
public class Corona {
	private static final String HOST = "https://8oi9s0nnth.apigw.ntruss.com/corona19-masks/v1"; //요청할 주소 이뒤에다가 붙여야함
	private CoronaVO coronaVO;
	
	public ArrayList<StoresVO> coronaView(String address) {
		System.out.println("-----------------------------"); 
    	System.out.println("coronaView 시작");
    	System.out.println("-----------------------------");
    	
    	RestTemplate restTemplate = new RestTemplate();
  
        HttpHeaders headers = new HttpHeaders();              
        headers.add("Name", "약국");
        headers.add("Accept", MediaType.APPLICATION_JSON_VALUE);
        headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
     
        restTemplate.setErrorHandler(new RestTemplateErrorHandler()); //400페이지 에러 안뜨게 할수있음 
        
        coronaVO = restTemplate.getForObject(HOST +"/storesByAddr/json?address="+address,CoronaVO.class); 		
        System.out.println(coronaVO);
        
        ArrayList<StoresVO> list = coronaVO.getStores();
		for (int i = 0; i < list.size(); i++) {
			System.out.println("반복문시작");
			System.out.println(list.get(i));
			if(list.get(i).getCode() == null){
				System.out.println(list.get(i).getCode());
				list.get(i).setCode("데이터 없음");
			}
			if(list.get(i).getName() == null){
				System.out.println(list.get(i).getName());
				list.get(i).setName("데이터 없음");
			
			}
			if(list.get(i).getAddr() == null){
				System.out.println(list.get(i).getAddr());
				list.get(i).setAddr("데이터 없음");
			
			}
			if(list.get(i).getType() == null){
				System.out.println(list.get(i).getType());
				list.get(i).setType("데이터 없음");
			
			}
			if(list.get(i).getLat() == 0 ){
				System.out.println(list.get(i).getLat());
				list.get(i).setLat(0);
			
			}
			if(list.get(i).getLng() == 0){
				System.out.println(list.get(i).getLng());
				list.get(i).setLng(0);
			
			}
			if(list.get(i).getStock_at() == null){
				System.out.println(list.get(i).getStock_at());
				list.get(i).setStock_at("데이터 없음");
			
			}
			if(list.get(i).getRemain_stat() == null){
				System.out.println(list.get(i).getRemain_stat());
				list.get(i).setRemain_stat("데이터 없음");
				
			}
			
			if(list.get(i).getCreated_at() == null){
				System.out.println(list.get(i).getCreated_at());
				list.get(i).setCreated_at("데이터 없음");
			}
	
				
				
			if(list.get(i).getType().equals("01")) {
				list.get(i).setType("약국");
			}else if(list.get(i).getType().equals("02")) {
				list.get(i).setType("우체국");
			}else { 
				list.get(i).setType("농협");
			}
			
			
			if( list.get(i).getRemain_stat().trim().equals("empty")){
				list.get(i).setRemain_stat("1개이하");
				System.out.println(list.get(i).getRemain_stat());
			
			}else if(list.get(i).getRemain_stat().trim().equals("some")) {
				list.get(i).setRemain_stat("30개이상 100개 미만");
				System.out.println(list.get(i).getRemain_stat());
			
			}else if(list.get(i).getRemain_stat().trim().equals("plenty")) {
				list.get(i).setRemain_stat("100개이상");
				System.out.println(list.get(i).getRemain_stat());
				
			}else if(list.get(i).getRemain_stat().trim().equals("few")) {
				list.get(i).setRemain_stat("2개이상 30개미만");
				System.out.println(list.get(i).getRemain_stat());
			
			}else if(list.get(i).getRemain_stat().trim().equals("break")) {
				list.get(i).setRemain_stat("판매 중지");
				System.out.println(list.get(i).getRemain_stat());
			}

		
		}
		
		
		return list;
	}
}

