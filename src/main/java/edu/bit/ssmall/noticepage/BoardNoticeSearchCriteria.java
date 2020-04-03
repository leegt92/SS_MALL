package edu.bit.ssmall.noticepage;

public class BoardNoticeSearchCriteria extends Criteria {
	private String keyword = "";
	
	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	//검색을 위해 ", keyword=" + keyword + 추가. ", keyword=" + keyword + 
    @Override
    public String toString() {
        return "Criteria [keyword" + keyword + "]";
    }

}
