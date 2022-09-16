<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<title>Message board</title>
		<link rel="stylesheet" href="<c:url value='/css/reset.css' />">
		<link rel="stylesheet" href="<c:url value='/css/style.css' />">
	</head>
	<body>
		<div id="wrapper">
			<div id="header">
				<H1>Message borad application</H1>
			</div>
			<div id="content">
				${param.content}
			</div>
			<div id="footer">
				by Mouton Navarro.
			</div>
		</div>
	</body>
</html>