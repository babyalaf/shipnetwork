<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String tagname = session.getAttribute("session_tag_name").toString();
%>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title></title>
    <link href="<%=path %>/resource/hplus/css/bootstrap.min.css" rel="stylesheet">
    <link href="<%=path %>/resource/hplus/css/font-awesome.min.css" rel="stylesheet">
    <link href="<%=path %>/resource/hplus/css/plugins/bootstrap-table/bootstrap-table.min.css" rel="stylesheet">
    <link href="<%=path %>/resource/hplus/css/animate.min.css" rel="stylesheet">
    <link href="<%=path %>/resource/hplus/css/style.min.css" rel="stylesheet">
    <script type="text/javascript" src="<%=path %>/resource/hplus/js/jquery.min.js"></script>
    <script type="text/javascript" src="<%=path %>/resource/hplus/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="<%=path %>/resource/hplus/js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
    <script type="text/javascript" src="<%=path %>/resource/hplus/js/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
    <script type="text/javascript">
    var _bTable = null;
    $(function(){
    	_bTable = $('#shipListTab').bootstrapTable({
    		url: '<%=path %>/bjMonth', 
    	    cache: false, 
    	    pagination: true, 
    	    pageSize:15,
    	    pageList:[15],
    	    search: true, 
    	    showRefresh: true,
    	    sidePagination: "server", 
    	    columns: [
				{title: '监测时间',field: 'checkTime'},
				{title: '方向',field: 'direction'},
				{title: '船名',field: 'name'},
				{title: 'AIS',field: 'ais'},
				{title: '报港',field: 'report'},
				{title: '欠费',field: 'arrearage'},
				{title: '过期',field: 'overdue'},
				{title: '违章',field: 'peccancy'},
				{title: '黑名单',field: 'blacklist'}
    	    ]
    	});
    });
    function zdbjback(){
    	window.location.href = '<%=path %>/zhzx.jsp';
    }
    </script>
  </head>
  <body class="gray-bg">
    <div class="wrapper wrapper-content  animated fadeInRight">
    	<div class="row">
   			<div class="col-sm-12">
   				<div class="widget style1 lazur-bg">
                    <div class="row">
                        <div class="col-xs-2">
                            <a class="btn btn-link" title="返回" href="javascript:zdbjback();"><i class="fa fa-reply fa-2x"></i></a>
                        </div>
                        <div class="col-xs-8 text-center">
                            <h2 class="font-bold"><%=tagname %></h2>
                        </div>
                    </div>
                </div>
   			</div>
    	</div>
        <div class="row">
			<!-- 执勤人员 begin-->
            <div class="col-sm-4">
                <div class="ibox">
                    <div class="ibox-content text-center">
                        <h3 class="m-b-xxs">执勤人员</h3>
                    </div>
                </div>
				<div class="row">
					<div class="col-sm-6">
						<div class="contact-box">
	                        <div class="col-sm-4">
	                            <div class="text-center">
	                                <img alt="image" class="img-circle m-t-xs img-responsive" src="<%=path %>/resource/hplus/img/a2.jpg">
	                                <div class="m-t-xs font-bold"><span class="label label-primary">在岗</span></div>
	                            </div>
	                        </div>
	                        <div class="col-sm-8">
	                            <h3><strong>奔波儿灞</strong></h3>
	                            <p><i class="fa fa-phone"></i>15088616987</p>
	                        </div>
	                        <div class="clearfix"></div>
		                </div>
					</div>
					<div class="col-sm-6">
						<div class="contact-box">
	                        <div class="col-sm-4">
	                            <div class="text-center">
	                                <img alt="image" class="img-circle m-t-xs img-responsive" src="<%=path %>/resource/hplus/img/a2.jpg">
	                                <div class="m-t-xs font-bold"><span class="label label-primary"></span></div>
	                            </div>
	                        </div>
	                        <div class="col-sm-8">
	                            <h3><strong>奔波儿灞</strong></h3>
	                            <p><i class="fa fa-phone"></i>15088616987</p>
	                        </div>
	                        <div class="clearfix"></div>
		                </div>
					</div>
				</div>
                <div class="row">
					<div class="col-sm-6">
						<div class="contact-box">
	                        <div class="col-sm-4">
	                            <div class="text-center">
	                                <img alt="image" class="img-circle m-t-xs img-responsive" src="<%=path %>/resource/hplus/img/a2.jpg">
	                                <div class="m-t-xs font-bold"><span class="label label-primary">在岗</span></div>
	                            </div>
	                        </div>
	                        <div class="col-sm-8">
	                            <h3><strong>奔波儿灞</strong></h3>
	                            <p><i class="fa fa-phone"></i>15088616987</p>
	                        </div>
	                        <div class="clearfix"></div>
		                </div>
					</div>
					<div class="col-sm-6">
						<div class="contact-box">
	                        <div class="col-sm-4">
	                            <div class="text-center">
	                                <img alt="image" class="img-circle m-t-xs img-responsive" src="<%=path %>/resource/hplus/img/a2.jpg">
	                                <div class="m-t-xs font-bold"><span class="label label-primary">在岗</span></div>
	                            </div>
	                        </div>
	                        <div class="col-sm-8">
	                            <h3><strong>奔波儿灞</strong></h3>
	                            <p><i class="fa fa-phone"></i>15088616987</p>
	                        </div>
	                        <div class="clearfix"></div>
		                </div>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-6">
						<div class="contact-box">
	                        <div class="col-sm-4">
	                            <div class="text-center">
	                                <img alt="image" class="img-circle m-t-xs img-responsive" src="<%=path %>/resource/hplus/img/a2.jpg">
	                                <div class="m-t-xs font-bold"><span class="label label-primary"></span></div>
	                            </div>
	                        </div>
	                        <div class="col-sm-8">
	                            <h3><strong>奔波儿灞</strong></h3>
	                            <p><i class="fa fa-phone"></i>15088616987</p>
	                        </div>
	                        <div class="clearfix"></div>
		                </div>
					</div>
					<div class="col-sm-6">
						<div class="contact-box">
	                        <div class="col-sm-4">
	                            <div class="text-center">
	                                <img alt="image" class="img-circle m-t-xs img-responsive" src="<%=path %>/resource/hplus/img/a2.jpg">
	                                <div class="m-t-xs font-bold"><span class="label label-primary">在岗</span></div>
	                            </div>
	                        </div>
	                        <div class="col-sm-8">
	                            <h3><strong>奔波儿灞</strong></h3>
	                            <p><i class="fa fa-phone"></i>15088616987</p>
	                        </div>
	                        <div class="clearfix"></div>
		                </div>
					</div>
				</div>
            </div>
            <!-- 执勤人员 end-->
            
            <!-- 报警条目begin-->
            <div class="col-sm-8">
                <div class="ibox ">
                    <div class="ibox-content text-center">
                        <h3 class="m-b-xxs">报警船舶</h3>
                    </div>
                </div>
				<div class="row">
					<div class="col-sm-12">
						<div class="ibox">
							<div class="ibox-content">
								<table id="shipListTab"></table>
							</div>
						</div>
					</div>
				</div>
            </div>
            <!-- 报警条目end-->
        </div>
    </div>
</body>
</html>