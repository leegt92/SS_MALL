 package edu.bit.ssmall.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import edu.bit.ssmall.productpage.Criteria;
import edu.bit.ssmall.productpage.PageMaker;
import edu.bit.ssmall.productpage.SearchCriteria;
import edu.bit.ssmall.service.ProductService;
import edu.bit.ssmall.vo.BoardVO;
import edu.bit.ssmall.vo.ProductImageVO;
import edu.bit.ssmall.vo.ProductReplyVO;
import edu.bit.ssmall.vo.ProductVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class ProductController {
	
	@Autowired
	ProductService productService;
	
	
	@RequestMapping("/productView")
	public String productview(HttpServletRequest request,Model model, Criteria criteria) {
		System.out.println("productview");
		//페이징
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(criteria);
		int startNum = criteria.getStartNum(); 
		int endNum = criteria.getEndNum();
		//페이징시 전체상품의 갯수를 확인하기 위해.
		int totalCount = productService.selectCountProduct();
		//페이지메이커에 전체상품의 갯수를 넣었다. 이로써 전체상품갯수를 이용해 다른값을 뽑아낼 수 있을것.
		pageMaker.setTotalCount(totalCount);
		//페이징처리된 상품목록을 불러올 코드
		List<ProductVO> productList = productService.selectProductListPage(startNum, endNum);

		model.addAttribute("product",productList);
		model.addAttribute("pageMaker",pageMaker);
				
		/* model.addAttribute("product", productService.selectProductList()); */
		System.out.println("product 탔음");
		return "product";
	}
	//QuickView를 위한 메소드
	@ResponseBody
	@RequestMapping("/productViewQuick")
	public ProductVO productviewQuick(HttpServletRequest request,Model model, Criteria criteria) {
		System.out.println("productViewQuick");
		String p_number = request.getParameter("p_number");
		System.out.println("p_number : "+p_number);
		ProductVO quickViewList = productService.productOne(p_number);
		model.addAttribute("quickViewList",quickViewList);
		System.out.println(quickViewList);
		//페이징
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(criteria);
		int startNum = criteria.getStartNum(); 
		int endNum = criteria.getEndNum();
		//페이징시 전체상품의 갯수를 확인하기 위해.
		int totalCount = productService.selectCountProduct();
		//페이지메이커에 전체상품의 갯수를 넣었다. 이로써 전체상품갯수를 이용해 다른값을 뽑아낼 수 있을것.
		pageMaker.setTotalCount(totalCount);
		//페이징처리된 상품목록을 불러올 코드
		List<ProductVO> productList = productService.selectProductListPage(startNum, endNum);

		model.addAttribute("product",productList);
		model.addAttribute("pageMaker",pageMaker);
				
		/* model.addAttribute("product", productService.selectProductList()); */
		System.out.println("product 탔음");
		return quickViewList;
	}
	
	//검색시 페이징된 목록을 불러오기 위한 메소드. 위와 거의 똑같다.
	@RequestMapping("/productViewSearch")
	public String productViewSearch(HttpServletRequest request,Model model, SearchCriteria serchCriteria) {
		System.out.println("productview");
		//페이징
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(serchCriteria);
		int startNum = serchCriteria.getStartNum(); 
		int endNum = serchCriteria.getEndNum();
		String keyword = request.getParameter("keyword");
		System.out.println("keyword 확인 : "+keyword);
		//페이징시 전체상품의 갯수를 확인하기 위해. 여기서는 검색어에 해당하는 상품갯수를 뽑았다.
		int totalCount = productService.searchCountProduct(keyword);
		System.out.println("totalCount위");
		//페이지메이커에 전체상품의 갯수를 넣었다. 이로써 전체상품갯수를 이용해 다른값을 뽑아낼 수 있을것.
		pageMaker.setTotalCount(totalCount);
		System.out.println("setTotalCount위");
		//페이징처리된 상품목록을 불러올 코드
		/* String keyword = request.getParameter("keyword"); */
		
		System.out.println("productList위");
		List<ProductVO> productList = productService.searchProductListPage(startNum, endNum, keyword);
		model.addAttribute("keyword",keyword);
		model.addAttribute("product",productList);
		model.addAttribute("pageMaker",pageMaker);
				
		/* model.addAttribute("product", productService.selectProductList()); */	
		return "product";
	}
	//product 왼쪽상단 시계 버튼 눌럿을때 시계만 나오면서 페이징도 되도록 하기 위해 만듬======================================================
	@RequestMapping("/productViewSearchCategory")
	public String productViewSearchCategory(HttpServletRequest request,Model model, SearchCriteria serchCriteria) {
		System.out.println("productview");
		//페이징
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(serchCriteria);
		int startNum = serchCriteria.getStartNum(); 
		int endNum = serchCriteria.getEndNum();
		String keyword = request.getParameter("p_category");
		System.out.println("keyword(p_category) 확인 : "+keyword);
		//페이징시 전체상품의 갯수를 확인하기 위해. 여기서는 검색어에 해당하는 상품갯수를 뽑았다.
		int totalCount = productService.searchCountProductCategory(keyword);
		System.out.println("totalCount위");
		//페이지메이커에 전체상품의 갯수를 넣었다. 이로써 전체상품갯수를 이용해 다른값을 뽑아낼 수 있을것.
		pageMaker.setTotalCount(totalCount);
		System.out.println("setTotalCount위");
		//페이징처리된 상품목록을 불러올 코드
		/* String keyword = request.getParameter("keyword"); */
		
		System.out.println("productList위");
		List<ProductVO> productList = productService.searchProductListPageCategory(startNum, endNum, keyword);
		model.addAttribute("keyword",keyword);
		model.addAttribute("product",productList);
		model.addAttribute("pageMaker",pageMaker);
				
		/* model.addAttribute("product", productService.selectProductList()); */	
		return "product";
	}
	//===================================================================================================
	//product 왼쪽상단 시계 버튼 눌럿을때 시계만 나오면서 페이징도 되도록 하기 위해 만듬======================================================
	//product의 filter 브랜드별 필터 기능.
		@RequestMapping("/productViewSearchBrand")
		public String productViewSearchBrand(HttpServletRequest request,Model model, SearchCriteria serchCriteria) {
			System.out.println("productview");
			//페이징
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(serchCriteria);
			int startNum = serchCriteria.getStartNum(); 
			int endNum = serchCriteria.getEndNum();
			String keyword = request.getParameter("p_brand");
			System.out.println("keyword(p_category) 확인 : "+keyword);
			//페이징시 전체상품의 갯수를 확인하기 위해. 여기서는 검색어에 해당하는 상품갯수를 뽑았다.
			int totalCount = productService.searchCountProductBrand(keyword);
			System.out.println("totalCount위");
			//페이지메이커에 전체상품의 갯수를 넣었다. 이로써 전체상품갯수를 이용해 다른값을 뽑아낼 수 있을것.
			pageMaker.setTotalCount(totalCount);
			System.out.println("setTotalCount위");
			//페이징처리된 상품목록을 불러올 코드
			/* String keyword = request.getParameter("keyword"); */
			
			System.out.println("productList위");
			List<ProductVO> productList = productService.searchProductListPageBrand(startNum, endNum, keyword);
			model.addAttribute("keyword",keyword);
			model.addAttribute("product",productList);
			model.addAttribute("pageMaker",pageMaker);
					
			/* model.addAttribute("product", productService.selectProductList()); */	
			return "product";
		}
		//===================================================================================================
	
		//===================================================================================================
		//product 왼쪽상단 시계 버튼 눌럿을때 시계만 나오면서 페이징도 되도록 하기 위해 만듬======================================================
		//product의 filter 순위별 필터 기능.검색이 아니라 나열의 순서조정이므로 keyword 필요 없다.
		//각 버튼별 구별을 위해 keyword라는 단어를 사용하긴 할거임. 그저 구별을 위한 기능
		//생각해보니 keyword로 sql문에 직접 영향을 줄 수 있나 확인해보기로함. 할 수 있다면 코드 줄일 수 있음.
		@RequestMapping("/productViewRank")
		public String productviewRank(HttpServletRequest request,Model model, Criteria criteria) {
			System.out.println("productviewRank");
			//페이징
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(criteria);
			int startNum = criteria.getStartNum(); 
			int endNum = criteria.getEndNum();
			//페이징시 전체상품의 갯수를 확인하기 위해.
			int totalCount = productService.selectCountProduct();
			//페이지메이커에 전체상품의 갯수를 넣었다. 이로써 전체상품갯수를 이용해 다른값을 뽑아낼 수 있을것.
			pageMaker.setTotalCount(totalCount);			
			//어떤 버튼을 선택했는가에 따라 정렬순서 분기
			String keyword = request.getParameter("keyword");
			System.out.println("keyword 체크 : "+keyword);
			List<ProductVO> productList = productService.selectProductListPageRank(startNum, endNum,keyword);
			model.addAttribute("product",productList);
			model.addAttribute("pageMaker",pageMaker);
			model.addAttribute("rankKeyword",keyword);
			System.out.println("productViewRank 탔음");
			return "product";
		}
			//===================================================================================================
	
	
	/*
	@RequestMapping("/productViewWatch")
	public String productview2(Model model, HttpServletRequest request) {
		String p_category = request.getParameter("p_category");
		System.out.println("p_category"+p_category);
		model.addAttribute("product", productService.selectProductList());		
		return "productwatch";
	}
	
	@RequestMapping("/productViewWallet")
	public String productview3(Model model) {
		model.addAttribute("product", productService.selectProductList());		
		return "productwallet";
	}*/
	
	//글 작성시
	@ResponseBody
	@RequestMapping("/product_Write_reply")
	//@RequestMapping(value = "product_Write_reply", method = {RequestMethod.POST, RequestMethod.GET})
	public void product_Write_reply(ProductReplyVO productReplyVO, HttpServletRequest request,Model model) {	
	
		System.out.println("/product_Write_replyAjax");		
		String p_number = request.getParameter("p_number");
		System.out.println("상품번호 확인 "+ p_number);
		String btitle = request.getParameter("btitle");
		System.out.println("btitle 확인 "+ btitle);
		String bcontent = request.getParameter("bcontent");
		System.out.println("bcontent 확인 "+ bcontent);
		model.addAttribute("productDetail", productService.selectProductOne(p_number));	
		System.out.println(productService.selectProductOne(p_number));		
		productService.productReplyWrite(productReplyVO);
		System.out.println("/product_Write_replyAjax끝");	
		
	}
	//댓글에 대한 댓글(대댓글),버튼에서 ajax로 modal 킬때 혹시 넘길거 있나 해서 
	//대댓글 다는 버튼이벤트에 ajax를 이용해서 컨트롤러 경유하게 했음. 만약 m_number 같은게 필요하다면 여기서 넘겨줄수 있음
	//일단 컨트롤러 타도 무조건 success됨.
	@ResponseBody
	@RequestMapping(value = "product_Write_reply_replyCheckAjax", method = {RequestMethod.POST, RequestMethod.GET})
	public int product_Write_reply_replyCheckAjax(Model model, HttpServletRequest request) {
		System.out.println("product_Write_reply_reply");
		String bid = request.getParameter("bid");
		System.out.println("product_Write_reply_replyCheckAjax로 bid 넘어오나 확인 : "+bid);
		model.addAttribute("productWritereplyreplyCheckAjaxbid", bid);	
		int result = 1;//임시로 무조건 ajax success타게 했음.
		return result;		
	}
	//댓글에 대한 댓글(대댓글) 대댓글modal에서 입력 클릭시 ajax를 타고 컨트롤러로 넘어옴.
	@ResponseBody
	@RequestMapping(value = "product_Write_reply_reply", method = {RequestMethod.POST, RequestMethod.GET})
	public void product_Write_reply_reply(Model model, HttpServletRequest request, ProductReplyVO productReplyVO) {
		System.out.println("product_Write_reply_reply탔음");
		
		String bid = request.getParameter("bid");
		//대댓글modal에서 게시글 번호를 가져와서 그 게시글번호에 맞는 bstep bIndent뽑아옴		
		int bstep = productService.checkBstep(bid);
		System.out.println("bstep : "+bstep);
		int bindent = productService.checkBindent(bid);
		System.out.println("bindent : "+bindent);
		model.addAttribute("checkBstep",productService.checkBstep(bid));//시간적으로 한단계 일찍 써야하는건지도
		model.addAttribute("checkBindent",bindent);//모름
		productService.writeReplyReply(productReplyVO);
		System.out.println("대댓글 잘 써졌나 확인");
		
	}
	
	@ResponseBody
	@RequestMapping("/deleteReply")
	public int deleteReply(BoardVO boardVO, Model model,HttpServletRequest request) {
		int result = 0;
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    Object principal = auth.getPrincipal();
	    String name = "";
	    name = auth.getName();//현재 로그인한 id
	    int m_number = productService.principalGetMid(name);//principal에서 뽑은 회원id로 회원number를 가져옴		
		model.addAttribute("principal_m_number",m_number);//가져온것을 model에 넣어서 jsp에 전달함.
			    
		System.out.println("/deleteReply");
		String bid = request.getParameter("bid");//삭제할 글의 번호
		int b_m_number = productService.checkMid(bid);
		System.out.println("m_number : "+m_number);//로그인한 사람의 멤버번호
		System.out.println("b_m_number : "+b_m_number);//글 번호로 뽑아온 글 번호 안에 있는 멤버번호.
		System.out.println(bid);
		
		if(m_number == b_m_number) {
			productService.replyDelete(boardVO);
			System.out.println("/deleteReply끝 + if문 탔음");
			result = 1;
		}
		else {
			System.out.println("/deleteReply끝  + else부분");
			result = 0;
		}
		return result;
	}
	
	@ResponseBody
	@RequestMapping("/checkUser")//글 수정시 글을 쓴 유저인지 먼저 확인 후 modal페이지로 보내기 위해
	public int checkUser2(BoardVO boardVO,Model model,HttpServletRequest request) {
		int result = 0;
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    Object principal = auth.getPrincipal();
	    String name = "";
	    
	    name = auth.getName();//현재 로그인한 id
	    
	    int m_number = productService.principalGetMid(name);//principal에서 뽑은 회원id로 회원number를 가져옴		
		model.addAttribute("principal_m_number",m_number);//가져온것을 model에 넣어서 jsp에 전달함.

		String bid = request.getParameter("bid");//변경할 글의 번호
		int b_m_number = productService.checkMid(bid);//글 번호로 그 글에 저장되어 있는 m_number를 가져옴.
		System.out.println("m_number : "+m_number);//로그인한 사람의 멤버번호
		System.out.println("b_m_number : "+b_m_number);//글 번호로 뽑아온 글 번호 안에 있는 멤버번호.
		System.out.println(bid);
		
		if(m_number == b_m_number) {
			System.out.println("/checkUser끝 + if문 탔음");
			result = 1;
		}
		else {
			System.out.println("/checkUser끝  + else부분");
			result = 0;
		}
		return result;
				
	}
	//수정modal에서 확인을 누르면, 거기서 ajax를 통해 컨트롤러로 온다. 그래서 리턴값이 없다.
	//ajax는 리턴값을 지정하지 않아도(지정할 수도 있음)알아서 오류없이 끝나면 다시 ajax의 success를 타기때문.
	//modal 페이지에서 받은 data로 글을 고침.
	@ResponseBody
	@RequestMapping("/modifyReply2")
	public void modifyReply2(BoardVO boardVO,Model model,HttpServletRequest request) {
		System.out.println("modifyReply2 시작");
		String btitle = request.getParameter("btitle");
		String bcontent = request.getParameter("bcontent");
		String bid = request.getParameter("bid");
		String p_number = request.getParameter("p_number");		
		System.out.println(btitle);
		System.out.println(bcontent);
		System.out.println(bid);
		System.out.println(p_number);		
		productService.updateBoard(btitle,bcontent,bid);
		
	}
	@RequestMapping("/productDetail")
	public String product_detail(ProductReplyVO productReplyVO, HttpServletRequest request,Model model) {
		int check = 123;
		model.addAttribute("modelCheck",check);
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    Object principal = auth.getPrincipal();
	 
	    String name = "";
	    if(principal != "anonymousUser") {
	        name = auth.getName();
	        int m_number = productService.principalGetMid(name);//principal에서 뽑은 회원id로 회원number를 가져옴		
			model.addAttribute("principal_m_number",m_number);//가져온것을 model에 넣어서 jsp에 전달함.
	    }
	    System.out.println("principal : "+principal);
	    System.out.println("name : "+ name);
	    System.out.println("auth.getName() : "+auth.getName());
		System.out.println("productDetail시작");
		String p_number = request.getParameter("p_number");
		System.out.println("상품번호 : "+p_number);
		model.addAttribute("productDetail", productService.selectProductOne(p_number));
		model.addAttribute("productAmount", productService.selectProductListAmount());
		model.addAttribute("productReply", productService.productReply(p_number));
		model.addAttribute("productNum", productService.productOne(p_number));
		model.addAttribute("principal_m_id",name);//principal로 받은 회원의 id. leegt92같은거.
		System.out.println("productDetail끝");
								
		return "productDetail";
	}
	//시큐리티 이용 로그인확인
	@RequestMapping("/productDetailLogin")
	public String productDetailLogin(ProductReplyVO productReplyVO, HttpServletRequest request,Model model) {
		int check = 123;
		model.addAttribute("modelCheck",check);
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    Object principal = auth.getPrincipal();
	 
	    String name = "";
	    if(principal != "anonymousUser") {
	        name = auth.getName();
	        int m_number = productService.principalGetMid(name);//principal에서 뽑은 회원id로 회원number를 가져옴		
			model.addAttribute("principal_m_number",m_number);//가져온것을 model에 넣어서 jsp에 전달함.
	    }
	    System.out.println("principal : "+principal);
	    System.out.println("name : "+ name);
	    System.out.println("auth.getName() : "+auth.getName());	    
		System.out.println("productDetail시작");
		String p_number = request.getParameter("p_number");
		System.out.println("상품번호 : "+p_number);
		model.addAttribute("productDetail", productService.selectProductOne(p_number));
		model.addAttribute("productAmount", productService.selectProductListAmount());
		model.addAttribute("productReply", productService.productReply(p_number));
		model.addAttribute("productNum", productService.productOne(p_number));		
		model.addAttribute("principal_m_id",name);//principal로 받은 회원의 id. leegt92같은거.
	
		System.out.println("productDetail끝");
						
		return "productDetail";
	}
	//상품에 대한 구매후기를 불러오는것.(댓글)
	@ResponseBody 
	@RequestMapping(value="product_replyAjax2", method= {RequestMethod.GET, RequestMethod.POST})
	public List<ProductReplyVO> product_replyAjax2(ProductReplyVO productReplyVO, HttpServletRequest request,Model model) {
		System.out.println("product_replyAjax2 시작");		
		String p_number = request.getParameter("p_number");
		System.out.println("상품번호 확인 : "+p_number);
		String m_number = request.getParameter("m_number");
		System.out.println("회원번호 확인 : "+m_number);
		String m_id = request.getParameter("m_id");
		System.out.println("회원아이디 확인 : "+m_id);
		String bcontent = request.getParameter("bcontent");
		System.out.println("댓글내용 확인 : "+bcontent);
		String btitle = request.getParameter("btitle");
		System.out.println("댓글제목 확인 : "+btitle);
		String bid = request.getParameter("bid");
		System.out.println("댓글번호bid 확인 : "+bid);
				
		model.addAttribute("productDetail", productService.selectProductOne(p_number));
		model.addAttribute("productReply", productService.productReply(p_number));
		model.addAttribute("productNum", productService.productOne(p_number));
		System.out.println("product_replyAjax2��");
		System.out.println(productService.productReply(p_number));
		
		return productService.productReply(p_number);
	}
	/*
	@ResponseBody
	@RequestMapping("/product_replyAjax")
	public List<ProductImageVO> product_replyAjax(ProductReplyVO productReplyVO, HttpServletRequest request,Model model) {
		System.out.println("product_replyAjax����");
		String p_number = request.getParameter("p_number");
		System.out.println("product_replyAjax��");
			
		return productService.selectProductOne(p_number);
	}
	@ResponseBody
	@RequestMapping("/productView2")
	public List<ProductImageVO> productview2(HttpServletRequest request,Model model) {
		System.out.println("productview2");
		model.addAttribute("product", productService.selectProductList());		
		return productService.selectProductList();
	}*/
	
}
