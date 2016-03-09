<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<div class="extra">
  <div class="extra-inner">
    <div class="container">
      <div class="row">
                    <div class="span2">
                        <h4>
                            Card Reports</h4>
                        <ul>
                            <li><a href="javascript:navClick('nav_analysis', 'analysis.do');">Card Reports</a></li>
                        </ul>
                    </div>
                    <!-- /span3 -->
                    <div class="span2">
                        <h4>
                            Card Benefit Tour</h4>
                        <ul>
                            <li><a href="javascript:navClick('nav_benefit', 'benefit.do');">Card Benefit Tour</a></li>
                        </ul>
                    </div>
                    <!-- /span3 -->
                    <div class="span2">
                        <h4>
                            Card Expenditure</h4>
                        <ul>
                            <li><a href="javascript:navClick('nav_explist', 'explist.do');">Card Expenditure</a></li>
                        </ul>
                    </div>
                    <!-- /span3 -->
                    <div class="span2">
                        <h4>
                           Schedule</h4>
                        <ul>
                            <li><a href="javascript:navClick('nav_plan', 'plan.do');">Schedule</a></li>
                        </ul>
                    </div>
                    <!-- /span3 -->
                    <div class="span2">
                        <h4>
                           Notice</h4>
                        <ul>
                            <li><a href="javascript:navClick('nav_notice', 'boardlist.do');">Notice</a></li>
                        </ul>
                    </div>
                    <!-- /span3 -->
                </div>
      <!-- /row --> 
    </div>
    <!-- /container --> 
  </div>
  <!-- /extra-inner --> 
</div>
<!-- /extra -->
<div class="footer">
  <div class="footer-inner">
    <div class="container">
      <div class="row">
        <div class="span12"> &copy; 2016 <a href="http://choi7435.dothome.co.kr/">SIGMA Corporation</a>. </div>
        <!-- /span12 --> 
      </div>
      <!-- /row --> 
    </div>
    <!-- /container --> 
  </div>
  <!-- /footer-inner --> 
</div>
<!-- /footer --> 
<!-- Le javascript
================================================== --> 
<!-- Placed at the end of the document so the pages load faster --> 


<script>
function navClick(url, gourl){
 	 window.name = url;
	location.href = gourl;
}
</script>
    
</body>
</html>