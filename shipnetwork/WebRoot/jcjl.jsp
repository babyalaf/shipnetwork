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
    <link href="<%=path %>/resource/hplus/css/plugins/datepicker/datepicker3.css" rel="stylesheet">
    <link href="<%=path %>/resource/hplus/css/plugins/iCheck/custom.css" rel="stylesheet">
    <link href="<%=path %>/resource/hplus/css/animate.min.css" rel="stylesheet">
    <link href="<%=path %>/resource/hplus/css/style.min.css" rel="stylesheet">
    <script type="text/javascript" src="<%=path %>/resource/hplus/js/jquery.min.js"></script>
    <script type="text/javascript" src="<%=path %>/resource/hplus/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="<%=path %>/resource/hplus/js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
    <script type="text/javascript" src="<%=path %>/resource/hplus/js/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
    <script type="text/javascript" src="<%=path %>/resource/hplus/js/plugins/datepicker/bootstrap-datepicker.js"></script>
    <script type="text/javascript" src="<%=path %>/resource/hplus/js/plugins/iCheck/icheck.min.js"></script>
	<script type="text/javascript">
	$(function(){
		$('#datetimepicker').datepicker({format: 'yyyy-mm-dd'});
		$(".i-checks").iCheck({checkboxClass:"icheckbox_square-green",radioClass:"iradio_square-green"});
		$('#jcjl').bootstrapTable({
			url: '<%=path %>/jcjl', 
    	    cache: false, 
    	    pagination: true, 
    	    pageSize:15,
    	    pageList:[15],
    	    sidePagination: "server", 
            queryParams: queryParams,
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
	function queryParams(params) {
        var temp = {
            limit: params.limit, offset: params.offset,
            checkTime: $('#datetimepicker').val(), site:$('#jcjlSite').val(), name:$('#jcjlShipName').val(),
            ais:$("input:radio[name='aisRadio']:checked").val(), report:$("input:radio[name='reportRadio']:checked").val(),
            arrearage:$("input:radio[name='arrearageRadio']:checked").val(), overdue:$("input:radio[name='overdueRadio']:checked").val(),
            peccancy:$("input:radio[name='peccancyRadio']:checked").val(), blacklist:$("input:radio[name='blacklistRadio']:checked").val()
        };
        return temp;
    }
	function zd(a,b){
		$('#jcjlSite').val(a);
		$('#jcjlSiteShow').html(b);
	}
	function jcjlSearch(){
		$('#jcjl').bootstrapTable('refresh');
	}
	</script>
  </head>
  <body class="gray-bg">
    <div class="wrapper wrapper-content">
    	<div class="row">
    		<div class="col-sm-12">
    			<div class="ibox float-e-margins">
    				<div class="ibox-title">
    					<h5>监测记录查询</h5>
    				</div>
    				<div class="ibox-content">
    					<form id="jcjlFrm" class="form-horizontal">
    						<div class="form-group">
    							<label class="col-sm-1 control-label">日期</label>
    							<div class="col-sm-2">
    								<input type="text" id="datetimepicker" class="form-control">
    							</div>
    							<label class="col-sm-1 control-label">监测点</label>
    							<div class="col-sm-6">
    								<div class="input-group m-b">
                                        <div class="input-group-btn">
                                        	<input type="hidden" id="jcjlSite">
                                            <button data-toggle="dropdown" class="btn btn-white dropdown-toggle" type="button">
                                            	<span id="jcjlSiteShow">全部</span> 
                                            	<span class="caret"></span>
                                            </button>
                                            <ul class="dropdown-menu">
                                            	<li><a href="javascript:zd('','全部');">全部</a></li>
                                                <li><a href="javascript:zd('0572001','洪桥');">洪桥</a></li>
                                                <li><a href="javascript:zd('0572002','南浔');">南浔</a></li>
                                                <li><a href="javascript:zd('0572003','双林');">双林</a></li>
                                                <li><a href="javascript:zd('0572004','新市');">新市</a></li>
                                                <li><a href="javascript:zd('0572005','乾元');">乾元</a></li>
                                                <li><a href="javascript:zd('0572006','梅溪');">梅溪</a></li>
                                                <li><a href="javascript:zd('0572007','太湖');">太湖</a></li>
                                                <li><a href="javascript:zd('0572008','和云桥');">和云桥</a></li>
                                                <li><a href="javascript:zd('0572009','湖州船闸');">湖州船闸</a></li>
                                            </ul>
                                        </div>
                                        <input type="text" class="form-control" placeholder="船名" id="jcjlShipName">
                                    </div>
    							</div>
    							<div class="col-sm-2">
    								<button type="button" class="btn btn-danger" onclick="jcjlSearch()"><i class="fa fa-search"></i> 查询</button>
    							</div>
    						</div>
    						<div class="form-group">
                                <div class="col-sm-2">
                                	<label class="control-label">AIS:</label>
                                    <div class="radio-inline i-checks">
                                        <label><input type="radio" value="" name="aisRadio" checked="checked">全部</label>
                                    </div>
                                    <div class="radio-inline i-checks">
                                        <label><input type="radio" value="1" name="aisRadio">正常</label>
                                    </div>
                                    <div class="radio-inline i-checks">
                                        <label><input type="radio" value="0" name="aisRadio">异常</label>
                                    </div>
                                </div>
                                <div class="col-sm-2">
                                	<label class="control-label">报港:</label>
                                	<div class="radio-inline i-checks">
                                        <label><input type="radio" value="" name="reportRadio" checked="checked">全部</label>
                                    </div>
                                    <div class="radio-inline i-checks">
                                        <label><input type="radio" value="1" name="reportRadio">正常</label>
                                    </div>
                                    <div class="radio-inline i-checks">
                                        <label><input type="radio" value="0" name="reportRadio">异常</label>
                                    </div>
                                </div>
                                <div class="col-sm-2">
                                	<label class="control-label">欠费:</label>
                                	<div class="radio-inline i-checks">
                                        <label><input type="radio" value="" name="arrearageRadio" checked="checked">全部</label>
                                    </div>
                                    <div class="radio-inline i-checks">
                                        <label><input type="radio" value="0" name="arrearageRadio">无</label>
                                    </div>
                                    <div class="radio-inline i-checks">
                                        <label><input type="radio" value="1" name="arrearageRadio">有</label>
                                    </div>
                                </div>
                                <div class="col-sm-2">
                                	<label class="control-label">过期:</label>
                                	<div class="radio-inline i-checks">
                                        <label><input type="radio" value="" name="overdueRadio" checked="checked">全部</label>
                                    </div>
                                    <div class="radio-inline i-checks">
                                        <label><input type="radio" value="0" name="overdueRadio">无</label>
                                    </div>
                                    <div class="radio-inline i-checks">
                                        <label><input type="radio" value="1" name="overdueRadio">有</label>
                                    </div>
                                </div>
                                <div class="col-sm-2">
                                	<label class="control-label">违章:</label>
                                	<div class="radio-inline i-checks">
                                        <label><input type="radio" value="" name="peccancyRadio" checked="checked">全部</label>
                                    </div>
                                    <div class="radio-inline i-checks">
                                        <label><input type="radio" value="0" name="peccancyRadio">无</label>
                                    </div>
                                    <div class="radio-inline i-checks">
                                        <label><input type="radio" value="1" name="peccancyRadio">有</label>
                                    </div>
                                </div>
                                <div class="col-sm-2">
                                	<label class="control-label">黑名单:</label>
                                	<div class="radio-inline i-checks">
                                        <label><input type="radio" value="" name="blacklistRadio" checked="checked">全部</label>
                                    </div>
                                    <div class="radio-inline i-checks">
                                        <label><input type="radio" value="0" name="blacklistRadio">否</label>
                                    </div>
                                    <div class="radio-inline i-checks">
                                        <label><input type="radio" value="1" name="blacklistRadio">是</label>
                                    </div>
                                </div>
                            </div>
    					</form>
    					<div class="hr-line-dashed"></div>
    					<table id="jcjl"></table>
    				</div>
    			</div>
    		</div>
    	</div>
    </div>
  </body>
</html>