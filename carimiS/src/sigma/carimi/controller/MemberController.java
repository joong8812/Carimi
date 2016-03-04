package sigma.carimi.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import sigma.carimi.model.memberDTO;
import sigma.carimi.service.memberService;

@Controller
public class MemberController {

	private static final Logger logger = 
	LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private memberService memberService;
	
	@RequestMapping(value = "main.do", 
			method = RequestMethod.GET)
	public String main(Model model) {		
		logger.info("Welcome MemberController main! "+ new Date());
		return "main.tiles";
	}
	
	@RequestMapping(value = "login.do", 
			method = RequestMethod.GET)
	public String login(Model model) {		
		logger.info("Welcome MemberController login! "+ new Date());
		return "login.tiles";
	}
	
	@RequestMapping(value = "loginAf.do", 
			method = RequestMethod.POST)
	public String loginAf(HttpServletRequest request, memberDTO member, Model model) throws Exception {
		logger.info("Welcome MemberController loginAf! "+ new Date());
		memberDTO login = null;
		login = memberService.loginMember(member);
		if(login!=null && !login.getId().equals("")){
			request.getSession().setAttribute("login", login);
			return "redirect:/main.do";
		}else{
			return "login.tiles";
		}	
	}
	@RequestMapping(value = "logout.do", 
			method = RequestMethod.GET)
	public String logout(HttpServletRequest request, Model model) {		
		logger.info("Welcome MemberController logout! "+ new Date());
		request.getSession().invalidate();
		return "login.tiles";
	}
	
	@RequestMapping(value = "signup.do", 
			method = RequestMethod.GET)
	public String signup(Model model) {		
		logger.info("Welcome MemberController signup! "+ new Date());
		return "signup.tiles";
	}

	
}
