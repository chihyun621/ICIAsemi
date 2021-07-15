<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
	
	<meta charset="UTF-8">
	<title>전자결재 시스템</title>
	<link rel="stylesheet" href="/style.css"/>
	<link rel="shortcut icon" href="favicon.ico">
	<link rel="icon" href="favicon.ico">
</head>
<body>
	<div id="divPage">
		<div id="divTop">
			<h1>전자결재 시스템</h1>
			<a href="/home"><img src="/back.png" width=980 height=250/></a>
		</div>
		<div id="divCenter">
			<div id="divMenu"><jsp:include page="/menu.jsp"/></div>
			<div id="divContent">
				<jsp:include page="${pageName}"></jsp:include>
			</div>
		</div>
		<div id="divBottom">
			<h4>Copyright © Jerry Oh All Rights Reserved.</h4>
		</div>
	</div>
</body>	
</html>