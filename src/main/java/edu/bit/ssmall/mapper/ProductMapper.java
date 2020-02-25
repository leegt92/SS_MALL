package edu.bit.ssmall.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import edu.bit.ssmall.vo.ProductImageVO;
import edu.bit.ssmall.vo.ProductVO;



public interface ProductMapper {
	

	@Select("select * from product p , image i where p.p_number = i.p_number and i.i_type = '1' order by p_name desc")
	public List<ProductImageVO> selectProductList();
	
	@Select("select * from product p , image i where p.p_number = i.p_number and i.i_type = '1' order by p_amount desc")
	public List<ProductImageVO> selectProductListAmount();
	
	/*
	 * @Select("select * from product p , image i where p.p_number = i.p_number order by p_name desc"
	 * ) public List<ProductImageVO> selectProductList();
	 */
	
	/*
	 * @Select("select * from product p, image i where p.p_number = #{p_number} and i.p_number = p.p_number"
	 * ) public List<ProductImageVO> selectProductOne(String p_number);
	 */
	
	  @Select("select * from product p, image i where p.p_number = #{p_number} and i.p_number = p.p_number order by i_type asc")
	  public List<ProductImageVO> selectProductOne(String p_number);
	  
	  @Select("select * from product p, image i where p.p_number = #{p_number} and i.p_number = p.p_number order by i_type asc")
	  public List<ProductImageVO> selectProductOne2(String p_number);

	  
	  //구매위해서 하나 만들었음
	  @Select("Select * from product where p_number = #{p_number}")
	  public ProductVO productOne(String p_number);
	 

}
