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
<%@ include file ="../structure/header.jsp" %>
<style>

.modal {
  display: none;
  position: fixed;
  z-index: 1;
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  overflow: auto;
  background-color: rgba(0, 0, 0, 0.4);
  animation: modalFadeIn 0.3s ease-in-out;
}

@keyframes modalFadeIn {
  from {
    opacity: 0;
    transform: scale(0.8);
  }
  to {
    opacity: 1;
    transform: scale(1);
  }
}

.modal-content {
  background-color: #fefefe;
  margin: 10% auto;
  padding: 20px;
  border: 1px solid #888;
  width: 60%;
  max-width: 800px; /* Adjust the maximum width as needed */
  max-height: 80%; /* Adjust the maximum height as needed */
  overflow-y: auto;
  border-radius: 5px;
  animation: modalBlowUp 0.3s cubic-bezier(0.25, 0.46, 0.45, 0.94) both;
}

@keyframes modalBlowUp {
  from {
    opacity: 0;
    transform: scale(0.5);
  }
  to {
    opacity: 1;
    transform: scale(1);
  }
}

.close {
  color: #aaa;
  float: right;
  font-size: 28px;
  font-weight: bold;
  cursor: pointer;
}

.close:hover,
.close:focus {
  color: black;
  text-decoration: none;
  cursor: pointer;
}


</style>
<body>
<button id="filter">Filter</button>

<div id="filterModal" class="modal">
  <div class="modal-content">
    <span class="close">&times;</span>
    <h2>Modal Title</h2>
    <p>This is the content of the modal window.</p>
  </div>
</div>

<hr>

</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script type="text/javascript" src="/js/calendarMaker.js"></script>
<script>

calendar = calendarMaker();
$('body').append( calendar.getTag() );
$('body').append( calendar.getCss() );
calendar.fillCalendar();


$('#ip').change(function(){
	alert('')
})
$(document)
.on('input','#ip',function(){
	alert('e')
})
////////////////

// Get the modal element
var modal = document.getElementById("filterModal");

// Get the button that opens the modal
var btn = document.getElementById("filter");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

// When the user clicks the button, open the modal
btn.onclick = function() {
  modal.style.display = "block";
};

// When the user clicks on <span> (x), close the modal
span.onclick = function() {
  modal.style.display = "none";
};

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
  if (event.target == modal) {
    modal.style.display = "none";
  }
};


</script>
</html>
