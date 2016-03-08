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
public class AnalysisController {

	private static final Logger logger = 
	LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private memberService memberService;
	
	@RequestMapping(value = "analysis.do", 
			method = RequestMethod.GET)
	public String analysis(Model model) {		
		logger.info("Welcome MemberController login! "+ new Date());
		return "analysis.tiles";
	}

}

