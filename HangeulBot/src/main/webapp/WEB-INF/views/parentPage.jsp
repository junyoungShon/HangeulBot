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
    <link href="${initParam.root}css/font-awesome.css" rel="stylesheet" />
    <link href="${initParam.root}css/pace-theme-big-counter.css" rel="stylesheet" />
    <link href="${initParam.root}css/admin-style.css" rel="stylesheet" />
    <link href="${initParam.root}css/adminstyle.css" rel="stylesheet" />
    <!-- Page-Level CSS -->
    <link href="${initParam.root}css/morris-0.4.3.min.css" rel="stylesheet" />
</head>
<body>
    <!--  wrapper -->
    <div id="wrapper">
        <!-- navbar top -->
        <nav class="navbar navbar-default navbar-fixed-top" role="navigation" id="navbar">
            <!-- navbar-header -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="${initParam.root}index.do">
                   한글봇
                </a>
            </div>
            <!-- end navbar-header -->
            <!-- navbar-top-links -->
          

        </nav>
        <!-- end navbar top -->

       
        <!-- end navbar side -->
        
        <!--  page-wrapper -->
        <div id="page-wrapper">
            <div class="row">
                <!-- Page Header -->
                <div class="col-lg-12">
                    <h1 class="page-header">통계페이지</h1>
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
                        <b>${loginUserInfo.memberBabyName}</b>의 현재 단어 수준은 <b>${loginUserInfo.memberBabyGrade}</b> 단계 입니다.
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
                        <i class="fa  fa-pencil fa-3x"></i>&nbsp;<b>${result.memberBabyTotalStudyTime} </b>총 누적 한글봇 학습시간
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
                            <i class="fa fa-bar-chart-o fa-fw"></i> 단어 난이도별 정답률
                            <div class="pull-right">
                                <div class="btn-group">
                                    <button type="button" class="btn btn-default btn-xs dropdown-toggle" data-toggle="dropdown">
                                        	단어 난이도별 정답률
                                        <span class="caret"></span>
                                    </button>
                                    <ul class="dropdown-menu pull-right" role="menu">
                                        <li><a href="#">단어난이도별 정답률%</a>
                                        </li>
                                        <li><a href="#">최근 학습시간 추이</a>
                                        </li>
                                        <li><a href="#">파닉스 숙련도</a>
                                        </li>
                                        <li class="divider"></li>
                                        <li><a href="#">정답률 변화 추이</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="panel-body">
                            <div id="morris-bar-chart"></div>
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
                                            <tbody>
                                           		<c:forEach items="${result.wordStudyLogList}" var="wordStudyLogList">
	                                              	<tr>
	                                                    <td>${wordStudyLogList.word}</td>
	                                                    <td>${wordStudyLogList.studyDate}</td>
	                                                    
	                                                    <c:if test="${wordStudyLogList.isCorrect==1}">
		                                                    <td>O</td>
	                                                    </c:if>
	                                                    <c:if test="${wordStudyLogList.isCorrect==0}">
		                                                    <td>X</td>
	                                                    </c:if>
	                                                    <td>${wordStudyLogList.spendTime}초</td>
	                                                    <td>작업중</td>
	                                                </tr>
                                           		</c:forEach>
                                            </tbody>
                                        </table>
                                       <nav style="text-align: center;">
										  <ul class="pagination">
										    
<c:set var="pb" value="${requestScope.result.wordStudyLogPagingBean}"></c:set>
	<c:if test="${pb.previousPageGroup}">
		<li>
		<%-- <a href="${initParam.root}admin_postingListWithSmallProducts.do?pageNo=${pb.startPageOfPageGroup-1}">Prev</a> --%>
		<a href="#" aria-label="Previous">
			<span aria-hidden="true">&laquo;</span>
		</a>
		</li>
	</c:if>
	<c:forEach var="i" begin="${pb.startPageOfPageGroup}" end="${pb.endPageOfPageGroup}">
		<c:choose>
			<c:when test="${pb.nowPage!=i}">
				<%-- <a href="${initParam.root}admin_postingListWithSmallProducts.do?pageNo=${i}">${i}</a> --%>
				 <li><a href="#">${i}</a></li>
			</c:when>
			<c:otherwise>
				<li class="active"><a href="#" onclick="return false;">${i} <span class="sr-only">(current)</span></a></li>
			</c:otherwise>
		</c:choose>
	</c:forEach>
	<c:if test="${pb.nextPageGroup}">
		<li>
		<%-- <a href="${initParam.root}admin_postingListWithSmallProducts.do?pageNo=${pb.endPageOfPageGroup+1}">Next</a> --%>
		 <a href="#" aria-label="Next">
			<span aria-hidden="true">&raquo;</span>
		</a>
		</li>
	</c:if>
										    
										    
										  </ul>
										</nav>
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
                            <h3>${result.dailyAverageStudyTime} </h3>
                        </div>
                        <div class="panel-footer">
                            <span class="panel-eyecandy-title">하루평균 학습시간
                            </span>
                        </div>
                    </div>

                </div>
            </div>
        </div>
        
        
 <!--         page-wrapper
        <div id="page-wrapper">

            <div class="row">
                Page Header
                <div class="col-lg-12">
                    <h1 class="page-header">통계페이지</h1>
                </div>
                End Page Header
            </div>

            <div class="row">
                Welcome
                <div class="col-lg-12">
                    <div class="alert alert-info">
                        <i class="fa fa-folder-open"></i><b>&nbsp;안녕하세요 ! </b>본 페이지에서 <b>똘기의  </b>
						<b>학습과 관련된 다양한 데이터를 </b> 한눈에 확인하세요!
                    </div>
                </div>
                end  Welcome
            </div>


            <div class="row">
                quick info section
                <div class="col-lg-3">
                    <div class="alert alert-info text-center">
                        <i class="fa fa-rss fa-3x"></i>&nbsp;<b>1,900</b>개의 단어를 학습

                    </div>
                </div>
                <div class="col-lg-3">
                    <div class="alert alert-success text-center">
                        <i class="fa  fa-beer fa-3x"></i>&nbsp;<b>87 % </b>최근 일주일간의 정답율  
                    </div>
                </div>
                <div class="col-lg-3">
                    <div class="alert alert-warning text-center">
                        <i class="fa  fa-pencil fa-3x"></i>&nbsp;<b>2,000 시간 </b>총 누적 한글봇 학습시간
                    </div>
                </div>
                <div class="col-lg-3">
                    <div class="alert alert-danger text-center">
                        <i class="fa fa-calendar fa-3x"></i>&nbsp;<b>20 </b>일주일간 오답 단어 수

                    </div>
                </div>
                end quick info section
            </div>

            <div class="row">
                <div class="col-lg-8">



                    Area chart example
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <i class="fa fa-bar-chart-o fa-fw"></i> 단어 난이도별 정답률
                            <div class="pull-right">
                                <div class="btn-group">
                                    <button type="button" class="btn btn-default btn-xs dropdown-toggle" data-toggle="dropdown">
                                        	단어 난이도별 정답률
                                        <span class="caret"></span>
                                    </button>
                                    <ul class="dropdown-menu pull-right" role="menu">
                                        <li><a href="#">단어난이도별 정답률</a>
                                        </li>
                                        <li><a href="#">최근 학습시간 추이</a>
                                        </li>
                                        <li><a href="#">파닉스 숙련도</a>
                                        </li>
                                        <li class="divider"></li>
                                        <li><a href="#">정답률 변화 추이</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>

                        <div class="panel-body">
                            <div id="morris-area-chart"></div>
                        </div>

                    </div>
                    End area chart example
                    Simple table example
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
                                            <tbody>
                                                <tr>
                                                    <td>3326</td>
                                                    <td>10/21/2013</td>
                                                    <td>3:29 PM</td>
                                                    <td>$321.33</td>
                                                </tr>
                                                <tr>
                                                    <td>3325</td>
                                                    <td>10/21/2013</td>
                                                    <td>3:20 PM</td>
                                                    <td>$234.34</td>
                                                </tr>
                                                <tr>
                                                    <td>3324</td>
                                                    <td>10/21/2013</td>
                                                    <td>3:03 PM</td>
                                                    <td>$724.17</td>
                                                </tr>
                                                <tr>
                                                    <td>3323</td>
                                                    <td>10/21/2013</td>
                                                    <td>3:00 PM</td>
                                                    <td>$23.71</td>
                                                </tr>
                                                <tr>
                                                    <td>3322</td>
                                                    <td>10/21/2013</td>
                                                    <td>2:49 PM</td>
                                                    <td>$8345.23</td>
                                                </tr>


                                            </tbody>
                                        </table>
                                        로그 더 보기
                                    </div>

                                </div>

                            </div>
                            /.row
                        </div>
                        /.panel-body
                    </div>
                    End simple table example

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
                            <h3>1270 </h3>
                        </div>
                        <div class="panel-footer">
                            <span class="panel-eyecandy-title">총 정답 단어수
                            </span>
                        </div>
                    </div>
                    <div class="panel panel-primary text-center no-boder">
                        <div class="panel-body green">
                            <i class="fa fa fa-floppy-o fa-3x"></i>
                            <h3>127개</h3>
                        </div>
                        <div class="panel-footer">
                            <span class="panel-eyecandy-title">하루평균 학습 단어수
                            </span>
                        </div>
                    </div>
                    <div class="panel panel-primary text-center no-boder">
                        <div class="panel-body red">
                            <i class="fa fa-thumbs-up fa-3x"></i>
                            <h3>127분 </h3>
                        </div>
                        <div class="panel-footer">
                            <span class="panel-eyecandy-title">하루평균 학습시간
                            </span>
                        </div>
                    </div>
                </div>

            </div>



        </div> -->
        <!-- end page-wrapper -->

    </div>
    <!-- end wrapper -->

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
		<c:forEach var="dataList" items="${result.studyWordCategoryList}" varStatus="status">
			var categoryArray = "${dataList}".split("/");
			var categoryName = categoryArray[0];
			var categoryCount = categoryArray[1]; 
			categoryData.push({label:categoryName,value:categoryCount});
		</c:forEach>
		var answerRateByGradeData = new Array();
		<c:forEach var="answerRateByGradeData" items="${result.answerRateMap}">
			answerRateByGradeData.push({y:'${answerRateByGradeData.key}',a:'${answerRateByGradeData.value}',b:10});
		</c:forEach>
		                    	
		$(document).ready(function(){
		    //  morris Area chart on dashboard///
		   
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
		        resize: true
		    });
	
			//alert(Math.round(4893204/3293, 1));
		});

	</script>
</body>

</html>
