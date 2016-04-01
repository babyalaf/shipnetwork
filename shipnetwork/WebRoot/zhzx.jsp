<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
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
    <link href="<%=path %>/resource/hplus/css/plugins/morris/morris-0.4.3.min.css" rel="stylesheet">
    <link href="<%=path %>/resource/hplus/css/animate.min.css" rel="stylesheet">
    <link href="<%=path %>/resource/hplus/css/style.min.css" rel="stylesheet">
    <script type="text/javascript" src="<%=path %>/resource/hplus/js/jquery.min.js"></script>
    <script type="text/javascript" src="<%=path %>/resource/hplus/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="<%=path %>/resource/hplus/js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
    <script type="text/javascript" src="<%=path %>/resource/hplus/js/plugins/morris/raphael-2.1.0.min.js"></script>
    <script type="text/javascript" src="<%=path %>/resource/hplus/js/plugins/morris/morris.js"></script>
    <script type="text/javascript">
    var _bjTable = null;
    $(function(){
    	_bjTable = $('#bjTab').bootstrapTable({
    		url: '<%=path %>/bjToday', 
    	    cache: false, 
    	    showHeader:false,
    	    sidePagination: "server", 
    	    columns: [
				{title: 'Site',field: 'site'},
				{title: 'Ship',field: 'ship'},
				{title: 'Info',field: 'info'}
    	    ]
    	});
    	monthAlarm();
    	tj(0);
    });
    function tj(idx){
    	$('.zbr').removeClass('active');
    	$('#c'+idx).addClass('active');
    	$('#tbtj').empty();
    	$.ajax({
      		url:'<%=path %>/barChart',
      		data:{'type':idx},
    		type:'post',
    		dataType:'json',
    		cache:false,
    		success:function(r){
    			Morris.Bar({
    				element: 'tbtj',
    				data:r,
    				xkey: 'site',
                    ykeys: ['total'],
                    labels: ['船舶数量'],
                    hideHover: 'always'
    			});
    		}
      	});
    }
    function monthAlarm(){
    	$.ajax({
    		url:'<%=path %>/monthAlarm',
    		type:'post',
    		dataType:'json',
    		cache:false,
    		success:function(r){
    			$.each(r,function(i,item){
    				$('#'+item.site).html(item.total);
    			});
    		}
    	});
    }
    </script>
  </head>
  <body class="gray-bg">
    <div class="wrapper wrapper-content">
    	<!-- 9个点报警数begin -->
    	<div class="row">
    		<div class="col-sm-4">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                    	<span class="label label-info pull-right"> 月</span>
                        <h2>洪桥</h2>
                    </div>
                    <div class="ibox-content">
                        <h1 class="no-margins"><a class="text-danger" href="<%=path %>/zdbj/0572001" id="0572001">0</a></h1>
                    </div>
                </div>
            </div>
            <div class="col-sm-4">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                    	<span class="label label-info pull-right"> 月</span>
                        <h2>南浔</h2>
                    </div>
                    <div class="ibox-content">
                        <h1 class="no-margins"><a class="text-danger" href="<%=path %>/zdbj/0572002" id="0572002">0</a></h1>
                    </div>
                </div>
            </div>
            <div class="col-sm-4">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                    	<span class="label label-info pull-right"> 月</span>
                        <h2>双林</h2>
                    </div>
                    <div class="ibox-content">
                        <h1 class="no-margins"><a class="text-danger" href="<%=path %>/zdbj/0572003" id="0572003">0</a></h1>
                    </div>
                </div>
            </div>
    	</div>
    	<div class="row">
    		<div class="col-sm-4">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                    	<span class="label label-info pull-right"> 月</span>
                        <h2>新市</h2>
                    </div>
                    <div class="ibox-content">
                        <h1 class="no-margins"><a class="text-danger" href="<%=path %>/zdbj/0572004" id="0572004">0</a></h1>
                    </div>
                </div>
            </div>
            <div class="col-sm-4">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                    	<span class="label label-info pull-right"> 月</span>
                        <h2>乾元</h2>
                    </div>
                    <div class="ibox-content">
                        <h1 class="no-margins"><a class="text-danger" href="<%=path %>/zdbj/0572005" id="0572005">0</a></h1>
                    </div>
                </div>
            </div>
            <div class="col-sm-4">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                    	<span class="label label-info pull-right"> 月</span>
                        <h2>梅溪</h2>
                    </div>
                    <div class="ibox-content">
                        <h1 class="no-margins"><a class="text-danger" href="<%=path %>/zdbj/0572006" id="0572006">0</a></h1>
                    </div>
                </div>
            </div>
    	</div>
    	<div class="row">
    		<div class="col-sm-4">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                    	<span class="label label-info pull-right"> 月</span>
                        <h2>太湖</h2>
                    </div>
                    <div class="ibox-content">
                        <h1 class="no-margins"><a class="text-danger" href="<%=path %>/zdbj/0572007" id="0572007">0</a></h1>
                    </div>
                </div>
            </div>
            <div class="col-sm-4">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                    	<span class="label label-info pull-right"> 月</span>
                        <h2>和云桥</h2>
                    </div>
                    <div class="ibox-content">
                        <h1 class="no-margins"><a class="text-danger" href="<%=path %>/zdbj/0572008" id="0572008">0</a></h1>
                    </div>
                </div>
            </div>
            <div class="col-sm-4">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                    	<span class="label label-info pull-right"> 月</span>
                        <h2>湖州船闸</h2>
                    </div>
                    <div class="ibox-content">
                        <h1 class="no-margins"><a class="text-danger" href="<%=path %>/zdbj/0572009" id="0572009">0</a></h1>
                    </div>
                </div>
            </div>
    	</div>
    	<!-- 9个点报警数end -->
    	
    	<!-- 实时报警滚动 图表统计begin -->
    	<div class="row">
    		<div class="col-sm-4">
    			<div class="ibox float-e-margins">
    				<div class="ibox-title">
    					<h5>报警</h5>
    				</div>
    				<div class="ibox-content">
	    				<table id="bjTab" style="height: 300px;"></table>
	                </div>
    			</div>
    		</div>
    		<div class="col-sm-8">
    			<div class="ibox float-e-margins">
    				<div class="ibox-title">
                        <h5>统计</h5>
                        <div class="pull-right">
                            <div class="btn-group">
                                <button id="c0" onclick="tj(0)" type="button" class="btn btn-xs btn-white zbr">流量</button>
                                <button id="c1" onclick="tj(1)" type="button" class="btn btn-xs btn-white zbr">违章</button>
                                <button id="c2" onclick="tj(2)" type="button" class="btn btn-xs btn-white zbr">报警</button>
                            </div>
                        </div>
                    </div>
                    <div class="ibox-content">
                    	<div id="tbtj" style="height: 300px;"></div>
                    </div>
    			</div>
    		</div>
    	</div>
    	<!-- 实时报警滚动 图表统计end -->
    </div>
  </body>
</html>