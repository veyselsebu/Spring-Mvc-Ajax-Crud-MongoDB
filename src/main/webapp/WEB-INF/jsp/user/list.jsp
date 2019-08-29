<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
     <%@ taglib prefix="s" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>

<head>
<meta charset="ISO-8859-1">
<title>list</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="../resources/js/mask.js"></script>
<script src="../resources/js/user.js"></script>
</head>

<body onload="getUserList()">


<button onclick="clearForm()" type="button" class="btn btn-primary" data-toggle="modal"data-target="#formModal">
 Add User
</button>


<h1>List User</h1>

<table id="listTable" class="table">
<thead>
<tr>
<th>Name</th>
<th>Surname</th>
<th>Phone Number</th>
<th>Captcha Code</th>
<th colspan=2> Action </th>
</tr>
</thead>
</table>
<!-- Modal -->
<div class="modal fade" id="formModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      <label>Name : </label>
       <input class="form-control form-control-lg" type="text" id="name">
       <label>Surname : </label>
       <input class="form-control form-control-lg" type="text" id="surName">
       <label>Phone Number : </label>
       <input class="form-control form-control-lg"  type="text" name="phoneNumber"
								id="phoneNumber"
								class="text ui-widget-content ui-corner-all">
	<div class="captchaDiv">
	<img id="captcha_id" name="imgCaptcha" src="captcha.jpg">
	<a id="changedButton" href="javascript:;"
						title="change captcha text"
						onclick="document.getElementById('captcha_id').src = 'captcha.jpg?' + Math.random();  return false">
							change
					</a>
	</div>
	<input class="form-control form-control-lg" type="text" id="captcha">
	<div id="error"></div>
      </div>
      <div class="modal-footer">
        <button  id="userFormClose" type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary" onclick="saveClick();">Save changes</button>
      </div>
    </div>
  </div>
</div>
<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
		User will be permanently deleted !
      </div>
      <div class="modal-footer">
        <button  id="deleteFormClose" type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary" onclick="deleteUser();">Delete</button>
      </div>
    </div>
  </div>
</div>

<div style="position:fixed; top:10px;right:10px;" id="ajaxProgressImages"></div>
</body>

</html>