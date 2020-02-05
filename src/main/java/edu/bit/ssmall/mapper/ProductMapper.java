package edu.bit.ssmall.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import edu.bit.ssmall.productVO.ProductVO;

public interface ProductMapper {
	
	@Select("select * from product")
	public List<ProductVO> selectProductList();		

}
