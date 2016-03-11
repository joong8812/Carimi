package sigma.carimi.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import sigma.carimi.model.CARDDTOCond;
import sigma.carimi.model.CARDDTOSltd;
import sigma.carimi.service.CARDService;

@Controller
public class TestController {
	private static final Logger logger = 
	LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private CARDService CARDService;
	
	@RequestMapping(value = "analysisAF.do", 
			method = RequestMethod.POST)
	public String analysisAF(HttpServletRequest request, Model model) throws Exception {
		logger.info("Welcome AnalysisAFController! "+ new Date());
		int a1 = Integer.parseInt(request.getParameter("a1"));
		int b1 = Integer.parseInt(request.getParameter("b1"));
		String[] c1ready = request.getParameterValues("c1");
		String c11= c1ready[0];
		String c12= c1ready[1];
		String c13= c1ready[2];
		String c14= c1ready[3];
		String c15= c1ready[4];
		String c16= c1ready[5];
		
		CARDDTOCond ccond = new CARDDTOCond();
		ccond.setA1(a1);
		ccond.setB1(b1);
		ccond.setC11(c11);
		ccond.setC12(c12);
		ccond.setC13(c13);
		ccond.setC14(c14);
		ccond.setC15(c15);
		ccond.setC16(c16);
		
		List<CARDDTOSltd> CARDinformList = CARDService.getCARDinformList(ccond);
		
		model.addAttribute("CARDinformList", CARDinformList);
		model.addAttribute("CARDinformListSize", CARDinformList.size());

		
		return "analysisAF.tiles";
	}
}
