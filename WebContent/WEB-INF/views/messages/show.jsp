<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="../layout/app.jsp">
	<c:param name="content">
		<c:choose>
			<c:when test="${message != null}">
				<H2>ID: ${message.id}'s message detail page</H2>

				<table>
					<tbody>
						<tr>
							<th>Title</th>
							<td><c:out value="${message.title}" /></td>
						</tr>
						<tr>
							<th>Message</th>
							<td><c:out value="${message.content}" /></td>
						</tr>
						<tr>
							<th>Date Created</th>
							<td><fmt:formatDate value="${message.created_at}" pattern="MM/dd/yyyy HH:mm:ss" /></td>
						</tr>
						<tr>
							<th>Date Updated</th>
							<td><fmt:formatDate value="${message.updated_at}" pattern="MM/dd/yyyy HH:mm:ss" /></td>
						</tr>
					</tbody>
				</table>
				<p><a href="${pageContext.request.contextPath}/index">Back to the list</a></p>
				<p><a href="${pageContext.request.contextPath}/edit?id=${message.id}">Edit this message</a></p>
			</c:when>
			<c:otherwise>
				<H2>The page was not found.</H2>
			</c:otherwise>
		</c:choose>
	</c:param>
</c:import>
