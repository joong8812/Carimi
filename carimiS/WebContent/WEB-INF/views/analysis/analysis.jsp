<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Analysis</title>
    	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
	<link href="<%=request.getContextPath()%>/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
	<link href="<%=request.getContextPath()%>/css/bootstrap-responsive.min.css" rel="stylesheet" type="text/css" />
	<link href="<%=request.getContextPath()%>/css/font-awesome.css" rel="stylesheet">
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600" rel="stylesheet">
	<link href="<%=request.getContextPath()%>/css/style.css" rel="stylesheet" type="text/css">
	<link href="<%=request.getContextPath()%>/css/pages/signin.css" rel="stylesheet" type="text/css">
	<style>
	#header {
		background-color: white;
		color: black;
		text-align: left;
		height: 80px;
		border: 1px solid #F2E6D9;
	}
	#wrapperDiv {
		width: 100%;
		height:1800px;
		background-color: #ffffff;
	}
	#sidebar {
		background-color: #F2E6D9;
		width: 270px;
		height:1800px;
		float:left;
	}
	#contents {
		height: 100%;
		float:left;
	}
	</style>
	<%
	String a1 = request.getParameter("a1");
	String b1 = request.getParameter("b1");
	String c1[] = new String[6];
	c1 = request.getParameterValues("c1");
	%>
	<script>
	function imgCbox(N, tabstop)
	{
	    var objs, cboxes, Img, Span, A;
	    objs = document.getElementsByTagName("INPUT");
	    if (N == undefined) return false;
	    if (tabstop == undefined) tabstop = true;
	
	    for (var i=0; i < objs.length; i++) {
	        if (objs[i].type != "checkbox" || objs[i].name != N) continue;
	        if (imgCbox.Objs[N] == undefined) {
	            imgCbox.Objs[N] = [];
	            imgCbox.Imgs[N] = [];
	            imgCbox.ImgObjs[N] = [];
	        }
	
	        var len = imgCbox.Objs[N].length;
	        imgCbox.Objs[N][len] = objs[i];
	        imgCbox.Imgs[N][len] = {};
	
	        // for image cache
	        (Img = new Image()).src = objs[i].getAttribute("onsrc");
	        imgCbox.Imgs[N][len]["on"] = Img;
	
	        (Img = new Image()).src = objs[i].getAttribute("offsrc");
	        imgCbox.Imgs[N][len]["off"] = Img;
	
	        // image element
	        Img = document.createElement("IMG");
	        Img.src = objs[i].checked?objs[i].getAttribute("onsrc"):objs[i].getAttribute("offsrc");
	        Img.style.borderWidth = "0px";
	        Img.onclick = new Function("imgCbox.onclick('"+N+"','"+len+"')");
	        imgCbox.ImgObjs[N][len] = Img;
	
	        // anchor element for tab stop
	        A = document.createElement("A");
	        if (tabstop) {
	            A.href = "javascript:;";
	            A.onkeypress = new Function("evt", "if(evt==undefined)evt=event;if(evt.keyCode==13){ imgCbox.onclick('"+N+"','"+len+"'); }");
	        }
	        A.style.borderWidth = "0px";
	        A.appendChild(Img);
	
	        // insert object
	        Span = objs[i].parentNode;
	        Span.style.display = "none";
	        Span.parentNode.insertBefore(A, Span);
	    }
	}
	imgCbox.onclick = function(N, idx) {
	    var C = imgCbox.Objs[N][idx];
	    var I = imgCbox.ImgObjs[N][idx];
	
	    C.checked = !C.checked;
	    I.src = imgCbox.Imgs[N][idx][C.checked?"on":"off"].src;
	    if(C.checked){
	        divOpen('popup');
	    	
	    }else
	        divClose('popup');
	    // fire event
	    if (C.onclick != undefined || C.onclick != null) C.onclick();
	}
	imgCbox.Objs = {};
	imgCbox.Imgs = {};
	imgCbox.ImgObjs = {};
	</script>
</head>

<body>

<div class="main">
  <div class="main-inner">
    <div class="container">
      <div class="row">
        <div class="span12">
          <div class="widget">
 			<div class="widget-header"> <i class="icon-th-list"></i>
              <h3>혜택 정보 팡팡!</h3> 
        	</div>
			<div class="control-group">	
			   <FORM  name="fr" ACTION="/WEB-INF/views/analysis/analysis.jsp" METHOD="post" onsubmit="return check()">
		        <div class="controls">
                <div class="accordion" id="accordion2">
                   <div class="accordion-group">
                     <div class="accordion-heading">
                       <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseOne">
                         	연회비와 실적기준을 선택해주세요
                       </a>
                     </div>
                     <div id="collapseOne" class="accordion-body collapse in">
                       <div class="accordion-inner" style="text-align:center;">
                    	
                         <span><input type="checkbox" name="a1" value="0" offsrc="/Carimi2/image/analysis/an_1.png" onsrc="/Carimi2/image/analysis/an_1_on.png"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							 <span><input onclick="chk_only1(this)" type="checkbox" name="a1" value="5000" offsrc="/Carimi2/image/analysis/an_2.png" onsrc="/Carimi2/image/analysis/an_2_on.png"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							 <span><input onclick="chk_only1(this)"  type="checkbox" name="a1" value="10000" offsrc="/Carimi2/image/analysis/an_3.png" onsrc="/Carimi2/image/analysis/an_3_on.png"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							 <span><input onclick="chk_only1(this)" type="checkbox" name="a1" value="15000" offsrc="/Carimi2/image/analysis/an_4.png" onsrc="/Carimi2/image/analysis/an_4_on.png"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							 <span><input onclick="chk_only1(this)" type="checkbox" name="a1" value="20000" offsrc="/Carimi2/image/analysis/an_5.png" onsrc="/Carimi2/image/analysis/an_5_on.png"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							 <span><input onclick="chk_only1(this)" type="checkbox" name="a1" value="1" offsrc="/Carimi2/image/analysis/an_6.png" onsrc="/Carimi2/image/analysis/an_6_on.png"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							 <script>imgCbox("a1");</script>
							 <script>chk_only1("a1")</script>
							 <br> <br>
							 							 
					    	 <span><input onclick="chk_only2(this)" type="checkbox" name="b1" value="0" offsrc="/Carimi2/image/analysis/an_1.png" onsrc="/Carimi2/image/analysis/an_1_on.png"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							  <span><input onclick="chk_only2(this)" type="checkbox" name="b1" value="100000" offsrc="/Carimi2/image/analysis/an_s_1.png" onsrc="/Carimi2/image/analysis/an_s_1_on.png"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							  <span><input onclick="chk_only2(this)" type="checkbox" name="b1" value="200000" offsrc="/Carimi2/image/analysis/an_s_2.png" onsrc="/Carimi2/image/analysis/an_s_2_on.png"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							  <span><input onclick="chk_only2(this)" type="checkbox" name="b1" value="300000" offsrc="/Carimi2/image/analysis/an_s_3.png" onsrc="/Carimi2/image/analysis/an_s_3_on.png"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							  <span><input onclick="chk_only2(this)" type="checkbox" name="b1" value="400000" offsrc="/Carimi2/image/analysis/an_s_4.png" onsrc="/Carimi2/image/analysis/an_s_4_on.png"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							  <span><input onclick="chk_only2(this)" type="checkbox" name="b1" value="500000" offsrc="/Carimi2/image/analysis/an_s_5.png" onsrc="/Carimi2/image/analysis/an_s_5_on.png"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							  <span><input onclick="chk_only2(this)"  type="checkbox" name="b1" value="1" offsrc="/Carimi2/image/analysis/an_6.png" onsrc="/Carimi2/image/analysis/an_6_on.png"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							 <script>imgCbox("b1");</script>

                       </div>
                     </div>
                   </div>
                   <div class="accordion-group">
                     <div class="accordion-heading">
                       <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseTwo">
                        	비교하고 싶은 혜택 6개를 선택하세요
                       </a>
                     </div>
                     <div id="collapseTwo" class="accordion-body collapse in">
                       <div class="accordion-inner" >
                         <p style="text-align:center;">
							 <span><input onclick="chk_six(this)" type="checkbox" name="c1" value="bea" offsrc="/Carimi2/image/benefits/bea_off.png" onsrc="/Carimi2/image/benefits/bea_on.png"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							 <span><input onclick="chk_six(this)" type="checkbox" name="c1" value="cafe" offsrc="/Carimi2/image/benefits/cafe_off.png" onsrc="/Carimi2/image/benefits/cafe_on.png"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							 <span><input onclick="chk_six(this)" type="checkbox" name="c1" value="cul" offsrc="/Carimi2/image/benefits/cul_off.png" onsrc="/Carimi2/image/benefits/cul_on.png"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							 <span><input onclick="chk_six(this)" type="checkbox" name="c1" value="cvs" offsrc="/Carimi2/image/benefits/cvs_off.png" onsrc="/Carimi2/image/benefits/cvs_on.png"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							 <span><input onclick="chk_six(this)" type="checkbox" name="c1" value="edu" offsrc="/Carimi2/image/benefits/edu_off.png" onsrc="/Carimi2/image/benefits/edu_on.png"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							 <span><input onclick="chk_six(this)" type="checkbox" name="c1" value="eou" offsrc="/Carimi2/image/benefits/eou_off.png" onsrc="/Carimi2/image/benefits/eou_on.png"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							 <span><input onclick="chk_six(this)" type="checkbox" name="c1" value="lei" offsrc="/Carimi2/image/benefits/lei_off.png" onsrc="/Carimi2/image/benefits/lei_on.png"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							 <span><input onclick="chk_six(this)" type="checkbox" name="c1" value="mart" offsrc="/Carimi2/image/benefits/mart_off.png" onsrc="/Carimi2/image/benefits/mart_on.png"></span>
							 <br>							 
							 <span><input onclick="chk_six(this)" type="checkbox" name="c1" value="medi" offsrc="/Carimi2/image/benefits/medi_off.png" onsrc="/Carimi2/image/benefits/medi_on.png"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							  <span><input onclick="chk_six(this)" type="checkbox" name="c1" value="movie" offsrc="/Carimi2/image/benefits/movie_off.png" onsrc="/Carimi2/image/benefits/movie_on.png"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							  <span><input onclick="chk_six(this)" type="checkbox" name="c1" value="oil" offsrc="/Carimi2/image/benefits/oil_off.png" onsrc="/Carimi2/image/benefits/oil_on.png"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							  <span><input onclick="chk_six(this)" type="checkbox" name="c1" value="poi" offsrc="/Carimi2/image/benefits/poi_off.png" onsrc="/Carimi2/image/benefits/poi_on.png"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							  <span><input onclick="chk_six(this)" type="checkbox" name="c1" value="shop" offsrc="/Carimi2/image/benefits/shop_off.png" onsrc="/Carimi2/image/benefits/shop_on.png"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							  <span><input onclick="chk_six(this)" type="checkbox" name="c1" value="tel" offsrc="/Carimi2/image/benefits/tel_off.png" onsrc="/Carimi2/image/benefits/tel_on.png"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							  <span><input onclick="chk_six(this)" type="checkbox" name="c1" value="tra" offsrc="/Carimi2/image/benefits/tra_off.png" onsrc="/Carimi2/image/benefits/tra_on.png"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							 <script>imgCbox("c1");</script>
							 	<input type="submit" class="btn" value="분석!">
							 </p>
                       </div>
                     </div>
                   </div>
                 </div>
			</div> <!-- /controls -->	
			</FORM>
		</div> <!-- /control-group -->
		  
					   <%if(a1 != null && b1 != null && c1!=null){%>
		    			<jsp:include page="/WEB-INF/views/analysis/analysisAF.jsp">
							<jsp:param value="<%=a1%>" name="a1"/>
								<jsp:param value="<%=b1 %>" name="b1"/>
								<jsp:param value="<%=c1[0] %>" name="c1"/>
								<jsp:param value="<%=c1[1] %>" name="c1"/>
								<jsp:param value="<%=c1[2] %>" name="c1"/>
								<jsp:param value="<%=c1[3] %>" name="c1"/>
								<jsp:param value="<%=c1[4] %>" name="c1"/>
								<jsp:param value="<%=c1[5] %>" name="c1"/>
							</jsp:include>
					<%} %>
		          <!-- /widget --> 
		        </div>
		        <!--/span5  -->
			    </div>
	      </div> <!-- /row -->
	    </div> <!-- /container -->
	</div> <!-- /main-inner -->
</div> <!-- /main -->

	<script src="<%=request.getContextPath()%>/js/jquery-1.7.2.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/bootstrap.js"></script>
	<script src="<%=request.getContextPath()%>/js/signin.js"></script>
	<script>
	function check() {
			var obj = document.getElementsByName("a1");
			var count = 0;
			var count1 =0;
			for(var i=0; i<obj.length; i++){
				if(obj[i].checked === false){
					count1++;
					if(count1>5){
					alert("실적이 없습니다!");
					return false;
					}
				}
				if(obj[i].checked === true){
					count++;
					if(count > 1){
						alert("실적을 하나 이상 선택 할 수 없습니다!");
						return false;
					}
				}	
			}
			
			var obj1 = document.getElementsByName("b1");
			var count1 = 0;
			var count11 =0;
			for(var i=0; i<obj.length; i++){
				if(obj1[i].checked === false){
					count11++;
					if(count11>6){
					alert("연회비가 없습니다!");
					return false;
					}
				}
				if(obj1[i].checked === true){
					count1++;
					if(count1 > 1){
						alert("연회비를 하나 이상 선택 할 수 없습니다!");
						return false;
					}
				}	
			}
		
		var obj2 = document.getElementsByName("c1");
			var count2 = 0;
			var count12 =0;
			for(var i=0; i<obj2.length; i++){
				if(obj2[i].checked === false){
					count12++;
					if(count12>9){
					alert("혜택을 6개 선택하세요!");
					return false;
					}
				}
				if(obj2[i].checked === true){
					count2++;
					if(count2 > 6){
						alert("혜택을 6개 이상 선택 할 수 없습니다");
						return false;
					}
				}
			} 
	}
	</script>

</body>
</html>