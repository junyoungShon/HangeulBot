<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
		<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
		<title>재미있는 한글 블럭 놀이! 한글봇</title>
		<meta name="description" content="Blueprint: " />
		<meta name="keywords" content="" />
		<meta name="author" content="Codrops" />
		<link rel="shortcut icon" href="../favicon.ico">
		<link rel="stylesheet" type="text/css" href="css/default.css" />
		<link rel="stylesheet" type="text/css" href="css/component.css" />
		<script src="js/modernizr.custom.js"></script>
	</head>
	<body>
		<div class="container">
			<header class="clearfix">
				<span>한글봇</span>
				<h1>낱말 맞추기</h1>
				<nav>
					<a href="#" class="icon-arrow-left" data-info="메인화면으로">Previous Blueprint</a>
					<a href="#" class="icon-drop" data-info="?">back to the Codrops article</a>
				</nav>
			</header>
			<div id="cbp-fwslider" class="cbp-fwslider">
				<ul>
					<%-- <c:forEach items="${sessionScope.blliMemberVO.blliBabyVOList}" var="blliBabyVOList" varStatus="status">
						<li><a href="#"><img src="images/1.jpg" alt="img01"/></a></li>
					</c:forEach> --%>
					<li><a href="#"><img src="images/word_1_noSupport_1/가.png" alt="가"/></a></li>
					<li><a href="#"><img src="images/word_1_noSupport_1/나.png" alt="나"/></a></li>
					<li><a href="#"><img src="images/word_1_noSupport_1/다.png" alt="다"/></a></li>
					<li><a href="#"><img src="images/word_1_noSupport_1/라.png" alt="라"/></a></li>
					<li><a href="#"><img src="images/word_1_noSupport_1/마.png" alt="마"/></a></li>
					<li><a href="#"><img src="images/word_1_noSupport_1/바.png" alt="바"/></a></li>
					<li><a href="#"><img src="images/word_1_noSupport_1/사.png" alt="사"/></a></li>
					<li><a href="#"><img src="images/word_1_noSupport_1/아.png" alt="아"/></a></li>
					<li><a href="#"><img src="images/word_1_noSupport_1/자.png" alt="자"/></a></li>
				</ul>
			</div>
		</div>
		<br><br>
		<div align="center">
			<input type="text" name="input">
			<input type="button" value="제출" onclick="move()">
		</div>
		<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
		<script src="js/jquery.cbpFWSlider.min.js"></script>
		<script>
			$( function() {
				/*
				- how to call the plugin:
				$( selector ).cbpFWSlider( [options] );
				- options:
				{
					// default transition speed (ms)
					speed : 500,
					// default transition easing
					easing : 'ease'
				}
				- destroy:
				$( selector ).cbpFWSlider( 'destroy' );
				*/

				$( '#cbp-fwslider' ).cbpFWSlider();

			} );
			
		</script>
	</body>
</html>
