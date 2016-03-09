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

@Controller
public class planController {
	
	private static final org.slf4j.Logger logger=
	LoggerFactory.getLogger(planController.class);
	
	@Autowired
	private planService planService;
	
	
	@RequestMapping(value="plan.do", method={RequestMethod.GET, RequestMethod.POST})
	public String plan(planDTO pdto, Model model, HttpServletRequest request) throws Exception {
		
		memberDTO mem = (memberDTO) request.getSession().getAttribute("login");
		String id = mem.getId();
		pdto.setId(id);

		System.out.println(pdto.getId());
		logger.info("Welcome planController= " + new Date());
		
		List<planDTO> listplan = planService.listPlan(pdto);
		model.addAttribute("listplan", listplan);
		logger.info("Welcome planController listPlan= " + new Date());
		
		/*List<planDTO> eventplan = planService.eventPlan(pdto);
		model.addAttribute("eventplan", eventplan);*/
		
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