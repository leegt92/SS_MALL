package edu.bit.ssmall.valid;

public class EmailCheck {

	
	public String check(String addr1,String addr2,String addr3){

		String address1 = addr1; 
		String address2 = addr2; 
		String address3 = addr3; 
		
		if(addr1.trim().isEmpty() || addr2.trim().isEmpty() || addr3.trim().isEmpty()) {
			
			System.out.println("주소 널값!!");
			return null;
		}
		
		String M_adress = "(" + addr1 + ") " + addr2 + " " + addr3;
		
		return M_adress;
	}
	
}

