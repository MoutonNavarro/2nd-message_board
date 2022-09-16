<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="../layout/app.jsp">
	<c:param name="content">
		<H2>ID: ${message.id}'s message detail page</H2>

		<p>Title: <c:out value="${message.title}" /></p>
		<p>Message: <c:out value="${message.content}" /></p>
		<p>Date Created: <fmt:formatDate value="${message.created_at}" pattern="MM-dd-yyyy HH:mm:ss" /></p>
		<p>Date Updated: <fmt:formatDate value="${message.updated_at}" pattern="MM-dd-yyyy HH:mm:ss" /></p>

		<p><a href="${pageContext.request.contextPath}/index">Back to the list</a></p>
		<p><a href="${pageContext.request.contextPath}/edit?id=${message.id}">Edit this message</a></p>
	</c:param>
</c:import>
