<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
        <title>한글봇 콘텐츠</title>
        <!-- Bootstrap Core CSS -->
        <link href="${initParam.root}bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <!-- Font Awesome CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
        <!-- Custom CSS -->
        <link href="${initParam.root}css/style.css" rel="stylesheet">
        <!-- Custom Fonts -->
        <link href='http://fonts.googleapis.com/css?family=Lobster' rel='stylesheet' type='text/css'>
   		<link rel="stylesheet" type="text/css" href="${initParam.root}css/component.css" />
		<script src="${initParam.root}js/modernizr.js"></script> <!-- Modernizr -->
	    <link rel="stylesheet" href="https://npmcdn.com/flickity@1.2/dist/flickity.min.css">
		
    </head>
<style>
.carousel-cell{
	text-align: center;
	width:33%;
}
.hangeulbotCard {
	border-radius: 25px;
	width: 800px;
	height: 600px;
	margin-top: 10%;
	margin: 0 auto;
	vertical-align:center;
	text-align: center;
	background-color: rgba(255, 255, 255, 0.7);
	padding: 10px;
}

.hangeulbotCard>.page-header {
	margin-bottom: 60px
}

.hangeulbotCard>.contentsInst {
	margin-bottom: 60px
}

.contentsPicture {
	width: 400px;
	height: 300px;
	float: left;
	margin-left: 10px;

}

.contentsText {
	color: black;
	width: 350px;
	height: 300px;
	float: right;
}

.contentsPlay {
	position: relative;
	width: 600px;
	height: 200px;
	margin-top: 400px;
	margin-left: 100px;
}
.main-carousel{
	margin-top:10%;
}
.carousel-cell {
	width: 100%;
}
</style>
<body>
<body>
	<a class="cd-nav-trigger cd-text-replace" href="#primary-nav">Menu<span aria-hidden="true" class="cd-icon"></span></a>
	
	<div class="cd-projects-container">
		<ul class="cd-projects-previews">
			<li>
				<a href="#0">
					<div class="cd-project-title">
						<h2>파닉스 교육!</h2>
						<p></p>
					</div>
				</a>
			</li>
			<li>
				<a href="#0">
					<div class="cd-project-title">
						<h2>낱말 놀이!</h2>
					</div>
				</a>
			</li>
			<li>
				<a href="#0">
					<div class="cd-project-title">
						<h2>한글봇 게임!</h2>
					</div>
				</a>
			</li>
			<li>
				<a href="#0">
					<div class="cd-project-title">
						<h2>학습 통계!</h2>
					</div>
				</a>
			</li>
		</ul> <!-- .cd-projects-previews -->

		<ul class="cd-projects">
			<!-- 파닉스 -->
			<li>
				<div class="preview-image">
						<div class="container-fluid">
                        <div class="main-carousel" style="width:100%; text-align: center" >
                          
                          <div class="carousel-cell" >
                          	
                            <div class="hangeulbotCard">
                            	<div class="page-header">
								  <h1 style="color:black">모음편! <small> - 파닉스 교육</small></h1>
								</div>
								<div class="contentsInst">
	                                <div class="contentsPicture">
	                                    <img src="img/1.jpg" style="width:400px;height:300px">
	                                </div>
	                                <div class="contentsText">
	                                   	<blockquote>
										  <p class="text-left">파닉스 모음편의 효과는?</p>
										  <footer class="text-left">이거 엄청좋아 따로공부하니까 애들이 잘해 <cite title="Source Title"></cite></footer>
										</blockquote>
										<blockquote>
										  <p class="text-left">플레이한 아이의 평균연령은?</p>
										  <footer  class="text-left">3.4세 <cite title="Source Title"></cite></footer>
										</blockquote>
										<blockquote>
										  <p class="text-left">우리아이가 이전에 한적있나 ?</p>
										  <footer  class="text-left">2016.05.02에 플레이했고, 12분 동안 70%의 정답을 맞췄어 <cite title="Source Title"></cite></footer>
										</blockquote>
	                               </div>
                               </div>
                            	<div class="contentsPlay">
                                  <button type="button" class="btn btn-success btn-lg btn-block" >
                                   <span class="glyphicon glyphicon-education" aria-hidden="true"></span> P l a y !</button>
                            	</div>
                            </div>  
                          </div>
                          <div class="carousel-cell">
                            <div class="hangeulbotCard">
                            	<div class="page-header">
								  <h1 style="color:black">모음편! <small> - 파닉스 교육</small></h1>
								</div>
								<div class="contentsInst">
	                                <div class="contentsPicture">
	                                    <img src="img/1.jpg" style="width:400px;height:300px">
	                                </div>
	                                <div class="contentsText">
	                                   	<blockquote>
										  <p class="text-left">파닉스 모음편의 효과는?</p>
										  <footer class="text-left">이거 엄청좋아 따로공부하니까 애들이 잘해 <cite title="Source Title"></cite></footer>
										</blockquote>
										<blockquote>
										  <p class="text-left">플레이한 아이의 평균연령은?</p>
										  <footer  class="text-left">3.4세 <cite title="Source Title"></cite></footer>
										</blockquote>
										<blockquote>
										  <p class="text-left">우리아이가 이전에 한적있나 ?</p>
										  <footer  class="text-left">2016.05.02에 플레이했고, 12분 동안 70%의 정답을 맞췄어 <cite title="Source Title"></cite></footer>
										</blockquote>
	                               </div>
                               </div>
                            	<div class="contentsPlay">
                                  <button type="button" class="btn btn-success btn-lg btn-block" >
                                   <span class="glyphicon glyphicon-education" aria-hidden="true"></span> P l a y !</button>
                            	</div> 
                        </div>
                        </div>
                          <div class="carousel-cell">
                            <div class="hangeulbotCard">
                            	<div class="page-header">
								  <h1 style="color:black">모음편! <small> - 파닉스 교육</small></h1>
								</div>
								<div class="contentsInst">
	                                <div class="contentsPicture">
	                                    <img src="img/1.jpg" style="width:400px;height:300px">
	                                </div>
	                                <div class="contentsText">
	                                   	<blockquote>
										  <p class="text-left">파닉스 모음편의 효과는?</p>
										  <footer class="text-left">이거 엄청좋아 따로공부하니까 애들이 잘해 <cite title="Source Title"></cite></footer>
										</blockquote>
										<blockquote>
										  <p class="text-left">플레이한 아이의 평균연령은?</p>
										  <footer  class="text-left">3.4세 <cite title="Source Title"></cite></footer>
										</blockquote>
										<blockquote>
										  <p class="text-left">우리아이가 이전에 한적있나 ?</p>
										  <footer  class="text-left">2016.05.02에 플레이했고, 12분 동안 70%의 정답을 맞췄어 <cite title="Source Title"></cite></footer>
										</blockquote>
	                               </div>
                               </div>
                            	<div class="contentsPlay">
                                  <button type="button" class="btn btn-success btn-lg btn-block" >
                                   <span class="glyphicon glyphicon-education" aria-hidden="true"></span> P l a y !</button>
                            	</div>
                            </div>
                   
                        </div>
                        </div>
					
				</div>
				</div>
				
			</li>

			<li>
			<!-- 낱말놀이-->
			<div class="preview-image">
						<div class="container-fluid">
                        <div class="main-carousel" style="width:100%; text-align: center" >
                          
                          <div class="carousel-cell" >
                          
                            <div class="hangeulbotCard">
                            	<div class="page-header">
								  <h1 style="color:black">랜덤 낱말놀이 <small> - 낱말 놀이</small></h1>
								</div>
								<div class="contentsInst">
	                                <div class="contentsPicture">
	                                    <img src="img/1.jpg" style="width:400px;height:300px">
	                                </div>
	                                <div class="contentsText">
	                                   	<blockquote>
										  <p class="text-left">랜덤 낱말놀이 효과는?</p>
										  <footer class="text-left">이거 엄청좋아 따로공부하니까 애들이 잘해 <cite title="Source Title"></cite></footer>
										</blockquote>
										<blockquote>
										  <p class="text-left">플레이한 아이의 평균연령은?</p>
										  <footer  class="text-left">3.4세 <cite title="Source Title"></cite></footer>
										</blockquote>
										<blockquote>
										  <p class="text-left">우리아이가 이전에 한적있나 ?</p>
										  <footer  class="text-left">2016.05.02에 플레이했고, 12분 동안 70%의 정답을 맞췄어 <cite title="Source Title"></cite></footer>
										</blockquote>
	                               </div>
                               </div>
                            	<div class="contentsPlay">
                                  <a href="${initParam.root}goNewWordGame.do"  class="btn btn-success btn-lg btn-block">
                                   <span class="glyphicon glyphicon-education" aria-hidden="true"></span> P l a y !</a>
                            	</div>
                            </div>  
                          </div>
                          <div class="carousel-cell">
                            <div class="hangeulbotCard">
                            	<div class="page-header">
								  <h1 style="color:black">동물 낱말놀이!<small> - 낱말 놀이</small></h1>
								</div>
								<div class="contentsInst">
	                                <div class="contentsPicture">
	                                    <img src="img/1.jpg" style="width:400px;height:300px">
	                                </div>
	                                <div class="contentsText">
	                                   	<blockquote>
										  <p class="text-left">파닉스 모음편의 효과는?</p>
										  <footer class="text-left">이거 엄청좋아 따로공부하니까 애들이 잘해 <cite title="Source Title"></cite></footer>
										</blockquote>
										<blockquote>
										  <p class="text-left">플레이한 아이의 평균연령은?</p>
										  <footer  class="text-left">3.4세 <cite title="Source Title"></cite></footer>
										</blockquote>
										<blockquote>
										  <p class="text-left">우리아이가 이전에 한적있나 ?</p>
										  <footer  class="text-left">2016.05.02에 플레이했고, 12분 동안 70%의 정답을 맞췄어 <cite title="Source Title"></cite></footer>
										</blockquote>
	                               </div>
                               </div>
                            	<div class="contentsPlay">
                                  <button type="button" class="btn btn-success btn-lg btn-block" >
                                   <span class="glyphicon glyphicon-education" aria-hidden="true"></span> P l a y !</button>
                            	</div> 
                        </div>
                        </div>
                          <div class="carousel-cell">
                            <div class="hangeulbotCard">
                            	<div class="page-header">
								  <h1 style="color:black">국기 낱말놀이!<small> - 낱말 놀이</small></h1>
								</div>
								<div class="contentsInst">
	                                <div class="contentsPicture">
	                                    <img src="img/1.jpg" style="width:400px;height:300px">
	                                </div>
	                                <div class="contentsText">
	                                   	<blockquote>
										  <p class="text-left">파닉스 모음편의 효과는?</p>
										  <footer class="text-left">이거 엄청좋아 따로공부하니까 애들이 잘해 <cite title="Source Title"></cite></footer>
										</blockquote>
										<blockquote>
										  <p class="text-left">플레이한 아이의 평균연령은?</p>
										  <footer  class="text-left">3.4세 <cite title="Source Title"></cite></footer>
										</blockquote>
										<blockquote>
										  <p class="text-left">우리아이가 이전에 한적있나 ?</p>
										  <footer  class="text-left">2016.05.02에 플레이했고, 12분 동안 70%의 정답을 맞췄어 <cite title="Source Title"></cite></footer>
										</blockquote>
	                               </div>
                               </div>
                            	<div class="contentsPlay">
                                  <button type="button" class="btn btn-success btn-lg btn-block" >
                                   <span class="glyphicon glyphicon-education" aria-hidden="true"></span> P l a y !</button>
                            	</div>
                            </div>
                   
                        </div>
                        </div>
					
				</div>
				</div>
			</li>
			<!-- 한글봇 게임 -->
			<li>
				<div class="preview-image">
						<div class="container-fluid">
                        <div class="main-carousel" style="width:100%; text-align: center" >
                          
                          <div class="carousel-cell" >
                          
                            <div class="hangeulbotCard">
                            	<div class="page-header">
								  <h1 style="color:black">한글봇 베네치아! <small> - 한글봇 게임</small></h1>
								</div>
								<div class="contentsInst">
	                                <div class="contentsPicture">
	                                    <img src="img/1.jpg" style="width:400px;height:300px">
	                                </div>
	                                <div class="contentsText">
	                                   	<blockquote>
										  <p class="text-left">한글봇 동물농장의 효과는?</p>
										  <footer class="text-left">이거 엄청좋아 따로공부하니까 애들이 잘해 <cite title="Source Title"></cite></footer>
										</blockquote>
										<blockquote>
										  <p class="text-left">플레이한 아이의 평균연령은?</p>
										  <footer  class="text-left">3.4세 <cite title="Source Title"></cite></footer>
										</blockquote>
										<blockquote>
										  <p class="text-left">우리아이가 이전에 한적있나 ?</p>
										  <footer  class="text-left">2016.05.02에 플레이했고, 12분 동안 70%의 정답을 맞췄어 <cite title="Source Title"></cite></footer>
										</blockquote>
	                               </div>
                               </div>
                            	<div class="contentsPlay">
                                  <a href="${initParam.root}${initParam.root}goVenezia3.do" class="btn btn-success btn-lg btn-block" >
                                   <span class="glyphicon glyphicon-education" aria-hidden="true"></span> P l a y !</a>
                            	</div>
                            </div>  
                          </div>
                          <div class="carousel-cell">
                            <div class="hangeulbotCard">
                            	<div class="page-header">
								  <h1 style="color:black">한글봇 베네치아! <small> - 한글봇 게임</small></h1>
								</div>
								<div class="contentsInst">
	                                <div class="contentsPicture">
	                                    <img src="img/1.jpg" style="width:400px;height:300px">
	                                </div>
	                                <div class="contentsText">
	                                   	<blockquote>
										  <p class="text-left">한글봇 베네치아! 효과는?</p>
										  <footer class="text-left">이거 엄청좋아 따로공부하니까 애들이 잘해 <cite title="Source Title"></cite></footer>
										</blockquote>
										<blockquote>
										  <p class="text-left">플레이한 아이의 평균연령은?</p>
										  <footer  class="text-left">3.4세 <cite title="Source Title"></cite></footer>
										</blockquote>
										<blockquote>
										  <p class="text-left">우리아이가 이전에 한적있나 ?</p> 
										  <footer  class="text-left">2016.05.02에 플레이했고, 12분 동안 70%의 정답을 맞췄어 <cite title="Source Title"></cite></footer>
										</blockquote>
	                               </div>
                               </div>
                            	<div class="contentsPlay">
                                 <a href="${initParam.root}goVeneziaGame.do" class="btn btn-success btn-lg btn-block" >
                                   <span class="glyphicon glyphicon-education" aria-hidden="true"></span> P l a y !</a>
                            	</div> 
                        </div>
                        </div>
                          <div class="carousel-cell">
                            <div class="hangeulbotCard">
                            	<div class="page-header">
								  <h1 style="color:black">한글봇 어떤 게임! <small> - 한글봇 게임</small></h1>
								</div>
								<div class="contentsInst">
	                                <div class="contentsPicture">
	                                    <img src="img/1.jpg" style="width:400px;height:300px">
	                                </div>
	                                <div class="contentsText">
	                                   	<blockquote>
										  <p class="text-left">파닉스 모음편의 효과는?</p>
										  <footer class="text-left">이거 엄청좋아 따로공부하니까 애들이 잘해 <cite title="Source Title"></cite></footer>
										</blockquote>
										<blockquote>
										  <p class="text-left">플레이한 아이의 평균연령은?</p>
										  <footer  class="text-left">3.4세 <cite title="Source Title"></cite></footer>
										</blockquote>
										<blockquote>
										  <p class="text-left">우리아이가 이전에 한적있나 ?</p>
										  <footer  class="text-left">2016.05.02에 플레이했고, 12분 동안 70%의 정답을 맞췄어 <cite title="Source Title"></cite></footer>
										</blockquote>
	                               </div>
                               </div>
                            	<div class="contentsPlay">
                                   <a href="${initParam.root}goVenezia2.do" class="btn btn-success btn-lg btn-block" >
                                   <span class="glyphicon glyphicon-education" aria-hidden="true"></span> P l a y !</a>
                            	</div>
                            </div>
                   
                        </div>
                        </div>
					
				</div>
				</div>


			</li>

			<li>
				<div class="preview-image">
					<div class="cd-project-title">
						<h2>학습 통계!</h2>
						<button type="button" id="reportCreateBtn" data-loading-text="리포트 생성중입니다...." class="btn btn-primary">
						  리포트 생성
						</button>
					</div> 
				</div>

		
			</li>
		</ul> <!-- .cd-projects -->

		<button class="scroll cd-text-replace">Scroll</button>
	</div> <!-- .cd-project-container -->

	<nav class="cd-primary-nav" id="primary-nav">
		<ul>
			<li class="cd-label">Navigation</li>
			<li><a href="#0">한글봇은 ?</a></li>
			<li><a href="#0">콘텐츠 소개</a></li>
			<li><a href="#0">제품 구입하기</a></li>
			<li><a href="#0">Contact us</a></li>
		</ul>
	</nav> <!-- .cd-primary-nav -->
	<!-- 곻통부분 시작 -네비게이션 버튼  -->
     <div class="component">
				<!-- Start Nav Structure -->
				<button class="cn-button" id="cn-button">-</button>
				<div class="cn-wrapper opened-nav" id="cn-wrapper">
				    <ul>
				      <li><a href="${initParam.root}index.do"><span class="fa fa-arrow-up"></span></a></li>
				      <li class="bluetoothBtn"><a href="#" class="connectInfo"><h4>연결필요</h4><span class="fa fa-bluetooth"></span></a></li>
				      <li><a href="${initParam.root}index.do"><span class="fa fa-home"></span></a></li>
				      <li><a href="#"><span class="fa fa-bar-chart"></span></a></li>
				      <li><a href="${initParam.root}logout.do"><span class="fa fa-sign-out"></span></a></li>
				     </ul>
				</div>
				<div id="cn-overlay" class="cn-overlay on-overlay"></div>
				<!-- End Nav Structure -->
			</div>
          <!-- Javascript & jQuery -->
       
        <script src="${initParam.root}js/jquery-2.1.1.min.js"></script>
        <script src="${initParam.root}js/script.js"></script>
        <script src="${initParam.root}js/jquery.appear.js"></script>
        

      
    <script src="${initParam.root}js/main.js"></script> <!-- Resource jQuery -->
    <script src="${initParam.root}js/polyfills.js"></script> <!-- Resource jQuery -->
    <script src="https://npmcdn.com/flickity@1.2/dist/flickity.pkgd.min.js"></script>
        <!-- 합쳐지고 최소화된 최신 자바스크립트 -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    <script src="${initParam.root}js/hangeulBotBlutoothConnector.js"></script>
    
		<script>
			$(document).ready(function(){
				
				setTimeout(function(){
					$('#cn-button')[0].click();
			   	},2000);
				
                 $('.main-carousel').flickity({
                  // options
                  cellAlign: 'left',
                  contain: true,
                });           
						
					  $('#reportCreateBtn').on('click', function () {
					    var $btn = $(this);
					    $btn.button('리포트 생성중입니다...');
					    // business logic...
					    setTimeout(function(){
					   		location.href='${initParam.root}member_goParentsPage.do';
					   	 	$btn.button('reset');
					   	},2000);
					  })
					});
		</script>
        

        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
		<script type="text/javascript">
		$(document).ready(function(){
			var broswerInfo = navigator.userAgent;
			/*var bluetoothConnectionStatus = */
			if(broswerInfo.indexOf("HangeulBotAndroidAPP")>-1){
				//페이지 로딩 시 블루투스 상태를 체크하고 Componenet를 수정해준다
				checkBluetoothState();
			}else{
				alert("앱으로 접속하지 않으셨습니다. 정상적인 사용이 불가능합니다.");
			}
			
			
			$('.bluetoothBtn').click(function(){
				if($('.connectInfo').text()=='연결양호'){
					if(confirm('이미 블루투스가 연결된 상태입니다!\n 연결을 종료하시겠습니까?')){
						//블루투스 연결 종료
					};
				}else if($('.connectInfo').text()=='연결필요'){
					turnOnbluetooth();
					$('.connectInfo').html('<h4>연결중..</h4><span class="fa fa-bluetooth"></span>');
				}
				
			})
			
			
		});
		function bluetoothDisconnected(){
			alert('블루 투스 연결이 해제되었습니다.');
			$('.connectInfo').html('<h4>연결필요</h4><span class="fa fa-bluetooth"></span>');
		}
		function checkBluetoothState(){
			window.HangeulBotAndroidAPP.checkBluetoothState();
		}
		function returnBtState(btState){
			if(btState=='disConnect'){
				$('.connectInfo').html('<h4>연결필요</h4><span class="fa fa-bluetooth"></span>');
			}else{
				$('.connectInfo').html('<h4>연결양호</h4><span class="fa fa-bluetooth"></span>');
			}
		}
		function turnOnbluetooth(){
			window.HangeulBotAndroidAPP.turnOnbluetooth();
		}
		function getBluetoothMsg(Msg){
			$('#latestMSG').val(Msg);
			$('#connectStatus').val("connected");
			alert('정상적으로 값이 전송되었습니다.');
		}
		function getBluetoothInfo(macAdreess){
			$('#MacAddress').val(macAdreess);
			$('#connectStatus').val("connected");
			alert('블루투스 연결이 정상적으로 이루어졌습니다.');
			$('.connectInfo').html('<h4>연결양호</h4><span class="fa fa-bluetooth"></span>');
		}
		function lostConnection(){
			alert('연결이실패하였습니다.');
		}

/* 		function turnOnbluetooth(){
			var broswerInfo = navigator.userAgent;
			//위시룸 안드로이드 앱이 맞다면 아래 내용 실행
			window.HangeulBotAndroidAPP.turnOnbluetooth();
		}
		
		 */
		/* 	function turnOnbluetooth(){
				var broswerInfo = navigator.userAgent;
				//위시룸 안드로이드 앱이 맞다면 아래 내용 실행
				window.HangeulBotAndroidAPP.turnOnbluetooth();
			}
			function getBluetoothInfo(macAdreess){
				$('#MacAddress').val(macAdreess);
				$('#connectStatus').val("connected");
				alert('블루투스 연결이 정상적으로 이루어졌습니다.');
			}
			function getBluetoothMsg(Msg){
				$('#latestMSG').val(Msg);
				$('#connectStatus').val("connected");
				alert('정상적으로 값이 전송되었습니다.');
			}
			 */
		</script>
    </body>
    
</html>
