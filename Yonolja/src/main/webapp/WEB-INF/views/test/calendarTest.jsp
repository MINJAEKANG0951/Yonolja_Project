<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="true"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
<title>calendarTest</title>
</head>
<style>

#calendarBox{
	position:relative;
	border:1px solid black;
	width:800px;
	height:800px;
}


</style>
<body>

<div id=calendarBox>



</div>




</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script type="text/javascript" src="/js/calendarMaker.js"></script>
<script>

$(document)
.ready(function(){
	
	calendar = calendarMaker()
	
	$('#calendarBox').append( calendar.getTag() );
	$('body').append(calendar.getCss());
	calendar.fillCalendar();
	
})


</script>
</html>
