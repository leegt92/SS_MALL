package edu.bit.ssmall.controller;


import java.io.PrintWriter;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import edu.bit.ssmall.exception.AlreadyExistingEmailException;
import edu.bit.ssmall.exception.AlreadyExistingIdException;
import edu.bit.ssmall.service.RegisterService;
import edu.bit.ssmall.valid.MemberValidator;
import edu.bit.ssmall.vo.MemberVO;

@Controller
public class RegisterController {
	@Autowired
	PasswordEncoder passwordEncoder;
	
	@Autowired
	RegisterService registerService;
	
	@Autowired
	JavaMailSender mailSender;

	@RequestMapping("/register1")
	public String register1() {
		System.out.println("이용약관 페이지로 ");
		return "register1";
	}

	@RequestMapping("/register2")
	public String register2(@RequestParam(value="agree", defaultValue="false") Boolean agree, HttpServletResponse response, Model model) throws Exception {
		if(!agree) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();			 
			out.println("<script>alert('약관에 동의하여 주세요');</script>");			 
			out.flush();
			return "register1";
		} else {

	
			return "emailcheck";
		}
	}
	
	@RequestMapping("/emailcheck")
	public String emailcheck(HttpServletRequest request, HttpServletResponse response,HttpServletResponse response_email, Model model) throws Exception {
		System.out.println("이메일체크 ");
		
		Random r = new Random();
        int code = r.nextInt(4589362) + 49311; //이메일로 받는 인증코드 부분 (난수)
        
        String setfrom = "96jinhyemin@naver.com";
        String tomail = request.getParameter("m_email"); // 받는 사람 이메일
        if(tomail.trim().isEmpty()) {
        	response.setContentType("text/html; charset=UTF-8");
    		PrintWriter out = response.getWriter();	
    		out.println("<script>alert('이메일이 입력되지 않았습니다.');</script>");
    		out.flush();
        	return "emailcheck";
        }
        String title = "회원가입 인증 이메일 입니다."; // 제목
        
        System.out.println(tomail);
        
        String content =
        
        System.getProperty("line.separator")+ //한줄씩 줄간격을 두기위해 작성
        
        System.getProperty("line.separator")+
                
        "안녕하세요 회원님 저희 홈페이지를 찾아주셔서 감사합니다"
        
        +System.getProperty("line.separator")+
        
        System.getProperty("line.separator")+

        " 인증번호는 " +code+ " 입니다. "
        
        +System.getProperty("line.separator")+
        
        System.getProperty("line.separator")+
        
        "받으신 인증번호를 홈페이지에 입력해 주시면 다음으로 넘어갑니다."; // 내용
        
        
        try {
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper messageHelper = new MimeMessageHelper(message,
                    true, "UTF-8");

           // messageHelper.setFrom(setfrom);// 보내는사람 생략하면 정상작동을 안함
            messageHelper.setFrom(setfrom, "상승몰");
            messageHelper.setTo(tomail); // 받는사람 이메일
            messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
            messageHelper.setText(content); // 메일 내용
            
            mailSender.send(message);
            
        } catch (Exception e) {
            System.out.println(e);
        }
        
 
        model.addAttribute("code", code);
        model.addAttribute("m_email", tomail);
        
		response_email.setContentType("text/html; charset=UTF-8");
        PrintWriter out_email = response_email.getWriter();
        out_email.println("<script>alert('이메일이 발송되었습니다. 인증번호를 입력해주세요.');</script>");
        out_email.flush();
		
		return "emailcheck2";
	}
	
	@RequestMapping(value="/emailcheck.do", method = RequestMethod.POST)
	public String emailcheckDo(HttpServletRequest request, Model model, HttpServletResponse response_equals)throws Exception {
		
	     String m_email = request.getParameter("m_email");
	     String inputCode = request.getParameter("inputCode");
	     String code = request.getParameter("code");
	     
	     System.out.println("inputCode : " + inputCode);
	     System.out.println("code : " + code);
	     System.out.println("이메일 : " + m_email);
	    
	     model.addAttribute("inputCode", inputCode);
	    
	     if(inputCode.equals(code)){
	    	 //인증번호가 일치할 경우 인증번호가 맞다는 창을 출력하고 회원가입창으로 이동함
	    	 //만약 인증번호가 같다면 이메일을 회원가입 페이지로 같이 넘겨서 이메일을
	    	 //한번더 입력할 필요가 없게 한다.

	    	 response_equals.setContentType("text/html; charset=UTF-8");
	    	 PrintWriter out_equals = response_equals.getWriter();
	    	 out_equals.println("<script>alert('인증번호가 일치하였습니다. 회원가입창으로 이동합니다.');</script>");
	    	 out_equals.flush();
	    	 
	    	 model.addAttribute("m_email",m_email);
	    	 model.addAttribute("memberVO", new MemberVO());
	    	
	    	 return "register2";


	     }else{
	    	 
	    	 response_equals.setContentType("text/html; charset=UTF-8");
	    	 PrintWriter out_equals = response_equals.getWriter();
	    	 out_equals.println("<script>alert('인증번호가 일치하지않습니다. 인증번호를 다시 입력해주세요.'); history.go(-1);</script>");
	    	 out_equals.flush();

	    	 return "emailcheck";
	     }    
	}
	
	@RequestMapping("/register.do")
	public String registerDo(HttpServletRequest request,MemberVO memberVO, Errors errors, Model model, HttpServletResponse response) throws Exception{
		System.out.println("회원가입시작");
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();	
		
		String addr1 = request.getParameter("addr1");
		String addr2 = request.getParameter("addr2");
		String addr3 = request.getParameter("addr3");
		System.out.println(addr1);
		System.out.println(addr2);
		System.out.println(addr3);
		
		if(addr1.trim().isEmpty() || addr2.trim().isEmpty() || addr3.trim().isEmpty()) {
			System.out.println("주소 널값!!");
			out.println("<script>alert('주소가 정보가 누락되었습니다.');</script>");			 
			out.flush(); 
			
			model.addAttribute("m_email", memberVO.getM_email());
			return "register2";
		}
		String M_adress = "(" + addr1 + ") " + addr2 + " " + addr3;
		memberVO.setM_adress(M_adress);
		
		new MemberValidator().validate(memberVO, errors);//유효성 검사
		
		if(errors.hasErrors()) {
			System.out.println("에러발생");		
			out.println("<script>alert('입력한 정보를 다시 확인하여 주세요!');</script>");			 
			out.flush();
			model.addAttribute("m_email", memberVO.getM_email());
			return "register2";
		}
		String hashpw = passwordEncoder.encode(memberVO.getM_password());
		memberVO.setM_password(hashpw); // 암호화 저장

		try {
			registerService.register(memberVO); 
		} catch (AlreadyExistingIdException e) {
			e.printStackTrace();
			errors.rejectValue("m_id", "duplicate", "이미 가입된 아이디입니다.");
			
			out.println("<script>alert('입력한 정보를 다시 확인하여 주세요!');</script>");			 
			out.flush();
			model.addAttribute("m_email", memberVO.getM_email());
			return "register2";
		}catch(AlreadyExistingEmailException e2) {
			e2.printStackTrace();
			errors.rejectValue("m_email", "duplicate", "이미 가입된 이메일입니다.");
			
			out.println("<script>alert('이미 가입된 이메일입니다. 다른 이메일로 가입해주세요!');</script>");			 
			out.flush();
			return "register1";
		}
				 
		out.println("<script>alert('회원가입이 완료되었습니다!');</script>");			 
		out.flush();
		
		return "login";
	}
}
