package sigma.carimi.controller;

import java.util.Date;
import java.util.List;

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
			String pageno, String pageno1, String pageno2 , String act0, String act1, String act2) throws Exception{		
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
	
	public Integer toInt(String x){
		int a = 0;
		try{
			a = Integer.parseInt(x);
		}catch(Exception e){}
		return a;
	}
}
