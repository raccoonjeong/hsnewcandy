<!DOCTYPE HTML>
<!--
	Hielo by TEMPLATED
	templated.co @templatedco
	Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->
<html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

.pagination

 

a


:hover


:not

 

(
.active

 

){
background-color


:

 

pink


;
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
			<button>Login</button>
		</div>
		<a href="#menu">Menu</a>
	</header>
	<!-- Nav -->
	<nav id="menu">
		<ul class="links">
			<li><a href="/board/list">Home</a></li>
			<li><a href="/up/ajax">Best Food Truck</a></li>
			<li><a href="/board/list">Free Board</a></li>
		</ul>
		<br><br><br><br><br><br><br><br><br>
		<ul>
 		<li class = "myTruck">
		<!-- user01님,<br>
	아직 자신의 푸드트럭을 <br>등록하지 않으셨나요?<br>
	<button>Register</button>	 -->
	user01님,<br>
	방문을 환영합니다.
	<button>Open</button>
	<button>Close</button>
	<button>Modify</button>
	</li>
	
	
	  	 
		</ul>
		
	</nav>
	
	<!-- One -->
	<section id="One" class="wrapper style3">
		<div class="inner">
			<header class="align-center">
				<p>What do you want to eat?</p>
				<h2>FOOD TRUCK</h2>
			</header>
		</div>
	</section>
	

	<!-- Banner -->
	<!-- 	<section class="banner full">
				<article>
					<img src="/resources/images/home/night.jpg" alt="" />
					<div class="inner">
						
					</div>
				</article>
				<article>
					<img src="/resources/images/home/market.jpg" alt="" />
					<div class="inner">
						<header>
							
							<h2>Magna etiam</h2>
						</header>
					</div>
				</article>
				<article>
					<img src="/resources/images/home/market2.jpg"  alt="" />
					<div class="inner">
						<header>
							
						</header>
					</div>
				</article>
				<article>
					<img src="/resources/images/home/ranking.jpg"  alt="" />
					<div class="inner">
						<header>
							
						</header>
					</div>
				</article>
				<article>
					<img src="/resources/images/slide05.jpg"  alt="" />
					<div class="inner">
						<header>
							<p>Ipsum dolor sed magna veroeros lorem ipsum</p>
							<h2>Lorem adipiscing</h2>
						</header>
					</div>
				</article>
			</section> -->
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

				<div>
					<div class="box">
						<div class="image fit">
							<img src="resources/images/foodtruck/1991핫도그0.jpg" alt="" />
							 <div style="text-align:right; margin-top:10px"> <!-- border-top:1px solid #999999 -->
						<span style="color:black">&nbsp;review&nbsp;&nbsp;3&nbsp;</span>&nbsp;&nbsp;
							<span style="color:red;">&nbsp;♥&nbsp;&nbsp;&nbsp;10&nbsp;</span>
							</div>
						</div>
						<div class="content" style="margin:-1rem 2rem 0 2rem">
							<header class="align-center">
								<p style="font-size: 1.9em">1991핫도그 </p>	
								<h2>OPEN</h2>
							</header>
							
						<p>#1991핫도그#에그스크럼블핫도그#치킨어니언핫도그#칠리비프핫도그</p>

							<footer class="align-center">
								<a href="/view" class="button alt">Read More</a>
							</footer>
						</div>
					</div>
				</div>

				<div>
					<div class="box">
						<div class="image fit">
							<img src="resources/images/foodtruck/베가스타코0.jpg" alt="" />
						</div>
						<div class="content">
							<header class="align-center">
								<p style="font-size: 1.9em">베가스타코</p>
								<h2>Closed</h2>
							</header>
							<p>오르차타 / 파히타 스테이크 타코 / 치킨브리또 / 불고기 타코 / 치즈 타코</p>
							<footer class="align-center">
								<a href="/view" class="button alt">Read More</a>
							</footer>
						</div>
					</div>
				</div>
				<div>
					<div class="box">
						<div class="image fit">
							<img src="resources/images/foodtruck/steakout.jpg" alt="" />
						</div>
						<div class="content">
							<header class="align-center">
								<p>mattis elementum sapien pretium tellus</p>
								<h2>퇴근</h2>
							</header>
							<p>Cras aliquet urna ut sapien tincidunt</p>
							<footer class="align-center">
								<a href="/view" class="button alt">Learn More</a>
							</footer>
						</div>
					</div>
				</div>

				<div>
					<div class="box">
						<div class="image fit">
							<img src="resources/images/foodtruck/steakout.jpg" alt="" />
						</div>
						<div class="content">
							<header class="align-center">
								<p>mattis elementum sapien pretium tellus</p>
								<h2>퇴근</h2>
							</header>
							<p>Cras aliquet urna ut sapien tincidunt</p>
							<footer class="align-center">
								<a href="/view" class="button alt">Learn More</a>
							</footer>
						</div>
					</div>
				</div>

				<div>
					<div class="box">
						<div class="image fit">
							<img src="resources/images/foodtruck/steakout.jpg" alt="" />
						</div>
						<div class="content">
							<header class="align-center">
								<p>mattis elementum sapien pretium tellus</p>
								<h2>퇴근</h2>
							</header>
							<p>Cras aliquet urna ut sapien tincidunt</p>
							<footer class="align-center">
								<a href="/view" class="button alt">Learn More</a>
							</footer>
						</div>
					</div>
				</div>

				<div>
					<div class="box">
						<div class="image fit">
							<img src="resources/images/foodtruck/steakout.jpg" alt="" />
						</div>
						<div class="content">
							<header class="align-center">
								<p>mattis elementum sapien pretium tellus</p>
								<h2>퇴근</h2>
							</header>
							<p>Cras aliquet urna ut sapien tincidunt</p>
							<footer class="align-center">
								<a href="/view" class="button alt">Learn More</a>
							</footer>
						</div>
					</div>
				</div>

				<div>
					<div class="box">
						<div class="image fit">
							<img src="resources/images/foodtruck/steakout.jpg" alt="" />
						</div>
						<div class="content">
							<header class="align-center">
								<p>mattis elementum sapien pretium tellus</p>
								<h2>퇴근</h2>
							</header>
							<p>Cras aliquet urna ut sapien tincidunt</p>
							<footer class="align-center">
								<a href="/view" class="button alt">Learn More</a>
							</footer>
						</div>
					</div>
				</div>

				<div>
					<div class="box">
						<div class="image fit">
							<img src="resources/images/foodtruck/steakout.jpg" alt="" />
						</div>
						<div class="content">
							<header class="align-center">
								<p style="font-size: 1.9em">베가스타코</p>
								<h2>Closed</h2>
							</header>
							<p>오르차타 / 파히타 스테이크 타코 / 치킨브리또 / 불고기 타코 / 치즈 타코</p>
							<footer class="align-center">
								<a href="/view" class="button alt">Read More</a>
							</footer>
						</div>
					</div>
				</div>

				<div>
					<div class="box">
						<div class="image fit">
							<img src="resources/images/foodtruck/쿡스테이크0.jpg" alt="" />
						</div>
						<div class="content">
							<header class="align-center">
								<p style="font-size: 1.9em">쿡스테이크</p>
								<h2>Open</h2>
							</header>
							<p>스테이크 / 감자튀김 / 스테이크꼬치 / 콜라</p>
							<footer class="align-center">
								<a href="/view" class="button alt">Read More</a>
							</footer>
						</div>
					</div>
				</div>

				<div>
					<div class="box">
						<div class="image fit">
							<img src="resources/images/foodtruck/허클베리핀0.jpg" alt="" />
							<div style="text-align:right; margin-top:10px"> <!-- border-top:1px solid #999999 -->
						<span style="color:black">&nbsp;review&nbsp;&nbsp;0&nbsp;</span>&nbsp;&nbsp;
							<span style="color:red;">&nbsp;♥&nbsp;&nbsp;&nbsp;2&nbsp;</span>
							</div>
						</div>
						<div class="content" style="margin:-1rem 2rem 0 2rem">
							<header class="align-center">
								<p style="font-size: 1.9em">허클베리핀</p>
								<h2>Closed</h2>
							</header>
							<p> #랍스터쉬림프#탄두리쉬림프 </p>
							<footer class="align-center">
								<a href="/view" class="button alt">Read More</a>
							</footer>
						</div>
					</div>
				</div>



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

				<a href=1>1</a> <a href=2>2</a> <a href=3>3</a> <a href=4>4</a> <a
					href=5>5</a> <a href=6>6</a> <a href=7>7</a> <a href=8>8</a> <a
					href=8>9</a> <a href=8>10</a> <a href=8>>></a>
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
	
	




</body>
</html>