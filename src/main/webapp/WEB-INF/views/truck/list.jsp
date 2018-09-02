<!DOCTYPE HTML>

<html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<head>
<title>Hielo by TEMPLATED</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="/resources/css/main.css?ver=4" />
</head>
<style>
}

.button special{
background-color: black;
}
.wrapper.style3{
padding: 6rem 0 15rem 0;}
.wrapper.style2{

padding: 0rem 0 0 0;}
.search1 {
	text-align: center;
}

#search {
	min-width: 180px;
}

.search {
	width: 33%;
	margin-left: 33%;
}

#selectbox {
	display: inline-block;
	width: 60%;
}

.center {
	text-align: center;
}

.pagination {
	display: inline-block;
}

.pagination a {
	font-size: 1.3em;
	color: black;
	float: left;
	padding: 8px 5px;
	text-decoration: none;
	color: black;
}

.pagination a.active {
	background-color: pink;
	color: white;
}

.pagination a :hover :not(.active){
background-color:pink;
}
.categoryList {
	text-align: center;
	background-color: rgba(252, 205, 0, 0.66);
}

.category1 {
  width: 300px;  
	 color : black;
	display: inline-block;
	font-size: 1.8em;
	    border-bottom: 1.5px solid black;
/* 	border-left: 2px solid red;
	border-right: 2px solid red; */	
}
.categoryDiv{
    width: 100%;
}

.grid-style p{
text-align:center;
font-size: 1.5em;
}
ul li {
			padding-left: 0rem;
		}
		ul {
    list-style: disc;
    margin: 0 0 2rem 0;
    padding-left: 0rem}

.myTruck{
color:rgba(255, 255, 255, 0.5);
list-style:none;
border: 1px solid rgba(255, 255, 255, 0.5);
text-align: center;

}
.myTruck button{
/* border:1px solid #8a4680; */
margin-top: 5px
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

.box img {
height : 300px;
}
</style>
<body>

	<!-- Header -->
	<!-- 			<header id="header" class="alt">
				<div class="logo"><a href="index.html">Hielo <span>by TEMPLATED</span></a></div>
				<a href="#menu">Menu</a>
			</header> -->
	<!-- Header -->
	<header id="header">
		<div class="logo">
		
		<div class="loginbtn">

<sec:authorize access="isAnonymous()">
	<form action="/myLogin">
	<button>login</button>
	
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
			<li><a href="/home">Home</a></li>
			<li><a href="/up/ajax">Best Food Truck</a></li>
			<li><a href="/board/list">Free Board</a></li>
			<li><a href="/mypage">My page</a></li>
		</ul>
		<br><br><br><br><br><br><br><br><br>
		<ul>
			<c:if test="${user.vo.role=='s'}">
 				
 				<li class = "myTruck">
 				
 					<c:if test="${user.vo.title==null}">
 						${user.vo.uname}님, <br>
						아직 자신의 푸드트럭을 <br>등록하지 않으셨나요?<br>
						<button id="regbtn">Register</button>
					</c:if>
					<c:if test="${user.vo.title!=null}">
						${user.vo.uname}님, <br>
						자신의 푸드트럭을 관리해보세요.<br>
						${user.vo.title}
						<button id = "openBtn">Open</button>
						
						<button id = "closeBtn">Close</button>

						<button>Modify</button>
					</c:if>
					
				</li>	  	
				
			</c:if>
			<li class = "myTruck">
			<c:if test="${user.vo.role=='c'}">
 				${user.vo.uname}님, <br>
				관심키워드를 설정해보세요.<br> 
				실시간 알림을 보내드려요. 				
 				<button id = "keywordBtn">My Keyword</button>
 			
 				
 			</c:if>
			</li>
		</ul>		
	</nav>
	<form id="openClose"> 
		<input type="hidden" name="uid" value="${user.username}">
		<input type="hidden" name = "${_csrf.parameterName}" value ="${_csrf.token}">
	</form>
	<!-- One -->
	<section id="One" class="wrapper style3">
		<div class="inner">
			<header class="align-center">
				<p>What do you want to eat?</p>
				<h2>FOOD TRUCK</h2>
			</header>
		</div>
	</section>
	
			<div class="categoryDiv">
			<ul class="categoryList">
				<li class="category1"><span>Food</span></li>
				<li class="category1"><span>Beverage</span></li>
				<li class="category1"><span>Dessert</span></li>
				<li class="category1"><span>Drink</span></li>
			</ul>
			</div>
	<!-- 푸드트럭리스트 -->
	<section id="one" class="wrapper style2">

		<div class="inner">

			<div class="grid-style">

				
				<c:forEach items="${list}" var="vo">
				<div>
					<div class="box">
						<div class="image fit">
							<img src="/ex/displayFile?fileName=${fn:substring(vo.fullname, 0, 12)}${fn:substring(vo.fullname, 14,fn:length(vo.fullname))}" alt="" />
							 <div style="text-align:right; margin-top:10px"> <!-- border-top:1px solid #999999 -->
						<span style="color:black">&nbsp;review&nbsp;&nbsp;<c:out value="${vo.reviewCnt}"></c:out>&nbsp;</span>&nbsp;&nbsp;
							<span style="color:red;">&nbsp;♥&nbsp;&nbsp;&nbsp;<c:out value="${vo.likeCnt}"></c:out>&nbsp;</span>
							</div>
						</div>
						<div class="content" style="margin:-1rem 2rem 0 2rem">
							<header class="align-center">
							
								<p style="font-size: 1.9em"><c:out value="${vo.title}"></c:out></p>	
								<h2><c:if test="${vo.open_check=='f'}">CLOSE</c:if>
								<c:if test="${vo.open_check=='t'}">OPEN</c:if></h2>
							</header>
							
						<p><c:out value="${vo.keyword}"></c:out></p>

							<footer class="align-center">
								<a class="button alt" id="readBtn" data-fno="${vo.fno}">Read More</a>
							</footer>
						</div>
					</div>
				</div>
				</c:forEach>
				


			</div>
		</div>
		<!--@@@검색@@@  -->
		<div class="search1">
			<div class="row uniform" id="selectbox">
				<div class="3u 12u$(small)">
					<div class="select-wrapper">
						<select name="type" id="category">
							<option value="n"
								<c:out value="${cri.type == 'n' ? 'selected' : '' }"></c:out>>--category--</option>
							<option value="t"
								<c:out value="${cri.type eq 't' ? 'selected' : '' }"/>>title</option>
							<option value="c"
								<c:out value="${cri.type eq 'c' ? 'selected' : '' }"/>>content</option>
							<option value="w"
								<c:out value="${cri.type eq 'w' ? 'selected' : '' }"/>>writer</option>
							<option value="tc"
								<c:out value="${cri.type eq 'tc' ? 'selected' : '' }"/>>title+content</option>
							<option value="tcw"
								<c:out value="${cri.type eq 'tcw' ? 'selected' : '' }"/>>title+content+writer</option>
						</select>
					</div>
				</div>

				<div class="6u 12u$(small)">
					<input type="text" name="keyword" id="query" value="${cri.keyword}"
						placeholder="search" />
				</div>

				<div class="3u 12u$(small)">
					<button id="search" value="Search"
						class="button special icon fa-search">Search</button>
				</div>
			</div>
		</div>
		<!-- 검색end -->
		<!-- 페이징start -->
		<div class="center">
			<div class="pagination">
					<c:if test="${pm.prev}">
						<a href="/truck/list${cri.makeSearch(pm.start -1)}"><< </a>
					</c:if>
					<c:forEach begin="${pm.start}" end="${pm.end}" var="idx">
						<a href="/truck/list${cri.makeSearch(idx)}"
							class="<c:if test="${pm.cri.page==idx}">active</c:if>">${idx}</a>
					</c:forEach>
					<c:if test="${pm.next}">
						<a href="/truck/list${cri.makeSearch(pm.end+1)}">>></a>
					</c:if>
			</div>
		</div>
		<!-- 페이징end -->
	</section>



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
		$(document).ready(function() {
			$("#search").on("click",function(e) {
				console.log("clicked...............................");
				console.log(encodeURIComponent($('#keywordInput').val()));
				var type = $("#category")[0].value;
				var keyword = $('#query').val();

				if (type === 'n'|| keyword === '') {
					return;
				};
				self.location = "/truck/list"+'${pm.makeQuery(1)}'+"&type="
								+ $("select option:selected").val()
								+ "&keyword="+ encodeURIComponent(keyword);
			});

			$("#regbtn").on("click",function(e) {
				console.log("clicked...........ssddddd............");
				self.location = "/truck/register${cri.makeSearch(cri.page)}";

			});

			$(".box").on("click","#readBtn",function(e) {

				var fno = $(this).attr("data-fno");
				var link = '${cri.makeSearch(cri.page)}';
				console.log(fno);

				self.location = "/truck/read"+ link + "&fno=" + fno;
			});

			console.log("history:" + history.state);

			var msg = '<c:out value="${msg}"/>';

			if (msg == "success" && !history.state) {
				alert("등록이 완료되었습니다.");
				}
			if (msg == "fail" && !history.state) {
				alert("등록이 실패하였습니다. 내용을 똑바로 입력하세요.");
				}
			if (msg == "successRemove" && !history.state) {
				alert("삭제가 완료되었습니다.");
				}
			if (msg == "failRemove" && !history.state) {
				alert("삭제에 실패하였습니다.");
				}
			if (msg == "openSuccess" && !history.state) {
				alert("영업을 시작합니다.");
				}
			if (msg == "closeSuccess" && !history.state) {
				alert("영업을 종료합니다.");
				}
			history.replaceState({}, null, null);
			
			$(".lOutbtn").on("click", function(e) {
				
				alert("로그아웃 되었습니다.");				
			});
			
			
			
			$("#keywordBtn").on("click", function(e){
				
				var windowW = 900;  // 창의 가로 길이
				 var windowH = 700;  // 창의 세로 길이
				 var left = Math.ceil((window.screen.width - windowW)/2);
				 var top = Math.ceil((window.screen.height - windowH)/2);
				
				
				
				e.preventDefault();
				
				window.open("http://localhost:8080/truck/keyword", "keywordInput", 
						"toolbar=no, menubar=no, scrollbars=no, resizable=yes, l top="+
						top+", left="+left+", height="+windowH+", width="+windowW);			
				
				
				
			});
		});
	</script>
	
	
	
<script src="https://www.gstatic.com/firebasejs/5.4.2/firebase.js"></script>

<!-- Firebase App is always required and must be first -->
<script src="https://www.gstatic.com/firebasejs/5.0.4/firebase-app.js"></script>

<!-- Add additional services you want to use -->
<script src="https://www.gstatic.com/firebasejs/5.0.4/firebase-auth.js"></script>
<script src="https://www.gstatic.com/firebasejs/5.0.4/firebase-database.js"></script>
<script src="https://www.gstatic.com/firebasejs/5.0.4/firebase-firestore.js"></script>
<script src="https://www.gstatic.com/firebasejs/5.0.4/firebase-messaging.js"></script>
<script src="https://www.gstatic.com/firebasejs/5.0.4/firebase-functions.js"></script>

<script>
  // Initialize Firebase
  var config = {
    apiKey: "AIzaSyB8HBoFl5-x61YX3Gd6U5lHGqspOlB-SUE",
    authDomain: "hscandy-b0a6d.firebaseapp.com",
    databaseURL: "https://hscandy-b0a6d.firebaseio.com",
    projectId: "hscandy-b0a6d",
    storageBucket: "hscandy-b0a6d.appspot.com",
    messagingSenderId: "744061303057"
  };
  firebase.initializeApp(config);
  
  var db = firebase.database();
  var sellerRef = db.ref("candy/seller");
  var uidVal = "${user.vo.uid}";
  var keyVal = "새우";
  var storeVal = "새우왕";
  
  $("#openBtn").on("click",function(e) {
		var result = confirm("영업을 시작하시겠습니까?");
		if(result){
			$("#openClose").attr({action:"open", method:'post'}).submit();
			
			sellerRef.child(uidVal).set({keyword:keyVal, store:storeVal}, function () {
	            console.log("TestSaved....");
			});
			
		}else{
			sellerRef.on('value', function(snapshot) {
		    console.log(snapshot.val());
				});
			
			return;}
		
	});
	
	$("#closeBtn").on("click",function(e) {
		var result = confirm("영업을 종료하시겠습니까?");
		if(result){
			$("#openClose").attr({action:"close", method:'post'}).submit();
			
			sellerRef.child(uidVal).remove();
			
		}else{return;}
	});
  
</script>
	
	

</body>
</html>