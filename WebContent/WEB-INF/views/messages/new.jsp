<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../layout/app.jsp">
	<c:param name="content">
		<H2>Create new message page</H2>

		<form method="POST" action="${pageContext.request.contextPath}/create">
			<c:import url="_form.jsp"/>
		</form>

		<p><a href="${pageContext.request.contextPath}/index">Back to the list</a></p>
	</c:param>
</c:import>
