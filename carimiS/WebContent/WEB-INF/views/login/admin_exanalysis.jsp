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
            text: '카드별 혜택 소비 지도'
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
                return '<b>' + this.series.xAxis.categories[this.point.x] + '</b> 고객 중 <br><b>' +
                    this.point.value + '</b> 명 이 <b>' + this.series.yAxis.categories[this.point.y] + '</b><br>'
                    + '혜택을 소비 합니다';
            }
        },

        series: [{
            name: 'Sales per employee',
            borderWidth: 1,
            data: [
					<c:forEach begin="1" end="18" step="1" var="i">
						<c:forEach begin="1" end="14" step="1" var="j">
							[${i-1}, ${j-1}, ${sum_bnfXcard[i-1][j-1]}],
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

<br>
<div id="bnfXcard" style="height:500px;width:90%;margin:auto"></div>