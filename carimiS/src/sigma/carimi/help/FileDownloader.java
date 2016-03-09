package sigma.carimi.help;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sigma.carimi.service.boardDAO;

public class FileDownloader extends HttpServlet {

    private static final long serialVersionUID = 4908298571553227744L;
      
    private static final int BUFFER_SIZE = 8192; // 8kb

    
    private ServletConfig mConfig = null;
    
    public void init(ServletConfig config) throws ServletException {
          super.init(config);
          mConfig=config;
      }

    //서버 -> 클라이언트
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
    
    //클라이언트 -> 서버
    public void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {

    	String bfilename = request.getParameter("bfilename");
    	
    	
    	
    	
    	/*boolean isS=dao.downloadCount(pdsid);
    	if(!isS){
    		response.sendRedirect("pdslist.jsp");
    	}*/
    	
    	//----------------------------------------------------
        //PrintWriter out = new PrintWriter( new OutputStreamWriter( response.getOutputStream(), "KSC5601") );
    	//저장하겟다
        BufferedOutputStream out = new BufferedOutputStream(response.getOutputStream());

        try {
        		String filePath =request.getSession().getServletContext().getRealPath("/" )+"upload";
        		
        		
                filePath=filePath+"\\"+bfilename;
                System.out.println("filepath@@@@@@@@@@@@@@@@@@@@@ : " + filePath);
                System.out.println("bfilename : " + bfilename);
                //Jacob Yi, 2006-09-25
                    //Move to dir for download stream
                    //And get any other Clock - Time
                    //But, this will be implemented in the next version .
                    File f = new File(filePath);			
                    System.out.println(filePath);
                    if (f.exists() && f.canRead()) {	
                    	
                    	bfilename = URLEncoder.encode(bfilename, "UTF-8");
                    	
                    	response.setHeader("Content-Disposition", "attachment; filename=\"" + bfilename + "\";");
              
                        response.setHeader("Content-Transfer-Encoding", "binary;");
                        response.setHeader("Content-Length", "" + f.length()); //길이값
                        response.setHeader("Pragma", "no-cache;"); 
                        response.setHeader("Expires", "-1;");

                        System.out.println("download");
                        BufferedInputStream fileInput = new BufferedInputStream(new FileInputStream(f));
                        byte buffer[] = new byte[BUFFER_SIZE]; //Limited in FileIO.SWF....

                        int read = 0;

                         while ((read = fileInput.read(buffer)) != -1) {
                            out.write(buffer, 0, read);
                         }
                         
                         fileInput.close();				
                         out.flush();
                         System.out.println("download");
                    }else {
                        System.out.println("not found");
                        request.setAttribute("dir", f.getParent());
                        request.setAttribute("error", "File "+f.getAbsolutePath()+
                                " does not exist or is not readable on the server");
                    }
        }
        catch(Throwable e) {
        	
             //e.printStackTrace(System.err);

        } finally{
        	
            if( out != null){
                out.flush();
                out.close();
            }
        }
    }
}