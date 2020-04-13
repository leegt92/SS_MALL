package edu.bit.ssmall.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.bit.ssmall.mapper.AdminMapper;
import edu.bit.ssmall.vo.ProductVO;

@Service
public class AdminService {
	
	@Autowired
	AdminMapper adminMapper;

	public ArrayList<ProductVO> productList(int startNum , int endNum) {
		
		return adminMapper.productList(startNum,endNum);
	}

	public int countProduct() {
		return adminMapper.countProduct();
	}
	
	
	
}

