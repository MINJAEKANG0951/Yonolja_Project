<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>사업장 정보 입력</title>
</head>
<body>
    <h2>사업장 정보 입력</h2>
    <form action="your_spring_controller_path" method="POST" enctype="multipart/form-data">
        <label for="pname">사업장 이름:</label><br>
        <input type="text" id="pname" name="pname"><br>
        
        <label for="ptype">사업장 유형:</label>
		<select id="ptype" name="ptype">
    	<c:forEach items="${ptypes}" var="ptype">
        <option value="${ptype}">${ptype}</option>
    	</c:forEach>
		</select><br>
        
        <label for="paddress">사업장 위치:</label><br>
        <input type="text" id="paddress" name="paddress"><br>
        
        <label for="pmobile">사업자 전화번호:</label><br>
        <input type="text" id="pmobile" name="pmobile"><br>
        
        <label for="checkin">체크인 시간:</label><br>
        <input type="time" id="checkin" name="checkin"><br>
        
        <label for="checkout">체크아웃 시간:</label><br>
        <input type="time" id="checkout" name="checkout"><br>
        
        <label for="guide">안내문:</label><br>
        <textarea id="guide" name="guide"></textarea><br>
        
        <label for="pfeature">사업장옵션:</label>
		<select id="pfeature" name="pfeature">
    	<c:forEach items="${pfeatures}" var="pfeature">
        <option value="${pfeature.place_option_seq}">${pfeature}</option>
    	</c:forEach>
		</select><br>
        
        <label for="pimage">사업장 사진:</label><br>
        <input type="file" id="pimage" name="pimage"><br>
        
        <input type="submit" value="Submit">
    </form>
</body>
</html>
