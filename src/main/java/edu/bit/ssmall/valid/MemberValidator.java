package edu.bit.ssmall.valid;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import edu.bit.ssmall.vo.MemberVO;

public class MemberValidator implements Validator{
	
	@Override
	public boolean supports(Class<?> clazz) {
		
		return MemberVO.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		System.out.println("validate()");
		
		MemberVO memberVO = (MemberVO) target;

		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "m_name", "required", "필수 정보 입니다.");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "m_id", "required", "필수 정보 입니다.");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "m_password", "required", "필수 정보 입니다.");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "m_checkpassword", "required", "필수 정보 입니다.");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "m_age", "required", "필수 정보 입니다.");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "m_email", "required", "필수 정보 입니다.");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "m_adress", "required", "필수 정보 입니다.");
        
        if(!memberVO.getM_password().isEmpty()) {
            if(!memberVO.isEqualsPassword()) {
                errors.rejectValue("m_checkpassword", "nomatch", "비밀번호가 일치하지 않습니다.");
            }
        }
        
        //errors.rejectValue(String field, String errorCode, String defaultMessage)

        //필드에 대한 에러코드를 추가, 에러코드에 대한 메시지가 존재하지 않을 경우 defaultMessage를 사용한다.

        // - rejectIfEmpty(Errors errors, String field, String erreCode, String defaultMessage)

        //값이 공백일 경우, 지정된 errorCode를 가지는 지정된 field가 없으면 defaultMessage를 사용한다.

        // - rejectIfEmptyOrWhitespace(Errors errors, String field, String erreCode, String defaultMessage)

        // 값이 공백이거나 공백을 포함하고 있는 경우, 지정된 errorCode를 가지는 지정된 field가 없으면 defaultMessage를 사용한다.

      
	}
	
	
	
}
