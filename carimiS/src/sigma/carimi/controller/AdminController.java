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

import sigma.carimi.model.logDTO;
import sigma.carimi.service.adminService;


@Controller
public class AdminController {

	private static final Logger logger = 
	LoggerFactory.getLogger(AdminController.class);
	
	@Autowired
	private adminService adminService;
	public Integer toInt(String x){

		int a = 0;

		try{

			a = Integer.parseInt(x);

		}catch(Exception e){}

		return a;

	}
	@RequestMapping(value = "loglist.do", 
			method = {RequestMethod.GET,
			RequestMethod.POST})
	public String loglist(HttpServletRequest req, Model model,  String pageno) throws Exception {
		logger.info("Welcome AdminController loglist! "+ new Date());
		
		List<logDTO> list = null;
					list = adminService.loglist();
		int pageno2=toInt(pageno);
		if(pageno2<1){

			pageno2 = 1;

		}
		int total_record = list.size();	
		
		int page_per_record_cnt = 10; 
		int group_per_page_cnt =5;									
		int endno = pageno2*page_per_record_cnt;				

		int startno = endno-(page_per_record_cnt-1);
		System.out.println("startno" + startno);
		if(endno>total_record){

			endno = total_record;
		}
		int total_page = total_record / page_per_record_cnt + (total_record % page_per_record_cnt>0 ? 1 : 0);
		if(pageno2>total_page){
			pageno2 = total_page;
		}
		int group_no = pageno2/group_per_page_cnt+( pageno2%group_per_page_cnt>0 ? 1:0);
		int page_eno = group_no*group_per_page_cnt;
		int page_sno = page_eno-(group_per_page_cnt-1);	

		if(page_eno>total_page){
			page_eno=total_page;
		}	
		int prev_pageno = page_sno-group_per_page_cnt;		
		int next_pageno = page_sno+group_per_page_cnt;
		if(prev_pageno<1){
			prev_pageno=1;
		}
		if(next_pageno>total_page){
			next_pageno=total_page/group_per_page_cnt*group_per_page_cnt+1;
		}

		model.addAttribute("loglist",list);
		
		model.addAttribute("prev_pageno",prev_pageno);
		
		model.addAttribute("next_pageno",next_pageno);
		
		model.addAttribute("endno", endno);
		model.addAttribute("startno",startno);
		model.addAttribute("page_sno",page_sno);
		model.addAttribute("pageno",pageno2);
		model.addAttribute("page_eno",page_eno);
	
		int count= adminService.logAll();
		int count2= adminService.logToday();
        model.addAttribute("AllCount",count);
        model.addAttribute("TodayCount",count2);
   
		
		System.out.println("pageno" + pageno2);
		
		System.out.println("prev_pageno!!!" + prev_pageno);
		System.out.println("next_pageno!!!" + next_pageno);
		System.out.println("endno!!!" + endno);
		System.out.println("page_sno!!!" + page_sno);
		System.out.println("page_eno!!!" + page_eno);
		return "loglist.tiles";
	}
	
}
