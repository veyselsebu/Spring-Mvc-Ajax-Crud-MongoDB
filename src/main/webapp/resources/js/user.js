var csrfParameter = '${_csrf.parameterName}';
var csrfToken = '${_csrf.token}';
var userId;

function getUserList() {
	$.ajax({
		url:"list1",
		dataType: 'json',
		success: function (res){
			
			$('.trListe').remove();
			for(i=0; i < res.length; i++){
				console.log (res[i].name);
				
				$("#listTable").append('<tr class="trListe"> <td>' + res[i].name + '</td><td>' + res[i].surName + '</td><td>' + res[i].phoneNumber + '</td><td>' + res[i].captcha + '</td> <td><button data-toggle="modal" data-target="#formModal" type="button" class="btn btn-primary" onclick="updateModal(\''+res[i].id+'\');">Update</button></td><td><button  data-toggle="modal" data-target="#deleteModal" type="button" class="btn btn-primary"  onclick="deleteModal(\''+res[i].id+'\');">Delete</button></td> </tr>');
				
			}
		},
		error: function (res) {
			console.log("olmadi yar");
		}
	});
}

function userAdd() {
	ajaxProgressImageStart("add");
	var user={id:null,name:$("#name").val(),surName:$("#surName").val(),phoneNumber:$("#phoneNumber").val(),captcha:$("#captcha").val()};
	console.log("user burada");
	console.log(user);
	$.ajax({
		type:"post",
		url:"save",
		data:user,
		success: function (res){
			if(res=="success"){
				clearForm();
				getUserList();
				$("#userFormClose").click();
				ajaxProgressImageStop();
			}
			else{
				$("#error").html('<p>'+res+'</p>');
				ajaxProgressImageStop();
			}
		},
		error: function (res) {
			console.log("olmadi yar");
		}
	});
}
function updateSave(){
	ajaxProgressImageStart("update");
	var user={id:window.userId,name:$("#name").val(),surName:$("#surName").val(),phoneNumber:$("#phoneNumber").val(),captcha:$("#captcha").val()};
	$.ajax({
		type:"post",
		url:"save",
		data:user,
		success: function (res){
			if(res=="success"){
				clearForm();
				getUserList();
				$("#userFormClose").click();
				ajaxProgressImageStop();
			}
			else{
				$("#error").html('<p>'+res+'<p>');
				console.log(res);
				ajaxProgressImageStop();
			}
		},
		error: function (res) {
			console.log("olmadi yar");
		}
	});
	
}
function updateModal(userId){

	$("#changedButton").click();
	window.userId=userId;
	$.ajax({
		url:"findById",
		data:{id:userId },
		dataType: 'json',
		success: function (res){
			$("#name").val(res.name);
			$("#surName").val(res.surName);
			$("#phoneNumber").val(res.phoneNumber);
		},
		error: function (res) {
			console.log("olmadi yar");
		}
	});
}

function clearForm(){
	$("#changedButton").click();
	$("#name").val("");
	$("#phoneNumber").val("");
	window.userId=null;
}
function saveClick(){
	if(window.userId)
		updateSave();
	else
		userAdd();
}
function deleteModal(userId){
	window.userId=userId;
}
function deleteUser(){
	ajaxProgressImageStart("delete");
	$.ajax({
		url:"delete",	
		data:{id:window.userId },
		success: function (res){
			getUserList();
			$("#deleteFormClose").click();
			ajaxProgressImageStop();
		},
		error: function (res) {
			console.log("olmadi yar");
		}
	});
}

function ajaxProgressImageStart(operation){
	switch (operation){
	case "add":
		$("#ajaxProgressImages").html('<img style="width:50px; height:50px;" id="progressImage" src="../resources/images/add.png">');
		break;
	case "delete":
		$("#ajaxProgressImages").html('<img style="width:50px; height:50px;" id="progressImage" src="../resources/images/cop.png">');
		break;
	case "update":
		$("#ajaxProgressImages").html('<img style="width:50px; height:50px;" id="progressImage" src="../resources/images/update.png">');
		break;
	}
}
function ajaxProgressImageStop(){
	 setTimeout(function(){ $("#ajaxProgressImages").html("");}, 1000);

}
jQuery(function($){
	   $("#phoneNumber").mask("(999) 999-9999");
});
