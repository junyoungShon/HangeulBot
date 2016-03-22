<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bootsrtap Free Admin Template - SIMINTA | Admin Dashboad Template</title>
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
                <a class="navbar-brand" href="index.html">
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
                <div class="col-lg-12">
                    <div class="alert alert-info">
                        <i class="fa fa-folder-open"></i><b>&nbsp;안녕하세요 ! </b>본 페이지에서 <b>똘기의  </b>
						<b>학습과 관련된 다양한 데이터를 </b> 한눈에 확인하세요!
                    </div>
                </div>
                <!--end  Welcome -->
            </div>


            <div class="row">
                <!--quick info section -->
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
                                               <!--  <tr>
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
 -->

                                            </tbody>
                                        </table>
                                        로그 더 보기
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



        </div>
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
    <script src="${initParam.root}js/dashboard.js"  charset='utf-8'></script>

</body>

</html>
