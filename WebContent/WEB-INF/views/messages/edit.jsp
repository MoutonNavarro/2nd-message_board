<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../layout/app.jsp">
	<c:param name="content">
		<H2>ID: ${message.id}'s message edit page</H2>

		<form method="POST" action="${pageContext.request.contextPath}/update">
			<c:import url="_form.jsp" />
		</form>

		<p><a href="${pageContext.request.contextPath}/index">Back to the list</a></p>
		<p><a href="#" onclick="confirmDestroy();">Remove this message</a></p>
		<form method="POST" action="${pageContext.request.contextPath}/destroy">
			<input type="hidden" name="_token" value="${_token}" />
		</form>
		<script>
		function confirmDestroy(){
			if(confirm("Do you really want to remove this?")){
				document.forms[1].submit();
			}
		}
		</script>

	</c:param>
</c:import>