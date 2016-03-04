<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<fmt:requestEncoding value="utf-8"/>
<!DOCTYPE html>
<html lang="ko">
<head>

</head>
<tiles:insertAttribute name="top_menu"/>
	<body>
		<div class="navbar">
			<tiles:insertAttribute name="nav_menu"/>
		</div>
	<div class="main">
			<tiles:insertAttribute name="content"/>
	</div>
</body>
	<tiles:insertAttribute name="bottom_menu"/>
</html>
