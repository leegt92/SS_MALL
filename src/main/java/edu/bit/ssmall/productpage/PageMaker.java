package edu.bit.ssmall.productpage;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class PageMaker {
	private Criteria cri; // page, perPageNum �� ������ ����
	 
    private int totalCount; // ��ü �Խñ� ��

    //[11][12][13].......[20] : ���� �������� 13�� �� startPage�� 11, endPage�� 20
    private int startPage; // �Խñ� ��ȣ�� ���� (��������)�������� ���� ��ȣ
    private int endPage; // �Խñ� ��ȣ�� ���� (��������)�������� ������ ��ȣ
    
    private boolean prev; // ���� ��ư�� ���� �� �ִ� ���/���� ��� �з��� ����
    private boolean next;
 
    private int displayPageNum = 5; // ȭ�� �ϴܿ� �������� �������� ����
    private int tempEndPage;
 
    ///////////////////////////////////////////////////////////////////////////////////////////////
    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;
 
        calcData(); // ��ü �ʵ� ������ ���� : ��ü �Խñ� ���� setter�� ȣ��� �� ��ü ���õǵ��� ��
    }
 
    private void calcData() { // ��ü �ʵ� ���� ������ ����ϴ� �޼���
 
        endPage = (int) (Math.ceil(cri.getPage() / (double) displayPageNum) * displayPageNum);
 
        startPage = (endPage - displayPageNum) + 1;
 
        int tempEndPage = (int) (Math.ceil(totalCount / (double) cri.getPerPageNum()));
        this.tempEndPage = tempEndPage;
 
        if (endPage > tempEndPage) {
            endPage = tempEndPage;
        }
 
        prev = startPage == 1 ? false : true; // 1�������� ���� ���� �� ���� false
        next = endPage * cri.getPerPageNum() >= totalCount ? false : true;
 
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
		UriComponents uriComponents = UriComponentsBuilder.newInstance() .queryParam("page", page)
				.queryParam("perPageNum", cri.getPerPageNum()).build(); 
		return uriComponents.toUriString(); 
		
	}
	 
    //검색을 위해 uriComponentsBuilder 사용함
    /*
    public String makeQuery(int page) {
    	UriComponentsBuilder uriComponents = UriComponentsBuilder.newInstance()
        		.queryParam("page", page)
        		.queryParam("perPageNum", cri.getPerPageNum());
        if (this.cri.getKeyword() !=null) {
        	uriComponents
        		.queryParam("keyword", this.cri.getKeyword());
        }
        return uriComponents.build().toUriString();
    }*/
}
