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
<title>admin</title>

<script type="text/javascript">
$(function () {
    $('#container').highcharts({
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
                '<td style="padding:0"><b>{point.y:.1f} mm</b></td></tr>',
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
            data: [20,30,40,50,60]

        }, {
            name: '2위',
            data: [20,30,40,50,60]

        }, {
            name: '3위',
            data: [20,30,40,50,60]

        }]
    });
});
		</script>
		
		
							<script src="https://code.highcharts.com/highcharts.js"></script>
							<script src="https://code.highcharts.com/modules/exporting.js"></script>

							<div id="container"
								style="min-width: 480px; width: 100%; max-width: 100%; height: 500px;"></div>

						</div>