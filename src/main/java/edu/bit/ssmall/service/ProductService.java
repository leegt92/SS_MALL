package edu.bit.ssmall.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import edu.bit.ssmall.mapper.ProductMapper;
import edu.bit.ssmall.vo.ProductImageVO;

@Service
public class ProductService {

	@Inject
	ProductMapper productMapper;
	
	public List<ProductImageVO> selectProductList() {
		
		return productMapper.selectProductList();
	}

}
