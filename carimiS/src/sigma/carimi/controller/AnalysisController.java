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
import org.springframework.web.bind.annotation.RequestParam;
import sigma.carimi.model.CARDDTOCond;
import sigma.carimi.model.memberDTO;
import sigma.carimi.model.CARDDTO;
import sigma.carimi.service.CARDService;
import sigma.carimi.service.memberService;


@Controller
public class AnalysisController {

	private static final Logger logger = 
	LoggerFactory.getLogger(MemberController.class);
	
//	@Autowired
//	private CARDService CARDService;
//	
	@RequestMapping(value = "analysis.do", 
			method = RequestMethod.GET)
	public String analysis(Model model) {		
		logger.info("Welcome AnalysisController! "+ new Date());
		return "analysis.tiles";
	}
	

	@RequestMapping(value = "analysisAF.do", 
			method = RequestMethod.POST)
	public String analysisAF(HttpServletRequest request, Model model) throws Exception {
		logger.info("Welcome AnalysisAFController! "+ new Date());
		String a1 = request.getParameter("a1");
		String b1 = request.getParameter("b1");
		String[] c1 = request.getParameterValues("c1");
		System.out.println(a1);
		System.out.println(b1);
		for(int i=0;i<c1.length;i++){
		System.out.println(c1[i]);
		}
		return "analysisAF.tiles";
	}
}

