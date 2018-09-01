<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Hielo by TEMPLATED</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="/resources/css/main.css?ver=1" />

<style>
.subpage {
	background: linear-gradient(120deg, #F5F4F5, #F5F4F5) fixed
}

.outer {
	padding-top: 5%;
	background-color: #ffffff;
	background-color: rgba(255, 255, 255, 0.6);
	width: 100%;
	
	
}

.mytable {
	width: 70%;
	margin-left: auto;
	margin-right: auto;
}
.container{
	width: 75%;
}

.actions{
float: right;
}

.uiduid{
	width: 100%;
}

.upwuid{
	width: 100%;
}

body div{
font-size: 13pt;
}

button{
height: 3rem;
}

.keyList li{
width:50%;
float:left;
list-style:none;
}

.keyList::after{
display: block;
content:"";
clear:both;
}

/* body {
	background-image: url(/resources/images/bg.jpg);
} */
</style>

<body class="subpage">

	<!-- Header -->
	<header id="header">
		<div class="logo">
			<a href="/board/list">
			
			<i class="fa fa-truck" ></i>  foodtruck </a>
		
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
				<p>WHAT DO YOU WANT TO EAT?</p>
				<h2>FOOD TRUCK</h2>
			</header>
		</div>
	</section>

<title>Insert title here</title>
</head>

	<!-- Main -->
	<div id="main" class="container">
		<div class="outer">
			<div class="mytable">
				<h3><i class="fa fa-key" aria-hidden="true"></i>  My Keyword</h3>
				<hr>
				<h3>Choose keyword. </h3>

				<ul class="keyList">
					<li>
					<input type="checkbox" id="copy" name="copy">
					<label for="copy">새우</label>
					</li>
					<li>
					<input type="checkbox" id="copy2" name="copy2">
					<label for="copy2">닭발</label>
					</li>
					<li>
					<input type="checkbox" id="copy3" name="copy3">
					<label for="copy3">커피</label>
					</li>
					<li>
					<input type="checkbox" id="copy4" name="copy4">
					<label for="copy4">초밥</label>
					</li>
					<li>
					<input type="checkbox" id="copy5" name="copy5">
					<label for="copy5">곱창</label>
					</li>
					<li>
					<input type="checkbox" id="copy6" name="copy6">
					<label for="copy6">스테이크</label>
					</li>
					<li>
					<input type="checkbox" id="copy7" name="copy7">
					<label for="copy7">타코야키</label>
					</li>
					<li>
					<input type="checkbox" id="copy8" name="copy8">
					<label for="copy8">핫도그</label>
				</li>
				</ul>
				<hr>
				<div style="text-align:right; margin-top:15px; padding-bottom:15px"><input type="button" value="Choose!"></div>
				
			</div>
		</div>
	</div>


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