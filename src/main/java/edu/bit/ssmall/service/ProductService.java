package edu.bit.ssmall.service;

import java.util.List;
import javax.inject.Inject;
import org.springframework.stereotype.Service;
import edu.bit.ssmall.mapper.ProductMapper;
import edu.bit.ssmall.vo.ProductImageVO;
import edu.bit.ssmall.vo.ProductVO;


@Service
public class ProductService {

	@Inject
	ProductMapper productMapper;
	
	public List<ProductImageVO> selectProductList() {
		
		return productMapper.selectProductList();
	}
	
	public List<ProductImageVO> selectProductOne(String p_number) {
		
		return productMapper.selectProductOne(p_number);
	}
	public List<ProductImageVO> selectProductOne2(String p_number) {
		
		return productMapper.selectProductOne2(p_number);
	}
	public List<ProductImageVO> selectProductListAmount() {
		
		return productMapper.selectProductListAmount();
	}

	
	
	//구매 하기위해 하나 만들었음
	public ProductVO productOne(String p_number) {
		
		return productMapper.productOne(p_number);
	}

}
