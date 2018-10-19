package com.saem.aop;

import java.net.InetAddress;

import javax.inject.Inject;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

import com.google.gson.Gson;
import com.saem.domain.LogVO;
import com.saem.domain.MemberVO;
import com.saem.service.LogService;

@Component
@Aspect
public class Advice {
	
	@Inject
	private LogService lService;
	
	@Before("execution(!void com.saem.service..*Impl.user_*(..))")
	public void startLog(JoinPoint jp) { //[안에는 service(매개변수를 보여준다.)]
		Object[] obj = jp.getArgs();
		MemberVO mvo = (MemberVO)obj[0];
		System.out.println(new Gson().toJson(mvo).toString());
		LogVO lvo = new LogVO();
		
		InetAddress local;
		String ip;
		try {
		    local = InetAddress.getLocalHost();
		    ip = local.getHostAddress();
		    lvo.setM_userid(mvo.getM_userid());
		    lvo.setLog_ip(ip);
		    if(mvo.getM_confirm() != null) {
		    	lvo.setLog_state("로그인");
		    } else {
		    	lvo.setLog_state("로그아웃");
		    }
		    lService.insertLog(lvo);
		    System.out.println("local ip : "+ip);
			System.out.println("---------------------------");
		} catch (Exception e1) {
		    e1.printStackTrace();
		}
	}

}