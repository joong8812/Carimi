<%@page import="javafx.scene.control.DatePicker"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Calendar"%>
<%@ page import="sigma.carimi.model.memberDTO"%>
<%@ page import="sigma.carimi.model.memberDTO"%>
<%@ page import="sigma.carimi.service.memberDAO"%>
<%@ page import="sigma.carimi.service.memberService"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<fmt:requestEncoding value="UTF-8" />
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.9.1/themes/base/jquery-ui.css" />

<script src="http://code.jquery.com/ui/1.9.1/jquery-ui.js"></script>

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css" />
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script type="text/javascript">

var agecnt = 0;
var cardcnt = 0;

var jsTop3 = new Array();
jsTop3[0] = new Array();
jsTop3[1] = new Array();
jsTop3[2] = new Array();
jsTop3[3] = new Array();
jsTop3[4] = new Array();

jsTop3[0][0] =	'${k_cardname[top3[0][0]]}';
jsTop3[1][0] =	'${k_cardname[top3[1][0]]}';
jsTop3[2][0] =	'${k_cardname[top3[2][0]]}';
jsTop3[3][0] =	'${k_cardname[top3[3][0]]}';
jsTop3[4][0] =	'${k_cardname[top3[4][0]]}';
jsTop3[0][1] =	'${k_cardname[top3[0][1]]}';
jsTop3[1][1] =	'${k_cardname[top3[1][1]]}';
jsTop3[2][1] =	'${k_cardname[top3[2][1]]}';
jsTop3[3][1] =	'${k_cardname[top3[3][1]]}';
jsTop3[4][1] =	'${k_cardname[top3[4][1]]}';
jsTop3[0][2] =	'${k_cardname[top3[0][2]]}';
jsTop3[1][2] =	'${k_cardname[top3[1][2]]}';
jsTop3[2][2] =	'${k_cardname[top3[2][2]]}';
jsTop3[3][2] =	'${k_cardname[top3[3][2]]}';
jsTop3[4][2] =	'${k_cardname[top3[4][2]]}';

var customFormatPointName = function() {
	
	if(agecnt > 4){
		agecnt = 0;
		cardcnt++;
	}
    return jsTop3[agecnt++][cardcnt];
};


$(function () { 
    $('#ageXcard').highcharts({
        chart: {
            type: 'column'
        },
        title: {
            text: '나이대 별 보유카드'
        },
        subtitle: {
            text: ''
        },
        xAxis: {
            categories: [
                '20대',
                '30대',
                '40대',
                '50대',
                '60대'
            ],
            crosshair: true
        },
        yAxis: {
            min: 0,
            title: {
                text: ''
            }
        },
        tooltip: {
            headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
            pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
                '<td style="padding:0"><b>{point.y} 명</b></td></tr>',
            footerFormat: '</table>',
            shared: true,
            useHTML: true
        },
        plotOptions: {
            column: {
                pointPadding: 0.2,
                borderWidth: 0
            }
        },
        series: [{
            name: '1위', 
            data: [	'${sort_ageXcard[0][0]}'*1,
                   	'${sort_ageXcard[1][0]}'*1,
                   	'${sort_ageXcard[2][0]}'*1,
                   	'${sort_ageXcard[3][0]}'*1,
                   	'${sort_ageXcard[4][0]}'*1
                   ],
            dataLabels: {
	           enabled: true,
	           rotation: 0,
	           color: '#9F2a4d',
	           align: 'center',
	           formatter:function(){
	        	 return customFormatPointName();  
	           },
	           y: -10, // 10 pixels down from the top
	           style: {
	               fontSize: '9px',
	               fontFamily: 'Verdana, sans-serif'
          		 }
       		},
       		color:'#32B92D'
        }, {
            name: '2위',
            data: [
					'${sort_ageXcard[0][1]}'*1,
					'${sort_ageXcard[1][1]}'*1,
					'${sort_ageXcard[2][1]}'*1,
					'${sort_ageXcard[3][1]}'*1,
					'${sort_ageXcard[4][1]}'*1
                   ],
                   dataLabels: {
        	           enabled: true,
        	           rotation: 0,
        	           color: '#9F2a4d',
        	           align: 'center',
        	           formatter:function(){
        	        	 return customFormatPointName();  
        	           },
        	           y: 5, // 10 pixels down from the top
        	           style: {
        	               fontSize: '9px',
        	               fontFamily: 'Verdana, sans-serif'
                  		}
                   },
                   color:'#FF6EB0'
        }, {
            name: '3위',
            data: [
					'${sort_ageXcard[0][2]}'*1,
					'${sort_ageXcard[1][2]}'*1,
					'${sort_ageXcard[2][2]}'*1,
					'${sort_ageXcard[3][2]}'*1,
					'${sort_ageXcard[4][2]}'*1
                   ],
                   dataLabels: {
        	           enabled: true,
        	           rotation: 0,
        	           color: '#9F2a4d',
        	           align: 'center',
        	           formatter:function(){
        	        	 return customFormatPointName();  
        	           },
        	           y: 20, // 10 pixels down from the top
        	           style: {
        	               fontSize: '9px',
        	               fontFamily: 'Verdana, sans-serif'
                 	  }
                   },
                   color:'#FFCB00'
        }]
    });
});

$(function () {
    $('#container').highcharts({
        chart: {
            type: 'column'
        },
        title: {
            text: '나이대별 회원수'
        },
        subtitle: {
            text: '출처: www.carimi.com'
        },
        xAxis: {
            categories: [
                '20대',
                '30대',
                '40대',
                '50대',
                '60대'

            ],
            crosshair: true
        },
        yAxis: {
            min: 0,
            title: {
                text: '인원 (명)'
            }
        },
        tooltip: {
            headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
            pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name} :</td>' +
                '<td style="padding:2"><b> ${ctmXage[5]} 명 중 {point.y} 명</b></td></tr>',
            footerFormat: '</table>',
            shared: true,
            useHTML: true
        },
        plotOptions: {
            column: {
                pointPadding: 0.2,
                borderWidth: 0
            }
        },
        series: [{
            name: '연령',
            data: ['${ctmXage[0]}'*1, 
                   '${ctmXage[1]}'*1,
                   '${ctmXage[2]}'*1,
                   '${ctmXage[3]}'*1,
                   '${ctmXage[4]}'*1,
                   ]
        }]
    });
});

</script>


<script>
$(function () {

    $('#bnfXcard').highcharts({

        chart: {
            type: 'heatmap',
            marginTop: 40,
            marginBottom: 80,
            plotBorderWidth: 1
        },


        title: {
            text: '카드별 혜택 선호도'
        },

        xAxis: {
            categories: ["신한love", "신한tasty", "국민goodday", "국민ddam", "우리damoa",
     					"우리gadeuk", "하나pop", "하나2xa", "롯데dcsu", "롯데dcsm", "삼성sclass",
    					"삼성2v2", "농협smarty", "농협take5", "기업ibkhi", "기업cham", "씨티mul",
    					"씨티cle"]
        },

        yAxis: {
            categories: ['주유', '쇼핑', '마트', '편의점', '외식', '까페',
                         '영화', '교통', '통신', '교육', '문화', '레저',
                         '의료', '미용', '캐시백'],
            title: null
        },

        colorAxis: {
            min: 0,
            minColor: '#FFFF80',
//             maxColor: Highcharts.getOptions().colors[9]
        	maxColor: '#00ff00'
        },

        legend: {
            align: 'right',
            layout: 'vertical',
            margin: 0,
            verticalAlign: 'top',
            y: 25,
            symbolHeight: 370
        },

        tooltip: {
            formatter: function () {
                return '<b>' + this.series.xAxis.categories[this.point.x] + '</b> 고객 중 <br><b>' +
                    this.point.value + '</b> 명 이 <b>' + this.series.yAxis.categories[this.point.y] + '</b><br>'
                    + '혜택을 선호 합니다';
            }
        },

        series: [{
            name: 'Sales per employee',
            borderWidth: 1,
            data: [
                   <c:forEach begin="1" end="18" step="1" var="i">
                   	<c:forEach begin="1" end="15" step="1" var="j">
                   		[${i-1}, ${j-1}, ${benefitXcard[i-1][j-1]}],
                   	</c:forEach>
                   </c:forEach>                   
                  ],
            dataLabels: {
                enabled: true,
                color: '#000000'
            }
        }]

    });
});		
</script>		
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/heatmap.js"></script>

<div id="container" style=" width: 50%;  height: 500px; margin-left:10px" ></div>
<br><br><br><br>
<div id="ageXcard" style=" width: 90%;  height: 500px; margin:auto" ></div>
<br><br><br><br>
<div id="bnfXcard" style="height:500px;width:90%;margin:auto"></div>
<br><br><br><br>

