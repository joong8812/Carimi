<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- /navbar -->
<style>
video#bgvid { 
    position: fixed;
    top: 50%;
    left: 50%;
    min-width: 100%;
    min-height: 100%;
    width: auto;
    height: auto;
    z-index: -100;
    -ms-transform: translateX(-50%) translateY(-50%);
    -moz-transform: translateX(-50%) translateY(-50%);
    -webkit-transform: translateX(-50%) translateY(-50%);
    transform: translateX(-50%) translateY(-50%);
    background: url(polina.jpg) no-repeat;
    background-size: cover; 
    opacity:.5;
}
</style>
<!-- /navbar -->
<div class="subnavbar">
  <div class="subnavbar-inner">
    <div class="container">
      <ul class="mainnav">
        <li class="active" ><a href="/Carimi2/main.jsp"><i class="icon-dashboard"></i><span>Dashboard</span> </a> </li>
        <li><a href="/Carimi2/view/analysis/analysis.jsp"><i class="icon-list-alt"></i><span>Reports</span> </a> </li>
        <li class="dropdown"><a href="/Carimi2/view/bnfSearch/bnf_main.jsp" class="dropdown-toggle" data-toggle="dropdown"><i class="icon-facetime-video"></i><span>Benefit Tour</span><b class="caret"></b> </a>
        

        </li>
		<li><a href="/Carimi2/view/plan/plan.jsp"><i class="icon-calendar"></i><span>Schedule</span> </a> </li>
        <li class="dropdown"><a href="/Carimi2/view/board/boardlist.jsp" class="dropdown-toggle" data-toggle="dropdown"> <i class="icon-bell"></i><span>Notice</span> <b class="caret"></b></a>

        </li>
      </ul>
    </div>
    <!-- /container --> 
  </div>
  <!-- /subnavbar-inner --> 
</div>



