<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>한글봇 학습 통계 페이지</title>
    <!-- Core CSS - Include with every page -->
    <link href="${initParam.root}bootstrap/css/bootstrap.css" rel="stylesheet" />
  
    <!-- Font Awesome CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
    <link href="${initParam.root}css/pace-theme-big-counter.css" rel="stylesheet" />
    <link href="${initParam.root}css/admin-style.css" rel="stylesheet" />
    <link href="${initParam.root}css/adminstyle.css" rel="stylesheet" />
    
   		<link rel="stylesheet" type="text/css" href="${initParam.root}css/component.css" />
		<script src="${initParam.root}js/modernizr.js"></script> <!-- Modernizr -->
    
    <!-- Page-Level CSS -->
    <link href="${initParam.root}css/morris-0.4.3.min.css" rel="stylesheet" />
   <style>
   	.phonicsTitle{
   		font-size: 20px;
   		margin  : 20px;
   	}
   </style>
</head>
<body>
    <!--  wrapper -->
    <div id="wrapper">
       
        <!-- end navbar top -->

       
        <!-- end navbar side -->
        
        <!--  page-wrapper -->
        <div id="page-wrapper" class="container-fluid col-lg-12">
            <div class="row">
                <!-- Page Header -->
                <div class="col-lg-12">
                    <h1 class="page-header" style="color:black">통계페이지</h1>
                </div>
                <!--End Page Header -->
            </div>

            <div class="row">
                <!-- Welcome -->
                <div class="col-lg-6">
                    <div class="alert alert-info">
                        <i class="fa fa-folder-open"></i><b>&nbsp;안녕하세요! </b> 본 페이지에서 아이의 학습과 관련된 다양한 데이터를 한눈에 확인하세요!
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="alert alert-danger">
                        <i class="fa fa-folder-open"></i> 
                        <b>${loginUserInfo.memberBabyName}준영</b>의 현재 단어 수준은 <b>4.8</b> 단계 입니다.
                    </div>
                </div>
                <!--end  Welcome -->
            </div>


            <div class="row">
                <!--quick info section -->
                <div class="col-lg-3">
                    <div class="alert alert-info text-center">
                        <i class="fa fa-graduation-cap fa-3x"></i>&nbsp;<b>${result.totalStudyWordCount}</b>개의 단어를 학습
                    </div>
                </div>
                <div class="col-lg-3">
                    <div class="alert alert-success text-center">
                        <i class="fa fa-check fa-3x"></i>&nbsp;<b>${result.currentAnswerRate} % </b>최근 일주일간의 정답율  
                    </div>
                </div>
                <div class="col-lg-3">
                    <div class="alert alert-warning text-center">
                        <i class="fa  fa-pencil fa-3x"></i>&nbsp;<b>345시간 37분 </b>총 누적 한글봇 학습시간
                    </div>
                </div>
                <div class="col-lg-3">
                    <div class="alert alert-danger text-center">
                        <i class="fa fa-frown-o fa-3x"></i>&nbsp;<b>${result.currentWrongWordCount} </b>일주일간 오답 단어 수
                    </div>
                </div>
                <!--end quick info section -->
            </div>

            <div class="row">
                <div class="col-lg-8">
                    <!--Area chart example -->
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <i class="fa fa-bar-chart-o fa-fw"></i><span class="currentGraph">단어 난이도별 정답률</span> 
                            <div class="pull-right">
                                <div class="btn-group">
                                    <button type="button" class="btn btn-default btn-xs dropdown-toggle" data-toggle="dropdown">
                                        	<span class="currentGraph">단어 난이도별 정답률</span>
                                        <span class="caret"></span>
                                    </button>
                                    <!-- <ul class="dropdown-menu pull-right" role="menu">
                                        <li><a href="#" class="graphSelector">단어난이도별 정답률</a>
                                        </li>
                                        <li><a href="#" class="graphSelector">최근 학습시간 추이</a>
                                        </li>
                                        <li class="divider"></li>
                                        <li><a href="#" class="graphSelector">정답률 변화 추이</a>
                                        <li><a href="#" class="graphSelector">파닉스 숙련도</a>
                                        </li>
                                    </ul> -->
                                </div>
                            </div>
                        </div>
                        <div class="panel-body" id="study-graph-panel">
                        	<!-- 또래아이와 비교한 정답율 선 그래프 -->
                            <div id="morris-bar-chart"></div>
                            <!-- 최근학습시간 추이  -->
                            <div id="currentStudyTimeReport"></div>
                            <!-- 정답률 변화 추이 -->
                            <div id="answerRateByPeriod"></div>
                            <!-- 파닉스 숙련도 -->
                            <div id="phonicsRate">
                            		<div class="phonicsTitle">
                            		 	초성
                            		</div>
                            	<c:forEach items="${requestScope.result.initialSoundResult}" var="initialSound">
                            		<c:choose>
                            			<c:when test="${initialSound.initialSoundId eq 'white'}">
				                           	<button type="button" class="btn btn-default btn-circle btn-lg"><span style="font-weight: 900;">${initialSound.initialSound}</span></button>
                            			</c:when>
                            			<c:when test="${initialSound.initialSoundId eq 'red'}">
				                           	<button type="button" class="btn btn-danger btn-circle btn-lg"><span style="font-weight: 900;">${initialSound.initialSound}</span></button>
                            			</c:when>
                            			<c:when test="${initialSound.initialSoundId eq 'green'}">
				                           	<button type="button" class="btn btn-success btn-circle btn-lg"><span style="font-weight: 900;">${initialSound.initialSound}</span></button>
                            			</c:when>
                            			<c:when test="${initialSound.initialSoundId eq 'yellow'}">
				                           	<button type="button" class="btn btn-warning btn-circle btn-lg"><span style="font-weight: 900;">${initialSound.initialSound}</span></button>
                            			</c:when>
                            		</c:choose>
                            	</c:forEach>
                            		<div class="phonicsTitle">
                            			중성
                            		</div>
                            	<c:forEach items="${requestScope.result.vowelResult }" var="vowelList">
                            		<c:choose>
                            			<c:when test="${vowelList.vowelId eq 'white'}">
				                           	<button type="button" class="btn btn-default btn-circle btn-lg"><span style="font-weight: 900;">${vowelList.vowel}</span></button>
                            			</c:when>
                            			<c:when test="${vowelList.vowelId eq 'red'}">
				                           	<button type="button" class="btn btn-danger btn-circle btn-lg"><span style="font-weight: 900;">${vowelList.vowel}</span></button>
                            			</c:when>
                            			<c:when test="${vowelList.vowelId eq 'green'}">
				                           	<button type="button" class="btn btn-success btn-circle btn-lg"><span style="font-weight: 900;">${vowelList.vowel}</span></button>
                            			</c:when>
                            			<c:when test="${vowelList.vowelId eq 'yellow'}">
				                           	<button type="button" class="btn btn-warning btn-circle btn-lg"><span style="font-weight: 900;">${vowelList.vowel}</span></button>
                            			</c:when>
                            		</c:choose>
                            	</c:forEach>
                            		<div class="phonicsTitle">
                            			종성
                            		</div>
                            	<c:forEach items="${requestScope.result.finalConsonantResult }" var = "finalConsonantList">
                            		<c:choose>
                            			<c:when test="${finalConsonantList.finalConsonantId eq 'white'}">
				                           	<button type="button" class="btn btn-default btn-circle btn-lg"><span style="font-weight: 900;">${finalConsonantList.finalConsonant}</span></button>
                            			</c:when>
                            			<c:when test="${finalConsonantList.finalConsonantId eq 'red'}">
				                           	<button type="button" class="btn btn-danger btn-circle btn-lg"><span style="font-weight: 900;">${finalConsonantList.finalConsonant}</span></button>
                            			</c:when>
                            			<c:when test="${finalConsonantList.finalConsonantId eq 'green'}">
				                           	<button type="button" class="btn btn-success btn-circle btn-lg"><span style="font-weight: 900;">${finalConsonantList.finalConsonant}</span></button>
                            			</c:when>
                            			<c:when test="${finalConsonantList.finalConsonantId eq 'yellow'}">
				                           	<button type="button" class="btn btn-warning btn-circle btn-lg"><span style="font-weight: 900;">${finalConsonantList.finalConsonant}</span></button>
                            			</c:when>
                            		</c:choose>
                            	</c:forEach>
                            </div>
                          
                        </div>
                    </div>
                    <!--End area chart example -->
                    <!--Simple table example -->
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <i class="fa fa-bar-chart-o fa-fw"></i> 학습 로그
                        </div>

                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="table-responsive">
                                        <table class="table table-bordered table-hover table-striped">
                                            <thead>
                                                <tr>
                                                    <th>단어</th>
                                                    <th>일시</th>
                                                    <th>정답여부</th>
                                                    <th>정답도출시간</th>
                                                    <th>또래 아이 평균 정답도출시간</th>
                                                </tr>
                                            </thead>
                                            <tbody class="usersWordLog">
	                               	        	<tr><td>골프</td><td>2016.06.27</td><td>O</td><td>21초</td><td>31초</td></tr>
	                               	        	<tr><td>축구</td><td>2016.06.27</td><td>O</td><td>29초</td><td>38초</td></tr>
	                               	        	<tr><td>사과</td><td>2016.06.27</td><td>O</td><td>28초</td><td>35초</td></tr>
	                               	        	<tr><td>수박</td><td>2016.06.26</td><td>O</td><td>15초</td><td>25초</td></tr>
	                               	        	<tr><td>경찰</td><td>2016.06.26</td><td>O</td><td>31초</td><td>42초</td></tr>
	                               	        	<tr><td>프랑스</td><td>2016.06.26</td><td>O</td><td>44초</td><td>49초</td></tr>
	                               	        	<tr><td>사자</td><td>2016.06.26</td><td>O</td><td>20초</td><td>25초</td></tr>
	                               	        	<tr><td>호랑이</td><td>2016.06.26</td><td>O</td><td>55초</td><td>62초</td></tr>
	                               	        	<tr><td>가수</td><td>2016.06.26</td><td>O</td><td>32초</td><td>35초</td></tr>
	                               	        	<tr><td>나비</td><td>2016.06.26</td><td>O</td><td>21초</td><td>22초</td></tr>
	                               	        	
                                            </tbody>
                                        </table>
                                     <%--   <nav style="text-align: center;">
										  <ul class="pagination">
										    
<c:set var="pb" value="${requestScope.result.wordStudyLogPagingBean}"></c:set>
	<c:if test="${pb.previousPageGroup}">
		<li>
		<a href="${initParam.root}admin_postingListWithSmallProducts.do?pageNo=${pb.startPageOfPageGroup-1}">Prev</a>
		<a href="#" aria-label="Previous">
			<span aria-hidden="true">&laquo;</span>
		</a>
		</li>
	</c:if>
	<c:forEach var="i" begin="${pb.startPageOfPageGroup}" end="${pb.endPageOfPageGroup}">
		<c:choose>
			<c:when test="${pb.nowPage!=i}">
				
				<li><a href="#" class="pagingBtn">${i}</a></li>
			</c:when>
			<c:otherwise>
				<li class="active"><a href="#" onclick="return false;">${i} <span class="sr-only">(current)</span></a></li>
			</c:otherwise>
		</c:choose>
	</c:forEach>
	<c:if test="${pb.nextPageGroup}">
		<li>
		<a href="${initParam.root}admin_postingListWithSmallProducts.do?pageNo=${pb.endPageOfPageGroup+1}">Next</a>
		 <a href="#" aria-label="Next">
			<span aria-hidden="true">&raquo;</span>
		</a>
		</li>
	</c:if>
			    
										    
										  </ul>
										</nav> --%>
                                    </div>

                                </div>

                            </div>
                            <!-- /.row -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!--End simple table example -->

                </div>

                <div class="col-lg-4">
                    <div class="panel panel-primary text-center no-boder">
                        <div class="panel-body yellow">
							<div id="morris-donut-chart" ></div>
                        </div>
                         <div class="col-sm-6 col-sm-offset-3 text-center">
								
    					</div>
                        <div class="panel-footer">
                            <span class="panel-eyecandy-title">학습 단어 카테고리 구분
                            </span>
                        </div>
                    </div>
                    <div class="panel panel-primary text-center no-boder">
                        <div class="panel-body blue">
                            <i class="fa fa-pencil-square-o fa-3x"></i>
                            <h3>${result.totalCorrectWordCount} </h3>
                        </div>
                        <div class="panel-footer">
                            <span class="panel-eyecandy-title">총 정답 단어수
                            </span>
                        </div>
                    </div>
                    <div class="panel panel-primary text-center no-boder">
                        <div class="panel-body green">
                            <i class="fa fa fa-floppy-o fa-3x"></i>
                            <h3>${result.dailyAverageStudyWord}</h3>
                        </div>
                        <div class="panel-footer">
                            <span class="panel-eyecandy-title">하루평균 학습 단어수
                            </span>
                        </div>
                    </div>
                    <div class="panel panel-primary text-center no-boder">
                        <div class="panel-body red">
                            <i class="fa fa-thumbs-up fa-3x"></i>
                            <h3>1시간 7분 </h3>
                        </div>
                        <div class="panel-footer">
                            <span class="panel-eyecandy-title">하루평균 학습시간
                            </span>
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <!-- end page-wrapper -->
    </div>
    <!-- end wrapper -->
	<!-- 곻통부분 시작 -네비게이션 버튼  -->
	
     <div class="component">
				<!-- Start Nav Structure -->
				<button class="cn-button" id="cn-button">-</button>
				<div class="cn-wrapper opened-nav" id="cn-wrapper">
				    <ul>
				      <li><a href="${initParam.root}index.do"><span class="fa fa-arrow-up"></span></a></li>
				      <li><a href="${initParam.root}index.do"><span class="fa fa-bluetooth"></span></a></li>
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
    <!-- Core Scripts - Include with every page -->
    <script src="${initParam.root}js/jquery-1.12.1.min.js"></script>
    <script src="${initParam.root}js/bootstrap.min.js"></script>
    <script src="${initParam.root}js/jquery.metisMenu.js"></script>
    <script src="${initParam.root}js/pace.js"></script>
    <script src="${initParam.root}js//siminta.js"></script>
    <!-- Page-Level Plugin Scripts-->
    <script src="${initParam.root}js/raphael-2.1.0.min.js"></script>
    <script src="${initParam.root}js//morris.js" charset='utf-8'></script>
	<script type="text/javascript">
	var categoryData = new Array();
		categoryData.push({label:'국가',value:152})
		categoryData.push({label:'과일',value:223})
		categoryData.push({label:'동물',value:114})
		categoryData.push({label:'운동',value:63})
		categoryData.push({label:'직업',value:122})
	var answerRateByGradeData = new Array();
	answerRateByGradeData.push({y:'1단계',a:90,b:88})
	answerRateByGradeData.push({y:'2단계',a:86,b:80})
	answerRateByGradeData.push({y:'3단계',a:82,b:77})
	answerRateByGradeData.push({y:'4단계',a:70,b:65})
	answerRateByGradeData.push({y:'5단계',a:60,b:52})
	

	

	
	$(document).ready(function(){
	    //  morris Area chart on dashboard///
	    $('#study-graph-panel').children().eq(0).css("display","block");
		$('#study-graph-panel').children().eq(1).css("display","block");
		$('#study-graph-panel').children().eq(2).css("display","block");
		$('#study-graph-panel').children().eq(3).css("display","block");
		graphChanger("initialGraph");
	    //  morris donut chart on dashboard///
	    Morris.Donut({
	        element: 'morris-donut-chart',
	        data: categoryData,
	        resize: true
	    });

	    Morris.Bar({
	        element: 'morris-bar-chart',
	        data: answerRateByGradeData,
	        xkey: 'y',
	        ykeys: ['a', 'b'],
	        labels: ['현재아이', '또래아이'],
	        hideHover: 'auto',
	        resize: false
	    });
	    Morris.Line({
	        element: 'answerRateByPeriod',
	        data: [{y:'2016.05.30',a:65},{y:'2016.06.06',a:78},{y:'2016.06.13',a:92},{y:'2016.06.20',a:55},{y:'2016.06.27',a:68}],
	        xkey: 'y',
	        ykeys: ['a'],
	        labels: ['현재아이'],
	        hideHover: 'auto',
	        resize: false
	    });

		//alert(Math.round(4893204/3293, 1));
		$('.graphSelector').click(function(){
			graphChanger(this);
		});
	
	

	});
	function graphChanger(target){
		if(target=="initialGraph"){
			setTimeout(function(){
				$('.currentGraph').text("단어난이도별 정답률");
				$('#study-graph-panel').children().eq(0).css("display","block");
				$('#study-graph-panel').children().eq(1).css("display","none");
				$('#study-graph-panel').children().eq(2).css("display","none");
				$('#study-graph-panel').children().eq(3).css("display","none");
			},1000)
			
		}else{
			$('.currentGraph').text($(target).text());
			if($(target).text()=='단어난이도별 정답률'){
				$('#study-graph-panel').children().eq(0).css("display","block");
				$('#study-graph-panel').children().eq(1).css("display","none");
				$('#study-graph-panel').children().eq(2).css("display","none");
				$('#study-graph-panel').children().eq(3).css("display","none");
			}else if($(target).text()=='최근 학습시간 추이'){
				$('#study-graph-panel').children().eq(0).css("display","none");
				$('#study-graph-panel').children().eq(1).css("display","block");
				$('#study-graph-panel').children().eq(2).css("display","none");
				$('#study-graph-panel').children().eq(3).css("display","none");
			}else if($(target).text()=='정답률 변화 추이'){	
				$('#study-graph-panel').children().eq(0).css("display","none");
				$('#study-graph-panel').children().eq(1).css("display","none");
				$('#study-graph-panel').children().eq(2).css("display","block");
				$('#study-graph-panel').children().eq(3).css("display","none");
			}else if($(target).text()=='파닉스 숙련도'){
				$('#study-graph-panel').children().eq(0).css("display","none");
				$('#study-graph-panel').children().eq(1).css("display","none");
				$('#study-graph-panel').children().eq(2).css("display","none");
				$('#study-graph-panel').children().eq(3).css("display","block");
			}
		}
	}
	
	</script>
	<script>
		$(document).ready(function(){
			$('.pagingBtn').click(function(){
				var page = $(this).text();
				alert(page);
				$.ajax({
					type:"get",
					url:"selectListStudyWordLogByPaging.do?page="+page,
					success:function(data){
						alert(data);
						var wordLogSource ;
						for(var i=0;i<data.length;i++){
							wordLogSource += "<tr><td>"+data[i].word+"</td><td>"+data[i].studyDate+"</td>";
							if(data[i].isCorrect==1){
								wordLogSource += "<td>O</td>";
							}else{
								wordLogSource += "<td>X</td>" ;
							}
							wordLogSource += "<td>"+data[i].spendTime+"초</td><td>작업중</td>";
						}
                  
                    $('.usersWordLog').html(wordLogSource);
					}
				});
			})
			
		});
	</script>				
</body>

</html>
