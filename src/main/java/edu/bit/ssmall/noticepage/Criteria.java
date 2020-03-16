package edu.bit.ssmall.noticepage;

public class Criteria {
	
	private int page;
	private int perPageNum;
	private int startNum;
	private int endNum;
	
	public Criteria() { 
		this.page = 1;
	    this.perPageNum = 10; 
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
	    
	
	public int getPageStart(){
		return (this.page -1) * this.perPageNum;
		
	}
	         
	// getter setter
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		if ( page <= 0 ){
	    
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
	 
	    @Override
	    public String toString() {
	        return "Criteria [page=" + page + ", perPageNum=" + perPageNum + "]";
	    }
	
	

}
