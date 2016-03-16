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
		 
			int count= memberService.visitAll();
			
	         

	        model.addAttribute("ip", ip);
	        model.addAttribute("count",count);
	       
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
					"lot1", "lot2", "sam1", "sam2", "nong1", "nong2", "gi1", "gi2", "ci", "ci2"};
			int[] n_cardname = {0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17};
			int[] humanage = {20, 30, 40, 50, 60};
			int[][] ageXcard = new int[humanage.length][cardname.length];
			int[][] sort_ageXcard = new int[humanage.length][cardname.length];
			
			for(int i=0; i<humanage.length; i++){
				for(int j=0; j<cardname.length; j++){
					ageXcard[i][j] = memberService.cntPerCardAge(cardname[j], cardname[j], humanage[i]-1, humanage[i]+10);
					System.out.println(humanage[i] + " / " + cardname[j] + " = " + ageXcard[i][j]);
				}
			}
			
			
			for(int i=0; i<humanage.length; i++){
				//sort_ageXcard[i] = j_sort(ageXcard[i], n_cardname);
				sort_ageXcard[i] = j_sort(ageXcard[i]);
			}
			
			System.out.println("cpcpcpcpcpcp");
			for(int i=0; i<humanage.length; i++){
				for(int j=0; j<cardname.length; j++){
					System.out.println(humanage[i] + " / " + cardname[j] + " = " + ageXcard[i][j]);
				}
			}
			System.out.println("cpcpcpcpcpcp");
			
			for(int i=0; i<humanage.length; i++){
				for(int j=0; j<cardname.length; j++){
					for(int k=0; k<cardname.length; k++){
						if(sort_ageXcard[i][j] == ageXcard[i][k]){
							System.out.println("k = " + k);
							System.out.println(humanage[i] + " / " + cardname[k] + " = " + sort_ageXcard[i][j]);
						}
					}
				}
			}
			
			
			
			
			List<memberDTO> memberlist = new ArrayList<memberDTO>();
			
			model.addAttribute("memberlist",memberlist);
			
			// 카드 이름 18개를 변수로 받아와서 넣고 맵으로 받아옴. Map<카드이름을 키값으로,count(*)로 숫자> 받아온후 desc하고 3개 순서대로
			/*List<Integer> twlist = new ArrayList<Integer>(cardname);
			
			int age = 20;
			
			allMap = memberService.allList(age);
			System.out.println(all.size());
			
			model.addAttribute("all", all);
			*/
			
			
			return "admin_analysis.tiles";
		
		
	}
		
//	public int[] j_sort(int[] t_sort, int cardname[]){
////		int tmp;
//		int s_tmp;
//		
//		for(int j=0; j<t_sort.length; j++){
//			for(int i=0; i<t_sort.length-1; i++){
//				if(t_sort[i]<t_sort[i+1]){
////					tmp = t_sort[i];
//					System.out.println("before : [" + i + "] = " + cardname[i] +" / " + t_sort[i]);
//					s_tmp = cardname[i];
////					t_sort[i] = t_sort[i+1];
//					cardname[i] = cardname[i+1];
////					t_sort[i+1] = tmp;
//					cardname[i+1] = s_tmp;
//					System.out.println("after : [" + i + "] = " + cardname[i] +" / " + t_sort[i]);
//				}
//			}
//		}
//	
//		System.out.println("-------------------");
//		for(int i=0; i<cardname.length; i++){
//			System.out.println(cardname[i]);
//		}
//		System.out.println("-------------------");
//		
//		return cardname;
//	}
	
	public int[] j_sort(int[] t_sort){
		int tmp;
		int tt[] = t_sort;
		
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

}
