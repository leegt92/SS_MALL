package edu.bit.ssmall.service;


import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import edu.bit.ssmall.mapper.HomeMapper;
import edu.bit.ssmall.vo.ProductImageVO;



@Service
public class HomeService {
	@Inject
	HomeMapper homeMapper;
	
	public List<ProductImageVO> selectProductListAmount(){
		return homeMapper.selectProductListAmount();
	}

	



	
}
