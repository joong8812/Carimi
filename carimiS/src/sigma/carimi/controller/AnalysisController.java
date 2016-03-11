package sigma.carimi.controller;

import java.util.Date;
import java.util.Iterator;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
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
import sigma.carimi.model.CARDDTOSltd;
import sigma.carimi.model.CARDDTOCond;
import sigma.carimi.model.expenditureDTO;
import sigma.carimi.service.CARDService;


@Controller
public class AnalysisController {

	private static final Logger logger = 
	LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private CARDService CARDService;
	
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
		
		System.out.println("��Ʈ�ѷ� : " +a1);
		System.out.println("��Ʈ�ѷ� : " +b1);
		System.out.println("��Ʈ�ѷ� : " +c11);
		System.out.println("��Ʈ�ѷ� : " +c12);
		System.out.println("��Ʈ�ѷ� : " +c13);
		System.out.println("��Ʈ�ѷ� : " +c14);
		System.out.println("��Ʈ�ѷ� : " +c15);
		System.out.println("��Ʈ�ѷ� : " +c16);
		
		
		//List<CARDDTOSltd> CARDinformList;
		//CARDinformList = CARDService.getCARDinformList(c1[0],c1[1],c1[2],c1[3],c1[4],c1[5],a1,b1);
		List<CARDDTOSltd> CARDinformList = CARDService.getCARDinformList(ccond);
		// �Ʒ��� �͵��� CARDinformList�κ��� �޾� �� ���� member�� ���� ����Ͽ� analysisAF���� ��� �� �� �ְ� ���ش�.
		
		
//		model.addAttribute("CARDNAME", CARDNAME);
//		model.addAttribute("IMG", IMG);
//		model.addAttribute("sel1",sel1);
//		model.addAttribute("sel2",sel2);
//		model.addAttribute("sel3",sel3);
//		model.addAttribute("sel4",sel4);
//		model.addAttribute("sel5",sel5);
//		model.addAttribute("sel6",sel6);
//		model.addAttribute("sel7",sel7);
//		model.addAttribute("sel8",sel8);
		
		System.out.println(" ����� analysis controller!!! list " + CARDinformList.get(0));
		int arr[][] = new int[1][2];
		arr[0][0] = 1;
		arr[0][1] = 2;
		
		model.addAttribute("cinfolist", CARDinformList);
		model.addAttribute("arr", arr);
		
		return "analysisAF.tiles";
	}
}

