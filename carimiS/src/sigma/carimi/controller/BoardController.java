package sigma.carimi.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.JspWriter;

import org.apache.tomcat.util.http.fileupload.FileItem;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.apache.tomcat.util.http.fileupload.servlet.ServletRequestContext;
import java.io.IOException;


import org.apache.tomcat.util.http.fileupload.FileItem;
import java.util.Iterator;
import org.apache.tomcat.util.http.fileupload.RequestContext;

import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import sigma.carimi.model.benefitDTO;
import sigma.carimi.model.boardDTO;
import sigma.carimi.service.boardService;

@Controller
public class BoardController {

	private static final Logger logger = 
	LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	private boardService boardService;
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
	
	public Integer toInt(String x){

		int a = 0;

		try{

			a = Integer.parseInt(x);

		}catch(Exception e){}

		return a;

	}
	@RequestMapping(value = "boardlist.do", 
			method = {RequestMethod.GET,
			RequestMethod.POST})
	public String boardlist(HttpServletRequest req, Model model,  String pageno, String cardvalue) throws Exception {
		logger.info("Welcome MemberController boardlist! "+ new Date());
		if(req.getParameter("cardvalue")==null){
			cardvalue="";
		}else if(req.getParameter("cardvalue").equals("all")){
			cardvalue="";
		}else{
			cardvalue=req.getParameter("cardvalue");
		}
		System.out.println(cardvalue + "cardvalue");
		List<boardDTO> list = null;
					list = boardService.boardList(cardvalue);
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

		model.addAttribute("boardlist",list);
		
		model.addAttribute("prev_pageno",prev_pageno);
		
		model.addAttribute("next_pageno",next_pageno);
		
		model.addAttribute("endno", endno);
		model.addAttribute("startno",startno);
		model.addAttribute("page_sno",page_sno);
		model.addAttribute("pageno",pageno2);
		model.addAttribute("page_eno",page_eno);
		model.addAttribute("cardvalue", cardvalue);
		System.out.println("pageno" + pageno2);
		
		System.out.println("prev_pageno!!!" + prev_pageno);
		System.out.println("next_pageno!!!" + next_pageno);
		System.out.println("endno!!!" + endno);
		System.out.println("page_sno!!!" + page_sno);
		System.out.println("page_eno!!!" + page_eno);
		return "boardlist.tiles";
	}
	
	@RequestMapping(value = "boardDetail.do", 
			method = {RequestMethod.GET,
			RequestMethod.POST})
	public String boardDetail(boardDTO bbs,Model model, int bseq) throws Exception {
		logger.info("Welcome MemberController boardDetail! "+ new Date());
		
		boardDTO dto=boardService.boardDetail(bseq);
		model.addAttribute("boardDetail",dto);
		
		return "boardDetail.tiles";
	}
	
	@RequestMapping(value = "boardwrite.do", 
			method = {RequestMethod.GET,
			RequestMethod.POST})
	public String boardwrite(Model model) throws Exception {
		logger.info("Welcome MemberController boardwrite! "+ new Date());
		
		return "boardwrite.tiles";
	}
	@RequestMapping(value="boardwriteAf.do", method={RequestMethod.GET, RequestMethod.POST})
	public String boardwriteAf(Model model, HttpServletResponse res, HttpServletRequest request
			)throws Exception{
		logger.info("Welcome MemberController boardwriteAF! "+ new Date());
		JspWriter out = null;
		
		String fupload = request.getSession().getServletContext().getRealPath("/" )+"upload";

		System.out.println("파일업로드 경로" + fupload);

		String yourTempDirecory = fupload;

		int yourMaxRequestSize = 100 * 1024 * 1024;
		int yourMaxMemorySize = 100 * 1024;

			String id = "";
			String bcontent = "";
			String btitle = "";
			String bsdate="";
			String bedate="";
			String bselect="";
			String bfilename = null;
			boolean isMultipart = ServletFileUpload.isMultipartContent(request);
			if(isMultipart){
				DiskFileItemFactory factory = new DiskFileItemFactory();
				
				factory.setSizeThreshold(yourMaxMemorySize);
				factory.setRepository(new File(yourTempDirecory));
				
				ServletFileUpload upload = new ServletFileUpload(factory);
				upload.setSizeMax(yourMaxRequestSize);
				
				List<FileItem> items = upload.parseRequest(new ServletRequestContext(request));
				
				Iterator<FileItem> iter = items.iterator();
						
				while(iter.hasNext()){
					FileItem item = iter.next();
					
					if(item.isFormField()){
						processFormField(item, out);
						if(item.getFieldName().equals("id")){
							id = item.getString("utf-8");
						}else if(item.getFieldName().equals("btitle")){
							btitle =item.getString("utf-8");
						}else if(item.getFieldName().equals("bcontent")){
							bcontent=item.getString("utf-8");
						}else if(item.getFieldName().equals("bsdate")){
							bsdate=item.getString("utf-8");
						}else if(item.getFieldName().equals("bedate")){
							bedate=item.getString("utf-8");
						}else if(item.getFieldName().equals("bselect")){
							bselect=item.getString("utf-8");
						}
							
					}else{
						if(item.getFieldName().equals("fileload")){
							int idx = item.getName().lastIndexOf("\\");
							if(idx == -1){
								idx = item.getName().lastIndexOf("/");
							}
							bfilename = item.getName().substring(idx + 1);
						}
						processUploadedFile(item, fupload, out);
					}
				}
						
			}else{
				System.out.println("isMultipart 가 아님 ");
			}
			boolean clear=boardService.boardwriteAf(new boardDTO
					(0, id, btitle, bcontent, bsdate, bedate, bselect, bfilename));
			
		 
		if(clear==true){
			return "redirect:/boardlist.do";
		}
	
		
		return "boardwrite.tiles";
		
	}
	@RequestMapping(value="boarddelete.do", method={RequestMethod.GET, RequestMethod.POST})
	public String boarddelete(Model model,int bseq,HttpServletResponse res)throws Exception{
		
		boolean clear =  boardService.boarddelete(bseq);
		if(clear){
		res.setContentType("text/html;charset=UTF-8");
		res.getWriter().write("<script language='JavaScript'>");
		res.getWriter().write("alert('삭제되었습니다!');");
		res.getWriter().write("location.href='boardlist.do'");
		res.getWriter().write("</script>");
		res.getWriter().flush(); 
	
		}
		return "bbsDetail.tiles";
	}
}
