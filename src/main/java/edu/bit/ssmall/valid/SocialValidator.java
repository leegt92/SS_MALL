package edu.bit.ssmall.valid;

import java.util.regex.Pattern;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import edu.bit.ssmall.vo.MemberVO;

public class SocialValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {

		return MemberVO.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		System.out.println("validate()");

		MemberVO memberVO = (MemberVO) target;
		
		ValidationUtils.rejectIfEmpty(errors, "m_phonenum", "required", "필수 정보 입니다.");
		
		
		if (memberVO.getM_age() == 0 || memberVO.getM_age() < 0 || memberVO.getM_age() > 100) {
			errors.rejectValue("m_age", "error", "나이를 제대로 입력하세요");
		}
		
		if (!Pattern.matches("(01[016789])(\\d{3,4})(\\d{4})", memberVO.getM_phonenum())){
			errors.rejectValue("m_phonenum", "error", "핸드폰번호를 -없이 제대로 입력해주세요");
		}


	
	}

}
