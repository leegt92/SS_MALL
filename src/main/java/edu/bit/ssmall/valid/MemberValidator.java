package edu.bit.ssmall.valid;

import java.util.regex.Pattern;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import edu.bit.ssmall.vo.MemberVO;

public class MemberValidator implements Validator {

	/*
	 * private static final String emailRegExp =
	 * "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@" +
	 * "[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";
	 * 
	 * "^01(?:0|1|[6-9])-(?:\d{3}|\d{4})-\d{4}$";
	 * 
	 * 
	 * private Pattern pattern;
	 * 
	 * public void RegisterRequestValidator() { pattern =
	 * Pattern.compile(emailRegExp); }
	 */

	@Override
	public boolean supports(Class<?> clazz) {

		return MemberVO.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		System.out.println("validate()");

		MemberVO memberVO = (MemberVO) target;
		if (memberVO.getM_email() == null || memberVO.getM_email().trim().isEmpty()) {
			errors.rejectValue("m_email", "required", "필수 정보 입니다.");
		}

		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "m_name", "required", "필수 정보 입니다.");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "m_id", "required", "필수 정보 입니다.");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "m_password", "required", "필수 정보 입니다.");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "m_checkpassword", "required", "필수 정보 입니다.");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "m_age", "required", "필수 정보 입니다.");
		ValidationUtils.rejectIfEmpty(errors, "m_phonenum", "required", "필수 정보 입니다.");
		
		if (!Pattern.matches("^[가-힣a-zA-Z]*$", memberVO.getM_name()) || memberVO.getM_name().length() > 20) {
			errors.rejectValue("m_name", "wrong name", "이름입력이 잘못되었습니다.");
		} 
		
		
		if (!Pattern.matches("^[a-zA-Z0-9!@#$%^&*(),.?\":{}|<>]*$", memberVO.getM_password()) || memberVO.getM_password().length() < 8 || memberVO.getM_password().length() > 12) {
			errors.rejectValue("m_password", "wrong password", "비밀번호는 영문,숫자,특수문자 8~12자리로 입력해주세요");
		}

		if (!Pattern.matches("^[a-zA-Z0-9]*$", memberVO.getM_id()) || memberVO.getM_id().length() < 4 || memberVO.getM_id().length() > 10) {
			errors.rejectValue("m_id", "too long and short", "아이디는 영어와숫자 4~10자리로 입력해주세요");
		}
		
		if (memberVO.getM_age() == 0 || memberVO.getM_age() < 0 || memberVO.getM_age() > 100) {
			errors.rejectValue("m_age", "error", "나이를 제대로 입력하세요");
		}
		
		if (!Pattern.matches("(01[016789])-(\\d{3,4})-(\\d{4})", memberVO.getM_phonenum())){
			errors.rejectValue("m_phonenum", "error", "핸드폰번호를 -포함해서 입력해주세요");
		}
		if (!memberVO.getM_password().isEmpty()) {
			if (!memberVO.isEqualsPassword()) {
				errors.rejectValue("m_checkpassword", "nomatch", "비밀번호가 일치하지 않습니다.");
			}
		}

		// errors.rejectValue(String field, String errorCode, String defaultMessage)

		// 필드에 대한 에러코드를 추가, 에러코드에 대한 메시지가 존재하지 않을 경우 defaultMessage를 사용한다.

		// - rejectIfEmpty(Errors errors, String field, String erreCode, String
		// defaultMessage)

		// 값이 공백일 경우, 지정된 errorCode를 가지는 지정된 field가 없으면 defaultMessage를 사용한다.

		// - rejectIfEmptyOrWhitespace(Errors errors, String field, String erreCode,
		// String defaultMessage)

		// 값이 공백이거나 공백을 포함하고 있는 경우, 지정된 errorCode를 가지는 지정된 field가 없으면 defaultMessage를
		// 사용한다.

	}

}
