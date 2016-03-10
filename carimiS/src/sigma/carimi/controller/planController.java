package sigma.carimi.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.HttpRequestHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import sigma.carimi.model.*;
import sigma.carimi.service.*;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

@Controller
public class planController {
	
	private static final org.slf4j.Logger logger=
	LoggerFactory.getLogger(planController.class);
	
	@Autowired
	private planService planService;
	
	
	@RequestMapping(value="plan.do", method={RequestMethod.GET, RequestMethod.POST})
	public String plan(planDTO pdto, Model model, HttpServletRequest request) throws Exception {
		
		memberDTO mem = (memberDTO) request.getSession().getAttribute("login");
		if(mem == null) {
			return "plan.tiles";
		}
		
		String id = mem.getId();
		pdto.setId(id);

		logger.info("Welcome planController= " + new Date());
		
		List<planDTO> listplan = planService.listPlan(pdto);
		model.addAttribute("listplan", listplan);
		logger.info("Welcome planController listPlan= " + new Date());
		
		
		String mc1 = mem.getMycard1();
		String mc2 = mem.getMycard2();
		String[] e_card = {"shin1", "shin2", "guk1", "guk2", "uri1", "uri2", "ha1", "ha2", "lot1", "lot2", "sam1",
				"sam2", "nong1", "nong2", "gi1", "gi2", "ci1", "ci2", "미보유"};
		String[] k_card = {"신한 LOVE", "신한 Tasty", "국민 굿데이", "국민 다담", "우리 다모아할인", "우리 가득한할인", "하나 Pop", "하나 2X 알파",
				"롯데 DC 슈프림", "롯데 DC 스마트", "삼성 S클래스", "삼성 2 v2", "농협 스마티", "농협 Take5", "기업 IBK Hi", "기업 참!좋은친구",
				"씨티 멀티플러스", "씨티 클리어", "미보유"};
		String mycard1 = "";
		String mc1_shot = "";
		String mycard2 = "";
		String mc2_shot = "";
		System.out.println(e_card.length);
		System.out.println("mc1= "+ mc1 + "/ mc2= " + mc2);
		for (int i = 0; i < e_card.length; i++) {
			if (e_card[i].indexOf(mc1) >= 0) {
				mycard1 = k_card[i];
				mc1_shot = k_card[i].substring(0, 2);
			}
			if (e_card[i].indexOf(mc2) >= 0) {
				mycard2 = k_card[i];
				mc2_shot = k_card[i].substring(0, 2);
			}
		}
		
		List<planDTO> cardevent = planService.eventPlan(pdto);
			
			
		for(int i=0; i<cardevent.size(); i++){
			if(cardevent.get(i).getBtitle().contains(mc1_shot)) {
				model.addAttribute("cardevent1", cardevent.get(i));
				System.out.println("cardevent1= " + cardevent.get(i));
			}
			if(cardevent.get(i).getBtitle().contains(mc2_shot)) {
				model.addAttribute("cardevent2", cardevent.get(i));
				System.out.println("cardevent2= " + cardevent.get(i));
			}
		
		}

		String[] cardlist = {mycard1, mycard2};
		model.addAttribute("cardlist", cardlist);
		logger.info("Welcome planController cardlist= " + new Date());
		
		
		return "plan.tiles";
	}
	
	@RequestMapping(value="plandetail.do", method={RequestMethod.GET, RequestMethod.POST})
	 public String plandetail(planDTO pdto, Model model, HttpServletRequest request) throws Exception {
		logger.info("Welcome planController.planDetail= " + new Date());
		
		planDTO detailplan = planService.selPlan(pdto);
		model.addAttribute("detailplan", detailplan);
		return "plandetail.tiles";
	}

	@RequestMapping(value="addplan.do", method={RequestMethod.GET, RequestMethod.POST})
	public String addplan(planDTO pdto, Model model, HttpServletRequest request)throws Exception {
		logger.info("Welcome planController.addPlan= " + new Date());
		model.addAttribute("addplan", "addplan");
		return "addplan.tiles";
	}
	
	@RequestMapping(value="addplanAf.do", method=RequestMethod.POST)
	public String addplanAf(planDTO pdto, Model model, HttpServletRequest request) throws Exception {
		logger.info("Welcome planController.addPlanAf= " + new Date());
		memberDTO mem = (memberDTO) request.getSession().getAttribute("login");
		String id = mem.getId();
		
		pdto.setPadate(request.getParameter("padate"));
		pdto.setPatime(request.getParameter("patime"));
		pdto.setPtitle(request.getParameter("ptitle"));
		pdto.setPcontent(request.getParameter("pcontent"));
		pdto.setPlocal(request.getParameter("plocal"));
		pdto.setPwdate(request.getParameter("pwdate"));
		pdto.setPedate(request.getParameter("pedate"));
		pdto.setPetime(request.getParameter("petime"));
		
		pdto.setPlocation_x(request.getParameter("lx"));
		pdto.setPlocation_y(request.getParameter("ly"));
		
		boolean isS = planService.addPlan(pdto);
		model.addAttribute("isS", isS);
		
		return "redirect:/plan.do";
	}
	
	@RequestMapping(value="updplan.do", method={RequestMethod.GET, RequestMethod.POST})
	public String updplan(planDTO pdto, Model model, HttpServletRequest request) throws Exception{
		logger.info("Welcome planController.updPlan= " + new Date());
		planDTO updplan = planService.selPlan(pdto);
		model.addAttribute("updplan", updplan);
		return "updplan.tiles";
	}
	
	@RequestMapping(value="updplanaf.do", method=RequestMethod.POST)
	public String updplanaf(planDTO pdto, Model model, HttpServletRequest request) throws Exception {
		logger.info("Welcome planController.updPlan= " + new Date());
		memberDTO mem = (memberDTO) request.getSession().getAttribute("login");
		String id = mem.getId();
		
		int pseq = Integer.parseInt(request.getParameter("pseq"));
		pdto.setPseq(pseq);
		pdto.setPadate(request.getParameter("padate"));
		pdto.setPatime(request.getParameter("patime"));
		pdto.setPtitle(request.getParameter("ptitle"));
		pdto.setPcontent(request.getParameter("pcontent"));
		pdto.setPlocal(request.getParameter("plocal"));
		pdto.setPwdate(request.getParameter("pwdate"));
		pdto.setPedate(request.getParameter("pedate"));
		pdto.setPetime(request.getParameter("petime"));
		
		pdto.setPlocation_x(request.getParameter("lx"));
		pdto.setPlocation_y(request.getParameter("ly"));
		
		boolean isS = planService.updPlan(pdto);
		model.addAttribute("isS", isS);
		
		return "redirect:/plan.do";
	}

	@RequestMapping(value="delplan.do", method={RequestMethod.GET, RequestMethod.POST})
	public String delplan(planDTO pdto, Model model, HttpServletRequest request) throws Exception {
		logger.info("Welcome planController.delPlan= " + new Date());
		planService.delPlan(pdto);
		return "redirect:/plan.do";
	}
}