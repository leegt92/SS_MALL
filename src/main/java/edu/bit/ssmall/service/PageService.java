package edu.bit.ssmall.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.bit.ssmall.mapper.PageMapper;
import edu.bit.ssmall.vo.Product_BuyVO;
import edu.bit.ssmall.vo.RefundVO;

@Service	
public class PageService {

	@Autowired
	PageMapper pageMapper;
	
	
	public int countRefundList(String m_id) {
		int m_number = pageMapper.memberInfo(m_id).getM_number();
		
		return pageMapper.countRefundList(m_number);
	}
	
	public int countOrderedList(int m_number) {
		return pageMapper.countOrderedList(m_number);
	}

	public int countShoppingList(int m_number) {
		return pageMapper.countShoppingList(m_number);
	}

	public List<RefundVO> refundListPage(String m_id, int startNum, int endNum) {
		int m_number = pageMapper.memberInfo(m_id).getM_number();
		
		return  pageMapper.refundListPage(m_number,startNum,endNum);
	}
	
	public List<Product_BuyVO> orderedListPage(int m_number, int startNum, int endNum) {
		return  pageMapper.orderedListPage(m_number,startNum,endNum);
	}
	
	public List<Product_BuyVO> shoppingListPage(int m_number, int startNum, int endNum) {
		return  pageMapper.shoppingListPage(m_number,startNum,endNum);
	}


}
