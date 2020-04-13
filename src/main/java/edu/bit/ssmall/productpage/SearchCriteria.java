package edu.bit.ssmall.productpage;
//검색시 사용될 Critera를 위해 복사함.
public class SearchCriteria extends Criteria{

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
