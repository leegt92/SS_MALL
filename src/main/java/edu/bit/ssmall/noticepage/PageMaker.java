package edu.bit.ssmall.noticepage;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class PageMaker {
	
	private Criteria cri; //현재페이지와 , 페이지당보여줄 게시글수를 가지고있음
	 
    private int totalCount; //전체 게시글수 select count(*)
 
    private int startPage; //게시글 번호에 따라서 페이지의 시작번호
    private int endPage; //게시글 번호에 따라서 페이지의 마지막번호
    
    private boolean prev; //이전 버튼을 누를수 있는 경우 없는경우
    private boolean next; //다음 버튼을 누를수 있는 경우 없는경우
 
    private int displayPageNum = 10; //화면 하단에 보여지는 페이지개수
    private int tempEndPage;
   
    
    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;
        
        calcData(); 
        //전체 필드 변수들 세팅 : 전체 게시글의 수가 호출되면 전체세팅됨.
    }
 
    private void calcData() { 
        endPage = (int) (Math.ceil(cri.getPage() / (double) displayPageNum) * displayPageNum);
        //math.ceil 올림함수. ex 현재페이지 1페이지면 / 바닥에 보여지는 페이지개수 10	* 10 ; 10이므로 1번부터 10번 보임
        //2페이지면 20이므로 20번까지보임
        startPage = (endPage - displayPageNum) + 1;
        //1페이지면 (10 - 10 + 1) 1번부터 시작. 	
        //2페이지면 (20 - 10 + 1) 11번부터 시작
        int tempEndPage = (int) (Math.ceil(totalCount / (double) cri.getPerPageNum()));
        //게시글 수가 만약 105개라고 한다면 105개를 10개씩 한다고 치면 11페이지까지 있어야함
        
        this.tempEndPage = tempEndPage;
 
        if (endPage > tempEndPage) {
            endPage = tempEndPage;
        }
 
        prev = (startPage == 1) ? false : true; //start페이지가 1이면 이전은 비활성화 
		
		System.out.println("startPage : " + startPage);
		System.out.println("endPage : " + endPage);
		System.out.println("prev : " + prev);
		next = (endPage * cri.getPerPageNum()) >= totalCount ? false : true;
		//20 * 10 >= 게시글수가(205개면) false니까 true를 타서 다음버튼 활성화
		System.out.println("next" + next);
 
    }
 
    // getter setter
 
    public Criteria getCri() {
        return cri;
    }
 
    public int getTempEndPage() {
        return tempEndPage;
    }
 
    public void setCri(Criteria cri) {
        this.cri = cri;
    }
 
    public int getTotalCount() {
        return totalCount;
    }
 
    public int getStartPage() {
        return startPage;
    }
 
    public void setStartPage(int startPage) {
        this.startPage = startPage;
    }
 
    public int getEndPage() {
        return endPage;
    }
 
    public void setEndPage(int endPage) {
        this.endPage = endPage;
    }
 
    public boolean isPrev() {
        return prev;
    }
 
    public void setPrev(boolean prev) {
        this.prev = prev;
    }
 
    public boolean isNext() {
        return next;
    }
 
    public void setNext(boolean next) {
        this.next = next;
    }
 
    public int getDisplayPageNum() {
        return displayPageNum;
    }
 
    public void setDisplayPageNum(int displayPageNum) {
        this.displayPageNum = displayPageNum;
    }
    
    public String makeQuery(int page) {
		UriComponents uriComponentsBuilder = UriComponentsBuilder.newInstance().queryParam("page", page) 
				.queryParam("perPageNum", cri.getPerPageNum()) 
				.build();
		
		System.out.println("makeQuery : "+uriComponentsBuilder.toUriString());
		return uriComponentsBuilder.toUriString(); 
		
	}



}
