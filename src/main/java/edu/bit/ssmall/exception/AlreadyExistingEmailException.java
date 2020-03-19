package edu.bit.ssmall.exception;

public class AlreadyExistingEmailException extends RuntimeException{

	private static final long serialVersionUID = 1L;
   
	 public AlreadyExistingEmailException(String message) {
	        super("이미존재합니다.");
	 }


	
}



