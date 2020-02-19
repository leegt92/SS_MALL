package edu.bit.ssmall.valid;

import java.util.regex.Pattern;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import edu.bit.ssmall.vo.MemberVO;

public class PwUpdateValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {

		return MemberVO.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		System.out.println("validate()");

		MemberVO memberVO = (MemberVO) target;
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "m_password", "required", "필수 정보 입니다.");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "m_checkpassword", "required", "필수 정보 입니다.");
		
		if (!Pattern.matches("^[a-zA-Z0-9!@#$%^&*(),.?\":{}|<>]*$", memberVO.getM_password()) || memberVO.getM_password().length() < 8 || memberVO.getM_password().length() > 12) {
			errors.rejectValue("m_password", "wrong password", "비밀번호는 영문,숫자,특수문자 8~12자리로 입력해주세요");
		}
		
		if (!memberVO.getM_password().isEmpty()) {
			if (!memberVO.isEqualsPassword()) {
				errors.rejectValue("m_checkpassword", "nomatch", "비밀번호가 일치하지 않습니다.");
			}
		}


	
	}

}
