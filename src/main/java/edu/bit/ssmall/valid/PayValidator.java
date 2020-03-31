package edu.bit.ssmall.valid;

import java.util.regex.Pattern;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import edu.bit.ssmall.vo.MemberVO;
import edu.bit.ssmall.vo.PayVO;

public class PayValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {

		return MemberVO.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		System.out.println("validate()");

		PayVO payVO = (PayVO) target;
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "name", "required", "필수 정보 입니다.");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "phonenum", "required", "필수 정보 입니다.");
		
		if (!Pattern.matches("^[가-힣a-zA-Z]*$", payVO.getName()) || payVO.getName().length() > 20) {
			errors.rejectValue("name", "wrong name", "이름입력이 잘못되었습니다.");
		}  
		if (!Pattern.matches("(01[016789])(\\d{3,4})(\\d{4})", payVO.getPhonenum())){
			errors.rejectValue("phonenum", "error", "핸드폰번호를 -없이 제대로 입력해주세요");
		}

		
		


	
	}

}
