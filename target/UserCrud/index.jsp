<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
     
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
</head>

<body onload="getUserList()">


<button type="button" class="btn btn-primary" data-toggle="modal"data-target="#formModal">
 Add User
</button>


<h1>List User</h1>

<table id="listTable" class="table">
<thead>
<tr>
<th>Name</th>
<th colspan=2> Action </th>
</tr>
</thead>
</table>
<!-- Modal -->
<div class="modal fade" id="formModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      <label>Name : </label>
       <input class="form-control form-control-lg" type="text" id="name">
       
       <input type="text" name="phoneNumber"
								id="phoneNumberInput"
								class="text ui-widget-content ui-corner-all">
      </div>
      <div class="modal-footer">
        <button  id="userFormClose" type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary" onclick="userAdd();">Save changes</button>
      </div>
    </div>
  </div>
</div>
</body>


<script type="text/javascript">
var csrfParameter = '${_csrf.parameterName}';
var csrfToken = '${_csrf.token}';

function getUserList() {
	$.ajax({
		url:"list1",
		dataType: 'json',
		success: function (res){
			
			$('.trListe').remove();
			for(i=0; i < res.length; i++){
				console.log (res[i].name);
				
				$("#listTable").append('<tr class="trListe"> <td>' + res[i].name + '</td> <td><button data-toggle="modal" data-target="#formModal" type="button" class="btn btn-primary" onclick="updateModal(\''+res[i].id+'\');">Update</button></td><td><button type="button" class="btn btn-primary" onclick="userAdd();">Delete</button></td> </tr>');
				
			}
		},
		error: function (res) {
			console.log("olmadi yar");
		}
	});
}

function userAdd() {
	var user={id:null,name:$("#name").val()};
	console.log("user burada");
	console.log(user);
	$.ajax({
		type:"post",
		url:"save",
		data:{id:user.id , name: user.name},
		success: function (res){
			 console.log("basardi");
		},
		error: function (res) {
			console.log("olmadi yar");
		}
	});
	$("#userFormClose").click();
	getUserList();
}

function updateModal(userId){
	$.ajax({
		url:"findById",
		data:{id:userId },
		dataType: 'json',
		success: function (res){
			$("#name").val(res.name);
		},
		error: function (res) {
			console.log("olmadi yar");
		}
	});
}

function clearForm(){
	$("#name").val("");
}
</script>
</html>