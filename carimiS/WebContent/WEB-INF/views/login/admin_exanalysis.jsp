<%@page import="javafx.scene.control.DatePicker"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
            text: '카드별 혜택 소비 지도(단위 : 백만원)'
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
            minColor: '#ffffff',
//             maxColor: Highcharts.getOptions().colors[9]
        	maxColor: '#747474'
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
                return '<b>' + this.series.xAxis.categories[this.point.x] + '</b> 고객들이 <br><b>' +
                this.series.yAxis.categories[this.point.y] + '</b> 카테고리에<br><b>' + this.point.value + ',000,000</b>원을<br>지출했습니다<br>';
            }
        },

        series: [{
            name: 'Sales per employee',
            borderWidth: 1,
            data: [
					<c:forEach begin="1" end="18" step="1" var="i">
						<c:forEach begin="1" end="14" step="1" var="j">
							[${i-1}, ${j-1}, <fmt:formatNumber value="${sum_bnfXcard[i-1][j-1]}" pattern="0"/> ],
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

$(function () {
    $('#exXbnf').highcharts({
        chart: {
            type: 'column'
        },
        title: {
            text: '혜택 별 소비 합계'
        },
        subtitle: {
            text: '출처: www.carimi.com'
        },
        xAxis: {
            categories: [
				'주유', '쇼핑', '마트', '편의점', '외식', '까페',
				'영화', '교통', '통신', '교육', '문화', '레저',
				'의료', '미용', '캐시백'
            ],
            crosshair: true
        },
        yAxis: {
            min: 0,
            title: {
                text: ' (원)'
            }
        },
        tooltip: {
            headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
            pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name} :</td>' +
                '<td style="padding:2"><b>{point.y} 원</b></td></tr>',
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
            name: '혜택',
            data: [
                   <c:forEach items="${sum_exXbnf}" var="arr">
                   	${arr},
                   </c:forEach>
                   ]
        }]
    });
});

$(function () {
    $('#container').highcharts({
        title: {
            text: '월 별 카드 별 소비 통계',
            x: -20 //center
        },
        subtitle: {
            text: '출처: www.carimi.com',
            x: -20
        },
        xAxis: {
            categories: ['1월', '2월', '3월', '4월', '5월', '6월',
                '7월', '8월', '9월', '10월', '11월', '12월']
        },
        yAxis: {
            title: {
                text: '원 (won)'
            },
            plotLines: [{
                value: 0,
                width: 1,
                color: '#808080'
            }]
        },
        tooltip: {
            valueSuffix: '원'
        },
        legend: {
            layout: 'vertical',
            align: 'right',
            verticalAlign: 'middle',
            borderWidth: 0
        },

        series: [
		            <c:forEach items="${k_cardname}" var="kcard" varStatus="vs">
			            {
			                name: '${kcard}',
			                data: [
									'${sum_exXmonth[vs.count-1][0]}'*1,
									'${sum_exXmonth[vs.count-1][1]}'*1,
									'${sum_exXmonth[vs.count-1][2]}'*1,
									'${sum_exXmonth[vs.count-1][3]}'*1,
									'${sum_exXmonth[vs.count-1][4]}'*1,
									'${sum_exXmonth[vs.count-1][5]}'*1,
									'${sum_exXmonth[vs.count-1][6]}'*1,
									'${sum_exXmonth[vs.count-1][7]}'*1,
									'${sum_exXmonth[vs.count-1][8]}'*1,
									'${sum_exXmonth[vs.count-1][9]}'*1,
									'${sum_exXmonth[vs.count-1][10]}'*1,
									'${sum_exXmonth[vs.count-1][11]}'*1
			            		]
			            },
		            </c:forEach>
    			]
    });
});
</script>

<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/heatmap.js"></script>

<br>
<div id="bnfXcard" style="height:500px;width:90%;margin:auto"></div>
<br><br><br><br>
<div id="exXbnf" style="height:500px;width:90%;margin:auto"></div>
<br><br><br><br>
<table>
<col width=52%>
	<tr>
	<td class="pull-left"><a
		href='/CarimiS/admin_exanalysis.do?year=${syear-1}'><img
			src="/CarimiS/image/left.png" /></a>${syear}<a
		href='/CarimiS/admin_exanalysis.do?year=${syear+1}'><img
			src="/CarimiS/image/right.png" /></a></td>
	</tr>
</table>
<div id="container" style="height:500px;width:90%;margin:auto"></div>
<br><br><br><br>

