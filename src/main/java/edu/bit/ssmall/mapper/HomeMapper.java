package edu.bit.ssmall.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import edu.bit.ssmall.vo.ProductImageVO;
import edu.bit.ssmall.vo.ProductVO;

public interface HomeMapper {
	
	@Select("select * from product p , image i where p.p_number = i.p_number and i.i_type = '1' order by p_amount desc")
	public List<ProductImageVO> selectProductListAmount();
	
	@Select("Select * from product order by P_RELEASED_DATE asc")
	public List<ProductVO> recommendItem();
	
	@Select("Select * from product where p_category='시계' order by p_amount desc")
	public List<ProductVO> hitWatchItem();

	@Select("Select * from product where p_category='지갑' order by p_amount desc")
	public List<ProductVO> hitWalletItem();

}
