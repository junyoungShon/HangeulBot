<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		<link rel="stylesheet" type="text/css" href="css/style.css" />
		<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
		<script src="js/modernizr.custom.js"></script>
		<script src="js/jquery.cbpFWSlider.js"></script>
	</head>
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
	<body>
		<div class="container">
			<header class="clearfix">
				<a href="${initParam.root}index.do">
					<span>한글봇</span>
				</a>
				<h1>낱말 맞추기</h1>
				<nav>
					<a href="#" class="icon-arrow-left" data-info="메인화면으로">Previous Blueprint</a>
					<a href="#" class="icon-drop" data-info="?">back to the Codrops article</a>
				</nav>
			</header>
			<div id="cbp-fwslider" class="cbp-fwslider">
				<ul>
					<c:forEach items="${requestScope.questionList}" var="questionList" varStatus="status">
						<li align="center" valign="middle">
							<img width="300px" src="images/wordList/${questionList}.jpg" alt="${questionList}"/>
							<img width="300px" src="images/wordList/${questionList}_가이드.png" alt="${questionList}_가이드"/>
						</li>
					</c:forEach>
				</ul>
			</div>
		</div>
		<br><br>
		<div align="center">
			<input type="text" name="input">
			<input type="button" value="제출" onclick="move()">
		</div>
	</body>
</html>