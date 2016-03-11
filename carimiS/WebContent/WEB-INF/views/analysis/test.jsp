<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@page import="java.util.List" %>
<%@page import="java.util.ArrayList" %>
<%@page import="sigma.carimi.service.*" %>
<%@page import="sigma.carimi.model.*" %>
<%@page import="sigma.carimi.controller.*" %>
<%@page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>분석제안</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes">
<link href="<%=request.getContextPath()%>/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/css/bootstrap-responsive.min.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/css/font-awesome.css" rel="stylesheet">
<link href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600" rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/style.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/css/pages/signin.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/css/pages/dashboard.css" rel="stylesheet">

<!-- ##### ##### ##### ##### ##### Select Menu FROM Analysis.jsp ##### ##### ##### ##### ##### -->
<script>
	function imgCbox(N, tabstop) {
		var objs, cboxes, Img, Span, A;
		objs = document.getElementsByTagName("INPUT"); //인풋 이름 달린 애들
		if (N == undefined)
			return false;
		if (tabstop == undefined)
			tabstop = true;

		for (var i = 0; i < objs.length; i++) {
			if (objs[i].type != "checkbox" || objs[i].name != N)
				continue;
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
			Img.src = objs[i].checked ? objs[i].getAttribute("onsrc") : objs[i]
					.getAttribute("offsrc");
			Img.style.borderWidth = "0px";
			Img.onclick = new Function("imgCbox.onclick('" + N + "','" + len
					+ "')");
			imgCbox.ImgObjs[N][len] = Img;

			// anchor element for tab stop
			A = document.createElement("A");
			if (tabstop) {
				A.href = "javascript:;";
				A.onkeypress = new Function("evt",
						"if(evt==undefined)evt=event;if(evt.keyCode==13){ imgCbox.onclick('"
								+ N + "','" + len + "'); }");
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
		I.src = imgCbox.Imgs[N][idx][C.checked ? "on" : "off"].src;
		if (C.checked) {
			divOpen('popup');

		} else
			divClose('popup');
		// fire event
		if (C.onclick != undefined || C.onclick != null)
			C.onclick();
	}
	imgCbox.Objs = {};
	imgCbox.Imgs = {};
	imgCbox.ImgObjs = {};
</script>
<!-- ##### ##### ##### ##### ##### Select Menu FROM Analysis.jsp ##### ##### ##### ##### ##### -->

</head>



<body bgcolor="white">
	


	<!-- ##### ##### ##### ##### ##### analysisAF FROM CARIMI2 ##### ##### ##### ##### ##### -->
		<H2>집중분석</H2>
		<div id="analysis">
    	</div>
    	<%
    		// 여기에서 dao의 정보들을 받아온다. 이러한 형태로 컨트롤러의 자료를 받아오면 된다.
	    	//dao = CARDDAO.getInstance();	// dao의 메소드를 불러오기 위해 인스턴스 형성
	    	//CARDinformList = dao.getCARDinformlist(strc1[0],strc1[1],strc1[2],strc1[3],strc1[4],strc1[5],stra1[0],strb1[0]);
	    	// 위의 조건을 불러 일으킨 녀석을 그냥 불러와서 쓰면 될 것 같은데 ...
    	%>
		총 ${CARDinformListSize } 개의 카드가 검색되었습니다.

</body>