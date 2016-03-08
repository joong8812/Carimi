package sigma.carimi.controller;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import sigma.carimi.model.expenditureDTO;
import sigma.carimi.model.memberDTO;
import sigma.carimi.service.expenditureService;


@Controller
public class ExpenditureController {

	private static final Logger logger = LoggerFactory.getLogger(ExpenditureController.class);
		
		@Autowired
		private expenditureService expenditureService;
		
		@RequestMapping(value="explist.do", method={RequestMethod.GET,RequestMethod.POST})
		public String explist(Model model, HttpSession session, HttpServletRequest request)throws Exception{
			logger.info("Welcome ExpenditureController explist! "+ new Date());
			
			memberDTO mem = (memberDTO) request.getSession().getAttribute("login");
			String id = mem.getId();
			System.out.println("id="+id);
			
			Calendar cal = Calendar.getInstance();
			cal.set(Calendar.DATE, 1);
			String eyear = request.getParameter("year");
			String emonth = request.getParameter("month");
			System.out.println(emonth);

			int year = cal.get(Calendar.YEAR);
			System.out.println("year="+year);
			if (!(eyear == null || eyear.trim().equalsIgnoreCase(""))) {
				year = Integer.parseInt(eyear);
			}
			System.out.println("year2="+year);
			int month = cal.get(Calendar.MONTH) + 1;
			System.out.println("month="+month);
			if (!(emonth == null || emonth.trim().equalsIgnoreCase(""))) {
				month = Integer.parseInt(emonth);
			}
			System.out.println("month2="+month);
			if (month < 1) {
				month = 12;
				year--;
			}
			if (month > 12) {
				month = 1;
				year++;
			}

			cal.set(year, month - 1, 1); // 첫날로 셋팅

			String sf = String.format("%d년 %d월", year, month);
			String sf2 = String.format("%d년 ", year);
			String syear = Integer.toString(year);
			String smonth = Integer.toString(month);
			if (smonth.length() != 2) {
				smonth = "0" + smonth;
			}
			String sf3 = syear + "-" + smonth;
			System.out.println("sf3="+sf3);
			String sleft = String.format("/CarimiS/views/expenditure/explist.jsp?year=%d&month=%d", year, month - 1);
			String sright = String.format("/CarimiS/views/expenditure/explist.jsp?year=%d&month=%d", year, month + 1);
			
			expenditureDTO edto = new expenditureDTO();
			edto.setId(id);
			edto.setWdates(sf3);
			
			List<expenditureDTO> explist = expenditureService.getexpList(edto);
			model.addAttribute("explist", explist);
			model.addAttribute("sf", sf);
			model.addAttribute("sleft", sleft);
			model.addAttribute("sright", sright);
			return "explist.tiles";
			
		}

		@RequestMapping(value="expwrite.do", method={RequestMethod.GET,RequestMethod.POST})
		public String expwrite(Model model, HttpSession session, HttpServletRequest request)throws Exception{
			logger.info("Welcome ExpenditureController expwrite! "+ new Date());
		
			memberDTO mem = (memberDTO) request.getSession().getAttribute("login");
			String id = mem.getId();
			System.out.println("id="+id);
			
			Calendar cal = Calendar.getInstance();
			cal.set(Calendar.DATE, 1);
			String eyear = request.getParameter("year");
			String emonth = request.getParameter("month");
			System.out.println(emonth);

			int year = cal.get(Calendar.YEAR);
			System.out.println("year="+year);
			if (!(eyear == null || eyear.trim().equalsIgnoreCase(""))) {
				year = Integer.parseInt(eyear);
			}
			System.out.println("year2="+year);
			int month = cal.get(Calendar.MONTH) + 1;
			System.out.println("month="+month);
			if (!(emonth == null || emonth.trim().equalsIgnoreCase(""))) {
				month = Integer.parseInt(emonth);
			}
			System.out.println("month2="+month);
			if (month < 1) {
				month = 12;
				year--;
			}
			if (month > 12) {
				month = 1;
				year++;
			}

			cal.set(year, month - 1, 1); // 첫날로 셋팅

			String sf = String.format("%d년 %d월", year, month);
			String sf2 = String.format("%d년 ", year);
			String syear = Integer.toString(year);
			String smonth = Integer.toString(month);
			if (smonth.length() != 2) {
				smonth = "0" + smonth;
			}
			String sf3 = syear + "-" + smonth;
			System.out.println("sf3="+sf3);

			String wyear = request.getParameter("year");
			String wmonth = request.getParameter("month");
			String day = request.getParameter("day");

			expenditureDTO edto = new expenditureDTO();
			edto.setId(id);
			edto.setWdates(sf3);
			List<expenditureDTO> explist = expenditureService.getexpList(edto);
			model.addAttribute("explist", explist);
			model.addAttribute("year", wyear);
			model.addAttribute("month", wmonth);
			model.addAttribute("day", day);

			return "expwrite.tiles";
		}
		
		@RequestMapping(value="expsave.do", method={RequestMethod.POST})
		public String expsave(expenditureDTO edto, Model model, HttpSession session, HttpServletRequest request)throws Exception{
			logger.info("Welcome ExpenditureController expsave! "+ new Date());
		
			memberDTO mem = (memberDTO) request.getSession().getAttribute("login");
			String id = mem.getId();

			String wdate = request.getParameter("wdate");
			String moneytype = request.getParameter("moneytype");
			String bcategory = request.getParameter("bcategory");
			String scategory = request.getParameter("sca");
			String shopname = request.getParameter("shopname");
			int price = Integer.parseInt(request.getParameter("price"));

			System.out.println("af_id="+ id);
			System.out.println("af_wdate="+ wdate);
			System.out.println("af_moneytype="+ moneytype);
			System.out.println("af_price="+ price);
			System.out.println("af_shopname="+ shopname);
			System.out.println("af_bcategory="+ bcategory);
			System.out.println("af_scategory="+ scategory);
			
			boolean isS = expenditureService.addexp(new expenditureDTO(id,wdate,moneytype,bcategory,scategory,shopname,price));
			model.addAttribute("isS", isS);
			
			return "redirect:/explist.do";
		}
		
		@RequestMapping(value="explistD.do", method={RequestMethod.GET,RequestMethod.POST})
		public String explistD(Model model, HttpSession session, HttpServletRequest request, int seq)throws Exception{
			logger.info("Welcome ExpenditureController explistD! "+ new Date());
		
			/*int seq = Integer.parseInt(request.getParameter("seq"));*/
			System.out.println("delete_seq="+ seq);
			boolean isS = expenditureService.deleteexp(seq);
			model.addAttribute("isS", isS);
			
			return "redirect:/explist.do";
		}
		
		@RequestMapping(value="expupdate.do", method={RequestMethod.GET,RequestMethod.POST})
		public String expupdate(Model model, HttpSession session, HttpServletRequest request, int seq)throws Exception{
			logger.info("Welcome ExpenditureController expupdate! "+ new Date());
		
			memberDTO mem = (memberDTO) request.getSession().getAttribute("login");
			String id = mem.getId();
			System.out.println("id="+id);
			
			Calendar cal = Calendar.getInstance();
			cal.set(Calendar.DATE, 1);
			String eyear = request.getParameter("year");
			String emonth = request.getParameter("month");
			System.out.println(emonth);

			int year = cal.get(Calendar.YEAR);
			System.out.println("year="+year);
			if (!(eyear == null || eyear.trim().equalsIgnoreCase(""))) {
				year = Integer.parseInt(eyear);
			}
			System.out.println("year2="+year);
			int month = cal.get(Calendar.MONTH) + 1;
			System.out.println("month="+month);
			if (!(emonth == null || emonth.trim().equalsIgnoreCase(""))) {
				month = Integer.parseInt(emonth);
			}
			System.out.println("month2="+month);
			if (month < 1) {
				month = 12;
				year--;
			}
			if (month > 12) {
				month = 1;
				year++;
			}

			cal.set(year, month - 1, 1); // 첫날로 셋팅

			String sf = String.format("%d년 %d월", year, month);
			String sf2 = String.format("%d년 ", year);
			String syear = Integer.toString(year);
			String smonth = Integer.toString(month);
			if (smonth.length() != 2) {
				smonth = "0" + smonth;
			}
			String sf3 = syear + "-" + smonth;
			System.out.println("sf3="+sf3);

			String wyear = request.getParameter("year");
			String wmonth = request.getParameter("month");
			String day = request.getParameter("day");

			expenditureDTO edto = expenditureService.expall(seq);
			edto.setId(id);
			edto.setWdates(sf3);
			System.out.println("uf_seq="+ seq);
			System.out.println("uf_id="+ id);
			System.out.println("expupdate.to="+edto.getSeq());
			
			model.addAttribute("edto", edto);

			model.addAttribute("year", wyear);
			model.addAttribute("month", wmonth);
			model.addAttribute("day", day);

			return "expupdate.tiles";
		}
		
		@RequestMapping(value="updsave.do", method={RequestMethod.POST})
		public String updsave(expenditureDTO edto, Model model, HttpSession session, HttpServletRequest request)throws Exception{
			logger.info("Welcome ExpenditureController updsave! "+ new Date());
		
			memberDTO mem = (memberDTO) request.getSession().getAttribute("login");
			String id = mem.getId();

			int seq = Integer.parseInt(request.getParameter("seq"));
			System.out.println("updsave.to="+seq);
			String wdate = request.getParameter("wdate");
			String moneytype = request.getParameter("moneytype");
			String bcategory = request.getParameter("bcategory");
			String scategory = "";
			if (request.getParameter("sca") != null && !request.getParameter("sca").equals("")) {
				scategory = request.getParameter("sca");
			}			
			String shopname = request.getParameter("shopname");
			int price = Integer.parseInt(request.getParameter("price"));
		
			expenditureDTO edto2 = new expenditureDTO();
			edto2.setId(id);
			edto2.setBcategory(bcategory);
			edto2.setMoneytype(moneytype);
			edto2.setPrice(price);
			edto2.setScategory(scategory);
			edto2.setSeq(seq);
			edto2.setShopname(shopname);
			edto2.setWdate(wdate);
		

			boolean isS = expenditureService.updexp(edto2);
			model.addAttribute("isS", isS);
			
			return "redirect:/explist.do";
		}

		@RequestMapping(value="monlist.do", method={RequestMethod.GET,RequestMethod.POST})
		public String monlist(Model model)throws Exception{
			logger.info("Welcome ExpenditureController monlist! "+ new Date());
		
			return "monlist.tiles";
		}

}
