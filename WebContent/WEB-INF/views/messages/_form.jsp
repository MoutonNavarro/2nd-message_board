<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${errors != null}">
	<div id="flush_error">
		Errors in input content.<br>
		<ul>
			<c:forEach var="error" items="${errors}">
				<li>*<c:out value="${error}" /></li>
			</c:forEach>
		</ul>
	</div>
</c:if>
<label for="title">Title</label><br>
<input type="text" name="title" id="title" value="${message.title}" />
<br><br>

<label for="content_msg">Message</label><br>
<input type="text" name="content" id="content_msg" value="${message.content}" />
<br><br>

<input type="hidden" name="_token" value="${_token}"/>
<button type="submit">Post</button>
