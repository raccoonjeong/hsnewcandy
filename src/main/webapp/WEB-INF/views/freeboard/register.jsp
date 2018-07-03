<!DOCTYPE HTML>
<!--
	Hielo by TEMPLATED
	templated.co @templatedco
	Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
<title>Hielo by TEMPLATED</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="/resources/css/main.css?ver=1" />

<style>
.subpage {
	background: linear-gradient(120deg, #D3959B, #BFE6BA) fixed
}

.outer {
	padding-top: 5%;
	background-color: #ffffff;
	background-color: rgba(255, 255, 255, 0.6);
}

.mytable {
	width: 70%;
	margin-left: auto;
	margin-right: auto;
}
.fileDrop
{
	width: 96.8%;
    height: 100px;
    padding: 20px;
    border: 3px solid #ccc;
    border-style: dashed;
    background: rgba(144, 144, 144, 0.075);
    margin: 0px 0px 0px 0px; 
    float:right;
    font-size:1.8em;
    text-align: center;

            }
.uploadedList
{
	display:block;
	width: 96.8%;
    min-height: 220px;
    padding: 20px;
    border: 1px solid #ccc;
    
    margin: 30px 0px 0px 0px; 
    float:right;
    list-style: none;



}
.uploadedList li{
	display: inline-block;
	border: 1px solid #ccc;
	width: 170px;
	height: 170px;
	float:left; 
	margin:0px 10px 10px 10px;
	
}
.uploadedList img{
width: 170px;
    height: 130px;
text-align: center;
}
.uploadedList li div{
 background: rgba(144, 144, 144, 0.075);
 height: 30px;

 bottom:0;
}

.mailbox-attachment-name{

        text-overflow: ellipsis;
    white-space: nowrap;
    word-wrap: normal;
    max-width: 149px;
    overflow: hidden;
    display: inline-block;

}
    
/* body {
	background-image: url(/resources/images/bg.jpg);
} */
</style>
</head>
<body class="subpage">

	<!-- Header -->
	<header id="header">
		<div class="logo">
	<div class="loginbtn">

<sec:authorize access="isAnonymous()">
	<form action="/login" method="post">
	<button>login</button>
	<input type="hidden" name = "${_csrf.parameterName}" value ="${_csrf.token}">
	</form>	
</sec:authorize>

<sec:authorize access="isAuthenticated()">
	<form action="/logout" method="post" ><sec:authentication property="principal" var="user"/>
	<strong>${user.username}</strong> 님 환영합니다
	<button>logout</button>
	<input type="hidden" name = "${_csrf.parameterName}" value ="${_csrf.token}">
	</form>
</sec:authorize>


		 </div>
		</div>
		<a href="#menu">Menu</a>
	</header>

	<!-- Nav -->
	<nav id="menu">
		<ul class="links">
			<li><a href="/board/list">Home</a></li>
			<li><a href="/up/ajax">Image gallery</a></li>
		</ul>
	</nav>

	<!-- One -->
	<section id="One" class="wrapper style3">
		<div class="inner">
			<header class="align-center">
				<h1>select</h1>
				<P></P>
				<h2>select</h2>
			</header>
		</div>
	</section>

	<!-- Main -->
	<div id="main" class="container">
		<div class="outer">
			<div class="mytable">
				<h3>form</h3>

				<form method="post" action="register" id="registerForm">
					<div class="row uniform">
						<div class="6u 12u$(xsmall)">
							<input type="text" name="title" id="name" value="제목"
								placeholder="title" />
						</div>

						<div class="6u 12u$(xsmall)">

						<input type="text" name="writer" id="writer" value="user01"/>
							<%-- <input type="text" name="writer" id="writer" value='<sec:authentication property="principal.username"/>' 
							readonly="readonly"	placeholder="writer" /> --%>

						</div>

						<div class="12u$">
							<textarea name="content" id="message"
								placeholder="Enter your message" rows="20"></textarea>
						</div>
						<h3>File Upload</h3>
						<div class="fileDrop">
						
						Drag&Drop file here.
						</div>
					<div class="uploadedList">
					
					</div>

						<div class="12u$">
							<ul class="actions">
								<li><input type="button" class="special list" value="List"></li>
								<li><input type="submit" class="special list" value=" Register"></li>
								<input type="hidden" name = "${_csrf.parameterName}" value ="${_csrf.token}">
							</ul>
						</div>
					</div>
				</form>
				<hr />
			</div>
		</div>

	</div>


	<script src="https://code.jquery.com/jquery-3.3.1.min.js"
		integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
		crossorigin="anonymous"></script>

		
	<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script id="template" type="text/x-handlebars-template">
<li><span class="mailbox-attachment-icon has-img"><img src="{{imgsrc}}" alt="Attachment"><span>
<div class="mailbox-attachment-info">
<a href="{{getLink}}" class="mailbox-attachment-name">{{fileName}}</a>
<a href="{{fullName}}" class="btn btn-default btn-xs pull-right delbtn"><i class="fa fa-fw fa-remove"></i></a></div>
</li>
</script>


<script>

$(document).ready(function(){

	
	
	var template = Handlebars.compile($("#template").html());
	$(".fileDrop").on("dragenter dragover", function(e){
			e.preventDefault();		
	});

	
	
	$(".fileDrop").on("drop", function(e){
		e.preventDefault();
	
		var files = e.originalEvent.dataTransfer.files;		
		var file = files[0];		
		var fileSize = file.size;
		var maxSize  =5*1024*1024; 
	
		console.log("filesize",fileSize);
if(fileSize<maxSize){			
		var formData = new FormData();
		console.log("size", fileSize);
		formData.append("file" , file);
		$.ajax({
			url: '/ex/uploadAjax',
			data:formData,
			dataType: 'text',
			processData:false,
			contentType:false,
			type: 'POST',
			success: function(data){		
				console.log("data.....",data);	     	   
				var fileInfo = getFileInfo(data);	     	   
	     	   console.log("FileInfo....",fileInfo);	     	   
	       	   var html = template(fileInfo);
	         	$(".uploadedList").append(html);
	         }
		})
		}else{
     	console.log("체크하고있다.",maxSize);
     	alert("첨부파일 사이즈는 5MB 이내로 등록 가능합니다.    ");
     	return ;
 }
	});
	
       $("#registerForm").submit(function(e){
    	   
    	   e.preventDefault();
    	   var that =$(this);
    	   console.log("that..1",that);
    	   var str="";
    	   $(".uploadedList .delbtn").each(function(index){
     		  str+="<input type='hidden' name ='files["+index+"]' value='"+$(this).attr("href")+"'>";
     		  /* alert(index); */
     		  });
    	   
    	   	 console.log("that..2",that.get(0));
    	   
      		 that.append(str);
     	 	 that.get(0).submit();
     	 	 
      	 });
       
   	$(".uploadedList").on("click",".delbtn",function(e){
   		e.preventDefault();
		e.stopPropagation();
   		console.log("click remove....");
		var that = $(this);
		
		$.ajax({
			url: '/ex/deleteFile',
			type: 'POST',
			data:{fileName:$(this).attr("href")},
			dataType: 'text',
			success:function(result){
				if(result =='deleted'){
					that.parent("div").parent("span").parent("span").parent("li").remove();
					alert("deleted");
					/* console.dir(that);
					console.log(that.parent("div").parent("span").parent("span").parent("li")); */
				}
			}
			
			
		});
		
   	});
       
});
   


</script>

<script type="text/javascript" src="/resources/js/upload.js"></script>	
	<!-- Footer -->
	<footer id="footer">
		<div class="container">
			<ul class="icons">
				<li><a href="#" class="icon fa-twitter"><span class="label">Twitter</span></a></li>
				<li><a href="#" class="icon fa-facebook"><span
						class="label">Facebook</span></a></li>
				<li><a href="#" class="icon fa-instagram"><span
						class="label">Instagram</span></a></li>
				<li><a href="#" class="icon fa-envelope-o"><span
						class="label">Email</span></a></li>
			</ul>
		</div>
		<div class="copyright">&copy; Untitled. All rights reserved.</div>
	</footer>

	<!-- Scripts -->
	<script src="/resources/js/jquery.min.js"></script>
	<script src="/resources/js/jquery.scrollex.min.js"></script>
	<script src="/resources/js/skel.min.js"></script>
	<script src="/resources/js/util.js"></script>
	<script src="/resources/js/main.js"></script>
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"
		integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
		crossorigin="anonymous"></script>
	<script>
		$(document).ready(function(e) {
			$(".actions").on("click", ".list", function(e) {
				self.location = "/board/list${cri.makeSearch(cri.page)}";
			});
		});
	</script>
</body>
</html>