<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:import url="../layout/app.jsp">
	<c:param name="content">
		<c:if test="${flush != null}">
			<div id="flush_success">
				<c:out value="${flush}" />
			</div>
		</c:if>
		<H2>Message list</H2>
		<ul>
			<c:forEach var="message" items="${messages}">
				<li>
					<a href="${pageContext.request.contextPath}/show?id=${message.id}">
						<c:out value="${message.id}" />
					</a>
					: <c:out value="${message.title}"></c:out> &gt; <c:out value="${message.content}" />
				</li>
			</c:forEach>
		</ul>
		<div id="pagination">
			(All: ${messages_count})<br>
			<c:forEach var="i" begin="1" end="${((messages_count - 1) / 16) + 1}" step="1">
				<c:choose>
					<c:when  test="${i == page}">
						<c:out value="${i}" />&nbsp;
					</c:when>
					<c:otherwise>
						<a href="${pageContext.request.contextPath}/index?page=${i}"><c:out value="${i}" /></a>&nbsp;
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</div>

		<p><a href="${pageContext.request.contextPath}/new">Post new message</a></p>
	</c:param>
</c:import>