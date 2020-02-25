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

import edu.bit.ssmall.service.FindService;
import edu.bit.ssmall.valid.PwUpdateValidator;
import edu.bit.ssmall.vo.MemberVO;

@Controller
public class FindController {
	
	@Autowired
	PasswordEncoder passwordEncoder;//패스워드암호화
	
	@Autowired
	JavaMailSender mailSender; //메일인증 
	
	@Autowired
	FindService findService;
	
	@RequestMapping("/findId")
	public String findId() {
		System.out.println("아이디 찾는 페이지로");

		return "Find/findId";
	}
	
	@RequestMapping("/findIdEmail")
	public String findIdEmail(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String email = request.getParameter("m_email");
		int result = findService.emailCheck(email);
		
		if(result == 0) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();	
			out.println("<script>alert('가입한 정보가 없습니다.');</script>");			 
			out.flush();
			return "Find/findId";
		}
				
		Random r = new Random();
        int code = r.nextInt(4589362) + 49311; //이메일로 받는 인증코드 부분 (난수)
        
        String setfrom = "96jinhyemin@naver.com"; //보내는사람 임일
        String tomail = email; // 받는 사람 이메일
  
        String title = "아이디찾기 인증번호 입니다."; // 제목    
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
        
 
        model.addAttribute("code", code); //난수로 생성한 코드번호 
        model.addAttribute("m_email", tomail); //받는사람 이메일
        
		response.setContentType("text/html; charset=UTF-8");
        PrintWriter out_email = response.getWriter();
        out_email.println("<script>alert('이메일이 발송되었습니다. 인증번호를 입력해주세요.');</script>");
        out_email.flush();
		
		return "Find/findIdEmail";
	
	}
	
	@RequestMapping("/findIdCheck")
	public String findIdCheck(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("인증코드 확인절차");
		
		String m_email = request.getParameter("m_email"); 
	    String inputCode = request.getParameter("inputCode"); //입력한값
	    String code = request.getParameter("code"); //난수값
	     
	    System.out.println("inputCode : " + inputCode);
	    System.out.println("code : " + code);
	    System.out.println("이메일 : " + m_email);

	    if(inputCode.equals(code)){
	    	//인증번호가 일치할 경우 아이디를 출력해준다.	 
	    	String id = findService.getId(m_email);
	    	model.addAttribute("ID",id);
	    	
	    	return "Find/findIdResult";

	    }
	    //틀리면 다시 이메일인증을 해야함.
	    response.setContentType("text/html; charset=UTF-8");
	    PrintWriter out = response.getWriter();
	    out.println("<script>alert('인증번호가 일치하지않습니다.');</script>");
	    out.flush();
	    
	    
	    return "redirect:/findId";
	      
	}

	@RequestMapping("/findPw")
	public String findPw() {
		System.out.println("비밀번호 찾는 페이지로");
		
		return "Find/findPw";
	}
	
	@RequestMapping(value="/findPwEmail", method = RequestMethod.POST)
	public String findPwEmail(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("가입된정보 확인하기");
		
		String id = request.getParameter("m_id");
		String name = request.getParameter("m_name");
		String email = request.getParameter("m_email");
		
		System.out.println(id+"/"+name+"/"+email);
		
		int result = findService.IdCheck(id,name,email);
		
		if(result==0) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('가입한 정보가 없습니다');</script>");
			out.flush();
			return "Find/findPw";
		}
		
		Random r = new Random();
        int code = r.nextInt(4589362) + 49311; //이메일로 받는 인증코드 부분 (난수)
        
        String setfrom = "96jinhyemin@naver.com"; //보내는사람 임일
        String tomail = email; // 받는 사람 이메일
  
        String title = "비밀번호찾기 인증번호 입니다."; // 제목    
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
        
        model.addAttribute("code", code); //난수로 생성한 코드번호 
        model.addAttribute("ID",id);
        
		response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.println("<script>alert('이메일이 발송되었습니다. 인증번호를 입력해주세요.');</script>");
        out.flush();
		
		return "Find/findPwEmail";
	}
	
	@RequestMapping(value="/findPwCheck" ,method = RequestMethod.POST)
	public String findPwCheck(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("인증코드 확인절차");

	    String inputCode = request.getParameter("inputCode"); //입력한값
	    String code = request.getParameter("code"); //난수값
	    String id = request.getParameter("m_id");
	    
	    System.out.println("inputCode : " + inputCode);
	    System.out.println("code : " + code);
	    MemberVO memberVO = new MemberVO();
	    memberVO.setM_id(id);

	    if(inputCode.equals(code)){
	    	//인증번호가 일치할 경우 비밀번호를 변경할 수 있는 사이트로 간다.	 
	    	
	    	model.addAttribute("memberVO",memberVO);
	    	
	    	return "Find/findPwResult";

	    }
	    //틀리면 다시 처음으로
	    
	    response.setContentType("text/html; charset=UTF-8");
	    PrintWriter out = response.getWriter();
	    out.println("<script>alert('인증번호가 일치하지않습니다.');</script>");
	    out.flush();
	
	    
	    return "redirect:/findPw";
	      
	}
	
	@RequestMapping(value ="/pwUpdate",method = RequestMethod.POST)
	public String pwUpdate(Model model, MemberVO memberVO, Errors errors, HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("비밀번호 업데이트");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		new PwUpdateValidator().validate(memberVO, errors); //유효성검사
		
		if(errors.hasErrors()) {
			//에러가 발생한다면 정보다시 확인하라는 경고창 띄우고
			System.out.println("에러발생");		
			
			out.println("<script>alert('비밀번호를 다시 확인하여 주세요!');</script>");			 
			out.flush();

			return "Find/findPwResult";
		}
		
		String pw = passwordEncoder.encode(memberVO.getM_password());
		memberVO.setM_password(pw); // 해당 비밀번호을 암호화 해서 업데이트한다.
		memberVO.setM_id(request.getParameter("m_id"));
		
		findService.pwUpdate(memberVO);
		out.println("<script>alert('비밀번호가 성공적으로 수정되었습니다.');</script>");			 
		out.flush();

		
		return "login";
	}
	
}
