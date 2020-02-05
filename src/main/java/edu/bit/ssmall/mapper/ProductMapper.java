package edu.bit.ssmall.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import edu.bit.ssmall.productVO.ProductVO;

public interface ProductMapper {
	
	@Select("select p_number, p_name,p_price,p_brand,p_stock,p_description,p_image,p_released_date,p_amount,p_category from product")
	public List<ProductVO> selectProductList();		

}
