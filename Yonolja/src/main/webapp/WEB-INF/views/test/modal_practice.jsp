<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>modalTest</title>
</head>
<style>
.modal {
  display: none;
  position: fixed;
  z-index: 1;
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  background-color: rgba(0, 0, 0, 0.4);
  opacity: 0;
  transition: opacity 0.3s ease;
}

.modal.show {
  display: block;
  opacity: 1;
}

.modal-content {
  background-color: #fefefe;
  margin: 15% auto;
  padding: 20px;
  border: 1px solid #888;
  width: 80%;
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
}

</style>
<body>

<button id="makeModal">Open Modal</button>

<div id="myModal" class="modal">	<!-- width:100% , height:100% 해서 전체화면 채우고, 투명하게하는거임 -->
  <div class="modal-content">
    <span class="close">&times;</span>
    <h2>Modal Title</h2>
    <p>This is the modal content.</p>
  </div>
</div>

</body>
<script>

document.getElementById('makeModal').addEventListener('click', function() {
	  document.getElementById('myModal').classList.add('show');
	});

document.addEventListener('click', function(event) {
  if (event.target.classList.contains('close') || event.target.id === 'myModal') {
    document.getElementById('myModal').classList.remove('show');
  }
});


</script>
</html>