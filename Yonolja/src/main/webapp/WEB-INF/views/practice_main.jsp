<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test용 main </title>
</head>
<style>
</style>

<body>
<h1>test용 main</h1>

로그인이 되어있으면, '환영합니다! xxx님' 이라고 뜨고, 안되어있으면 '안녕하세요 방문자님' 이라고 뜸. <br>
결과문구 : 
<% if(session.getAttribute("name").equals("")||session.getAttribute("name")==null){ %>
	<label> 안녕하세요 방문자님 </label>
<% } else { %>
	<label> 환영합니다 <%=session.getAttribute("name")%>님</label>
<% } %>	


</body>

<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script>

</script>
</html>





