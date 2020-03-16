package edu.bit.ssmall.corona;

import java.util.ArrayList;

public class CoronaVO {

	private int count;
	private ArrayList<StoresVO> stores;
	
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public ArrayList<StoresVO> getStores() {
		return stores;
	}
	public void setStores(ArrayList<StoresVO> stores) {
		this.stores = stores;
	}
	@Override
	public String toString() {
		return "CoronaVO [count=" + count + ", stores=" + stores + "]";
	}
	
	
	
	
	
}
