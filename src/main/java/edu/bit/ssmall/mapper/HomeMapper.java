package edu.bit.ssmall.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import edu.bit.ssmall.vo.ProductImageVO;

public interface HomeMapper {
	
	@Select("select * from product p , image i where p.p_number = i.p_number and i.i_type = '1' order by p_amount desc")
	public List<ProductImageVO> selectProductListAmount();

	

}
