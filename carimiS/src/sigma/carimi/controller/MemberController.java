package sigma.carimi.controller;

import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import sigma.carimi.model.memberDTO;
import sigma.carimi.service.memberService;

@Controller
public class MemberController {

	private static final Logger logger = 
	LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private memberService memberService;
	
	@RequestMapping(value = "main.do", method = RequestMethod.GET)
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
	public String loginAf(HttpServletRequest request, HttpServletResponse res, memberDTO member, Model model) throws Exception {
		logger.info("Welcome MemberController loginAf! "+ new Date());
	
		memberDTO login = null;
		login = memberService.loginMember(member);
		if(login!=null && !login.getId().equals("")){
			request.getSession().setAttribute("login", login);
			
			return "redirect:/main.do";
		}
			res.setContentType("text/html;charset=UTF-8");
			
			res.getWriter().write("<script language='JavaScript'>");
			res.getWriter().write("alert('���̵� ��й�ȣ�� Ȯ�����ּ���.');");
			res.getWriter().write("history.go(-1);");
			res.getWriter().write("</script>");
			res.getWriter().flush(); 
			
			return "login.tiles";
			
		
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

	@RequestMapping(value = "signupAf.do", method = RequestMethod.POST)
	public String signupAf(HttpServletRequest request, memberDTO member, 
			Model model, String[] fav, String goo) throws Exception {
		logger.info("Welcome MemberController signupAf! "+ new Date());
		
		member.setLocation(goo);
		
		for(int i=0; i<fav.length; i++){
			if(i==0){
				member.setFav1(fav[0]);	
				member.setFav2("");
				member.setFav3("");
				member.setFav4("");
				member.setFav5("");
				member.setFav6("");
			}else if(i==1){
				member.setFav1(fav[0]);
				member.setFav2(fav[1]);
				
				member.setFav3("");
				member.setFav4("");
				member.setFav5("");
				member.setFav6("");
			}
			else if(i==2){
				member.setFav1(fav[0]);
				member.setFav2(fav[1]);
				member.setFav3(fav[2]);
			
				member.setFav4("");
				member.setFav5("");
				member.setFav6("");
			}
			else if(i==3){
				member.setFav1(fav[0]);
				member.setFav2(fav[1]);
				member.setFav3(fav[2]);
				member.setFav4(fav[3]);
			
				member.setFav5("");
				member.setFav6("");
			}
			else if(i==4){
				member.setFav1(fav[0]);
				member.setFav2(fav[1]);
				member.setFav3(fav[2]);
				member.setFav4(fav[3]);
				member.setFav5(fav[4]);
				
				member.setFav6("");
			}
			else if(i==5){
				member.setFav1(fav[0]);
				member.setFav2(fav[1]);
				member.setFav3(fav[2]);
				member.setFav4(fav[3]);
				member.setFav5(fav[4]);
				member.setFav6(fav[5]);
			}
		}
		boolean approve = memberService.addMember(member);
		if(approve){
			return "login.tiles";
		} else {
			return "signup.tiles";
		}
		
	}
	
	@RequestMapping(value="meminfo.do", method={RequestMethod.GET, RequestMethod.POST})
	public String meminfo(Model model, HttpServletRequest req) throws Exception{
		memberDTO bdto = (memberDTO)req.getSession().getAttribute("login");
		logger.info("Welcome HelloMemberController meminfo! "+ new Date());
		System.out.println("���̵� : " + bdto.getId());
		memberDTO mdto = memberService.memberOne(bdto);
		System.out.println("����"+ mdto.getLocal());
		System.out.println("������"+ mdto.getLocation());
		model.addAttribute("mdto", mdto);
		return "meminfo.tiles";
		
	}
	
	@RequestMapping(value = "meminfoAf.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String meminfoAf(HttpServletRequest request, memberDTO member, 
			Model model, String[] fav, String goo, String mode, String id) throws Exception {
		logger.info("Welcome MemberController meminfoAf! "+ new Date());
		System.out.println("���̵�" + id);
		System.out.println("���" + mode);
		System.out.println("������" + goo);
		member.setLocation(goo);
		
		for(int i=0; i<fav.length; i++){
			if(i==0){
				member.setFav1(fav[0]);	
				member.setFav2("");
				member.setFav3("");
				member.setFav4("");
				member.setFav5("");
				member.setFav6("");
			}else if(i==1){
				member.setFav1(fav[0]);
				member.setFav2(fav[1]);
				
				member.setFav3("");
				member.setFav4("");
				member.setFav5("");
				member.setFav6("");
			}
			else if(i==2){
				member.setFav1(fav[0]);
				member.setFav2(fav[1]);
				member.setFav3(fav[2]);
			
				member.setFav4("");
				member.setFav5("");
				member.setFav6("");
			}
			else if(i==3){
				member.setFav1(fav[0]);
				member.setFav2(fav[1]);
				member.setFav3(fav[2]);
				member.setFav4(fav[3]);
			
				member.setFav5("");
				member.setFav6("");
			}
			else if(i==4){
				member.setFav1(fav[0]);
				member.setFav2(fav[1]);
				member.setFav3(fav[2]);
				member.setFav4(fav[3]);
				member.setFav5(fav[4]);
				
				member.setFav6("");
			}
			else if(i==5){
				member.setFav1(fav[0]);
				member.setFav2(fav[1]);
				member.setFav3(fav[2]);
				member.setFav4(fav[3]);
				member.setFav5(fav[4]);
				member.setFav6(fav[5]);
			}
		}
	
		if(mode.equals("update")){
			boolean approve = memberService.memUpdate(member);
			if(approve){
				return "redirect:/meminfo.do";
			} else {
				return "main.tiles";
			}
		}else{
			memberService.memDelete(id);
			request.getSession().invalidate();
			return "main.tiles";
		}
		
		
	}
}
