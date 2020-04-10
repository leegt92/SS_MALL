package edu.bit.ssmall.productpage;
//첫 화면에 보여지는 갯수를 늘리고 싶어서 복사함.
public class Criteria {
	private int page;
	private int perPageNum;
	
	private int startNum;
	private int endNum;
	//검색기능시 검색한 키워드를 url로 달고다니기 위하여 추가
	private String keyword;
	
	

	public Criteria() {
		this.page = 1;
		this.perPageNum = 12;
	}
	
public int getStartNum() {
    	
    	if(page == 1)
    		startNum = 1;
    	else{
    		startNum = getEndNum() - perPageNum +1 ;
    	}
    	System.out.println("���۹�ȣ" + startNum);
		return startNum;
	}

	public void setStartNum(int startNum) {
		this.startNum = startNum;
	}

	public int getEndNum() {
		endNum  =  page * getPerPageNum();
		//endNum  = getStartNum() + getPerPageNum();		
		System.out.println("�����ȣ" + endNum);
		return endNum;
	}

	public void setEndNum(int endNum) {
		this.endNum = endNum;
	}    
    
    // limit �������� ���� �κп� �ʿ��� ���� ��ȯ(mybatis���� ���)
    public int getPageStart(){
        return (this.page -1) * this.perPageNum;
		// RowBounds �� �Ű������� ���� �����ϴ� �޼ҵ�
		// RouwBounds �� start index�� 0���� �����ϹǷ�
		// 1������ : 1-1 * 10 = 0 ->>
		// 2������ : 2-1 * 10 = 10 ->>
    }
 
    // getter setter
    public int getPage() {
        return page;
    }
    public void setPage(int page) {
        if ( page <= 0 ){
            // �������� 1���������������� 0���� �۰ų� �������� ��� ������ ù��° �������� �����ǵ��� ���ش�.
            this.page = 1;
        }else{
            this.page = page;
        }
    }
    public int getPerPageNum() {
         
        return perPageNum;
    }
    
    public void setPerPageNum(int perPageNum) {
        if ( perPageNum <= 0 || perPageNum > 100 ) {
            this.perPageNum = 10;
        }else {
            this.perPageNum = perPageNum;
        }
    }
    
    public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	//검색을 위해 ", keyword=" + keyword + 추가. ", keyword=" + keyword + 
    @Override
    public String toString() {
        return "Criteria [page=" + page + ", perPageNum=" + perPageNum +"]";
    }

}
