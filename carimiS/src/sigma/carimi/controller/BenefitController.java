package sigma.carimi.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspWriter;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import sigma.carimi.model.benefitDTO;
import sigma.carimi.service.benefitService;

@Controller
public class BenefitController {

	private static final Logger logger = 
			LoggerFactory.getLogger(BenefitController.class);
	
	@Autowired
	private benefitService benefitService;
	
	@RequestMapping(value = "benefit.do", 
			method = {RequestMethod.GET, RequestMethod.POST}) 
	public String benefit(Model model, String[] cards, String benefit, String userchk,
			String pageno, String pageno1, String pageno2 , String act0, String act1, String act2,
			String lx, String ly, String mzoom) throws Exception{		
		logger.info("Welcome BenefitController benefit! "+ new Date());
		
		String[] active = {"active", null, null};

		active[0] = act0;
		active[1] = act1;
		active[2] = act2;
		
		if(active != null){
			if(active[0] == null && active[1] == null && active[2] == null){
				active[0] = "active";
			}
		}
		model.addAttribute("active", active);
		
		List<benefitDTO> allList = null;	// all of card lists
		List<benefitDTO> card1List = null;	// all of card1 lists
		List<benefitDTO> card2List = null;	// all of card2 lists
		
		if(cards != null){
			allList = benefitService.getCBFList(new benefitDTO(cards[0], benefit), new benefitDTO(cards[1], benefit));
			card1List = benefitService.getCBFList(new benefitDTO(cards[0], benefit));
			card2List = benefitService.getCBFList(new benefitDTO(cards[1], benefit));
		
		
			String[] kcards = changeNames(cards, benefit);
			model.addAttribute("kcards", kcards);
			
			System.out.println("String_pageno = " + pageno);
			int i_pageno = toInt(pageno);
			int i_pageno1 = toInt(pageno1);
			int i_pageno2 = toInt(pageno2);
			System.out.println("transfer i_pageno = " + i_pageno);
			
			if(i_pageno != 0){
				userchk = "click";
			}
			
			if(i_pageno<1){//현재 페이지
				i_pageno = 1;
			}
			if(i_pageno1<1){
				i_pageno1 = 1;
			}
			if(i_pageno2<1){
				i_pageno2 = 1;
			}
			
			int total_record = allList.size();		   //총 레코드 수
			int total_record1 = card1List.size();
			int total_record2 = card2List.size();
			model.addAttribute("total_record", total_record);
			model.addAttribute("total_record1", total_record1);
			model.addAttribute("total_record2", total_record2);
			
			int page_per_record_cnt = 10;  //페이지 당 레코드 수
			int group_per_page_cnt =5;     //페이지 당 보여줄 번호 수[1],[2],[3],[4],[5]
	//							  						  [6],[7],[8],[9],[10]											
	
			int record_end_no = i_pageno*page_per_record_cnt;					// n * 10
			int record_end_no1 = i_pageno1*page_per_record_cnt;
			int record_end_no2 = i_pageno2*page_per_record_cnt;
			int record_start_no = record_end_no-(page_per_record_cnt-1);	// (n-1) * 10 + 1
			int record_start_no1 = record_end_no1-(page_per_record_cnt-1);
			int record_start_no2 = record_end_no2-(page_per_record_cnt-1);
			
			if(record_end_no>total_record){			// 페이지 끝 번호가 모든 레코드보다 클 경우
				record_end_no = total_record;
			}
			if(record_end_no1>total_record1){		
				record_end_no1 = total_record1;
			}
			if(record_end_no2>total_record2){		
				record_end_no2 = total_record2;
			}
	
			int total_page = total_record / page_per_record_cnt + (total_record % page_per_record_cnt>0 ? 1 : 0);
			int total_page1 = total_record1 / page_per_record_cnt + (total_record1 % page_per_record_cnt>0 ? 1 : 0);
			int total_page2 = total_record2 / page_per_record_cnt + (total_record2 % page_per_record_cnt>0 ? 1 : 0);
			model.addAttribute("total_page", total_page);
			model.addAttribute("total_page1", total_page1);
			model.addAttribute("total_page2", total_page2);
			
			if(i_pageno>total_page){
				i_pageno = total_page;
			}
			if(i_pageno1>total_page1){
				i_pageno1 = total_page1;
			}
			if(i_pageno2>total_page2){
				i_pageno2 = total_page2;
			}
			
			int group_no = i_pageno/group_per_page_cnt+( i_pageno%group_per_page_cnt>0 ? 1:0);
			int group_no1 = i_pageno1/group_per_page_cnt+( i_pageno1%group_per_page_cnt>0 ? 1:0);
			int group_no2 = i_pageno2/group_per_page_cnt+( i_pageno2%group_per_page_cnt>0 ? 1:0);			  
			model.addAttribute("group_no", group_no);
			model.addAttribute("group_no1", group_no1);
			model.addAttribute("group_no2", group_no2);
			
			int page_eno = group_no*group_per_page_cnt;	
			int page_eno1 = group_no1*group_per_page_cnt;	
			int page_eno2 = group_no2*group_per_page_cnt;	
			
			
			int page_sno = page_eno-(group_per_page_cnt-1);	
			int page_sno1 = page_eno1-(group_per_page_cnt-1);
			int page_sno2 = page_eno2-(group_per_page_cnt-1);
			model.addAttribute("page_sno", page_sno);
			model.addAttribute("page_sno1", page_sno1);
			model.addAttribute("page_sno2", page_sno2);
	
			if(page_eno>total_page){
				page_eno=total_page;
			}	
			if(page_eno1>total_page1){
				page_eno1=total_page1;
			}
			if(page_eno2>total_page2){
				page_eno2=total_page2;
			}
			model.addAttribute("page_eno", page_eno);
			model.addAttribute("page_eno1", page_eno1);
			model.addAttribute("page_eno2", page_eno2);
	
			int prev_pageno = page_sno-group_per_page_cnt;  
			int prev_pageno1 = page_sno1-group_per_page_cnt;
			int prev_pageno2 = page_sno2-group_per_page_cnt;
	
			int next_pageno = page_sno+group_per_page_cnt;	
			int next_pageno1 = page_sno1+group_per_page_cnt;
			int next_pageno2 = page_sno2+group_per_page_cnt;
	
			if(prev_pageno<1){
				prev_pageno=1;
			}
			if(prev_pageno1<1){
				prev_pageno1=1;
			}
			if(prev_pageno2<1){
				prev_pageno2=1;
			}
			model.addAttribute("prev_pageno", prev_pageno);
			model.addAttribute("prev_pageno1", prev_pageno1);
			model.addAttribute("prev_pageno2", prev_pageno2);
			
			if(next_pageno>total_page){
				next_pageno=total_page/group_per_page_cnt*group_per_page_cnt+1;
			}
			if(next_pageno1>total_page1){
				next_pageno1=total_page1/group_per_page_cnt*group_per_page_cnt+1;
			}
			if(next_pageno2>total_page2){
				next_pageno2=total_page2/group_per_page_cnt*group_per_page_cnt+1;
			}
			model.addAttribute("next_pageno", next_pageno);
			model.addAttribute("next_pageno1", next_pageno1);
			model.addAttribute("next_pageno2", next_pageno2);
			
			List<benefitDTO> bTenAllList = null;
			List<benefitDTO> bTenCard1List = null;
			List<benefitDTO> bTenCard2List = null;
			
			bTenAllList = benefitService.getCBFtenList(record_start_no, record_end_no,
					new benefitDTO(cards[0], benefit), new benefitDTO(cards[1], benefit));
			bTenCard1List = benefitService.getCBFtenList(record_start_no1, record_end_no1, 
					new benefitDTO(cards[0], benefit), new benefitDTO(null, benefit));
			bTenCard2List = benefitService.getCBFtenList(record_start_no2, record_end_no2, 
					new benefitDTO(null, benefit), new benefitDTO(cards[1], benefit));	
			
			String[] bTenAllImg = new String[10];
			if(cards != null){
				for(int i=0; i<bTenAllList.size(); i++){
					benefitDTO bdto = bTenAllList.get(i);
					if(cards[0].equals(bdto.getCardname().substring(0, bdto.getCardname().indexOf("_")))){
						bTenAllImg[i] = "/CarimiS/image/focusMarkerG.png";
					} else {
						bTenAllImg[i] = "/CarimiS/image/focusMarker.png";
					}
				}
			}
			
			model.addAttribute("bTenAllImg", bTenAllImg);
			model.addAttribute("bTenAllList", bTenAllList);
			model.addAttribute("bTenCard1List", bTenCard1List);
			model.addAttribute("bTenCard2List", bTenCard2List);
			System.out.println("i_pageno = " + i_pageno);
			model.addAttribute("pageno", i_pageno);
			model.addAttribute("pageno1", i_pageno1);
			model.addAttribute("pageno2", i_pageno2);
			
			JSONArray arr = new JSONArray();
			JSONArray arr1 = new JSONArray();
			JSONArray arr2 = new JSONArray();

			JSONObject jsonObject = new JSONObject();
			JSONObject jsonObject1 = new JSONObject();
			JSONObject jsonObject2 = new JSONObject();

			for(int i=0; i<bTenAllList.size(); i++){
				JSONObject obj = new JSONObject();
				obj.put("shopname", bTenAllList.get(i).getShopname());
				obj.put("phone", bTenAllList.get(i).getPhone());
				obj.put("brate", bTenAllList.get(i).getBrate());
				obj.put("locationx", bTenAllList.get(i).getLocationx());
				obj.put("locationy", bTenAllList.get(i).getLocationy());
				if(bTenAllList.get(i).getCardname().contains(cards[0])){
					obj.put("cardtype", "card1");
				} else {
					obj.put("cardtype", "card2");
				}
				arr.add(obj);
			}
			jsonObject.put("all", arr);

			for(int i=0; i<bTenCard1List.size(); i++){
				JSONObject obj = new JSONObject();
				obj.put("shopname", bTenCard1List.get(i).getShopname());
				obj.put("phone", bTenCard1List.get(i).getPhone());
				obj.put("brate", bTenCard1List.get(i).getBrate());
				obj.put("locationx", bTenCard1List.get(i).getLocationx());
				obj.put("locationy", bTenCard1List.get(i).getLocationy());
				obj.put("cardtype", "card1");
				arr1.add(obj);
			}
			jsonObject1.put("card1", arr1);
			for(int i=0; i<bTenCard2List.size(); i++){
				JSONObject obj = new JSONObject();
				obj.put("shopname", bTenCard2List.get(i).getShopname());
				obj.put("phone", bTenCard2List.get(i).getPhone());
				obj.put("brate", bTenCard2List.get(i).getBrate());
				obj.put("locationx", bTenCard2List.get(i).getLocationx());
				obj.put("locationy", bTenCard2List.get(i).getLocationy());
				obj.put("cardtype", "card2");
				arr2.add(obj);
			}
			jsonObject2.put("card2", arr2);
			
			//JSON OBJECT -> String
			String jsonInfo = jsonObject.toJSONString();
			String jsonInfo1 = jsonObject1.toJSONString();
			String jsonInfo2 = jsonObject2.toJSONString();
			System.out.println("jsonInfo = " + jsonInfo);
			model.addAttribute("jsonInfo", jsonInfo);
			model.addAttribute("jsonInfo1", jsonInfo1);
			model.addAttribute("jsonInfo2", jsonInfo2);
		}
		
		model.addAttribute("cards", cards);
		model.addAttribute("benefit", benefit);
		model.addAttribute("searchBtnClick", userchk);
		model.addAttribute("act0", act0);
		model.addAttribute("act1", act1);
		model.addAttribute("act2", act2);
		System.out.println("----------");
		System.out.println("lx = " + lx);
		System.out.println("ly = " + ly);
		model.addAttribute("lx", lx);
		model.addAttribute("ly", ly);
		System.out.println("mzoom = " + mzoom);
		System.out.println("----------");
		model.addAttribute("mzoom", mzoom);
		
		return "benefit.tiles";
	}
	
	@RequestMapping(value = "admin_bdetail.do", 
			method = {RequestMethod.GET}) 
	public String admin_bdetail(Model model, benefitDTO bnfdto) throws Exception{		
		logger.info("Welcome BenefitController admin_bdetail! "+ new Date());
		benefitDTO bdto = benefitService.getCBF(bnfdto);
		model.addAttribute("bdto", bdto);
		return "admin_bdetail.tiles";
	}
	@RequestMapping(value = "bdetail.do", 
			method = {RequestMethod.GET}) 
	public String bdetail(Model model, benefitDTO bnfdto) throws Exception{		
		logger.info("Welcome BenefitController bdetail! "+ new Date());
		benefitDTO bdto = benefitService.getCBF(bnfdto);
		model.addAttribute("bdto", bdto);
		return "bdetail.tiles";
	}
	
	@RequestMapping(value = "admin_page.do", 
			method = {RequestMethod.GET, RequestMethod.POST}) 
	public String admin_page(Model model, String s_pageno, String find, String search,
			benefitDTO bdto) throws Exception{		
		logger.info("Welcome BenefitController admin_page! "+ new Date());
		String x1 = find;
		String x2 = search;
		
		if(x2 == null || x2.length() == 0){
			x2="all";
		}
		
		List<benefitDTO> benefitList = new ArrayList<benefitDTO>();
		benefitList = benefitService.getAllCBFList(x1, x2);
		
		int pageno = toInt(s_pageno);
		
		if(pageno<1){//현재 페이지
			pageno = 1;
		}

		int total_record = benefitList.size();		   //총 레코드 수
		int page_per_record_cnt = 10;  //페이지 당 레코드 수
		int group_per_page_cnt =5;     //페이지 당 보여줄 번호 수[1],[2],[3],[4],[5]

		int record_end_no = pageno*page_per_record_cnt;					// n * 10
		int record_start_no = record_end_no-(page_per_record_cnt-1);	// (n-1) * 10 + 1
		if(record_end_no>total_record){			// 페이지 끝 번호가 모든 레코드보다 클 경우
			record_end_no = total_record;
		}

		int total_page = total_record / page_per_record_cnt + (total_record % page_per_record_cnt>0 ? 1 : 0);
		if(pageno>total_page){
			pageno = total_page;
		}
		int group_no = pageno/group_per_page_cnt+( pageno%group_per_page_cnt>0 ? 1:0);

		int page_eno = group_no*group_per_page_cnt;		

		int page_sno = page_eno-(group_per_page_cnt-1);	

		if(page_eno>total_page){
			page_eno=total_page;
		}	

		int prev_pageno = page_sno-group_per_page_cnt;  // <<  *[이전]* [21],[22],[23]... [30] [다음]  >>

		int next_pageno = page_sno+group_per_page_cnt;	// <<  [이전] [21],[22],[23]... [30] *[다음]*  >>

		if(prev_pageno<1){
			prev_pageno=1;
		}
		if(next_pageno>total_page){
			next_pageno=total_page/group_per_page_cnt*group_per_page_cnt+1;
		}
		
		List<benefitDTO> benefitTenList = benefitService.getCBFtenList(record_start_no, record_end_no ,x1, x2);

		model.addAttribute("x1", x1);
		model.addAttribute("x2", x2);
		model.addAttribute("benefitTenList", benefitTenList);
		model.addAttribute("prev_pageno", prev_pageno);
		model.addAttribute("page_sno", page_sno);
		model.addAttribute("page_eno", page_eno);
		model.addAttribute("pageno", pageno);
		model.addAttribute("next_pageno", next_pageno);
		model.addAttribute("total_page", total_page);
		
		String[] kcardnames = new String[10];
		for(int i=0; i<benefitTenList.size(); i++){
			benefitDTO t_bdto = benefitTenList.get(i);
			kcardnames[i] = changeNames(t_bdto.getCardname().substring(0, t_bdto.getCardname().indexOf("_")));
		}
		model.addAttribute("kcardnames", kcardnames);
		
		return "admin_page.tiles";
	}

	@RequestMapping(value = "admin_bwrite.do", 
			method = {RequestMethod.GET}) 
	public String admin_bwrite(Model model) throws Exception{		
		logger.info("Welcome BenefitController admin_bwrite! "+ new Date());
		
		String[] cardnames = {"신한카드love", "신한카드tasty", "국민카드goodday", "국민카드ddam", "우리카드damoa",
				"우리카드gadeuk", "하나카드pop", "하나카드2xa", "롯데카드dcsu", "롯데카드dcsm", "삼성카드sclass",
				"삼성카드2v2", "농협카드smarty", "농협카드take5", "기업카드ibkhi", "기업카드cham", "씨티카드mul",
				"씨티카드cle"};
		String[] cardvalues = {"si_love", "si_tasty", "ku_goodday", "ku_ddam", "w_damoa", "w_gadeuk", "h_pop",
				"h_2xa", "l_dcsu", "l_dcsm", "sa_sclass", "sa_2v2", "n_smarty", "n_take5", "ki_ibkhi", "ki_charm",
				"ci_mul", "ci_cle"};
		String[] bcategory ={"주유", "쇼핑", "대형마트", "편의점", "외식", "카페/베이커리", "영화", "대중교통",
				"통신", "교육", "문화", "레저", "의료", "뷰티", "포인트캐시백"};
		String[] bvalues = {"oil", "shop", "mart", "cvs", "eou", "cafe", "movie", "tra", "tel", "edu", "cul",
				"lei", "medi", "bea", "poi"};
		String[] times = {"오전 12:00", "오전 12:30", "오전 1:00", "오전 1:30", "오전 2:00", "오전 2:30",
				"오전 3:00", "오전 3:30", "오전 4:00", "오전 4:30", "오전 5:00", "오전 5:30", "오전 6:00", "오전 6:30",
				"오전 7:00", "오전 7:30", "오전 8:00", "오전 8:30", "오전 9:00", "오전 9:30", "오전 10:00", "오전 10:30",
				"오전 11:00", "오전 11:30", "오후 12:00", "오후 12:30", "오후 1:00", "오후 1:30", "오후 2:00", "오후 2:30",
				"오후 3:00", "오후 3:30", "오후 4:00", "오후 4:30", "오후 5:00", "오후 5:30", "오후 6:00", "오후 6:30",
				"오후 7:00", "오후 7:30", "오후 8:00", "오후 8:30", "오후 9:00", "오후 9:30", "오후 10:00", "오후 10:30",
				"오후 11:00", "오후 11:30"};
		
		model.addAttribute("cardnames", cardnames);
		model.addAttribute("cardvalues", cardvalues);
		model.addAttribute("bcategory", bcategory);
		model.addAttribute("bvalues", bvalues);
		model.addAttribute("times", times);

		return "admin_bwrite.tiles";
	}
	@RequestMapping(value = "admin_bwriteAf.do", 
			method = {RequestMethod.POST}) 
	public String admin_bwriteAf(HttpServletRequest request, Model model) throws Exception{		
		logger.info("Welcome BenefitController admin_bwriteAf! "+ new Date());
		
		JspWriter out = null;
		
		String fupload = request.getSession().getServletContext().getRealPath("/" ) + "bupload";
		String yourTempDirectory = fupload;

		int yourMaxRequestSize = 100 * 1024 * 1024;
		int yourMaxMemorySize = 100 * 1024;

		String cardname = "";
		String shopname = "";
		String bcategory = "";
		String brate = "";
		String opentime = "";
		String closetime = "";
		String p1 = "";
		String p2 = "";
		String p3 = "";
		String address = "";
		String locationx = "";
		String locationy = "";
		String filename = null;

		boolean isMultipart = ServletFileUpload.isMultipartContent(request);
		if(isMultipart){
			DiskFileItemFactory factory = new DiskFileItemFactory();
			
			factory.setSizeThreshold(yourMaxMemorySize);
			factory.setRepository(new File(yourTempDirectory));
			
			ServletFileUpload upload = new ServletFileUpload(factory);
			upload.setSizeMax(yourMaxRequestSize);
			
			List<FileItem> items = upload.parseRequest(request);
			
			Iterator<FileItem> iter = items.iterator();
			
			while(iter.hasNext()){
				FileItem item = iter.next();
				
				if(item.isFormField()){
					processFormField(item, out);
					if(item.getFieldName().equals("cardname")){
						cardname = item.getString("utf-8");
					}else if(item.getFieldName().equals("shopname")){
						shopname = item.getString("utf-8");
					}else if(item.getFieldName().equals("bcategory")){
						bcategory = item.getString("utf-8");
					}else if(item.getFieldName().equals("brate")){
						brate = item.getString("utf-8");
					}else if(item.getFieldName().equals("opentime")){
						opentime = item.getString("utf-8");
					}else if(item.getFieldName().equals("closetime")){
						closetime = item.getString("utf-8");
					}else if(item.getFieldName().equals("p1")){
						p1 = item.getString("utf-8");
					}else if(item.getFieldName().equals("p2")){
						p2 = item.getString("utf-8");
					}else if(item.getFieldName().equals("p3")){
						p3 = item.getString("utf-8");
					}else if(item.getFieldName().equals("address")){
						address = item.getString("utf-8");
					}else if(item.getFieldName().equals("locationx")){
						locationx = item.getString("utf-8");
					}else {
						locationy  = item.getString("utf-8");
					}
				} else {
					if(item.getFieldName().equals("fileload")){
						int idx = item.getName().lastIndexOf("\\");
						if(idx==-1){
							idx = item.getName().lastIndexOf("/");
						}
						filename = item.getName().substring(idx + 1);
					}
					processUploadedFile(item, fupload, out);
				}

			}
		} else {
			System.out.println("isMultipart가 아님");
		}

		String phone = p1 + "-" + p2 + "-" + p3;
		int irate = Integer.parseInt(brate);
		
		benefitService.addCBF(new benefitDTO(0, cardname, shopname, bcategory,
				irate, opentime, closetime, phone, address, 
				filename, locationx, locationy));
		
		return "admin_bwriteAf.tiles";
	}
	@RequestMapping(value = "admin_bdel.do", 
			method = {RequestMethod.GET}) 
	public String admin_bdel(Model model, benefitDTO bnfdto) throws Exception{		
		logger.info("Welcome BenefitController admin_bdel! "+ new Date());
		
		benefitService.deleteCBF(bnfdto);
		
		return "admin_bdel.tiles";
	}
	
	
	//it can change cardname from English to Korean
	String[] changeNames(String[] cards, String benefit){
		String[] e_cards = {"si", "ku", "w", "h", "l",
				"sa", "n", "ki", "ci"};
		String[] k_cards = {"신한카드", "국민카드", "우리카드", "하나카드", "롯데카드",
							"삼성카드", "농협카드", "기업카드", "씨티카드"};
		String t_cards[] = {null, null};
		if(cards != null && benefit != null){
			for(int i=0; i<cards.length; i++){
				for(int j=0; j<e_cards.length; j++){
					if(cards[i].equals(e_cards[j])){
						t_cards[i] = k_cards[j];
					}
				}
			}
		}
		return t_cards;
	}
	String changeNames(String ecard){
		String[] e_cards = {"si", "ku", "w", "h", "l",
				"sa", "n", "ki", "ci"};
		String[] k_cards = {"신한카드", "국민카드", "우리카드", "하나카드", "롯데카드",
							"삼성카드", "농협카드", "기업카드", "씨티카드"};
		String rt_card = null;
		for(int i=0; i<e_cards.length; i++){
			if(e_cards[i].equals(ecard)){
				rt_card = k_cards[i];
			}
		}
		return rt_card;
	}
	
	public Integer toInt(String x){
		int a = 0;
		try{
			a = Integer.parseInt(x);
		}catch(Exception e){}
		return a;
	}
	
	public void processFormField(FileItem item,JspWriter out) throws IOException{
		
	    String name = item.getFieldName();
	    String value = "";
	    try{
	    	value = item.getString("utf-8");
	    }catch(Exception ee){
	    	value = item.getString();
	    } 
}

	public void processUploadedFile(FileItem fileItem, String dir,JspWriter out) throws IOException{
		    String fieldName = fileItem.getFieldName();
		    String fileName = fileItem.getName();
		    String contentType = fileItem.getContentType();
		    long sizeInBytes = fileItem.getSize();
		    System.out.println("size: "+sizeInBytes);
		    	// 업로드한 파일이 존재하는 경우
	            if (sizeInBytes > 0) {
	                int idx = fileName.lastIndexOf("\\");
	                if (idx == -1) {
	                    idx = fileName.lastIndexOf("/");
	                }
	                fileName = fileName.substring(idx + 1);
	                try {
	                    File uploadedFile = new File(dir, fileName);
	                    fileItem.write(uploadedFile);
	                    
	                } catch(Exception ex) {
	                    // 예외 처리
	                }
	            }
	}
}
