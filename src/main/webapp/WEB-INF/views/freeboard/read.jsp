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
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<head>

<meta name="csrf-token" content="{{ csrf_token() }}">

<title>Hielo by TEMPLATED</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="/resources/css/main.css?ver=3" />
<style>
.pagination {
	display: inline-block;
	text-align: center;
}
.pagination li {
   display: inline;
            }
.pagination a {
	color: black;	
	padding: 8px 5px;
	text-decoration: none;
}

.pagination .active {
	background-color: yellowgreen;
	color: white;
}

.pagination a:hover:not (.active ){
	background-color: pink;
}
.contentbox {
	min-height: 500px;
}

.mytable {
	width: 70%;
	margin-left: auto;
	margin-right: auto;
}

.subpage {
	background: linear-gradient(120deg, #D3959B, #BFE6BA) fixed
}

.outer {
	padding-top: 5%;
	background-color: #ffffff;
	background-color: rgba(255, 255, 255, 0.6);
}
 .listDiv li {
            list-style-type: none;

        }
        ul {
            display: inline;
            padding: 0;
        }
        

 .pagination {
	display: inline-block;
	text-align: center;
}
.pagination{
        display: block;        
        }        

 p {
          color: #000;
      }
.mask {
            width: 100%;
            height: 100%;
            position: fixed;
            left: 0;
            top: 0;
            z-index: 10;
            background: #000;
            opacity: .5;
            filter: alpha(opacity=50);
        }
#modalLayer {
            display: none;
            position: relative;
        }
#modalLayer .modalContent {
            width: 440px;
            height: 200px;
            padding: 20px;
            border: 1px solid #ccc;
            position: fixed;
            left: 50%;
            top: 50%;
            z-index: 11;
            background: #fff;
        }
#modalLayer .modalContent .closebtn {
            position: absolute;
            right: 0;
            top: 0;
            cursor: pointer;
        }
        /* 대댓글창 start*/
.reMask {
            width: 100%;
            height: 100%;
            position: fixed;
            left: 0;
            top: 0;
            z-index: 10;
            background: #000;
            opacity: .5;
            filter: alpha(opacity=50);
        }
#reModalLayer {
            display: none;
            position: relative;
        }
#reModalLayer .reModalContent {
            width: 440px;
            height: 220px;
            padding: 20px;
            border: 1px solid #ccc;
            position: fixed;
            left: 50%;
            top: 50%;
            z-index: 11;
            background: #fff;
        }
#reModalLayer .reModalContent .reClosebtn {
            position: absolute;
            right: 0;
            top: 0;
            cursor: pointer;
        }
         /* 대댓글창 end*/

#datestyle{
        font-size: 80%;
        text-align: right;
        }
        .dbtn{

        text-align: right;
        }
.uploadedList
{
	display:block;
	width: 100%;
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
width: 168px;
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
        
       
</style>
<style type="text/css">
		 .popup{position: absolute;}
        .back{ 
        	 opacity: 0.5; width: 100%; height: 100%;
        		overflow: hidden; z-index: 1101;}
        		
        .front{
        	z-index:1110; opacity: 1; border: 1px; margin: auto;}		
		
		.show{
		    
			position: relative;
			max-width: 1200px;
			max-height: 800px;
			overflow: auto;	
			}


</style>
</head>

<body class="subpage">

	<!-- Header -->
	<header id="header">
		<div class="logo">
	<div class="loginbtn">


<%-- <sec:authorize access="isAnonymous()">

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


 --%>

		 </div>
		</div>
		<a href="#menu">Menu</a>
	</header>
	<!-- Nav -->
	<nav id="menu">
		<ul class="links">

			<li><a href="/freeboard/list">Home</a></li>

			<li><a href="/up/ajax">Image gallery</a></li>
			
		</ul>
	</nav>
	<!-- One -->
	<section id="One" class="wrapper style3">
		<div class="inner">
			<header class="align-center">
				<p>Sed amet nulla</p>
				<h2>Candy</h2>
			</header>
		</div>
	</section>
	<!-- Main -->

	<div id="main" class="container">
		<div class="outer">
			<div class="mytable">
				<div class="table-wrapper">
					<h3>View</h3>
					<table class="alt">
						<thead>
							<tr>

								<th>No.<c:out value="${vo.bno}" /></th>

							</tr>
						</thead>
						<tbody>
							<tr>
								<td colspan="2"><strong><c:out value="${vo.title}" /></strong></td>
							</tr>
							<tr>
								<td style="border-right: hidden; border-left: hidden;">Writer:
									<c:out value="${vo.writer}" />
								</td>
								<td width=50% style="text-align: right; border-right: hidden;">
									작성일 <fmt:formatDate value="${vo.regdate}" pattern="yyyy-MM-dd HH:mm" />
									<div class="12u$">
										수정일 <fmt:formatDate value="${vo.updatedate}" pattern="yyyy-MM-dd HH:mm" />
									</div>
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<div class="contentbox">
										<c:out value="${vo.content}" />
									</div>
								</td>
							</tr>
						</tbody>

					</table>
					
					<div class= "mailbox-attachments clearfix uploadedList"></div>
					<div id="map" style="width:1000px; height:400px;"></div>
					
					<div class="12u$">
					
					<div class='popup back' style="display:none;"></div>
					<div id="popup_front" class='popup front' style="display:none;">
						<img id="popup_img">
	
					</div>
						<ul class="actions">
							<li><input type="button" class="special list" value="List"></li>
							<li><input type="button" class="special modify"

								data-bno="${vo.bno}" value="Modify" /></li>

							<li><input type="button" class="special remove" value="Remove" /></li>
						</ul>
					</div>
					

					
					
					<div class="wrapper">
    <div class="inputDiv"><h1>여러분의 소중한 댓글은 글쓴이에게 힘이 됩니다.</h1>

         <div><label style="text-align: left">댓글내용:</label><input type="text" name="content"/></div>
        <div><label style="text-align: left">댓글쓴이:</label><%-- <input type="text" name="replyer" 
        			value='<sec:authentication property="principal.username"/>'	readonly="readonly" 
        			placeholder='<sec:authentication property="principal.username"/>' /> --%><input type="text" name="replyer" 
        			value='user01' /></div>
        <div>
            <button class="rbtn" data-type="register">Register</button>
            
        </div> 

    </div>

    <div class="listDiv">

    </div>
    <div class="pagination">
</div>
</div>

				</div>
				
			</div>
			
		</div>
	</div>
	
	<div id="modalLayer"><div class="mask"></div>
    <div class="modalContent">
        <button class="closebtn">닫기</button>

        <div style="text-align: center;">
            <label style="text-align: left">댓글내용:</label><input type="text" name="modalContent">
            <label style="text-align: left">댓글쓴이:</label><input type="text" name="modalReplyer">
            
            
            
            
        </div>
        <div style="text-align: center;">
            <button class="mbtn">수정</button>
            

        </div>
    </div>
</div>

<div id="reModalLayer"><div class="reMask"></div>
    <div class="reModalContent">
        <button class="reClosebtn">닫기</button>
대댓글 달기
        <div style="text-align: center;">
            <label style="text-align: left">댓글내용:</label><input type="text" name="reModalContent">
         <!--    <label style="text-align: left">댓글쓴이:</label><input type="text" name="reModalReplyer"> -->
            

            <label style="text-align: left">댓글쓴이:</label><%-- <input type="text" name="reModalReplyer" 
        			value='<sec:authentication property="principal.username"/>'	readonly="readonly" 
        			placeholder='<sec:authentication property="principal.username"/>' /> --%>
        			<input type="text" name="replyer" 
        			value='user01' />

            
            
        </div>
        <div style="text-align: center;">
            <button class="reRegister">등록</button>
            
        </div>
    </div>
</div>


	
	<form role="form" action="remove" method="post">

		<input type="hidden" name="bno" value="${vo.bno}">


	<input type="hidden" name="keyword" value="${cri.keyword}">
			 <input type="hidden" name="page" value="${cri.page}">
			<input type="hidden" name="type" value="${cri.type}">
			<input type="hidden" name = "${_csrf.parameterName}" value ="${_csrf.token}">
			
	</form>

	<script src="https://code.jquery.com/jquery-3.3.1.min.js"
		integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
		crossorigin="anonymous"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=59e8318797fd6445767e2561cad63793"></script>
			
		
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script id="templateAttach" type="text/x-handlebars-template">
<li data-src='{{fullName}}'>
<span class="mailbox-attachment-icon has-img"><img src="{{imgsrc}}" alt="Attachment"><span>
<div class="mailbox-attachment-info">
<a href="{{getLink}}" class="mailbox-attachment-name">{{fileName}}</a>
</span>
</div>
</li>
</script>
	
	<script>
		 
		$(document).ready(function(e) {
			var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
			var options = { //지도를 생성할 때 필요한 기본 옵션
				center: new daum.maps.LatLng(37.526571, 126.933590), //지도의 중심좌표.
				level: 3 //지도의 레벨(확대, 축소 정도)
			};

			var map = new daum.maps.Map(container, options); //지도 생성 및 객체 리턴
			// 마커가 표시될 위치입니다 
			var markerPosition  = new daum.maps.LatLng(37.526571, 126.933590); 

			// 마커를 생성합니다
			var marker = new daum.maps.Marker({
			    position: markerPosition
			});

			// 마커가 지도 위에 표시되도록 설정합니다
			marker.setMap(map);
			
			
			var replyCnt = ${vo.recnt};
			console.log("reviewCnt",reviewCnt);
		    	/* 목록가기 */
					$(".actions").on("click",".list", function(e) {

						self.location="/freeboard/list${cri.makeSearch(cri.page)}";

					});
					
				/* 삭제  */
					var formObj = $("form[role='form']");
				
					$(".actions").on("click",".remove", function(e) {
						
						if(reviewCnt>0){
							alert("댓글이 달린 게시물을 삭제할 수 없습니다.");
							return;
						}
						var arr=[];
						$(".uplodedList li").each(function(index){
							arr.push($(this).attr("data-src"));
						});
						
						if(arr.length >0){
							$.post("/deleteAllFiles",{files:arr},function(){
								
							});
						}				

						formObj.attr("action","/freeboard/remove")					

						formObj.submit();
					});
					
				/* 수정  */
					$(".actions").on("click",".modify", function(e) {

						var bno = $(this).attr("data-bno");
						alert("첨부파일이 다 삭제되는데도 수정하실건가요?");
						
						self.location="/freeboard/modify${cri.makeSearch(cri.page)}&bno="+bno;

					});
					
					var msg = '<c:out value="${msg}"/>';
                    
                    if(msg=="success" && !history.state){
                        alert("수정이 완료되었습니다.");
                    	}
                    if(msg=="fail" && !history.state){
                        alert("수정 실패하였습니다. 내용을 똑바로 입력하세요.");
                    	}
                    history.replaceState({}, null, null);
                 
                });

		
	</script>
<script>
    $(document).ready(function () {
        var inputContent = $("input[name='content']");
        var inputReplyer = $("input[name='replyer']");
        var modifyContent = $("input[name='modalContent']");
        var modifyReplyer = $("input[name='modalReplyer']");
        var reContent = $("input[name='reModalContent']");
        var reReplyer = $("input[name='reModalReplyer']");

        var rbtn = $(".rbtn");
        var mbtn = $(".mbtn");
        var dbtn = $(".dbtn");
        var listUL = $(".listDiv");

        var bno = ${vo.bno};

        var reviewPage = 1;
        var gno=1;

        var csrfToken = "${_csrf.token}";

        function setCsrf(token){
        	
        	$.ajaxSetup({
                headers:
                { 'X-CSRF-TOKEN':token }
            });
        	
        }

        function loadList(bno, page) {
           reviewPage = page || 1;
            /* var bno = bno || 1; */
            $.getJSON("/reviews/list/" + bno + "/" + page + ".json", function (data) {

                console.log(data.reviewCnt);
                console.log(data.list);
                var str = "";
                $(data.list).each(function (idx, data) {
                    var regdate = new Date(data.regdate);
                    console.log("ord===",data)
                    if(data.ord==1){
                    	str += "<li>" + "<span data-rno = '" + data.rno + "'>"
                    	+"&emsp;"+"<span style='color:crimson'>"+"[Re:]"+"</span>"
                    	+"글쓴이: " +data.replyer+ "<br>"
                    	+"&emsp;&emsp;&emsp;내용: "+ data.rcontent + "</span></li>"
                        +"<div id=datestyle>"
                        +"&nbsp&nbsp"+"<span id=modibtn data-rno = '" + data.rno + "'><a>수정</a></span>"
                        +"&nbsp&nbsp"+"<a class=dbtn data-rno = '" + data.rno + "'data-ord = '"+data.ord+"'>삭제</a> "
                        +"날짜 :   "+ formatDate(regdate) + "</div><hr>";
                    	
                    }else if(data.replyer!=""){
                    	str += "<li>" + "<span data-rno = '" + data.rno + "'>"
                    	 +"글쓴이: " +data.replyer+ "<br>"
                    	 +"내용: "+ data.rcontent + "</span></li>"
                         +"<div id=datestyle><a class=rerebtn data-rno = '"+data.rno+"'>답댓글</a>"
                         +"&nbsp&nbsp"+"<span id=modibtn data-rno = '" + data.rno + "'><a>수정</a></span>"
                         +"&nbsp&nbsp"+"<a class=dbtn data-rno = '" + data.rno 
                         + "' data-ord = '"+data.ord+"'>삭제</a> "
                         +"날짜 :   "+ formatDate(regdate) + "</div><hr>";
                    }else{
                    	str += "<li>" + "<span data-rno = '" + data.rno + "' style='color:gray'>"
                   	 +"<br>"
                   	 + data.rcontent + "</span></li>"
                        +"<br><hr>";
                    	
                    }
                    	
                });
                listUL.html("<hr>"+str);
                showReviewPage(replyPage, data.reviewCnt);
                console.log("로드리스트 페이지는"+reviewPage);
            })
        }

        loadList(bno, 1);


        function saveReviews(ord, inputgno) {

        	console.log("inputval"+inputContent.val());
        	console.log("inputval"+reContent.val());     		
        		 if(ord == 0){
        			 
        			 if(inputContent.val()!="" && inputReplyer.val()!=""){       				 

        				var data = {bno: bno, rcontent: inputContent.val(), replyer: inputReplyer.val(), ord:0};

        			}else {
                		alert("내용을 똑바로 입력하세요 ㅡ_ㅡ!!"); return;
                	}
        		 }else{
        			if(reContent.val()!="" && reReplyer.val()!=""){

        				var data = {bno: bno, rcontent: reContent.val(), replyer: reReplyer.val(),ord:1, gno: inputgno};

        			}else {
        	        		alert("내용을 똑바로 입력하세요 ㅡ_ㅡ!!"); return;
        	        	}
        			}
        		 
        		 setCsrf(csrfToken);
        		 
            	$.ajax({
               	 type: 'post',
               	 url: "/reviews/new",
               	 headers: {
               	     "Content-type": "application/json"
               	 },
               	 dataType: "text",
               	 data: JSON.stringify(data),
               	 success: function (result) {
               	     

                     loadList(bno, 1);

                     alert("등록이 완료되었습니다.");
                     inputContent.val("");
                     inputReplyer.val("");
                     reContent.val("");
                     reReplyer.val("");
                     
                }
            });      		
        	
            console.log("세이브리플 페이지는"+reviewPage);
        }

        function readReviews(rno, page) {

            $.getJSON("/reviews/" + rno + ".json", function (data) {
                
				var reviewPage = page;
                modifyContent.val(data.rcontent);
                modifyReplyer.val(data.replyer);
                mbtn.attr("data-rno", rno);
                dbtn.attr("data-rno", rno);
            });
            console.log("리드 리플 페이지는"+reviewPage);
        }

        function modifyReviews() {
            var rno = mbtn.attr("data-rno");
            var data = {rcontent: modifyContent.val(), replyer: modifyReplyer.val()};
            
            setCsrf(csrfToken);
            
            $.ajax({
                type: 'put',
                url: "/reviews/" + rno,
                headers: {
                    "Content-type": "application/json"
                },
                dataType: "text",
                data: JSON.stringify(data),
                success: function (result) {
                    

                    loadList(bno, reviewPage);

                    modalLayer.fadeOut("slow");
                }
            });
        }

        function deleteReviews(rno,ord) {
        	
            $.ajax({
                type: 'delete',
                url: "/reviews/" + rno +"/" + ord,
                headers: {
                    "Content-type": "application/json"
                },
                dataType: "text",
                
                success: function (result) {
                    

                    loadList(bno, reviewPage);

                }
            });
        }

        $(".pagination").on("click", "a", function (e) {
            e.preventDefault();
            console.log("hi~~~");
            reviewPage = $(this).attr("href");


            loadList(bno, reviewPage);


        });
        
        
        
        
        listUL.on("click",".dbtn", function (e) {

            var rno = $(this).attr("data-rno");
            var ord = $(this).attr("data-ord");

            if (confirm(rno + "번 글을 삭제하시겠습니까?")) {
                deleteReviews(rno,ord);
               
            }

        });
         


        rbtn.on("click", function (e) {
            saveReviews(0);
        });
        
      

        var modalLayer = $("#modalLayer");
        var modalCont = $(".modalContent");
        var marginLeft = modalCont.outerWidth() / 2;
        var marginTop = modalCont.outerHeight() / 2;
        
        var reModalLayer = $("#reModalLayer");
        var reModalCont = $(".reModalContent");
        var reMarginLeft = reModalCont.outerWidth() / 2;
        var reMarginTop = reModalCont.outerHeight() / 2;
        
        var reviewNumber;
        
        listUL.on("click",".rerebtn", function(e){
         reviewNumber = $(this).attr("data-rno");
       	 reModalLayer.fadeIn("slow");
       	 reModalCont.css({"margin-top": -reMarginTop, "margin-left": -reMarginLeft});
         $(this).blur();
         $(".reModalContent > a").focus();
        
         
         
       });
        $(".reRegister").on("click", function(e){
       		
        	saveReviews(1,reviewNumber);
        	reModalLayer.fadeOut("slow");
     
   		});

       
        
        listUL.on("click", "#modibtn", function (e) {
            var rno = $(this).attr("data-rno");
            readReviews(rno, reviewPage);
            modalLayer.fadeIn("slow");
            modalCont.css({"margin-top": -marginTop, "margin-left": -marginLeft});
            $(this).blur();
            $(".modalContent > a").focus();
        });

       

        $(".modalContent > .closebtn").click(function () {
            modalLayer.fadeOut("slow");

        });
        
        $(".reModalContent > .reClosebtn").click(function () {
            reModalLayer.fadeOut("slow");

        });

        mbtn.on("click", function (e) {
            modifyReviews();
            alert("수정되었습니다.");
        });
        

        var bno = ${vo.bno};
        var template = Handlebars.compile($("#templateAttach").html());
        
        $.getJSON("/freeboard/getAttach/"+bno, function(list){

        	$(list).each(function(){
        		
        		
        		
        		var fileInfo = getFileInfo(this);
        		
        		var html = template(fileInfo);
        		console.log("fileInfo......",fileInfo)
        		$(".uploadedList").append(html);
        	});
        });
        
        $(".uploadedList").on("click",".mailbox-attachment-info a", function(e){
        	/* e.stopPropagation(); */
        	
        	console.log("1111111111111111");
        	var fileLink = $(this).attr("href");
        	
        	if(checkImageType(fileLink)){
        	e.preventDefault();

        	var imgTag = $("#popup_img");
        	imgTag.attr("src",fileLink);
        	
        	console.log(imgTag.attr("src"));
        	
        	$(".popup").show('slow');
        	imgTag.addClass("show");
        	}
        });
        	
       $("#popup_img").on("click", function(){
    	  
    	   $(".popup").hide('slow');
       });

        
      

    });

</script>

<script type="text/javascript" src="/resources/js/pageMaker.js"></script>	

<script type="text/javascript" src="/resources/js/upload.js?ver=3"></script>	

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
		<div class="copyright">Untitled. All rights reserved.</div>
	</footer>
	<!-- Scripts -->
	<script src="/resources/js/jquery.min.js"></script>
	<script src="/resources/js/jquery.scrollex.min.js"></script>
	<script src="/resources/js/skel.min.js"></script>
	<script src="/resources/js/util.js"></script>
	<script src="/resources/js/main.js"></script>
</body>
</html>