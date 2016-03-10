package sigma.carimi.controller;

import java.text.DecimalFormat;
import java.text.NumberFormat;
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
		public String explist(Model model, HttpSession session, HttpServletRequest request, String year, String month) throws Exception{
			logger.info("Welcome ExpenditureController explist! "+ new Date());
			
			memberDTO mem = (memberDTO) request.getSession().getAttribute("login");
			if(mem==null){
				return "explist.tiles";
			}
			String id = mem.getId();
			System.out.println("id="+id);
						
			Calendar cal = Calendar.getInstance();
			int int_year = cal.get(Calendar.YEAR);
			int int_month = cal.get(Calendar.MONTH) + 1;
			
			if (year != null && !year.equals("")) {
				int_year = Integer.parseInt(year); 
			}			
			if (month != null && !month.equals("")) {
				int_month = Integer.parseInt(month);
			}
			
			// 占쏙옙占쏙옙 0占싱거놂옙 13占쏙옙  占쏙옙占�  처占쏙옙占쏙옙占쌍깍옙
			if (int_month < 1) {
				int_month = 12;
				int_year--;
			}
			if (int_month > 12) {
				int_month = 1;
				int_year++;
			}

			String sf = String.format("%d占쏙옙 %d占쏙옙", int_year, int_month);
			String sf2 = String.format("%d占쏙옙 ", int_year);
			String syear = Integer.toString(int_year);
			String smonth = Integer.toString(int_month);
			
			if (smonth.length() < 2) {
				smonth = "0" + smonth;
			}
			
			String sf3 = syear + "-" + smonth;
			System.out.println("sf3="+sf3);

			expenditureDTO edto = new expenditureDTO();
			edto.setId(id);
			edto.setWdates(sf3);
			
			List<expenditureDTO> explist = expenditureService.getexpList(edto);
			model.addAttribute("year", int_year);
			model.addAttribute("month", int_month);			
			model.addAttribute("explist", explist);
			model.addAttribute("sf", sf);
			model.addAttribute("id", id);
			model.addAttribute("sf3", sf3);
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

			cal.set(year, month - 1, 1); // 첫占쏙옙占쏙옙 占쏙옙占쏙옙

			String sf = String.format("%d占쏙옙 %d占쏙옙", year, month);
			String sf2 = String.format("%d占쏙옙 ", year);
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
			model.addAttribute("id", id);

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

			cal.set(year, month - 1, 1); // 첫占쏙옙占쏙옙 占쏙옙占쏙옙

			String sf = String.format("%d占쏙옙 %d占쏙옙", year, month);
			String sf2 = String.format("%d占쏙옙 ", year);
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
			model.addAttribute("id", id);

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
		
		@RequestMapping(value="listsearch.do", method={RequestMethod.GET,RequestMethod.POST})
		public String listsearch(expenditureDTO edto, Model model, HttpSession session, HttpServletRequest request, String year, String month, String stext)throws Exception{
			logger.info("Welcome ExpenditureController listsearch! "+ new Date());
		
			memberDTO mem = (memberDTO) request.getSession().getAttribute("login");
			String id = mem.getId();
			System.out.println("id="+id);
						
			Calendar cal = Calendar.getInstance();
			int int_year = cal.get(Calendar.YEAR);
			int int_month = cal.get(Calendar.MONTH) + 1;
			
			if (year != null && !year.equals("")) {
				int_year = Integer.parseInt(year); 
			}			
			if (month != null && !month.equals("")) {
				int_month = Integer.parseInt(month);
			}
			
			// 占쏙옙占쏙옙 0占싱거놂옙 13占쏙옙  占쏙옙占�  처占쏙옙占쏙옙占쌍깍옙
			if (int_month < 1) {
				int_month = 12;
				int_year--;
			}
			if (int_month > 12) {
				int_month = 1;
				int_year++;
			}
			
			String sf = String.format("%d占쏙옙 %d占쏙옙", int_year, int_month);
			String sf2 = String.format("%d占쏙옙 ", int_year);
			String syear = Integer.toString(int_year);
			String smonth = Integer.toString(int_month);
			
			if (smonth.length() < 2) {
				smonth = "0" + smonth;
			}
			
			String sf3 = syear + "-" + smonth;
			System.out.println("sf3="+sf3);
			
			
			String text = "";
			if (stext != null && !stext.equals("")) {
				text = stext;
			}
						
			edto.setWdates(sf3);
			List<expenditureDTO> getsearchlist = expenditureService.searchList(stext);
			model.addAttribute("getsearchlist", getsearchlist);
	
			model.addAttribute("year", int_year);
			model.addAttribute("month", int_month);			
			model.addAttribute("stext", text);
			model.addAttribute("sf", sf);
			model.addAttribute("sf3", sf3);

			model.addAttribute("id", id);

			return "listsearch.tiles";
		}

		@RequestMapping(value="monlist.do", method={RequestMethod.GET,RequestMethod.POST})
		public String monlist(Model model, HttpSession session, HttpServletRequest request)throws Exception{
			logger.info("Welcome ExpenditureController monlist! "+ new Date());
		
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

			cal.set(year, month - 1, 1); // 첫占쏙옙占쏙옙 占쏙옙占쏙옙

			String sf = String.format("%d占쏙옙 %d占쏙옙", year, month);
			String sf2 = String.format("%d占쏙옙 ", year);
			String syear = Integer.toString(year);
			String smonth = Integer.toString(month);
			if (smonth.length() != 2) {
				smonth = "0" + smonth;
			}
			String sf3 = syear + "-" + smonth;
			System.out.println("sf3="+sf3);
			String sleft = String.format("/CarimiS/monlist.do?year=%d&month=%d", year, month - 1);
			String sright = String.format("/CarimiS/monlist.do?year=%d&month=%d", year, month + 1);
			
			expenditureDTO edto = new expenditureDTO();
			edto.setId(id);
			edto.setWdates(sf3);
			
			List<expenditureDTO> e1list = expenditureService.e1List(edto);
			
			model.addAttribute("e1list", e1list);
			model.addAttribute("sf", sf);
			model.addAttribute("sleft", sleft);
			model.addAttribute("sright", sright);
			model.addAttribute("sf3", sf3);
			model.addAttribute("id", id);

			int categorylist;
			int scategorylist;

			String[][] sumprice = null;
			String[][] sumscate = null;
			
			categorylist = e1list.size();
			sumprice = new String[categorylist][2];

			scategorylist = e1list.size();
			sumscate = new String[scategorylist][2];
			
			double sumoil=0;
			double sumshop=0;
			double summart=0;
			double sumcvs=0;
			double sumeou=0;
			double sumcafe=0;
			double summovie=0;
			double sumtra=0;
			double sumtel=0;
			double sumedu=0;
			double sumcul=0;
			double sumlei=0;
			double summedi=0;
			double sumbea=0;

			double totalsum = 0;
			 
				for (int j = 0; j < e1list.size(); j++) {
					expenditureDTO exp = e1list.get(j);
					String date = e1list.get(j).getWdate().substring(0, 7);
					if (date.equals(sf3)) {
						sumprice[j][0] = exp.getBcategory(); // bcategory 占싱몌옙占쏙옙 
						sumprice[j][1] = Integer.toString(exp.getPrice()); // price
						sumscate[j][0] = exp.getScategory(); // scategory 占싱몌옙占쏙옙
						sumscate[j][1] = Integer.toString(exp.getPrice()); // price       

						if (sumprice[j][0].equals("oil")) {
							sumoil = sumoil + Integer.parseInt(sumprice[j][1]);
						} else if (sumprice[j][0].equals("shop")) {
							sumshop = sumshop + Integer.parseInt(sumprice[j][1]);
						} else if (sumprice[j][0].equals("mart")) {
							summart = summart + Integer.parseInt(sumprice[j][1]);
						} else if (sumprice[j][0].equals("cvs")) {
							sumcvs = sumcvs + Integer.parseInt(sumprice[j][1]);
						} else if (sumprice[j][0].equals("eou")) {
							sumeou = sumeou + Integer.parseInt(sumprice[j][1]);
						} else if (sumprice[j][0].equals("cafe")) {
							sumcafe = sumcafe + Integer.parseInt(sumprice[j][1]);
						} else if (sumprice[j][0].equals("movie")) {
							summovie = summovie + Integer.parseInt(sumprice[j][1]);
						} else if (sumprice[j][0].equals("tra")) {
							sumtra = sumtra + Integer.parseInt(sumprice[j][1]);
						} else if (sumprice[j][0].equals("tel")) {
							sumtel = sumtel + Integer.parseInt(sumprice[j][1]);
						} else if (sumprice[j][0].equals("edu")) {
							sumedu = sumedu + Integer.parseInt(sumprice[j][1]);
						} else if (sumprice[j][0].equals("cul")) {
							sumcul = sumcul + Integer.parseInt(sumprice[j][1]);
						} else if (sumprice[j][0].equals("lei")) {
							sumlei = sumlei + Integer.parseInt(sumprice[j][1]);
						} else if (sumprice[j][0].equals("medi")) {
							summedi = summedi + Integer.parseInt(sumprice[j][1]);
						} else if (sumprice[j][0].equals("bea")) {
							sumbea = sumbea + Integer.parseInt(sumprice[j][1]);
						}
					}
				}
				// sumscate 占쏙옙占쏙옙 占쏙옙占쏙옙占� 占쏙옙占쏙옙카占쌓곤옙占쏙옙 占싱몌옙占쏙옙占쏙옙 占쏙옙占쏙옙占싹울옙 占쏙옙占쏙옙 占쏙옙占싹댐옙 占싱몌옙占쏙옙 占쏙옙占쏙옙 占쌓몌옙占쏙옙 占쏙옙占쏙옙占쏙옙 占싱아놂옙占쏙옙 sumres占쏙옙 占쏙옙占쏙옙占쌔댐옙.  
				double sumres = 0;
				double sumfast = 0;
				double sumliq = 0;
				double sumeetc = 0;
				double sumcgv = 0;
				double sumlotte = 0;
				double summega = 0;
				double sumpri = 0;
				double summetc = 0;
				double sumresort = 0;
				double sumamuse = 0;
				double sumtravel = 0;
				double sumhotel = 0;
				double sumgolf = 0;
				double sumair = 0;
				double sumletc = 0;
				double sumdep = 0;
				double sumout = 0;
				double sumduty = 0;
				double suminter = 0;
				double sumhome = 0;
				double sumsetc = 0;
				for (int k = 0; k < e1list.size(); k++) {
					String date = e1list.get(k).getWdate().substring(0, 7);
					if (date.equals(sf3)) {
						if (sumscate[k][0] != null && sumscate[k][0].equals("restaurant")) {
							sumres = sumres + Integer.parseInt(sumscate[k][1]);
						} else if (sumscate[k][0] != null && sumscate[k][0].equals("cgv")) {
							sumcgv = sumcgv + Integer.parseInt(sumscate[k][1]);
						} else if (sumscate[k][0] != null && sumscate[k][0].equals("amusement")) {
							sumamuse = sumamuse + Integer.parseInt(sumscate[k][1]);
						} else if (sumscate[k][0] != null && sumscate[k][0].equals("restaurant")) {
							sumres = sumres + Integer.parseInt(sumscate[k][1]);
						} else if (sumscate[k][0] != null && sumscate[k][0].equals("fastfood")) {
							sumfast = sumfast + Integer.parseInt(sumscate[k][1]);
						} else if (sumscate[k][0] != null && sumscate[k][0].equals("liquor")) {
							sumliq = sumliq + Integer.parseInt(sumscate[k][1]);
						} else if (sumscate[k][0] != null && sumscate[k][0].equals("eou_etc")) {
							sumeetc = sumeetc + Integer.parseInt(sumscate[k][1]);
						}

						else if (sumscate[k][0] != null && sumscate[k][0].equals("cgv")) {
							sumcgv = sumcgv + Integer.parseInt(sumscate[k][1]);
						} else if (sumscate[k][0] != null && sumscate[k][0].equals("lotte")) {
							sumlotte = sumlotte + Integer.parseInt(sumscate[k][1]);
						} else if (sumscate[k][0] != null && sumscate[k][0].equals("megabox")) {
							summega = summega + Integer.parseInt(sumscate[k][1]);
						} else if (sumscate[k][0] != null && sumscate[k][0].equals("primus")) {
							sumpri = sumpri + Integer.parseInt(sumscate[k][1]);
						} else if (sumscate[k][0] != null && sumscate[k][0].equals("movie_etc")) {
							summetc = summetc + Integer.parseInt(sumscate[k][1]);
						}

						else if (sumscate[k][0] != null && sumscate[k][0].equals("resort")) {
							sumresort = sumresort + Integer.parseInt(sumscate[k][1]);
						} else if (sumscate[k][0] != null && sumscate[k][0].equals("amusement")) {
							sumamuse = sumamuse + Integer.parseInt(sumscate[k][1]);
						} else if (sumscate[k][0] != null && sumscate[k][0].equals("travel")) {
							sumtravel = sumtravel + Integer.parseInt(sumscate[k][1]);
						} else if (sumscate[k][0] != null && sumscate[k][0].equals("hotel")) {
							sumhotel = sumhotel + Integer.parseInt(sumscate[k][1]);
						} else if (sumscate[k][0] != null && sumscate[k][0].equals("golf")) {
							sumgolf = sumgolf + Integer.parseInt(sumscate[k][1]);
						} else if (sumscate[k][0] != null && sumscate[k][0].equals("air")) {
							sumair = sumair + Integer.parseInt(sumscate[k][1]);
						} else if (sumscate[k][0] != null && sumscate[k][0].equals("lei_etc")) {
							sumletc = sumletc + Integer.parseInt(sumscate[k][1]);
						}

						else if (sumscate[k][0] != null && sumscate[k][0].equals("department")) {
							sumdep = sumdep + Integer.parseInt(sumscate[k][1]);
						} else if (sumscate[k][0] != null && sumscate[k][0].equals("outlet")) {
							sumout = sumout + Integer.parseInt(sumscate[k][1]);
						} else if (sumscate[k][0] != null && sumscate[k][0].equals("dutyfree")) {
							sumduty = sumduty + Integer.parseInt(sumscate[k][1]);
						} else if (sumscate[k][0] != null && sumscate[k][0].equals("internet")) {
							suminter = suminter + Integer.parseInt(sumscate[k][1]);
						} else if (sumscate[k][0] != null && sumscate[k][0].equals("home")) {
							sumhome = sumhome + Integer.parseInt(sumscate[k][1]);
						} else if (sumscate[k][0] != null && sumscate[k][0].equals("shop_etc")) {
							sumsetc = sumsetc + Integer.parseInt(sumscate[k][1]);
						}
					}
				}
				totalsum = sumoil + sumshop + summart + sumcvs + sumeou + sumcafe + summovie + sumtra + sumtel + sumedu + sumcul + sumlei + summedi + sumbea;
				
				model.addAttribute("sumoil", sumoil);
				model.addAttribute("sumshop", sumshop);
				model.addAttribute("summart", summart);
				model.addAttribute("sumcvs", sumcvs);
				model.addAttribute("sumeou", sumeou);
				model.addAttribute("sumcafe", sumcafe);
				model.addAttribute("summovie", summovie);
				model.addAttribute("sumtra", sumtra);
				model.addAttribute("sumtel", sumtel);
				model.addAttribute("sumedu", sumedu);
				model.addAttribute("sumcul", sumcul);
				model.addAttribute("sumlei", sumlei);
				model.addAttribute("summedi", summedi);
				model.addAttribute("sumbea", sumbea);
				model.addAttribute("summart", summart);
				model.addAttribute("sumcvs", sumcvs);
				model.addAttribute("totalsum", totalsum);
				
				model.addAttribute("sumres", sumres);
				model.addAttribute("sumfast", sumfast);
				model.addAttribute("sumliq", sumliq);
				model.addAttribute("sumeetc", sumeetc);
				model.addAttribute("sumcgv", sumcgv);
				model.addAttribute("sumlotte", sumlotte);
				model.addAttribute("summega", summega);
				model.addAttribute("sumpri", sumpri);
				model.addAttribute("summetc", summetc);
				model.addAttribute("sumresort", sumresort);
				model.addAttribute("sumamuse", sumamuse);
				model.addAttribute("sumtravel", sumtravel);
				model.addAttribute("sumhotel", sumhotel);
				model.addAttribute("sumgolf", sumgolf);
				model.addAttribute("sumair", sumair);
				model.addAttribute("sumletc", sumletc);
				model.addAttribute("sumdep", sumdep);
				model.addAttribute("sumout", sumout);
				model.addAttribute("sumduty", sumduty);
				model.addAttribute("suminter", suminter);
				model.addAttribute("sumhome", sumhome);
				model.addAttribute("sumsetc", sumsetc);
				
			return "monlist.tiles";
		}
		
		@RequestMapping(value="exp_1.do", method={RequestMethod.GET,RequestMethod.POST})
		public String exp_1(Model model, HttpSession session, HttpServletRequest request)throws Exception{
			logger.info("Welcome ExpenditureController monlist! "+ new Date());
		
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

			cal.set(year, month - 1, 1); // 첫占쏙옙占쏙옙 占쏙옙占쏙옙

			String sf = String.format("%d占쏙옙 %d占쏙옙", year, month);
			String sf2 = String.format("%d占쏙옙 ", year);
			String syear = Integer.toString(year);
			String smonth = Integer.toString(month);
			if (smonth.length() != 2) {
				smonth = "0" + smonth;
			}
			String sf3 = syear + "-" + smonth;
			System.out.println("sf3="+sf3);
			String sleft = String.format("/CarimiS/exp_1.do?year=%d&month=%d", year, month - 1);
			String sright = String.format("/CarimiS/exp_1.do?year=%d&month=%d", year, month + 1);
			
			expenditureDTO edto = new expenditureDTO();
			edto.setId(id);
			edto.setWdates(sf3);
			
			List<expenditureDTO> e1list = expenditureService.e1List(edto);
			
			model.addAttribute("e1list", e1list);
			model.addAttribute("sf", sf);
			model.addAttribute("sleft", sleft);
			model.addAttribute("sright", sright);
			model.addAttribute("sf3", sf3);
			model.addAttribute("id", id);
			
			int categorylist;

			String[][] sumprice = null;
			
			categorylist = e1list.size();
			sumprice = new String[categorylist][2];

			int sumoil=0;
			int sumshop=0;
			int summart=0;
			int sumcvs=0;
			int sumeou=0;
			int sumcafe=0;
			int summovie=0;
			int sumtra=0;
			int sumtel=0;
			int sumedu=0;
			int sumcul=0;
			int sumlei=0;
			int summedi=0;
			int sumbea=0;
			int sumpoi=0;
					
		for (int j = 0; j < e1list.size(); j++) {
			expenditureDTO exp = e1list.get(j);
			String date = e1list.get(j).getWdate().substring(0, 7);

				sumprice[j][0] = exp.getBcategory(); // bcategory 占싱몌옙占쏙옙 
				sumprice[j][1] = Integer.toString(exp.getPrice()); // price
				
				if (date.equals(sf3)&&sumprice[j][0].equals("oil")) {
					sumoil = sumoil + Integer.parseInt(sumprice[j][1]);
				} else if (date.equals(sf3)&&sumprice[j][0].equals("shop")) {
					sumshop = sumshop + Integer.parseInt(sumprice[j][1]);
				} else if (date.equals(sf3)&&sumprice[j][0].equals("mart")) {
					summart = summart + Integer.parseInt(sumprice[j][1]);
				} else if (date.equals(sf3)&&sumprice[j][0].equals("cvs")) {
					sumcvs = sumcvs + Integer.parseInt(sumprice[j][1]);
				} else if (date.equals(sf3)&&sumprice[j][0].equals("eou")) {
					sumeou = sumeou + Integer.parseInt(sumprice[j][1]);
				} else if (date.equals(sf3)&&sumprice[j][0].equals("cafe")) {
					sumcafe = sumcafe + Integer.parseInt(sumprice[j][1]);
				} else if (date.equals(sf3)&&sumprice[j][0].equals("movie")) {
					summovie = summovie + Integer.parseInt(sumprice[j][1]);
				} else if (date.equals(sf3)&&sumprice[j][0].equals("tra")) {
					sumtra = sumtra + Integer.parseInt(sumprice[j][1]);
				} else if (date.equals(sf3)&&sumprice[j][0].equals("tel")) {
					sumtel = sumtel + Integer.parseInt(sumprice[j][1]);
				} else if (date.equals(sf3)&&sumprice[j][0].equals("edu")) {
					sumedu = sumedu + Integer.parseInt(sumprice[j][1]);
				} else if (date.equals(sf3)&&sumprice[j][0].equals("cul")) {
					sumcul = sumcul + Integer.parseInt(sumprice[j][1]);
				} else if (date.equals(sf3)&&sumprice[j][0].equals("lei")) {
					sumlei = sumlei + Integer.parseInt(sumprice[j][1]);
				} else if (date.equals(sf3)&&sumprice[j][0].equals("medi")) {
					summedi = summedi + Integer.parseInt(sumprice[j][1]);
				} else if (date.equals(sf3)&&sumprice[j][0].equals("bea")) {
					sumbea = sumbea + Integer.parseInt(sumprice[j][1]);
				}
		}
			
		model.addAttribute("sumoil", sumoil);
		model.addAttribute("sumshop", sumshop);
		model.addAttribute("summart", summart);
		model.addAttribute("sumcvs", sumcvs);
		model.addAttribute("sumeou", sumeou);
		model.addAttribute("sumcafe", sumcafe);
		model.addAttribute("summovie", summovie);
		model.addAttribute("sumtra", sumtra);
		model.addAttribute("sumtel", sumtel);
		model.addAttribute("sumedu", sumedu);
		model.addAttribute("sumcul", sumcul);
		model.addAttribute("sumlei", sumlei);
		model.addAttribute("summedi", summedi);
		model.addAttribute("sumbea", sumbea);
		model.addAttribute("summart", summart);
		model.addAttribute("sumcvs", sumcvs);
		
			return "exp1.tiles";
		}
		
		@RequestMapping(value="exp_2.do", method={RequestMethod.GET,RequestMethod.POST})
		public String exp_2(Model model, HttpSession session, HttpServletRequest request)throws Exception{
			logger.info("Welcome ExpenditureController exp_2! "+ new Date());
		
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
			String sleft = String.format("/CarimiS/exp_2.do?year=%d&month=%d", year, month - 1);
			String sright = String.format("/CarimiS/exp_2.do?year=%d&month=%d", year, month + 1);
			
			expenditureDTO edto = new expenditureDTO();
			edto.setId(id);
			edto.setWdates(sf3);
			
			List<expenditureDTO> e2list = expenditureService.e2List(edto);
			
			model.addAttribute("e2list", e2list);
			model.addAttribute("sf", sf);
			model.addAttribute("sleft", sleft);
			model.addAttribute("sright", sright);
			model.addAttribute("sf3", sf3);
			model.addAttribute("id", id);
			
			int categorylist;
			String[][] sumprice = null;
			
			categorylist = e2list.size();
			sumprice = new String[categorylist][2];
			
			int sumshin1=0;
			int sumshin2=0;
			int sumguk1=0;
			int sumguk2=0;
			int sumuri1=0;
			int sumuri2=0;
			int sumha1=0;
			int sumha2=0;
			int sumlot1=0;
			int sumlot2=0;
			int sumsam1=0;
			int sumsam2=0;
			int sumnong1=0;
			int sumnong2=0;
			int sumgi1=0;
			int sumgi2=0;
			int sumci1=0;
			int sumci2=0;
			
		for (int j = 0; j < e2list.size(); j++) {
			
			expenditureDTO exp = e2list.get(j);
			String date = e2list.get(j).getWdate().substring(0, 7);
			
			sumprice[j][0] = exp.getMoneytype();
			sumprice[j][1] = Integer.toString(exp.getPrice());

			if (date.equals(sf3)) {

				if (sumprice[j][0].equals("shin1")) {
					sumshin1 = sumshin1 + Integer.parseInt(sumprice[j][1]);
				} else if (sumprice[j][0].equals("shin2")) {
					sumshin2 = sumshin2 + Integer.parseInt(sumprice[j][1]);
				} else if (sumprice[j][0].equals("guk1")) {
					sumguk1 = sumguk1 + Integer.parseInt(sumprice[j][1]);
				} else if (sumprice[j][0].equals("guk2")) {
					sumguk2 = sumguk2 + Integer.parseInt(sumprice[j][1]);
				} else if (sumprice[j][0].equals("uri1")) {
					sumuri1 = sumuri1 + Integer.parseInt(sumprice[j][1]);
				} else if (sumprice[j][0].equals("uri2")) {
					sumuri2 = sumuri2 + Integer.parseInt(sumprice[j][1]);
				} else if (sumprice[j][0].equals("ha1")) {
					sumha1 = sumha1 + Integer.parseInt(sumprice[j][1]);
				} else if (sumprice[j][0].equals("ha2")) {
					sumha2 = sumha2 + Integer.parseInt(sumprice[j][1]);
				} else if (sumprice[j][0].equals("lot1")) {
					sumlot1 = sumlot1 + Integer.parseInt(sumprice[j][1]);
				} else if (sumprice[j][0].equals("lot2")) {
					sumlot2 = sumlot2 + Integer.parseInt(sumprice[j][1]);
				} else if (sumprice[j][0].equals("sam1")) {
					sumsam1 = sumsam1 + Integer.parseInt(sumprice[j][1]);
				} else if (sumprice[j][0].equals("sam2")) {
					sumsam2 = sumsam2 + Integer.parseInt(sumprice[j][1]);
				} else if (sumprice[j][0].equals("nong1")) {
					sumnong1 = sumnong1 + Integer.parseInt(sumprice[j][1]);
				} else if (sumprice[j][0].equals("nong2")) {
					sumnong2 = sumnong2 + Integer.parseInt(sumprice[j][1]);
				} else if (sumprice[j][0].equals("gi1")) {
					sumgi1 = sumgi1 + Integer.parseInt(sumprice[j][1]);
				} else if (sumprice[j][0].equals("gi2")) {
					sumgi2 = sumgi2 + Integer.parseInt(sumprice[j][1]);
				} else if (sumprice[j][0].equals("ci1")) {
					sumci1 = sumci1 + Integer.parseInt(sumprice[j][1]);
				} else if (sumprice[j][0].equals("ci2")) {
					sumci2 = sumci2 + Integer.parseInt(sumprice[j][1]);
				}
			}
		}

		model.addAttribute("sumshin1", sumshin1);
		model.addAttribute("sumshin2", sumshin2);
		model.addAttribute("sumguk1", sumguk1);
		model.addAttribute("sumguk2", sumguk2);
		model.addAttribute("sumuri1", sumuri1);
		model.addAttribute("sumuri2", sumuri2);
		model.addAttribute("sumha1", sumha1);
		model.addAttribute("sumha2", sumha2);
		model.addAttribute("sumlot1", sumlot1);
		model.addAttribute("sumlot2", sumlot2);
		model.addAttribute("sumsam1", sumsam1);
		model.addAttribute("sumsam2", sumsam2);
		model.addAttribute("sumnong1", sumnong1);
		model.addAttribute("sumnong2", sumnong2);
		model.addAttribute("sumgi1", sumgi1);
		model.addAttribute("sumgi2", sumgi2);
		model.addAttribute("sumci1", sumci1);
		model.addAttribute("sumci2", sumci2);

		return "exp2.tiles";
	}
		
		@RequestMapping(value="yearlist.do", method={RequestMethod.GET,RequestMethod.POST})
		public String yearlist(Model model, HttpServletRequest request, String syear, String smonth)throws Exception{
			logger.info("Welcome ExpenditureController yearlist! "+ new Date());
			
			int[] sumoil=new int[12];
			int[] sumshop=new int[12];
			int[] summart=new int[12];
			int[] sumcvs=new int[12];
			int[] sumeou=new int[12];
			int[] sumcafe=new int[12];
			int[] summovie=new int[12];
			int[] sumtra=new int[12];
			int[] sumtel=new int[12];
			int[] sumedu=new int[12];
			int[] sumcul=new int[12];
			int[] sumlei=new int[12];
			int[] summedi=new int[12];
			int[] sumbea=new int[12];
			int[] sumpoi=new int[12];

			int categorylist;
			String[][] sumprice = null;
			memberDTO mem = (memberDTO)request.getSession().getAttribute("login");
			expenditureDTO edto = new expenditureDTO(mem.getId());
			
			
			Calendar cal = Calendar.getInstance();
			cal.set(Calendar.DATE, 1);
			String eyear = syear;
			String emonth = smonth;
			
			int year = cal.get(Calendar.YEAR);
			if(!(eyear == null || eyear.trim().equalsIgnoreCase(""))){
				year = Integer.parseInt(eyear);
			}

			int month = cal.get(Calendar.MONTH) + 1;
			if(!(emonth == null ||  emonth.trim().equalsIgnoreCase(""))){
				month = Integer.parseInt(emonth);
			}

			if (month < 1) {
				month = 12;
				year--;
			}
			if (month > 12) {
				month = 1;
				year++;
			}

			cal.set(year, month - 1, 1);

			String sf = String.format("%d�뀈 %d�썡", year, month);
			String sf2 = String.format("%d�뀈 ", year);

			String sleft = String.format("yearlist.do?syear=%d", year - 1);
			String sright = String.format("yearlist.do?syear=%d", year + 1);
			
			List<expenditureDTO> yearlist = expenditureService.yearList(edto, year);
			
			model.addAttribute("sf2", sf2);
			model.addAttribute("sleft", sleft);
			model.addAttribute("sright", sright);


			categorylist = yearlist.size();

			sumprice = new String[categorylist][2];
//			NumberFormat formatter = new DecimalFormat("#,###");
	
			for(int j=0;j<yearlist.size();j++)
			{   
				expenditureDTO exp = yearlist.get(j);
				
				String wdate = yearlist.get(j).getWdate();
				String[] splWdate = wdate.split("-");
				int wmonth = Integer.parseInt(splWdate[splWdate.length - 2])-1;
				
				sumprice[j][0] = exp.getBcategory();
				sumprice[j][1] = Integer.toString(exp.getPrice());
				
			   if(sumprice[j][0].equals("oil"))
			   {
			      sumoil[wmonth] = sumoil[wmonth] + Integer.parseInt(sumprice[j][1]);
			   }
			   else if(sumprice[j][0].equals("shop"))
			   {
				  sumshop[wmonth] = sumshop[wmonth] + Integer.parseInt(sumprice[j][1]);
			   }
			   else if(sumprice[j][0].equals("mart"))
			   {
			      summart[wmonth] = summart[wmonth] + Integer.parseInt(sumprice[j][1]);
			   }
			   else if(sumprice[j][0].equals("cvs"))
			   {
				  sumcvs[wmonth] = sumcvs[wmonth] + Integer.parseInt(sumprice[j][1]);
			   }
			   else if(sumprice[j][0].equals("eou"))
			   {
				  sumeou[wmonth] = sumeou[wmonth] + Integer.parseInt(sumprice[j][1]);
			   }
			   else if(sumprice[j][0].equals("cafe"))
			   {
				  sumcafe[wmonth] = sumcafe[wmonth] + Integer.parseInt(sumprice[j][1]);
			   }
			   else if(sumprice[j][0].equals("movie"))
			   {
				  summovie[wmonth] = summovie[wmonth] + Integer.parseInt(sumprice[j][1]);
			   }
			   else if(sumprice[j][0].equals("tra"))
			   {
				  sumtra[wmonth] = sumtra[wmonth] + Integer.parseInt(sumprice[j][1]);
			   }
			   else if(sumprice[j][0].equals("tel"))
			   {
				  sumtel[wmonth] = sumtel[wmonth] + Integer.parseInt(sumprice[j][1]);
			   }
			   else if(sumprice[j][0].equals("edu"))
			   {
				  sumedu[wmonth] = sumedu[wmonth] + Integer.parseInt(sumprice[j][1]);
			   }
			   else if(sumprice[j][0].equals("cul"))
			   {
				  sumcul[wmonth] = sumcul[wmonth] + Integer.parseInt(sumprice[j][1]);
			   }
			   else if(sumprice[j][0].equals("lei"))
			   {
				  sumlei[wmonth] = sumlei[wmonth] + Integer.parseInt(sumprice[j][1]);
			   }
			   else if(sumprice[j][0].equals("medi"))
			   {
				  summedi[wmonth] = summedi[wmonth] + Integer.parseInt(sumprice[j][1]);
			   }
			   else if(sumprice[j][0].equals("bea"))
			   {
				  sumbea[wmonth] = sumbea[wmonth] + Integer.parseInt(sumprice[j][1]);
			   }
			}
			
		   model.addAttribute("sumshop", sumshop);
		   model.addAttribute("sumoil", sumoil);
		   model.addAttribute("sumcafe", sumcafe);
		   model.addAttribute("sumbea", sumbea);
		   model.addAttribute("summart", summart);
		   model.addAttribute("sumcvs", sumcvs);
		   model.addAttribute("sumeou", sumeou);
		   model.addAttribute("summovie", summovie);
		   model.addAttribute("sumtra", sumtra);
		   model.addAttribute("sumtel", sumtel);
		   model.addAttribute("sumedu", sumedu);
		   model.addAttribute("sumcul", sumcul);
		   model.addAttribute("sumlei", sumlei);
		   model.addAttribute("summedi", summedi);
			   
			return "yearlist.tiles";
		}

}
