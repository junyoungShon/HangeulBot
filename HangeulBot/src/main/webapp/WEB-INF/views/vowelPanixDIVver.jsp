<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>자음 파닉스</title>
</head>
<meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Elevator - Multipurpose Bootstrap Theme</title>

        <!-- Bootstrap Core CSS -->
        <link href="${initParam.root}bootstrap/css/bootstrap.min.css" rel="stylesheet">

        <!-- Font Awesome CSS -->
        <link href="${initParam.root}css/font-awesome.min.css" rel="stylesheet">
		
		<!-- Custom CSS -->
        <link href="${initParam.root}css/animate.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="${initParam.root}css/style.css" rel="stylesheet">

        <!-- Custom Fonts -->
        <link href='http://fonts.googleapis.com/css?family=Lobster' rel='stylesheet' type='text/css'>


        <!-- Template js -->
		<script src="${initParam.root}js/jquery-1.12.1.min.js"></script>
		<script src="${initParam.root}js/jQueryRotate.js"></script>
        <script src="${initParam.root}bootstrap/js/bootstrap.min.js"></script>
        <script src="${initParam.root}js/jquery.appear.js"></script>
        <script src="${initParam.root}js/contact_me.js"></script>
        <script src="${initParam.root}js/jqBootstrapValidation.js"></script>
        <script src="${initParam.root}js/modernizr.custom.js"></script>
        <script src="${initParam.root}js/script.js"></script>

        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
<style>
	body { 
		margin-left: 0px; 
		margin-top: 0px; 
		margin-right: 0px; 
		margin-bottom: 0px; 
		overflow: hclassden;
	}
	.textScreen {
		 position:absolute; 
		 top:50%;
		 left:50%; 
		 width:300px; 
		 height:300px; 
		 margin-top:-150px; 
		 margin-left:-150px;
		 border: thin;
	}
	.answerDiv{
	position: relative;
	margin: 0 auto;
	padding: 30px;
	}
	.arrow {display:inline-block; width:0; height:0; border-style:solclass; border-width:30px;}
	.arrow.left {border-color:transparent .7d1919 transparent transparent;}
	.arrow.right {border-color:transparent transparent transparent .7d1919;}
	.leftArrowArea{
		position:absolute;
		float: left;
		margin-left: 0px;
		height: 100%;
		padding-left:10px;
		padding-right:10px;
	}
	.rightArrowArea{
		position:absolute;
		float: right;
		margin-left: 0px;
		height: 100%;
		padding-right:10px; 
		padding-left:10px; 
	}
	.rightArrowArea:HOVER{
		background-color: gray;
	}
	.leftArrowArea:HOVER{
		background-color: gray;
	}
	.textTable{
		width: 100%;
		height: 100%;
		border: 0px;
		border-spacing:0px;border-style:none;padding:0px;
	}
	.arrowAnimationArea{
		display: none;
		position: absolute;
		background-image: url("");
		background-repeat:no-repeat;
		height: 300px;
		width : 300px;
		margin-left: 85px;
		z-index:9999;
	}
	.rotateAnimationArea{
		display: block;
		position: absolute;
		height: 300px;
		width : 300px;
	}
	.firstBlock{
		display : none;
		position : absolute;
		background-color: orange;
	}
	.secondBlock{
		display : none;
		position : absolute;
		background-color: orange;
	}
	
/* Chrome, Safari, Opera */
@-webkit-keyframes etoah {
    0%   {left:0px; top:125px;}
    100% {left:-230px; top:125px;}
}
/* Standard syntax */
@keyframes etoah {
   0%   {left:0px; top:125px;}
   100% {left:-230px; top:125px;}
}
/* Chrome, Safari, Opera */
@-webkit-keyframes ohtou {
   0%   {left:0px; top:0px;}
    33%   {left:130px; top:0px;}
    50% {left:140px; top:46px;}
    66%   {left:130px; top:93px;}
    100% {left:0px; top:86px;}
}
/* Standard syntax */
@keyframes ohtou {
   0%   {left:0px; top:0px;}
    33%   {left:130px; top:0px;}
    50% {left:140px; top:46px;}
    66%   {left:130px; top:93px;}
    100% {left:0px; top:86px;}
}

/* Chrome, Safari, Opera */
@-webkit-keyframes utoeu {
   0%   {left:0px; top:0px;}
   100% {left:0px; top:100px;}
}
/* Standard syntax */
@keyframes utoeu {
   0%   {left:0px; top:0px;}
   100% {left:0px; top:100px;}
}


</style>
<body>
	<div class="rightArrowArea">
		<span class="arrow right"></span>
	</div>
	<div class="leftArrowArea">
		<span class="arrow left"></span>
	</div>
	<div class="textScreen">
		<div class="arrowAnimationArea"></div>
		<div class="rotateAnimationArea"></div>
		<div class="firstBlock"></div>
		<div class="secondBlock"></div>
		<div class="textDiv">
			
		</div>
	</div>
	<div class="answerDiv" >
		<input type="text" class="userAnswer">
		<input type="button" value="정답!" onclick="submitAnswer()">
	</div>
						
	    <!-- Start clients Section -->
        <div class="section-modal modal fade contact" id="answerAnimation" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-content" style="background: url('${initParam.root}images/30.gif');">
                
            </div>
        </div>
</body>
<script type="text/javascript">
	//현재 정답 인덱스
	var tempQuestionIndex = 0;
	//자음 리스트
	var vowelList = ['ㅣ','ㅏ','ㅓ','ㅗ','ㅜ','ㅡ','ㅣ','ㅑ','ㅕ','ㅛ','ㅠ'];
	var vowelCoordinateList = [
	               			[{x:3,y:1},{x:3,y:2},{x:3,y:3},{x:3,y:4},{x:3,y:5}],//ㅣ
	               			[{x:3,y:1},{x:3,y:2},{x:3,y:3},{x:4,y:3},{x:3,y:4},{x:3,y:5}], //ㅏ
	               			[{x:3,y:1},{x:3,y:2},{x:3,y:3},{x:2,y:3},{x:3,y:4},{x:3,y:5}], //ㅓ
	               			[{x:1,y:3},{x:2,y:3},{x:3,y:3},{x:3,y:2},{x:4,y:3},{x:5,y:3}], //ㅗ
	               			[{x:1,y:3},{x:2,y:3},{x:3,y:3},{x:3,y:4},{x:4,y:3},{x:5,y:3}], //ㅜ
	               			[{x:1,y:3},{x:2,y:3},{x:3,y:3},{x:4,y:3},{x:5,y:3}], //ㅡ
	               			[{x:3,y:1},{x:3,y:2},{x:3,y:3},{x:3,y:4},{x:3,y:5}],//ㅣ
	               			[{x:3,y:1},{x:3,y:2},{x:3,y:3},{x:4,y:2},{x:4,y:4},{x:3,y:4},{x:3,y:5}],//ㅑ
	               			[{x:3,y:1},{x:3,y:2},{x:3,y:3},{x:2,y:2},{x:2,y:4},{x:3,y:4},{x:3,y:5}],//ㅕ
	               			[{x:1,y:3},{x:2,y:3},{x:3,y:3},{x:2,y:2},{x:4,y:2},{x:4,y:3},{x:5,y:3}],//ㅛ
	               			[{x:1,y:3},{x:2,y:3},{x:3,y:3},{x:2,y:4},{x:4,y:4},{x:4,y:3},{x:5,y:3}]//ㅠ
	               		]
	var animationRepeater;
	//애니메이션 함수 리스트
	var vowelAnimator = [
	    //ㅣ -> ㅏ
		function(flag){
	    	if(!flag){
	    		function twinkleInetoAh(){
	    			//깜빡이는 메서드
					setTimeout(function(){
						$('.y3x4').css('background-color','white')
						$('.y3x4').css('border-color','orange')
						$('.y3x4').css('border-style','dashed')
						$('.y3x4').css('width','36px')
						$('.y3x4').css('height','36px')
					}, 150);
					setTimeout(function(){
						$('.y3x4').css('background-color','white')
						$('.y3x4').css('border-color','white')
						$('.y3x4').css('border-style','none')
						$('.y3x4').css('width',300/7)
						$('.y3x4').css('height',300/7)
					}, 300); 
	    		}
	    		animationRepeater = setInterval(function(){
	    			twinkleInetoAh();
				}, 300)	
				//1개 짜리 블럭 좌우 운동 메서드
				$('.firstBlock').css('display','block');
				$('.firstBlock').css('width',300/7);
				$('.firstBlock').css('height',300/7);
				$('.firstBlock').css('margin-left',400);
				$('.firstBlock').css('-webkit-animation-name','etoah');
				$('.firstBlock').css('-webkit-animation-duration','2s');
				$('.firstBlock').css('-webkit-animation-iteration-count','infinite');
				$('.firstBlock').css('webkit-animation-delay','0s');
				$('.firstBlock').css('animation-name','etoah');
				$('.firstBlock').css('animation-duration','2s');
				$('.firstBlock').css('animation-delay','0s');
				$('.firstBlock').css('animation-delay','0s');
				$('.firstBlock').css('animation-iteration-count','infinite');
				//화살표 출력
		    	$('.arrowAnimationArea').css('display','block');
		    	$('.arrowAnimationArea').css('background-image','url("${initParam.root}images/etoahArrow.png")');
		    	$('.arrowAnimationArea').css('margin-left','240px');
		    	$('.arrowAnimationArea').css('margin-top','100px');
	    	}else{
	    		clearInterval(animationRepeater);
	    		//정답 맞추면 시작되는 마지막 애니메이션
					$('.rotateAnimationArea').fadeOut();
					$('.textDiv').fadeOut();
					$('.firstBlock').fadeOut();
					$('.arrowAnimationArea').fadeOut();
					$('.arrowAnimationArea').css('display','none');
				setTimeout(function(){
		    		//초기화 및 다음글자로 변경완료
		    		//최초 제시어에 따라 테이블 크기 세팅
					textDIVMaker('ㅏ');		
					cordinateGenerator('ㅏ');
					$('.rotateAnimationArea').fadeIn();
					$('.textDiv').fadeIn();
				}, 1000); 
	    	}
		},
		// ㅏ -> ㅓ
		function(flag){
			if(!flag){
				animation2();
				function animation2(){
					$('.arrowAnimationArea').css('display','none');
			    	$('.y3x2').css('background-color','white')
					$('.y3x2').css('border-style','dashed')
					$('.y3x2').css('border-color','orange')
					$('.y3x2').css('width',300/7)
					$('.y3x2').css('height',300/7) 
					
			    	$('.y3x4').css('background-color','orange')
					$('.y3x4').css('border-style','none')
					$('.y3x4').css('width',300/7)
					$('.y3x4').css('height',300/7) 
			    	//div 모델 움직이는 모션
					setTimeout(function(){
						//화살표 출력
				    	$('.arrowAnimationArea').css('display','block');
				    	$('.arrowAnimationArea').css('background-image','url("${initParam.root}images/aToUhArrow.png")');
				    	$('.arrowAnimationArea').css('margin-left','85px');
				    	
						$('.y3x4').css('background-color','white')
						$('.y3x4').css('border-color','orange')
						$('.y3x4').css('border-style','dashed')
						$('.y3x4').css('width','37px')
						$('.y3x4').css('height','37px')
						$('.y2x3').css('background-color','orange')
					}, 1200)
					
					setTimeout(function(){$('.y3x4').css('background-color','white')}, 1380)
					setTimeout(function(){$('.y2x5').css('background-color','orange')}, 1380)
					
					setTimeout(function(){$('.y2x5').css('background-color','white')}, 1560)
					setTimeout(function(){$('.y1x4').css('background-color','orange')}, 1560)
					
					setTimeout(function(){$('.y1x4').css('background-color','white')}, 1740)
					setTimeout(function(){$('.y0x3').css('background-color','orange')}, 1740)
		
					setTimeout(function(){$('.y0x3').css('background-color','white')}, 1920)
					setTimeout(function(){$('.y1x2').css('background-color','orange')}, 1920)
		
					setTimeout(function(){$('.y1x2').css('background-color','white')}, 2100)
					setTimeout(function(){$('.y2x2').css('background-color','orange')}, 2100)
		
					setTimeout(function(){
						$('.y2x2').css('background-color','white')
						$('.y3x2').css('background-color','orange')
						//화살표 없애기
				    	$('.arrowAnimationArea').css('display','none');
				    	$('.arrowAnimationArea').css('background-image','url("${initParam.root}images/aToUhArrow.png")');
				    	$('.arrowAnimationArea').css('margin-left','85px');
				    	$('.y3x4').css('background-color','white')
						$('.y3x4').css('border-style','none')
						$('.y3x4').css('border-color','white')
						$('.y3x4').css('width',300/7)
						$('.y3x4').css('height',300/7) 
					}, 2100)
					for(var i=0;i<7;i++){
						//깜빡이는 메서드
						if(i%2==0){
							setTimeout(function(){
								$('.y3x2').css('background-color','white')
								$('.y3x2').css('border-color','orange')
								$('.y3x2').css('border-style','dashed')
								$('.y3x2').css('width',300/7)
								$('.y3x2').css('height',300/7)
							}, 150*(i+1));
							}else{
								
							setTimeout(function(){
								$('.y3x2').css('background-color','white')
								$('.y3x2').css('border-color','white')
								$('.y3x2').css('border-style','none')
								$('.y3x2').css('width',300/7)
								$('.y3x2').css('height',300/7)
							}, 300*(i+1)); 
						}
					}
				}
				
				animationRepeater = setInterval(function(){
					animation2();
				},3000)
				
			}else{
				clearInterval(animationRepeater);
	    			//정답 맞추면 시작되는 마지막 애니메이션
				setTimeout(function(){
					$('.rotateAnimationArea').fadeOut();
					$('.textDiv').fadeOut();
					$('.firstBlock').fadeOut();
					$('.arrowAnimationArea').fadeOut();
		    		//초기화 및 다음글자로 변경완료
		    		//최초 제시어에 따라 테이블 크기 세팅
					textDIVMaker('ㅓ');		
					cordinateGenerator('ㅓ');
					$('.rotateAnimationArea').fadeIn();
					$('.textDiv').fadeIn();
				}, 3000); 
			}
		},
		
		//ㅓ->ㅗ
		function(flag){
			if(!flag){
				function animation3(){
					//화살표 출력
			    	$('.arrowAnimationArea').css('display','block');
			    	$('.arrowAnimationArea').css('background-image','url("${initParam.root}images/uhtooh.png")');
			    	$('.arrowAnimationArea').css('margin-left','120px');
					//좌표 배열을 인자로 받아 글자를 점선으로 바꾼다.(회전 될 곳을)
					var coordinateInfoArray = vowelCoordinateList[2];
					for(var i=0;i<vowelCoordinateList[2].length;i++){
						var selector = ".y"+coordinateInfoArray[i].y+"x"+coordinateInfoArray[i].x;
						$($('.rotateAnimationArea').children().children(selector)).css('background-color','white');
						$($('.rotateAnimationArea').children().children(selector)).css('border-style','dashed');
						$($('.rotateAnimationArea').children().children(selector)).css('border-color','orange');
						$($('.rotateAnimationArea').children().children(selector)).css('width',300/7);
						$($('.rotateAnimationArea').children().children(selector)).css('height',300/7);
					}
					$('.rotateAnimationArea').rotate({animateTo:90,duration:1500,callback:function(){
						$('.rotateAnimationArea').css('display','hidden');
						$('.textDiv').fadeOut(400);
						setTimeout(function(){
							textDIVMaker('ㅓ');
							writeCharacter(vowelCoordinateList[2]);
						}, 1500);
					}});
				}
				animationRepeater = setInterval(function(){
					animation3();
				}, 3000)
			}else{
				clearInterval(animationRepeater);
	    		//정답 맞추면 시작되는 마지막 애니메이션
					$('.rotateAnimationArea').fadeOut();
					$('.textDiv').fadeOut();
					$('.firstBlock').fadeOut();
					$('.arrowAnimationArea').fadeOut();
				setTimeout(function(){
		    		//초기화 및 다음글자로 변경완료
		    		//최초 제시어에 따라 테이블 크기 세팅
					textDIVMaker('ㅗ');		
					cordinateGenerator('ㅗ');
					$('.rotateAnimationArea').fadeIn();
					$('.textDiv').fadeIn();
				}, 1000); 
			}
		},
		//ㅗ->ㅜ
		function(flag){
			if(!flag){
				animationRepeater = setInterval(function(){
					//반짝이는 메서드
					for(var i=0;i<50;i++){
						//깜빡이는 메서드
						if(i%2==0){
							setTimeout(function(){
								$('.y4x3').css('background-color','white')
								$('.y4x3').css('border-color','orange')
								$('.y4x3').css('border-style','dashed')
								$('.y4x3').css('width','36px')
								$('.y4x3').css('height','36px')
							}, 60*(i+1));
						}else{
							setTimeout(function(){
								$('.y4x3').css('background-color','white')
								$('.y4x3').css('border-color','white')
								$('.y4x3').css('border-style','none')
								$('.y4x3').css('width',300/7)
								$('.y4x3').css('height',300/7)
							}, 120*(i+1)); 
						}
					}
					$('.y2x3').css('width','36px');
					$('.y2x3').css('height','36px');
					$('.y2x3').css('background-color','white');
					$('.y2x3').css('border-style','dashed');
					$('.y2x3').css('border-color','orange');
					$('.firstBlock').css('background');
					$('.firstBlock').fadeIn();
					//1개 짜리 블럭 좌우 운동 메서드
					$('.firstBlock').css('display','block');
					$('.firstBlock').css('width',300/7);
					$('.firstBlock').css('height',300/7);
					$('.firstBlock').css('margin-left',126);
					$('.firstBlock').css('margin-top',84);
					$('.firstBlock').css('-webkit-animation-name','ohtou');
					$('.firstBlock').css('-webkit-animation-duration','3s');
					$('.firstBlock').css('-webkit-animation-iteration-count','infinite');
					$('.firstBlock').css('webkit-animation-delay','0s');
					$('.firstBlock').css('animation-name','ohtou');
					$('.firstBlock').css('animation-duration','3s');
					$('.firstBlock').css('animation-delay','0s');
					$('.firstBlock').css('animation-delay','0s');
					$('.firstBlock').css('animation-iteration-count','infinite');
				}, 3000)
			}else{
				clearInterval(animationRepeater);
	    		//정답 맞추면 시작되는 마지막 애니메이션
					$('.rotateAnimationArea').fadeOut();
					$('.textDiv').fadeOut();
					$('.firstBlock').fadeOut();
					$('.arrowAnimationArea').fadeOut();
				setTimeout(function(){
		    		//초기화 및 다음글자로 변경완료
		    		//최초 제시어에 따라 테이블 크기 세팅
					textDIVMaker('ㅡ');		
					cordinateGenerator('ㅡ');
					$('.rotateAnimationArea').fadeIn();
					$('.textDiv').fadeIn();
				}, 1000); 
			}
		},
		//ㅜ->ㅡ
		function(flag){
			if(!flag){
				animationRepeater = setInterval(function(){
					$('.firstBlock').fadeIn();
					//1개 짜리 블럭 좌우 운동 메서드
					$('.firstBlock').css('display','block');
					$('.firstBlock').css('width',300/7);
					$('.firstBlock').css('height',300/7);
					$('.firstBlock').css('margin-left',126);
					$('.firstBlock').css('margin-top',172);
					
					$('.y4x3').css('background-color','white')
					$('.y4x3').css('border-color','orange')
					$('.y4x3').css('border-style','dashed')
					$('.y4x3').css('width','36px')
					$('.y4x3').css('height','36px')
					
					$('.firstBlock').css('-webkit-animation-name','utoeu');
					$('.firstBlock').css('-webkit-animation-duration','3s');
					$('.firstBlock').css('-webkit-animation-iteration-count','infinite');
					$('.firstBlock').css('webkit-animation-delay','2s');
					$('.firstBlock').css('animation-name','utoeu');
					$('.firstBlock').css('animation-duration','3s');
					$('.firstBlock').css('animation-delay','0s');
					$('.firstBlock').css('animation-delay','0s');
					$('.firstBlock').css('animation-iteration-count','infinite');
					setTimeout(function(){
						$('.firstBlock').fadeOut();
					}, 2500)
				}, 3000)
			}else{
				clearInterval(animationRepeater);
	    		//정답 맞추면 시작되는 마지막 애니메이션
					$('.rotateAnimationArea').fadeOut();
					$('.textDiv').fadeOut();
					$('.firstBlock').fadeOut();
					$('.arrowAnimationArea').fadeOut();
				setTimeout(function(){
		    		//초기화 및 다음글자로 변경완료
		    		//최초 제시어에 따라 테이블 크기 세팅
					textDIVMaker('ㅡ');		
					cordinateGenerator('ㅡ');
					$('.rotateAnimationArea').fadeIn();
					$('.textDiv').fadeIn();
				}, 1000); 
			}
		},
		//ㅡ -> ㅣ
		function(flag){
			if(!flag){
				animationRepeater = setInterval(function(){
					//화살표 출력
			    	$('.arrowAnimationArea').css('display','block');
			    	$('.arrowAnimationArea').css('background-image','url("${initParam.root}images/uhtooh.png")');
			    	$('.arrowAnimationArea').css('margin-left','120px');
					//좌표 배열을 인자로 받아 글자를 점선으로 바꾼다.(회전 될 곳을)
					var coordinateInfoArray = vowelCoordinateList[5];
					for(var i=0;i<vowelCoordinateList[5].length;i++){
						var selector = ".y"+coordinateInfoArray[i].y+"x"+coordinateInfoArray[i].x;
						$($('.rotateAnimationArea').children().children(selector)).css('background-color','white');
						$($('.rotateAnimationArea').children().children(selector)).css('border-style','dashed');
						$($('.rotateAnimationArea').children().children(selector)).css('border-color','orange');
						$($('.rotateAnimationArea').children().children(selector)).css('width','36px');
						$($('.rotateAnimationArea').children().children(selector)).css('height','36px');
					}
					$('.rotateAnimationArea').rotate({animateTo:90,duration:1000,callback:function(){
						$('.rotateAnimationArea').css('display','hidden');
						for(var i=0;i<vowelCoordinateList[5].length;i++){
							var selector = ".y"+coordinateInfoArray[i].y+"x"+coordinateInfoArray[i].x;
							$('.textDiv').fadeOut(400);
							if(!flag){
								setTimeout(function(){
									textDIVMaker('ㅣ');
									writeCharacter(vowelCoordinateList[5]);
								}, 2000);
							}
						}
					}});
				}, 3000)
			}else{
				clearInterval(animationRepeater);
	    		//정답 맞추면 시작되는 마지막 애니메이션
					$('.rotateAnimationArea').fadeOut();
					$('.textDiv').fadeOut();
					$('.firstBlock').fadeOut();
					$('.arrowAnimationArea').fadeOut();
				setTimeout(function(){
		    		//초기화 및 다음글자로 변경완료
		    		//최초 제시어에 따라 테이블 크기 세팅
					textDIVMaker('ㅣ');		
					cordinateGenerator('ㅣ');
					$('.rotateAnimationArea').fadeIn();
					$('.textDiv').fadeIn();
				}, 1000); 
			}
		},
		//ㅣ -> ㅑ
		function(flag){
			if(!flag){
				function twinkleInetoAh(){
	    			//깜빡이는 메서드
					setTimeout(function(){
						$('.y2x4').css('background-color','white')
						$('.y2x4').css('border-color','orange')
						$('.y2x4').css('border-style','dashed')
						$('.y2x4').css('width','36px')
						$('.y2x4').css('height','36px')
						
						$('.y4x4').css('background-color','white')
						$('.y4x4').css('border-color','orange')
						$('.y4x4').css('border-style','dashed')
						$('.y4x4').css('width','36px')
						$('.y4x4').css('height','36px')
					}, 150);
					setTimeout(function(){
						$('.y2x4').css('background-color','white')
						$('.y2x4').css('border-color','white')
						$('.y2x4').css('border-style','none')
						$('.y2x4').css('width',300/7)
						$('.y2x4').css('height',300/7)
						
						$('.y4x4').css('background-color','white')
						$('.y4x4').css('border-color','white')
						$('.y4x4').css('border-style','none')
						$('.y4x4').css('width',300/7)
						$('.y4x4').css('height',300/7)
					}, 300); 
	    		}
	    		
	    		animationRepeater = setInterval(function(){
	    			twinkleInetoAh();
				}, 300)	
				//1개 짜리 블럭 좌우 운동 메서드
				$('.firstBlock').css('display','block');
				$('.firstBlock').css('width',300/7);
				$('.firstBlock').css('height',300/7);
				$('.firstBlock').css('margin-left',400);
				$('.firstBlock').css('margin-top',-40);
				$('.firstBlock').css('-webkit-animation-name','etoah');
				$('.firstBlock').css('-webkit-animation-duration','2s');
				$('.firstBlock').css('-webkit-animation-iteration-count','infinite');
				$('.firstBlock').css('webkit-animation-delay','0s');
				$('.firstBlock').css('animation-name','etoah');
				$('.firstBlock').css('animation-duration','2s');
				$('.firstBlock').css('animation-delay','0s');
				$('.firstBlock').css('animation-delay','0s');
				$('.firstBlock').css('animation-iteration-count','infinite');

				//1개 짜리 블럭 좌우 운동 메서드
				$('.secondBlock').css('display','block');
				$('.secondBlock').css('width',300/7);
				$('.secondBlock').css('height',300/7);
				$('.secondBlock').css('margin-left',400);
				$('.secondBlock').css('margin-top',40);
				$('.secondBlock').css('-webkit-animation-name','etoah');
				$('.secondBlock').css('-webkit-animation-duration','2s');
				$('.secondBlock').css('-webkit-animation-iteration-count','infinite');
				$('.secondBlock').css('webkit-animation-delay','0s');
				$('.secondBlock').css('animation-name','etoah');
				$('.secondBlock').css('animation-duration','2s');
				$('.secondBlock').css('animation-delay','0s');
				$('.secondBlock').css('animation-delay','0s');
				$('.secondBlock').css('animation-iteration-count','infinite');
				//화살표 출력
		    	$('.arrowAnimationArea').css('display','block');
		    	$('.arrowAnimationArea').css('background-image','url("${initParam.root}images/etoahArrow.png")');
		    	$('.arrowAnimationArea').css('margin-left','240px');
		    	$('.arrowAnimationArea').css('margin-top','100px');
			}else{
				clearInterval(animationRepeater);
	    		//정답 맞추면 시작되는 마지막 애니메이션
					$('.rotateAnimationArea').fadeOut();
					$('.textDiv').fadeOut();
					$('.firstBlock').fadeOut();
					$('.secondBlock').fadeOut();
					$('.arrowAnimationArea').fadeOut();
				setTimeout(function(){
		    		//초기화 및 다음글자로 변경완료
		    		//최초 제시어에 따라 테이블 크기 세팅
					textDIVMaker('ㅑ');		
					cordinateGenerator('ㅑ');
					$('.rotateAnimationArea').fadeIn();
					$('.textDiv').fadeIn();
				}, 1000); 
			}
		},
		//ㅑ -> ㅕ
		function(flag){
			if(!flag){
				animationRepeater = setInterval(function(){
					//좌표 배열을 인자로 받아 글자를 점선으로 바꾼다.(회전 될 곳을)
					var coordinateInfoArray = vowelCoordinateList[7];
					for(var i=0;i<vowelCoordinateList[7].length;i++){
						var selector = ".y"+coordinateInfoArray[i].y+"x"+coordinateInfoArray[i].x;
						$($('.rotateAnimationArea').children().children(selector)).css('background-color','white');
						$($('.rotateAnimationArea').children().children(selector)).css('border-style','dashed');
						$($('.rotateAnimationArea').children().children(selector)).css('border-color','orange');
						$($('.rotateAnimationArea').children().children(selector)).css('width',300/7);
						$($('.rotateAnimationArea').children().children(selector)).css('height',300/7);
					}
					$('.rotateAnimationArea').rotate({animateTo:180,duration:1000,callback:function(){
						$('.rotateAnimationArea').css('display','hidden');
						$('.textDiv').fadeOut(400);
							if(!flag){
								setTimeout(function(){
									textDIVMaker('ㅑ');
									writeCharacter(vowelCoordinateList[7]);
								}, 2000);
							}
					}});
				}, 3000)
			}else{
				clearInterval(animationRepeater);
	    		//정답 맞추면 시작되는 마지막 애니메이션
					$('.rotateAnimationArea').fadeOut();
					$('.textDiv').fadeOut();
					$('.firstBlock').fadeOut();
					$('.secondBlock').fadeOut();
					$('.arrowAnimationArea').fadeOut();
				setTimeout(function(){
		    		//초기화 및 다음글자로 변경완료
		    		//최초 제시어에 따라 테이블 크기 세팅
					textDIVMaker('ㅕ');		
					cordinateGenerator('ㅕ');
					$('.rotateAnimationArea').fadeIn();
					$('.textDiv').fadeIn();
				}, 1000); 
			}
		},
		//ㅕ -> ㅛ
		function(flag){
			if(!flag){
				animationRepeater = setInterval(function(){
					//좌표 배열을 인자로 받아 글자를 점선으로 바꾼다.(회전 될 곳을)
					var coordinateInfoArray = vowelCoordinateList[8];
					for(var i=0;i<vowelCoordinateList[8].length;i++){
						var selector = ".y"+coordinateInfoArray[i].y+"x"+coordinateInfoArray[i].x;
						$($('.rotateAnimationArea').children().children(selector)).css('background-color','white');
						$($('.rotateAnimationArea').children().children(selector)).css('border-style','dashed');
						$($('.rotateAnimationArea').children().children(selector)).css('border-color','orange');
						$($('.rotateAnimationArea').children().children(selector)).css('width',300/7);
						$($('.rotateAnimationArea').children().children(selector)).css('height',300/7);
					}
					$('.rotateAnimationArea').rotate({animateTo:90,duration:1000,callback:function(){
						$('.rotateAnimationArea').css('display','hidden');
						$('.textDiv').fadeOut(400);
							if(!flag){
								setTimeout(function(){
									textDIVMaker('ㅕ');
									writeCharacter(vowelCoordinateList[8]);
								}, 2000);
							}
					}});
				}, 3000)
			}else{
				clearInterval(animationRepeater);
	    		//정답 맞추면 시작되는 마지막 애니메이션
					$('.rotateAnimationArea').fadeOut();
					$('.textDiv').fadeOut();
					$('.firstBlock').fadeOut();
					$('.secondBlock').fadeOut();
					$('.arrowAnimationArea').fadeOut();
				setTimeout(function(){
		    		//초기화 및 다음글자로 변경완료
		    		//최초 제시어에 따라 테이블 크기 세팅
					textDIVMaker('ㅛ');		
					cordinateGenerator('ㅛ');
					$('.rotateAnimationArea').fadeIn();
					$('.textDiv').fadeIn();
				}, 1000); 
			}
		},
		//ㅛ -> ㅠ
		function(flag){
			if(!flag){
				animationRepeater = setInterval(function(){
					//좌표 배열을 인자로 받아 글자를 점선으로 바꾼다.(회전 될 곳을)
					var coordinateInfoArray = vowelCoordinateList[9];
					for(var i=0;i<vowelCoordinateList[9].length;i++){
						var selector = ".y"+coordinateInfoArray[i].y+"x"+coordinateInfoArray[i].x;
						$($('.rotateAnimationArea').children().children(selector)).css('background-color','white');
						$($('.rotateAnimationArea').children().children(selector)).css('border-style','dashed');
						$($('.rotateAnimationArea').children().children(selector)).css('border-color','orange');
						$($('.rotateAnimationArea').children().children(selector)).css('width',300/7);
						$($('.rotateAnimationArea').children().children(selector)).css('height',300/7);
					}
					$('.rotateAnimationArea').rotate({animateTo:180,duration:1000,callback:function(){
						$('.rotateAnimationArea').css('display','hidden');
						$('.textDiv').fadeOut(400);
							if(!flag){
								setTimeout(function(){
									textDIVMaker('ㅛ');
									writeCharacter(vowelCoordinateList[9]);
								}, 2000);
							}
					}});
				}, 3000)
			}else{
				clearInterval(animationRepeater);
	    		//정답 맞추면 시작되는 마지막 애니메이션
					$('.rotateAnimationArea').fadeOut();
					$('.textDiv').fadeOut();
					$('.firstBlock').fadeOut();
					$('.secondBlock').fadeOut();
					$('.arrowAnimationArea').fadeOut();
				setTimeout(function(){
		    		//초기화 및 다음글자로 변경완료
		    		//최초 제시어에 따라 테이블 크기 세팅
					textDIVMaker('ㅠ');		
					cordinateGenerator('ㅠ');
					$('.rotateAnimationArea').fadeIn();
					$('.textDiv').fadeIn();
				}, 1000); 
			}
		}
	]
	Array.prototype.contains = function(element) {
		for (var i = 0; i < this.length; i++) {
			if (this[i] == element) {
				return {booleanTest:true,index:i};
			}
		}
		return false;
	}
	
	$(document).ready(function(){
		//화면 크기에 따라 화살표 위치 조정
		arrowPositioner();
		//최초 제시어에 따라 테이블 크기 세팅
		textDIVMaker('ㅣ');		
		//최초 제시 자음
		cordinateGenerator('ㅣ');
		//애니메이션 시작
		vowelAnimator[0].call(vowelAnimator[0],false)
		//정답을 'ㅏ'로 설정
		tempQuestionIndex++;
	});
	
	function cordinateGenerator(inputText){
		textDIVMaker(inputText);
		var inputText = inputText
		//글 좌표 리스트에 따라 글자를 그리는 메서드로 이동
		writeCharacter(vowelCoordinateList[vowelList.contains(inputText).index]);
	}
	//좌표 배열을 인자로 받아 글자를 그린다.
	function writeCharacter(coordinateInfoArray){
		for(var i=0;i<coordinateInfoArray.length;i++){
			var selector = ".y"+coordinateInfoArray[i].y+"x"+coordinateInfoArray[i].x;
			$(selector).css('background-color','orange');
		}
	}
	//정답 제출 시 실행 메서드
	function submitAnswer(){
		if($('.userAnswer').val()==vowelList[tempQuestionIndex]){
			//애니메이션 종료
			vowelAnimator[tempQuestionIndex-1].call(vowelAnimator[tempQuestionIndex-1],true);
			//현재 정답 갱신			
			tempQuestionIndex++
			//학습 모달 창 출력
			$('#answerAnimation').modal({
				keyboard : false
			});
			setTimeout(function(){
				//5초뒤 학습 모달 닫기
				$('#answerAnimation').modal('hide');
				//다음애니메이션 출력
				textDIVMaker(vowelList[tempQuestionIndex]);		
					cordinateGenerator(vowelList[tempQuestionIndex-1]);
					$('.rotateAnimationArea').fadeIn();
					$('.textDiv').fadeIn();
				vowelAnimator[tempQuestionIndex-1].call(vowelAnimator[tempQuestionIndex-1],false);
			}, 5000)
		}else{
			alert('오답입니다.');
			return false;
		}
	}
	
	function arrowPositioner(){
		//화면 크기에 맞춰 이전 버튼 위치 조정 
		var userBrowserwidth = $(window).width();
		var userBrowserheight = $(window).height();
		$('.rightArrowArea').css('margin-left',userBrowserwidth-80);
		$('.rightArrowArea').css('padding-top',(userBrowserheight/2)-60);
		$('.leftArrowArea').css('padding-top',(userBrowserheight/2)-60);
		$('.rightArrowArea').click(function(){
			alert('이후 글자 보기');
		});
		$('.leftArrowArea').click(function(){
			alert('이전 글자 보기');
		});
	}
	function textDIVMaker(inputText){
		// 자음,모음 구분을 통해 표의 크기 설정
		var cellNumber;
		var textDIVHTML = '';
		$('.textDiv').html(textDIVHTML);
		//제시어가 외자일 때
		if(inputText.length==1){
			//제시어가 모음일때 
			if(vowelList.contains(inputText).booleanTest){
				cellNumber = 7;
				//alert('제시어가 모음 한글자입니다.');
				for(var i = 0;i<cellNumber;i++){
					textDIVHTML += '<div class="y'+i+'">';
					for(var j=0;j<cellNumber;j++){
						textDIVHTML += '<div class="y'+i+'x'+j+'"></div>'
					}
					textDIVHTML += '</div>'
				}
			}
			//제시어가 자음일때 
		}
		//제시어의 길이와 종류에 따라 표의 셀갯수 조절한 태그를 테이블에 삽입
		$('.textScreen').html('<div class="arrowAnimationArea"></div><div class="rotateAnimationArea"></div><div class="firstBlock"></div><div class="secondBlock"></div><div class="textDiv"></div>')
		$('.textDiv').html(textDIVHTML);
		$($('.textDiv').children('div')).css('width',300);
		$($('.textDiv').children('div')).css('height',300/cellNumber);
		$($('.textDiv').children().children('div')).css('width',300/cellNumber);
		$($('.textDiv').children().children('div')).css('height',300/cellNumber);
		$($('.textDiv').children().children('div')).css('float','left');
	
		$('.rotateAnimationArea').html(textDIVHTML);
		$($('.rotateAnimationArea').children('div')).css('width',300);
		$($('.rotateAnimationArea').children('div')).css('height',300/cellNumber);
		$($('.rotateAnimationArea').children().children('div')).css('width',300/cellNumber);
		$($('.rotateAnimationArea').children().children('div')).css('height',300/cellNumber);
		$($('.rotateAnimationArea').children().children('div')).css('float','left');
	}
	
</script>
</html>