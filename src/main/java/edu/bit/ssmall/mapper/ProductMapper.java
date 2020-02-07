package edu.bit.ssmall.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import edu.bit.ssmall.productVO.ProductVO;

public interface ProductMapper {
	

	@Select("select * from product p , image i where p.p_number = i.p_number order by p_name desc")
	public List<ProductVO> selectProductList();		

}
