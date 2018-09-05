<!DOCTYPE HTML>
<!--
	Hielo by TEMPLATED
	templated.co @templatedco
	Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta name="csrf-token" content="{{ csrf_token() }}">
<title>Hielo by TEMPLATED</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="/resources/css/main.css?ver=1" />

<style>
.subpage {
	
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
	width: 100%;
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
	width: 100%;
    min-height: 250px;
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
	height: 200px;
	float:left; 
	margin:0px 10px 30px 10px;
	
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


#map{
margin-top : 30px;
}

#selectbox {
	
	width: 100%;
}

#header .logo .loginbtn{
float: right;
display: inline-block;
text-align: right;
}

#header .logo .loginbtn .logOutbtn .btnlogOut1{

float: left;
margin-right: 10px;

}

#header .logo .loginbtn .logOutbtn .btnlogOut2{
display: inline-block;
text-align: left;
}


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

<div class="logOutbtn">
<sec:authorize access="isAuthenticated()">
	<form action="/logout" method="post" >
		<sec:authentication property="principal" var="user"/>
		<div class="btnlogOut1">
			<strong>${user.vo.uname}<c:if test="${user.vo.role=='c'}">(Consumer)</c:if>
			<c:if test="${user.vo.role=='s'}">(Seller)</c:if></strong>님
		</div>
		<div class="btnlogOut2">
			<button class="lOutbtn">logout</button>
		</div>
		<input type="hidden" name = "${_csrf.parameterName}" value ="${_csrf.token}">
	</form>
</sec:authorize>
</div>

		 </div>
		</div>
		<a href="#menu">Menu</a>
	</header>

	<!-- Nav -->
	<nav id="menu">
		<ul class="links">
			<li><a href="/truck/list">Home</a></li>
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
				
					<div class="row uniform" style = "margin-left:0;">
						
						<div class="6u 12u$(xsmall) titleInput">
							<input type="text" name="title" id="name" value="제목"
								placeholder="title" />
						</div>

						<div class="6u 12u$(xsmall) writerInput">
							<input type="text" name="writer" id="writer" value='<sec:authentication property="principal.username"/>' 
							readonly="readonly"	placeholder="writer" />
						</div>
						
						
						<div id="selectbox" style="padding-left:0">
							<select name="keyword" id="category">
								<option value="">--대표 키워드를 선택하세요--</option>
								<option value="새우">새우</option>
								<option value="닭발">닭발</option>
								<option value="커피">커피</option>
								<option value="초밥">초밥</option>
								<option value="곱창">곱창</option>
								<option value="스테이크">스테이크</option>
								<option value="타코야키">타코야키</option>
								<option value="핫도그">핫도그</option>
								
							</select>
						</div>


						<div class="12u$" style = "padding-left : 0">
							<textarea name="content" id="message"
								placeholder="Enter your message" rows="10"></textarea>
						</div>
						<h3>File Upload</h3>
						<div class="fileDrop">
						
						Drag&Drop file here.
						</div>
					
					<div class="uploadedList">
					
					</div>
			

					
					<div id="map" style="width:100%; height:400px;" ></div>
					
						<div class="12u$ regBtnBox"> <!-- 1371 -->
						
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
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=bff61a89655a4af04b04e53c609f6b3a"></script>
		
	<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script id="template" type="text/x-handlebars-template">
<li><span class="mailbox-attachment-icon has-img"><img src="{{imgsrc}}" alt="Attachment"><span>
<div class="mailbox-attachment-info">
<a href="{{getLink}}" class="mailbox-attachment-name">{{fileName}}</a>
<a href="{{fullName}}" class="btn btn-default btn-xs pull-right delbtn"><i class="fa fa-fw fa-remove"></i></a>
	
					<input type="radio" id="{{fullName}}" name="priority" value="{{fullName}}">
					<label for="{{fullName}}">대표사진 선택</label>
</div>
</li>

</script>


<script>

$(document).ready(function(){
	
	
	
	
	 var csrfToken = "${_csrf.token}";

     function setCsrf(token){
     	
     	$.ajaxSetup({
             headers:
             { 'X-CSRF-TOKEN':token }
         });
     	
     }
     
	var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
	var options = { //지도를 생성할 때 필요한 기본 옵션
		center: new daum.maps.LatLng(37.526571, 126.933590), //지도의 중심좌표.
		level: 3 //지도의 레벨(확대, 축소 정도)
	};

	var map = new daum.maps.Map(container, options); //지도 생성 및 객체 리턴
	// 마커가 표시될 위치입니다 
	
	
	
	// 지도를 클릭한 위치에 표출할 마커입니다
	var marker = new daum.maps.Marker({ 
    	// 지도 중심좌표에 마커를 생성합니다 
    	position: map.getCenter() 
		}); 
	
	// 지도에 마커를 표시합니다
	marker.setMap(map);
	
	// 지도에 클릭 이벤트를 등록합니다
	// 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
	
	var lat= options.center.getLat();
	var lng= options.center.getLng();
	
	
	daum.maps.event.addListener(map, 'click', function(mouseEvent) {        
	    
	    // 클릭한 위도, 경도 정보를 가져옵니다 
	    var latlng = mouseEvent.latLng; 
	    
	    // 마커 위치를 클릭한 위치로 옮깁니다
	    marker.setPosition(latlng);
	    
	    var message = '클릭한 위치의 위도는 ' + latlng.getLat() + ' 이고, ';
	    message += '경도는 ' + latlng.getLng() + ' 입니다';
	    
	    console.log(message);
	    
	    lat = latlng.getLat();
		lng = latlng.getLng();
	    
	});
	
	
	
	
	console.log("위도",lat,lng);
	
	
	
	
	
	
	
	
	
	
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
		
		
			setCsrf(csrfToken);
		
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
			});

		}else{
	     	console.log("체크하고있다.",maxSize);
	     	alert("첨부파일 사이즈는 5MB 이내로 등록 가능합니다.    ");
	     	return ;
		}
	});
	
	

	
	
	$("#registerForm").submit(function(e){

		e.preventDefault();
		if(!$('input:radio[name=priority]:checked').val()){
			alert("대표사진을 지정하세요.");
			return;
		}
    	   
		var that =$(this);
		console.log("that..1",that);
		var str="";
		$(".uploadedList .delbtn").each(function(index){
			str+="<input type='hidden' name ='files["+index+"]' value='"+$(this).attr("href")+"'>";
			/* alert(index); */
		});
  	   
		console.log("that..2",that.get(0));
		alert($('input:radio[name=priority]:checked').val());
		that.append("<input type='hidden' name = 'lat' value='"+lat+"'>");
		that.append("<input type='hidden' name = 'lng' value='"+lng+"'>");
		that.append("<input type='hidden' name = 'fullname' value='"+$('input:radio[name=priority]:checked').val()+"'>");
		that.append(str);
		that.get(0).submit();
    
	});
       
	$(".uploadedList").on("click",".mailbox-attachment-name",function(event){
		//크로스브라우징 고려
		event.preventDefault ? event.preventDefault() : (event.returnValue = false);

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
   	
   	
   	
   	$(".actions").on("click", ".list", function(e) {
		self.location = "/truck/list${cri.makeSearch(cri.page)}";
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
	
</body>
</html>