package edu.bit.ssmall.productVO;

import javax.inject.Inject;

import edu.bit.ssmall.mapper.ProductMapper;

public class ProductVO {

	@Inject
	ProductMapper productMapper;
	
	public List<ProductVO> selectProductList() {
		// TODO Auto-generated method stub
		return null;
	}

}
