package sigma.carimi.controller;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;


import jdk.nashorn.internal.ir.RuntimeNode.Request;

import sigma.carimi.model.expenditureDTO;

import sigma.carimi.model.memberDTO;
import sigma.carimi.model.visitDTO;
import sigma.carimi.service.memberService;

@Controller
public class MemberController {
	
	private static final Logger logger = 
	LoggerFactory.getLogger(MemberController.class);
	
	
	
	@Autowired
	private memberService memberService;
	
	

	@RequestMapping(value = "main.do", method = RequestMethod.GET)
	public String main(Model model,HttpServletRequest request, visitDTO visit ) throws Exception {		
		logger.info("Welcome MemberController main! "+ new Date());
		  HttpServletRequest req = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		  String ip = req.getHeader("X-FORWARDED-FOR");

	        if (ip == null)

	            ip = req.getRemoteAddr();
		 HttpSession session = request.getSession(); 
		 visit.setIp(ip);
		 System.out.println(ip);
		
		  if(session.isNew()){//새로운 브라우저의 요청이 발생한다면
				
				 System.out.println(memberService.addVisit(visit));
		  }
		 
			/**/
	       
		return "main.tiles";
	}
	
		
	@RequestMapping(value = "login.do", 
			method = RequestMethod.GET)
	public String login(Model model, HttpServletRequest request) {		
		logger.info("Welcome MemberController login! "+ new Date());
		String prevurl = request.getHeader("referer");
		model.addAttribute("prevurl", prevurl);
		return "login.tiles";
	}
	
	@RequestMapping(value = "loginAf.do", 
			method = RequestMethod.POST)
	public String loginAf(HttpServletRequest request, HttpServletResponse res, 
			memberDTO member, Model model, String prevurl) throws Exception {
		logger.info("Welcome MemberController loginAf! "+ new Date());
	
		memberDTO login = null;
		login = memberService.loginMember(member);
		if(login!=null && !login.getId().equals("")){
			request.getSession().setAttribute("login", login);
			String[] url = prevurl.split("/");
			return "redirect:/" + url[url.length-1];
		}
			res.setContentType("text/html;charset=UTF-8");
			
			res.getWriter().write("<script language='JavaScript'>");
			res.getWriter().write("alert('아이디 또는 비밀번호를 확인하세요.');");
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
		String prevurl = request.getHeader("referer");
		model.addAttribute("prevurl", prevurl);
		return "login.tiles";
	}
	@RequestMapping(value = "sign.do", 
			method = {RequestMethod.GET, RequestMethod.POST})
	public String sign(Model model) {		
		logger.info("Welcome MemberController sign! "+ new Date());
		return "sign.tiles";
	}
	
	@RequestMapping(value = "signup.do", 
			method = {RequestMethod.GET, RequestMethod.POST})
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
		
		memberDTO mdto = memberService.memberOne(bdto);
		
		model.addAttribute("mdto", mdto);
		return "meminfo.tiles";
		
	}
	
	@RequestMapping(value = "meminfoAf.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String meminfoAf(HttpServletRequest request, memberDTO member, 
			Model model, String[] fav, String goo, String mode, String id) throws Exception {
		logger.info("Welcome MemberController meminfoAf! "+ new Date());
		
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
		@RequestMapping(value="admin_analysis.do", method={RequestMethod.GET,RequestMethod.POST})
		public String admin_analysis(Model model, memberDTO mdto, HttpSession session, HttpServletRequest request) throws Exception{
			logger.info("Welcome MemberController admin_analysis! "+ new Date());
			
			
			String[] cardname = {"shin1", "shin2", "guk1", "guk2", "uri1", "uri2", "ha1", "ha2", 
					"lot1", "lot2", "sam1", "sam2", "nong1", "nong2", "gi1", "gi2", "ci1", "ci2"};
			String[] k_cardname = {"신한love", "신한tasty", "국민goodday", "국민ddam", "우리damoa",
					"우리gadeuk", "하나pop", "하나2xa", "롯데dcsu", "롯데dcsm", "삼성sclass",
					"삼성2v2", "농협smarty", "농협take5", "기업ibkhi", "기업cham", "씨티mul",
					"씨티cle"};
			int[] humanage = {20, 30, 40, 50, 60};
			String[] sex  = {"man", "woman", "all"};
			
			// The number of customer per age
			int[] ctmXage = new int[humanage.length+1];
			for(int i=0; i<humanage.length; i++){
				ctmXage[i] = memberService.cntHumanXAge(humanage[i]-1, humanage[i]+10);
			}
			ctmXage[humanage.length] = memberService.cntHumanXAge(19, 70);
			model.addAttribute("ctmXage", ctmXage);
			
			// How many cards per age
			int[][] ageXcard = new int[humanage.length][cardname.length];
			int[][] sort_ageXcard = new int[humanage.length][cardname.length];
			int[][] top3 = new int[humanage.length][3];
			
			for(int i=0; i<humanage.length; i++){
				for(int j=0; j<cardname.length; j++){
					ageXcard[i][j] = memberService.cntPerCardAge(cardname[j], cardname[j], humanage[i]-1, humanage[i]+10);
//					System.out.println(humanage[i] + " / " + cardname[j] + " = " + ageXcard[i][j]);
				}
			}
			
			for(int i=0; i<humanage.length; i++){
				sort_ageXcard[i] = j_sort(ageXcard[i]);
			}
			
			for(int i=0; i<humanage.length; i++){
				for(int j=0; j<3; j++){
					int cnt = 0;
					for(int k=0; k<cardname.length; k++){
						if(sort_ageXcard[i][j] == ageXcard[i][k] && cnt<1){
							top3[i][j] = k;
							cnt++;
//							System.out.println(humanage[i] + " / " + cardname[k] + " = " + sort_ageXcard[i][j]);
						}
					}
				}
			}

			model.addAttribute("sort_ageXcard", sort_ageXcard);
			model.addAttribute("top3", top3);
			model.addAttribute("k_cardname", k_cardname);
			
			// The number of customer per card
			int[][] hmXcard = new int[cardname.length][sex.length];
			for(int i=0; i<cardname.length; i++){
				for(int j=0; j<sex.length; j++){
					hmXcard[i][j] = memberService.cntHumanXCard(cardname[i], sex[j]);
				}
			}
			
			model.addAttribute("hmXcard", hmXcard);
			
			// benefit preference per card
			String[] benefit = {"oil", "shop", "mart", "cvs", "eou",
					"cafe", "movie", "tra", "tel", "edu", "cul", "lei",
					"medi", "bea", "poi"};
			int[][] benefitXcard = new int[cardname.length][benefit.length];
			for(int i=0; i<cardname.length; i++){
				for(int j=0; j<benefit.length; j++){
					benefitXcard[i][j] = memberService.cntBenefitXCard(cardname[i], benefit[j]);
				}
			}
			
			model.addAttribute("benefitXcard", benefitXcard);
			
			return "admin_analysis.tiles";
	}
		
	public int[] j_sort(int[] t_sort){
		int tmp;
		int tt[] = new int[18];
		for(int i=0; i<t_sort.length; i++){
			tt[i] = t_sort[i];
		}
		
		for(int j=0; j<tt.length; j++){
			for(int i=0; i<tt.length-1; i++){
				if(tt[i]<tt[i+1]){
					tmp = tt[i];
					tt[i] = tt[i+1];
					tt[i+1] = tmp;
				}
			}
		}
		return tt;
	}
	
	@RequestMapping(value="admin_exanalysis.do", method={RequestMethod.GET,RequestMethod.POST})
	public String admin_exanalysis(Model model, memberDTO mdto, HttpSession session, HttpServletRequest request) throws Exception{
		logger.info("Welcome MemberController admin_exanalysis! "+ new Date());
		
		String[] cardname = {"shin1", "shin2", "guk1", "guk2", "uri1", "uri2", "ha1", "ha2", 
				"lot1", "lot2", "sam1", "sam2", "nong1", "nong2", "gi1", "gi2", "ci1", "ci2"};
		String[] benefit = {"oil", "shop", "mart", "cvs", "eou",
				"cafe", "movie", "tra", "tel", "edu", "cul", "lei",
				"medi", "bea"};
		int[][] sum_bnfXcard = new int[cardname.length][benefit.length];
		
		for(int i=0; i<cardname.length; i++){
			for(int j=0; j<benefit.length; j++){
				sum_bnfXcard[i][j] = memberService.sumBenefitXCard(cardname[i], benefit[j]);
			}
		}
		model.addAttribute("sum_bnfXcard", sum_bnfXcard);
		for(int i=0; i<cardname.length; i++){
			for(int j=0; j<benefit.length; j++){
				System.out.println(cardname[i] + " / " + benefit[j] + " = " +sum_bnfXcard[i][j]);
			}
		}
		
		
		return "admin_exanalysis.tiles";
	}

}
