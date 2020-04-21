package edu.bit.ssmall.service;


import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import edu.bit.ssmall.mapper.HomeMapper;
import edu.bit.ssmall.vo.ProductImageVO;
import edu.bit.ssmall.vo.ProductVO;



@Service
public class HomeService {
	@Inject
	HomeMapper homeMapper;
	
	public List<ProductImageVO> selectProductListAmount(){
		return homeMapper.selectProductListAmount();
	}

	public List<ProductVO> recommendItem() {
		// TODO Auto-generated method stub
		return homeMapper.recommendItem();
	}
	
	public List<ProductVO> hitWatchItem() {
		
		return homeMapper.hitWatchItem();
	}
	
	public List<ProductVO> hitWalletItem() {
		
		return homeMapper.hitWalletItem();
	}

	
}
