<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>
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



<!-- ##### ##### ##### Drawing GRAPHS HERE ##### ##### ##### -->
<script>

</script>
<script>				
$(function () {
	// ############################################# 1번 혜택 #############################################
	$('#container1').highcharts({
		chart: {
            type: 'column',
            margin: 120,
            options3d: {
                enabled: true,
                alpha: 15,
                beta: 15,
                viewDistance: 25,
                depth: 40
            },
			marginTop: 80,
            marginRight: 50,
            marginLeft: 50,
            colorByPoint: true
        },
        title: {
            text: '<b> ${strc1[0]} 혜택</b>'// 이거도 자동으로 들어가도록				
        },
        subtitle: {
            text: ' --- 텍스트 입력 ---'
        },
        
        tooltip: {
            headerFormat: '<b>{point.key}</b><br>',
            //pointFormat: '<span style="color:{series.color}">\u25CF</span> {series.name}: {point.y} / {point.stackTotal}'
            pointFormat: '<span style="color:{series.color}">\u25CF</span> {series.name}: {point.y}'
        },
        
        plotOptions: {
            column: {
            	stacking: 'normal',
            	depth: 25
            }
        }
        ,
        
        yAxis: {
            title: {
                text: null
            }
        },
        series: [
			//#################### 원본값/연회비 자료 ####################
                {
				colorByPoint:'true',
			    name: '연회비 1000원 당 혜택',
			    data: [
						<c:forEach items="${CARDinformList}" var="CARDinformList" varStatus="vs">
						<c:choose>
							<c:when test="${vs.count ne CARDinformListSize}">
								${sort1[vs.count-1][1]} ,
							</c:when>
							<c:otherwise>
								${sort1[vs.count-1][1]}
							</c:otherwise>
						</c:choose>
						</c:forEach>
					  ],
				stack:'secondary'
			},
			// #################### 원본값 자료 ####################    
            {
        	colorByPoint:'true',
            name: '${strc1[0]}',
            data: [
					<c:forEach items="${sort1}" var="sort1" varStatus="vs">
						<c:choose>
							<c:when test="${vs.count ne sort1Length}">
								{y:${sort1[0]},color:'#DDDCFE'},
							</c:when>
							<c:otherwise>
								{y:${sort1[0]}}
							</c:otherwise>
						</c:choose>
					</c:forEach>
				  ],
        	stack:'primary',
        	}
		], //여기가 시리즈 닫는 곳
		xAxis: {// 참고로 xAxis항목을 다른 곳으로 옮겨도 아주 잘 작동한다.
        	categories: [//문자열, 반드시 작은 따옴표로 안아라
	                       	   
        	             <c:forEach items="${CARDinformList}" var="CARDinformList" varStatus="vs">
	                      	<c:choose>
							<c:when test="${vs.count ne CARDinformListSize}">
								'${sortname[sort1[vs.count-1][2].intValue()][0]}',
							</c:when>
							<c:otherwise>
								'${sortname[sort1[vs.count-1][2].intValue()][0]}'
							</c:otherwise>
							</c:choose>
                      	</c:forEach>
	                       	]
        }
    });	// 컨테이너1 닫는 곳 
    
  //############################################# 2번째 혜택 #############################################
    $('#container2').highcharts({
		chart: {
            type: 'column',
            margin: 120,
            options3d: {
                enabled: true,
                alpha: 15,
                beta: 15,
                viewDistance: 25,
                depth: 40
            },
			marginTop: 80,
            marginRight: 50,
            marginLeft: 50,
            colorByPoint: true
        },
        title: {
            text: '<b> ${strc1[1]} 혜택</b>'// 이거도 자동으로 들어가도록				
        },
        subtitle: {
            text: ' --- 텍스트 입력 ---'
        },
        
        tooltip: {
            headerFormat: '<b>{point.key}</b><br>',
            //pointFormat: '<span style="color:{series.color}">\u25CF</span> {series.name}: {point.y} / {point.stackTotal}'
            pointFormat: '<span style="color:{series.color}">\u25CF</span> {series.name}: {point.y}'
        },
        
        plotOptions: {
            column: {
            	stacking: 'normal',
            	depth: 25
            }
        }
        ,
        
        yAxis: {
            title: {
                text: null
            }
        },
        series: [
			//#################### 원본값/연회비 자료 ####################
                {
				colorByPoint:'true',
			    name: '연회비 1000원 당 혜택',
			    data: [
						<c:forEach items="${CARDinformList}" var="CARDinformList" varStatus="vs">
						<c:choose>
							<c:when test="${vs.count ne CARDinformListSize}">
								${sort2[vs.count-1][1]} ,
							</c:when>
							<c:otherwise>
								${sort2[vs.count-1][1]}
							</c:otherwise>
						</c:choose>
						</c:forEach>
					  ],
				stack:'secondary'
			},
			// #################### 원본값 자료 ####################    
            {
        	colorByPoint:'true',
            name: '${strc1[1]}',
            data: [
					<c:forEach items="${sort2}" var="sort2" varStatus="vs">
						<c:choose>
							<c:when test="${vs.count ne sort2Length}">
								{y:${sort2[0]},color:'#DDDCFE'},
							</c:when>
							<c:otherwise>
								{y:${sort2[0]}}
							</c:otherwise>
						</c:choose>
					</c:forEach>
				  ],
        	stack:'primary',
        	}
		], //여기가 시리즈 닫는 곳
		xAxis: {// 참고로 xAxis항목을 다른 곳으로 옮겨도 아주 잘 작동한다.
        	categories: [//문자열, 반드시 작은 따옴표로 안아라
	                       	   
        	             <c:forEach items="${CARDinformList}" var="CARDinformList" varStatus="vs">
	                      	<c:choose>
							<c:when test="${vs.count ne CARDinformListSize}">
								'${sortname[sort2[vs.count-1][2].intValue()][0]}',
							</c:when>
							<c:otherwise>
								'${sortname[sort2[vs.count-1][2].intValue()][0]}'
							</c:otherwise>
							</c:choose>
                      	</c:forEach>
	                       	]
        }
    });	// 컨테이너2 닫는 곳 
  
    //############################################# 3번째 혜택 #############################################
    $('#container3').highcharts({
		chart: {
            type: 'column',
            margin: 120,
            options3d: {
                enabled: true,
                alpha: 15,
                beta: 15,
                viewDistance: 25,
                depth: 40
            },
			marginTop: 80,
            marginRight: 50,
            marginLeft: 50,
            colorByPoint: true
        },
        title: {
            text: '<b> ${strc1[2]} 혜택</b>'// 이거도 자동으로 들어가도록				
        },
        subtitle: {
            text: ' --- 텍스트 입력 ---'
        },
        
        tooltip: {
            headerFormat: '<b>{point.key}</b><br>',
            //pointFormat: '<span style="color:{series.color}">\u25CF</span> {series.name}: {point.y} / {point.stackTotal}'
            pointFormat: '<span style="color:{series.color}">\u25CF</span> {series.name}: {point.y}'
        },
        
        plotOptions: {
            column: {
            	stacking: 'normal',
            	depth: 25
            }
        }
        ,
        
        yAxis: {
            title: {
                text: null
            }
        },
        series: [
			//#################### 원본값/연회비 자료 ####################
                {
				colorByPoint:'true',
			    name: '연회비 1000원 당 혜택',
			    data: [
						<c:forEach items="${CARDinformList}" var="CARDinformList" varStatus="vs">
						<c:choose>
							<c:when test="${vs.count ne CARDinformListSize}">
								${sort3[vs.count-1][1]} ,
							</c:when>
							<c:otherwise>
								${sort3[vs.count-1][1]}
							</c:otherwise>
						</c:choose>
						</c:forEach>
					  ],
				stack:'secondary'
			},
			// #################### 원본값 자료 ####################    
            {
        	colorByPoint:'true',
            name: '${strc1[2]}',
            data: [
					<c:forEach items="${sort3}" var="sort3" varStatus="vs">
						<c:choose>
							<c:when test="${vs.count ne sort3Length}">
								{y:${sort3[0]},color:'#DDDCFE'},
							</c:when>
							<c:otherwise>
								{y:${sort3[0]}}
							</c:otherwise>
						</c:choose>
					</c:forEach>
				  ],
        	stack:'primary',
        	}
		], //여기가 시리즈 닫는 곳
		xAxis: {// 참고로 xAxis항목을 다른 곳으로 옮겨도 아주 잘 작동한다.
        	categories: [//문자열, 반드시 작은 따옴표로 안아라
	                       	   
        	             <c:forEach items="${CARDinformList}" var="CARDinformList" varStatus="vs">
	                      	<c:choose>
							<c:when test="${vs.count ne CARDinformListSize}">
								'${sortname[sort3[vs.count-1][2].intValue()][0]}',
							</c:when>
							<c:otherwise>
								'${sortname[sort3[vs.count-1][2].intValue()][0]}'
							</c:otherwise>
							</c:choose>
                      	</c:forEach>
	                       	]
        }
    });	// 컨테이너3 닫는 곳 
    
  //############################################# 4번째 혜택 #############################################
    $('#container4').highcharts({
		chart: {
            type: 'column',
            margin: 120,
            options3d: {
                enabled: true,
                alpha: 15,
                beta: 15,
                viewDistance: 25,
                depth: 40
            },
			marginTop: 80,
            marginRight: 50,
            marginLeft: 50,
            colorByPoint: true
        },
        title: {
            text: '<b> ${strc1[3]} 혜택</b>'// 이거도 자동으로 들어가도록				
        },
        subtitle: {
            text: ' --- 텍스트 입력 ---'
        },
        
        tooltip: {
            headerFormat: '<b>{point.key}</b><br>',
            //pointFormat: '<span style="color:{series.color}">\u25CF</span> {series.name}: {point.y} / {point.stackTotal}'
            pointFormat: '<span style="color:{series.color}">\u25CF</span> {series.name}: {point.y}'
        },
        
        plotOptions: {
            column: {
            	stacking: 'normal',
            	depth: 25
            }
        }
        ,
        
        yAxis: {
            title: {
                text: null
            }
        },
        series: [
			//#################### 원본값/연회비 자료 ####################
                {
				colorByPoint:'true',
			    name: '연회비 1000원 당 혜택',
			    data: [
						<c:forEach items="${CARDinformList}" var="CARDinformList" varStatus="vs">
						<c:choose>
							<c:when test="${vs.count ne CARDinformListSize}">
								${sort4[vs.count-1][1]} ,
							</c:when>
							<c:otherwise>
								${sort4[vs.count-1][1]}
							</c:otherwise>
						</c:choose>
						</c:forEach>
					  ],
				stack:'secondary'
			},
			// #################### 원본값 자료 ####################    
            {
        	colorByPoint:'true',
            name: '${strc1[3]}',
            data: [
					<c:forEach items="${sort4}" var="sort4" varStatus="vs">
						<c:choose>
							<c:when test="${vs.count ne sort4Length}">
								{y:${sort4[0]},color:'#DDDCFE'},
							</c:when>
							<c:otherwise>
								{y:${sort4[0]}}
							</c:otherwise>
						</c:choose>
					</c:forEach>
				  ],
        	stack:'primary',
        	}
		], //여기가 시리즈 닫는 곳
		xAxis: {// 참고로 xAxis항목을 다른 곳으로 옮겨도 아주 잘 작동한다.
        	categories: [//문자열, 반드시 작은 따옴표로 안아라
	                       	   
        	             <c:forEach items="${CARDinformList}" var="CARDinformList" varStatus="vs">
	                      	<c:choose>
							<c:when test="${vs.count ne CARDinformListSize}">
								'${sortname[sort4[vs.count-1][2].intValue()][0]}',
							</c:when>
							<c:otherwise>
								'${sortname[sort4[vs.count-1][2].intValue()][0]}'
							</c:otherwise>
							</c:choose>
                      	</c:forEach>
	                       	]
        }
    });	// 컨테이너4 닫는 곳 
    
  //############################################# 5번째 혜택 #############################################
    $('#container5').highcharts({
		chart: {
            type: 'column',
            margin: 120,
            options3d: {
                enabled: true,
                alpha: 15,
                beta: 15,
                viewDistance: 25,
                depth: 40
            },
			marginTop: 80,
            marginRight: 50,
            marginLeft: 50,
            colorByPoint: true
        },
        title: {
            text: '<b> ${strc1[4]} 혜택</b>'// 이거도 자동으로 들어가도록				
        },
        subtitle: {
            text: ' --- 텍스트 입력 ---'
        },
        
        tooltip: {
            headerFormat: '<b>{point.key}</b><br>',
            //pointFormat: '<span style="color:{series.color}">\u25CF</span> {series.name}: {point.y} / {point.stackTotal}'
            pointFormat: '<span style="color:{series.color}">\u25CF</span> {series.name}: {point.y}'
        },
        
        plotOptions: {
            column: {
            	stacking: 'normal',
            	depth: 25
            }
        }
        ,
        
        yAxis: {
            title: {
                text: null
            }
        },
        series: [
			//#################### 원본값/연회비 자료 ####################
                {
				colorByPoint:'true',
			    name: '연회비 1000원 당 혜택',
			    data: [
						<c:forEach items="${CARDinformList}" var="CARDinformList" varStatus="vs">
						<c:choose>
							<c:when test="${vs.count ne CARDinformListSize}">
								${sort5[vs.count-1][1]} ,
							</c:when>
							<c:otherwise>
								${sort5[vs.count-1][1]}
							</c:otherwise>
						</c:choose>
						</c:forEach>
					  ],
				stack:'secondary'
			},
			// #################### 원본값 자료 ####################    
            {
        	colorByPoint:'true',
            name: '${strc1[4]}',
            data: [
					<c:forEach items="${sort5}" var="sort5" varStatus="vs">
						<c:choose>
							<c:when test="${vs.count ne sort5Length}">
								{y:${sort5[0]},color:'#DDDCFE'},
							</c:when>
							<c:otherwise>
								{y:${sort5[0]}}
							</c:otherwise>
						</c:choose>
					</c:forEach>
				  ],
        	stack:'primary',
        	}
		], //여기가 시리즈 닫는 곳
		xAxis: {// 참고로 xAxis항목을 다른 곳으로 옮겨도 아주 잘 작동한다.
        	categories: [//문자열, 반드시 작은 따옴표로 안아라
	                       	   
        	             <c:forEach items="${CARDinformList}" var="CARDinformList" varStatus="vs">
	                      	<c:choose>
							<c:when test="${vs.count ne CARDinformListSize}">
								'${sortname[sort5[vs.count-1][2].intValue()][0]}',
							</c:when>
							<c:otherwise>
								'${sortname[sort5[vs.count-1][2].intValue()][0]}'
							</c:otherwise>
							</c:choose>
                      	</c:forEach>
	                    ]
        }
    });	// 컨테이너5 닫는 곳
    
  //############################################# 6번째 혜택 #############################################
    $('#container6').highcharts({
		chart: {
            type: 'column',
            margin: 120,
            options3d: {
                enabled: true,
                alpha: 15,
                beta: 15,
                viewDistance: 25,
                depth: 40
            },
			marginTop: 80,
            marginRight: 50,
            marginLeft: 50,
            colorByPoint: true
        },
        title: {
            text: '<b> ${strc1[5]} 혜택</b>'// 이거도 자동으로 들어가도록				
        },
        subtitle: {
            text: ' --- 텍스트 입력 ---'
        },
        
        tooltip: {
            headerFormat: '<b>{point.key}</b><br>',
            //pointFormat: '<span style="color:{series.color}">\u25CF</span> {series.name}: {point.y} / {point.stackTotal}'
            pointFormat: '<span style="color:{series.color}">\u25CF</span> {series.name}: {point.y}'
        },
        
        plotOptions: {
            column: {
            	stacking: 'normal',
            	depth: 25
            }
        }
        ,
        
        yAxis: {
            title: {
                text: null
            }
        },
        series: [
			//#################### 원본값/연회비 자료 ####################
                {
				colorByPoint:'true',
			    name: '연회비 1000원 당 혜택',
			    data: [
						<c:forEach items="${CARDinformList}" var="CARDinformList" varStatus="vs">
						<c:choose>
							<c:when test="${vs.count ne CARDinformListSize}">
								${sort6[vs.count-1][1]} ,
							</c:when>
							<c:otherwise>
								${sort6[vs.count-1][1]}
							</c:otherwise>
						</c:choose>
						</c:forEach>
					  ],
				stack:'secondary'
			},
			// #################### 원본값 자료 ####################    
            {
        	colorByPoint:'true',
            name: '${strc1[5]}',
            data: [
					<c:forEach items="${sort6}" var="sort6" varStatus="vs">
						<c:choose>
							<c:when test="${vs.count ne sort5Length}">
								{y:${sort6[0]},color:'#DDDCFE'},
							</c:when>
							<c:otherwise>
								{y:${sort6[0]}}
							</c:otherwise>
						</c:choose>
					</c:forEach>
				  ],
        	stack:'primary',
        	}
		], //여기가 시리즈 닫는 곳
		xAxis: {// 참고로 xAxis항목을 다른 곳으로 옮겨도 아주 잘 작동한다.
        	categories: [//문자열, 반드시 작은 따옴표로 안아라
	                       	   
        	             <c:forEach items="${CARDinformList}" var="CARDinformList" varStatus="vs">
	                      	<c:choose>
							<c:when test="${vs.count ne CARDinformListSize}">
								'${sortname[sort6[vs.count-1][2].intValue()][0]}',
							</c:when>
							<c:otherwise>
								'${sortname[sort6[vs.count-1][2].intValue()][0]}'
							</c:otherwise>
							</c:choose>
                      	</c:forEach>
	                    ]
        }
    });	// 컨테이너5 닫는 곳
});



</script>


<div class="main">
	<div class="main-inner">
	<div class="container">
      	<div class="row">
		    <div class="span12">    
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
				
				<c:if test="${strc1Length eq 6 }">
					선택한 혜택 : 
					<c:forEach items="${strc1 }" var="strc1" varStatus="vs">
						${vs.count }. ${strc1 }
					</c:forEach>
				</c:if>  		
			   <div class="widget widget-table action-table">
<!--             		/widget-header -->
          			<div class="widget-content">
           				<table class="table table-striped table-bordered">		
     							<tr align="center" style="font-size:12px;">
								<td><b>${ strc1[0]}&nbsp 1위</b></td>
								<td><b>${ strc1[1]}&nbsp 1위</b></td>
								<td><b>${ strc1[2]}&nbsp 1위</b></td>
								<td><b>${ strc1[3]}&nbsp 1위</b></td>
								<td><b>${ strc1[4]}&nbsp 1위</b></td>
								<td><b>${ strc1[5]}&nbsp 1위</b></td>
							</tr>
							<tr align="center" style="font-size:12px;">
								<td><font color='red'><b>${sortname[sort1[0][2]][0]}</b></font></td>
								<td><font color=orange><b>${sortname[sort2[0][2]][0]}</b></font></td>
								<td><font color=lightbrown><b>${sortname[sort3[0][2]][0]}</b></font></td>
								<td><font color=green><b>${sortname[sort4[0][2]][0]}</b></font></td>
								<td><font color=blue><b>${sortname[sort5[0][2]][0]}</b></font></td>
								<td><font color=purple><b>${sortname[sort6[0][2]][0]}</b></font></td>
							</tr>
							<tr>
								<c:forEach items="${CARDinformList }" var="CARDinformList" varStatus="vs">
									<c:if test="${newcard[vs.count-1][0] eq sortname[sort1[0][2]][0] }">
										<td><img src="${newcard[vs.count-1][1]}" style="width:120px"></td>
									</c:if>
								</c:forEach>
								<c:forEach items="${CARDinformList }" var="CARDinformList" varStatus="vs">
									<c:if test="${newcard[vs.count-1][0] eq sortname[sort2[0][2]][0] }">
										<td><img src="${newcard[vs.count-1][1]}" style="width:120px"></td>
									</c:if>
								</c:forEach>
								<c:forEach items="${CARDinformList }" var="CARDinformList" varStatus="vs">
									<c:if test="${newcard[vs.count-1][0] eq sortname[sort3[0][2]][0] }">
										<td><img src="${newcard[vs.count-1][1]}" style="width:120px"></td>
									</c:if>
								</c:forEach>
								<c:forEach items="${CARDinformList }" var="CARDinformList" varStatus="vs">
									<c:if test="${newcard[vs.count-1][0] eq sortname[sort4[0][2]][0] }">
										<td><img src="${newcard[vs.count-1][1]}" style="width:120px"></td>
									</c:if>
								</c:forEach>
								<c:forEach items="${CARDinformList }" var="CARDinformList" varStatus="vs">
									<c:if test="${newcard[vs.count-1][0] eq sortname[sort5[0][2]][0] }">
										<td><img src="${newcard[vs.count-1][1]}" style="width:120px"></td>
									</c:if>
								</c:forEach>
								<c:forEach items="${CARDinformList }" var="CARDinformList" varStatus="vs">
									<c:if test="${newcard[vs.count-1][0] eq sortname[sort6[0][2]][0] }">
										<td><img src="${newcard[vs.count-1][1]}" style="width:120px"></td>
									</c:if>
								</c:forEach>
							</tr>
   						</table>
      				</div>
      			</div>
      		</div>
      		<div class="span6">      		
	   			<div class="widget widget-table action-table">
            		<!-- /widget-header -->
		            <div class="widget-content">
        		    	<table class="table table-striped table-bordered">
						<!-- ########## 혜택 1 ########## -->
							<tr>
								<th width="150"> ${strc1[0]} 혜택 1위!! : <br>${sortname[sort1[0][2]][0] }</th>
								<th width="200">
									<c:forEach items="${CARDinformList }" var="CARDinformList" varStatus="vs">
										<c:if test="${newcard[vs.count-1][0] eq sortname[sort1[0][2]][0] }">
											<img src="${newcard[vs.count-1][1]}" style="width:190px">
										</c:if>
									</c:forEach>
								</th>
								<th width="380">
									<c:forEach items="${CARDinformList }" var="CARDinformList" varStatus="vs">
										<c:if test="${newcard[vs.count-1][0] eq sortname[sort1[0][2]][0] }">
											<fmt:parseNumber var="anfee" integerOnly="true" value="${newcard[vs.count-1][2] }"/>
											<fmt:parseNumber var="earning" integerOnly="true" value="${newcard[vs.count-1][3] }"/>
											<fmt:parseNumber var="traben" integerOnly="true" value="${newcard[vs.count-1][4] }"/>
											연회비 : ${anfee } <br>
											기준실적 : ${earning }<br>
											${strc1[0]} 혜택 : ${traben}<br>
											연회비 1000원당 혜택 : ${1000*newcard[vs.count-1][4]/newcard[vs.count-1][2] }
										</c:if>
									</c:forEach>
						 		</th>
							</tr>
							<tr>
								<td colspan="3">
									<div id="container1" style="height:400px"></div>
								</td>
							</tr>	
							<!-- ########## 혜택 2 ########## -->
							<tr>
								<th width="150"> ${strc1[1]} 혜택 1위!! : <br>${sortname[sort2[0][2]][0] }</th>
								<th width="200">
									<c:forEach items="${CARDinformList }" var="CARDinformList" varStatus="vs">
										<c:if test="${newcard[vs.count-1][0] eq sortname[sort2[0][2]][0] }">
											<img src="${newcard[vs.count-1][1]}" style="width:190px">
										</c:if>
									</c:forEach>
								</th>
								<th width="380">
									<c:forEach items="${CARDinformList }" var="CARDinformList" varStatus="vs">
										<c:if test="${newcard[vs.count-1][0] eq sortname[sort2[0][2]][0] }">
											<fmt:parseNumber var="anfee" integerOnly="true" value="${newcard[vs.count-1][2] }"/>
											<fmt:parseNumber var="earning" integerOnly="true" value="${newcard[vs.count-1][3] }"/>
											<fmt:parseNumber var="traben" integerOnly="true" value="${newcard[vs.count-1][5] }"/>
											연회비 : ${anfee } <br>
											기준실적 : ${earning }<br>
											${strc1[1]} 혜택 : ${traben}<br>
											연회비 1000원당 혜택 : ${1000*newcard[vs.count-1][5]/newcard[vs.count-1][2] }
										</c:if>
									</c:forEach>
						 		</th>
							</tr>
							<tr>
								<td colspan="3">
									<div id="container2" style="height:400px"></div>
								</td>
							</tr>	
							<!-- ########## 혜택 3 ########## -->
							<tr>
								<th width="150"> ${strc1[2]} 혜택 1위!! : <br>${sortname[sort3[0][2]][0] }</th>
								<th width="200">
									<c:forEach items="${CARDinformList }" var="CARDinformList" varStatus="vs">
										<c:if test="${newcard[vs.count-1][0] eq sortname[sort3[0][2]][0] }">
											<img src="${newcard[vs.count-1][1]}" style="width:190px">
										</c:if>
									</c:forEach>
								</th>
								<th width="380">
									<c:forEach items="${CARDinformList }" var="CARDinformList" varStatus="vs">
										<c:if test="${newcard[vs.count-1][0] eq sortname[sort3[0][2]][0] }">
											<fmt:parseNumber var="anfee" integerOnly="true" value="${newcard[vs.count-1][2] }"/>
											<fmt:parseNumber var="earning" integerOnly="true" value="${newcard[vs.count-1][3] }"/>
											<fmt:parseNumber var="traben" integerOnly="true" value="${newcard[vs.count-1][6] }"/>
											연회비 : ${anfee } <br>
											기준실적 : ${earning }<br>
											${strc1[2]} 혜택 : ${traben}<br>
											연회비 1000원당 혜택 : ${1000*newcard[vs.count-1][6]/newcard[vs.count-1][2] }
										</c:if>
									</c:forEach>
						 		</th>
							</tr>
							<tr>
								<td colspan="3">
									<div id="container3" style="height:400px"></div>
								</td>
							</tr>					
						</table>
					</div>
				</div>
			</div>
			<div class="span6">      		
	           	<div class="widget widget-table action-table">
		            <!-- /widget-header -->
		            <div class="widget-content">
              			<table class="table table-striped table-bordered">
              				<!-- ########## 혜택 4 ########## -->
							<tr>
								<th width="150"> ${strc1[3]} 혜택 1위!! : <br>${sortname[sort4[0][2]][0] }</th>
								<th width="200">
									<c:forEach items="${CARDinformList }" var="CARDinformList" varStatus="vs">
										<c:if test="${newcard[vs.count-1][0] eq sortname[sort4[0][2]][0] }">
											<img src="${newcard[vs.count-1][1]}" style="width:190px">
										</c:if>
									</c:forEach>
								</th>
								<th width="380">
									<c:forEach items="${CARDinformList }" var="CARDinformList" varStatus="vs">
										<c:if test="${newcard[vs.count-1][0] eq sortname[sort4[0][2]][0] }">
											<fmt:parseNumber var="anfee" integerOnly="true" value="${newcard[vs.count-1][2] }"/>
											<fmt:parseNumber var="earning" integerOnly="true" value="${newcard[vs.count-1][3] }"/>
											<fmt:parseNumber var="traben" integerOnly="true" value="${newcard[vs.count-1][7] }"/>
											연회비 : ${anfee } <br>
											기준실적 : ${earning }<br>
											${strc1[3]} 혜택 : ${traben}<br>
											연회비 1000원당 혜택 : ${1000*newcard[vs.count-1][7]/newcard[vs.count-1][2] }
										</c:if>
									</c:forEach>
						 		</th>
							</tr>
							<tr>
								<td colspan="3">
									<div id="container4" style="height:400px"></div>
								</td>
							</tr>
							<!-- ########## 혜택 5 ########## -->
							<tr>
								<th width="150"> ${strc1[4]} 혜택 1위!! : <br>${sortname[sort5[0][2]][0] }</th>
								<th width="200">
									<c:forEach items="${CARDinformList }" var="CARDinformList" varStatus="vs">
										<c:if test="${newcard[vs.count-1][0] eq sortname[sort5[0][2]][0] }">
											<img src="${newcard[vs.count-1][1]}" style="width:190px">
										</c:if>
									</c:forEach>
								</th>
								<th width="380">
									<c:forEach items="${CARDinformList }" var="CARDinformList" varStatus="vs">
										<c:if test="${newcard[vs.count-1][0] eq sortname[sort5[0][2]][0] }">
											<fmt:parseNumber var="anfee" integerOnly="true" value="${newcard[vs.count-1][2] }"/>
											<fmt:parseNumber var="earning" integerOnly="true" value="${newcard[vs.count-1][3] }"/>
											<fmt:parseNumber var="traben" integerOnly="true" value="${newcard[vs.count-1][8] }"/>
											연회비 : ${anfee } <br>
											기준실적 : ${earning }<br>
											${strc1[4]} 혜택 : ${traben}<br>
											연회비 1000원당 혜택 : ${1000*newcard[vs.count-1][8]/newcard[vs.count-1][2] }
										</c:if>
									</c:forEach>
						 		</th>
							</tr>
							<tr>
								<td colspan="3">
									<div id="container5" style="height:400px"></div>
								</td>
							</tr>	
							<!-- ########## 혜택 6 ########## -->
							<tr>
								<th width="150"> ${strc1[5]} 혜택 1위!! : <br>${sortname[sort6[0][2]][0] }</th>
								<th width="200">
									<c:forEach items="${CARDinformList }" var="CARDinformList" varStatus="vs">
										<c:if test="${newcard[vs.count-1][0] eq sortname[sort6[0][2]][0] }">
											<img src="${newcard[vs.count-1][1]}" style="width:190px">
										</c:if>
									</c:forEach>
								</th>
								<th width="380">
									<c:forEach items="${CARDinformList }" var="CARDinformList" varStatus="vs">
										<c:if test="${newcard[vs.count-1][0] eq sortname[sort6[0][2]][0] }">
											<fmt:parseNumber var="anfee" integerOnly="true" value="${newcard[vs.count-1][2] }"/>
											<fmt:parseNumber var="earning" integerOnly="true" value="${newcard[vs.count-1][3] }"/>
											<fmt:parseNumber var="traben" integerOnly="true" value="${newcard[vs.count-1][9] }"/>
											연회비 : ${anfee } <br>
											기준실적 : ${earning }<br>
											${strc1[5]} 혜택 : ${traben}<br>
											연회비 1000원당 혜택 : ${1000*newcard[vs.count-1][9]/newcard[vs.count-1][2] }
										</c:if>
									</c:forEach>
						 		</th>
							</tr>
							<tr>
								<td colspan="3">
									<div id="container6" style="height:400px"></div>
								</td>
							</tr>
              			</table>
            		</div>
           		</div>
        	</div>			
		</div>
	</div>	
	</div>
</div>		
									
			
    <script src="https://code.highcharts.com/highcharts.js"></script>
	<script src="https://code.highcharts.com/highcharts-3d.js"></script>
	<script src="https://code.highcharts.com/modules/exporting.js"></script>
	
	
</body>
</html>