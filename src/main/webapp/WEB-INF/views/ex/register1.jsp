<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style>
.fileDrop {
	width: 80%;
	height: 100px;
	border: 1px dotted gray;
	background-color: lightslategrey;
	margin: auto;
}
</style>
<body>

	<div class="form-group">
		<label for="exampleInputEmail1">File DROP Here</label>
		<div class="fileDrop"></div>
	</div>

	<div class="box-footer">
		<div>
			<hr>
		</div>
	</div>

	<ul class="mailbox-attachments clearfix uploadedList">
	</ul>
	<button type="submit" class="btn btn-primary">Submit</button>



<script	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
	<script id="template" type="text/x-handlebars-template">
<li><span class="mailbox-attachment-icon has-img"><img src="{{imgsrc}}" alt="Attachment"><span>
<div class="mailbox-attachment-info">
<a href="{{getLink}}" class="mailbox-attachment-name">{{fileName}}</a>
<a href="{{fullName}}" class="btn btn-default btn-xs pull-right delbtn"><i class="fa fa-fw fa-remove"></i></a></div>
</li>
</script>

<script>
var template = Handlebars.compile($("#template").html());
$(".fileDrop").on("dragenter dragover", function(e){
	
	e.preventDefault();
	
	
});

$(".fileDrop").on("drop", function(e){
	e.preventDefault();
	
	var files = e.originalEvent.dataTransfer.files;
	
	var file = files[0];
	
	var formData = new FormData();
	
	formData.append("file" , file);
	
	
	$.ajax({
		url: '/ex/uploadAjax',
		data:formData,
		dataType: 'text',
		processData:false,
		contentType:false,
		type: 'POST',
		success: function(data){

	
     	   var fileInfo = getFileInfo(data);
     	   
       	   var html = template(fileInfo);
			$(".uploadedList").append(str);
		
		}
	});
	
	console.log(file);
});
$("#registerForm").submit(function(event){
	   e.preventDefault();
	   var that =$(this);
	   var str="";
	   
	  $(".fileList").each(function(index){
		  str+="<input type='hidden' name ='files["+index+"]' value='"+$(this).attr("href")+"'>";
		  });
that.append(str);
that.get(0).submit();
});


</script>

<script type="text/javascript" src="/resources/js/upload.js"></script>	

</body>
</html>