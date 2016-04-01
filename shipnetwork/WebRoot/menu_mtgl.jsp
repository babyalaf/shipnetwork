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
    <link href="<%=path %>/resource/hplus/css/plugins/toastr/toastr.min.css" rel="stylesheet">
    <link href="<%=path %>/resource/hplus/css/plugins/iCheck/custom.css" rel="stylesheet">
    <link href="<%=path %>/resource/hplus/css/animate.min.css" rel="stylesheet">
    <link href="<%=path %>/resource/hplus/css/style.min.css" rel="stylesheet">
    <script type="text/javascript" src="<%=path %>/resource/hplus/js/jquery.min.js"></script>
    <script type="text/javascript" src="<%=path %>/resource/hplus/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="<%=path %>/resource/hplus/js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
    <script type="text/javascript" src="<%=path %>/resource/hplus/js/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
    <script type="text/javascript" src="<%=path %>/resource/hplus/js/plugins/iCheck/icheck.min.js"></script>
    <script type="text/javascript" src="<%=path %>/resource/hplus/js/plugins/toastr/toastr.min.js"></script>
	<script type="text/javascript">
	$(function(){
		 
		
		$('#zhTbl').bootstrapTable({
			//url: '<%=path %>/mtgl',
			url: '<%=path %>/mtgl', 
    	    cache: false, 
    	    showRefresh:true,
    	    clickToSelect:true,
    	    sidePagination: 'server',
    	    toolbar:'#zhToolbar',
    	    columns: [
				{title: '',field: '',radio:true},
				{title: 'id',field: 'id'},
				{title: '名称',field: 'name'},
				{title: '位置',field: 'position'},
				{title: '组织',field: 'org',visible:false},
				{title: '等级',field: 'lev'},
				{title: '管理的站点',field: 'supervise',visible:false}
    	    ]
			
		});
	});
	 
	</script>
  </head>
  <body class="gray-bg">
    <div class="wrapper wrapper-content">
    	<div class="row">
    		<div class="col-sm-12">
    			<div class="ibox float-e-margins">
    				<div class="ibox-title">
    					<h5>账号管理</h5>
    				</div>
    				<div class="ibox-content">
    					<div class="btn-group hidden-xs" id="zhToolbar">
                            <button type="button" class="btn btn-outline btn-default">
                                <i class="glyphicon glyphicon-plus"></i> 新增
                            </button>
                            <button type="button" class="btn btn-outline btn-default" onclick="zhxg()">
                                <i class="glyphicon glyphicon-pencil"></i> 修改
                            </button>
                            <button type="button" class="btn btn-outline btn-default">
                                <i class="glyphicon glyphicon-trash"></i> 删除
                            </button>
                        </div>
    					<table id="zhTbl"></table>
    				</div>
    			</div>
    		</div>
    	</div>
    </div>
    
    <!-- 模态窗口 -->
    <div class="modal fade" id="myZhModal" tabindex="-1" role="dialog" aria-hidden="true">
	   <div class="modal-dialog">
	      <div class="modal-content">
	         <div class="modal-header">
	            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
	            <h4 class="modal-title">账号信息</h4>
	         </div>
	         <div class="modal-body">
	            <form class="form-horizontal">
	            	<input type="hidden" id="zhId">
	            	<div class="form-group">
                        <label class="col-sm-2 control-label">账号</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="zhLoginName">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">密码</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control"  id="zhPassword">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">职位</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="zhPosition">
                        </div>
                    </div>
	            </form>
	         </div>
	         <div class="modal-footer">
	            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	            <button type="button" class="btn btn-primary" onclick="jkUpdate()">提交</button>
	         </div>
	      </div>
	   </div>
	</div>
    
  </body>
</html>