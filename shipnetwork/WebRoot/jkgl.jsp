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
		toastr.options = {
		        "closeButton": false, //是否显示关闭按钮
		        "debug": false, //是否使用debug模式
		        "positionClass": "toast-top-center",//弹出窗的位置
		        "showDuration": "300",//显示的动画时间
		        "hideDuration": "300",//消失的动画时间
		        "timeOut": "5000", //展现时间
		        "extendedTimeOut": "1000",//加长展示时间
		        "showEasing": "swing",//显示时的动画缓冲方式
		        "hideEasing": "linear",//消失时的动画缓冲方式
		        "showMethod": "fadeIn",//显示时的动画方式
		        "hideMethod": "fadeOut" //消失时的动画方式
		};
		
		$('#jkTbl').bootstrapTable({
			url: '<%=path %>/jkgl', 
    	    cache: false, 
    	    clickToSelect:true,
    	    sidePagination: 'server',
    	    toolbar:'#jkToolbar',
    	    columns: [
				{title: '',field: '',radio:true},
				{title: 'ID',field: 'id'},
				{title: '站点名称',field: 'tag'},
				{title: '站点编号',field: 'no'},
				{title: '流媒体IP',field: 'streamMediaIP'},
				{title: '直播IP',field: 'directIP'},
				{title: '用户名',field: 'directUserName'},
				{title: '密码',field: 'directPassword'},
				{title: '频道',field: 'directChannel'},
				{title: '回放IP',field: 'backIP'},
				{title: '用户名',field: 'backUserName'},
				{title: '密码',field: 'backPassword'},
				{title: '频道',field: 'backChannel'}
    	    ]
		});
	});
	function jkxg(){
		var row = $('#jkTbl').bootstrapTable('getSelections');
		if(row.length>0){
			$('#jkId').val(row[0].id);
			$('#jkTag').val(row[0].tag);
			$('#jkNo').val(row[0].no);
			$('#jkSIP').val(row[0].streamMediaIP);
			$('#jkDIP').val(row[0].directIP);
			$('#jkBIP').val(row[0].backIP);
			$('#jkDname').val(row[0].directUserName);
			$('#jkBname').val(row[0].backUserName);
			$('#jkDpwd').val(row[0].directPassword);
			$('#jkBpwd').val(row[0].backPassword);
			$('#jkDcl').val(row[0].directChannel);
			$('#jkBcl').val(row[0].backChannel);
			$('#myModal').modal();
		}else{
			toastr.warning("请先选择要修改的记录！！！");
		}
	}
	function jkUpdate(){
		$.ajax({
			url:'<%=path %>/jkUpdate',
			data:{
				id:$('#jkId').val(), tag:$('#jkTag').val(), no:$('#jkNo').val(), streamMediaIP:$('#jkSIP').val(),
				directIP:$('#jkDIP').val(),directUserName:$('#jkDname').val(),directPassword:$('#jkDpwd').val(),directChannel:$('#jkDcl').val(),
				backIP:$('#jkBIP').val(),backUserName:$('#jkBname').val(),backPassword:$('#jkBpwd').val(),backChannel:$('#jkBcl').val()
			},
			type:'post',
			dataType:'json',
			cache:false,
			success:function(r){
				$('#jkTbl').bootstrapTable('refresh');
				$('#myModal').modal('toggle');
			}
		});
	}
	</script>
  </head>
  <body class="gray-bg">
    <div class="wrapper wrapper-content">
    	<div class="row">
    		<div class="col-sm-12">
    			<div class="ibox float-e-margins">
    				<div class="ibox-title">
    					<h5>监控管理</h5>
    				</div>
    				<div class="ibox-content">
    					<div class="btn-group hidden-xs" id="jkToolbar">
                            <button type="button" class="btn btn-outline btn-default" onclick="jkxg()">
                                <i class="glyphicon glyphicon-pencil"></i> 修改监控配置信息
                            </button>
                        </div>
    					<table id="jkTbl"></table>
    				</div>
    			</div>
    		</div>
    	</div>
    </div>
    
    <!-- 模态窗口 -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-hidden="true">
	   <div class="modal-dialog">
	      <div class="modal-content">
	         <div class="modal-header">
	            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
	            <h4 class="modal-title">监控设置</h4>
	         </div>
	         <div class="modal-body">
	            <form class="form-horizontal">
	            	<div class="form-group">
                        <label class="col-sm-2 control-label">站点名称</label>
                        <div class="col-sm-4">
                        	<input type="hidden" id="jkId">
                            <input type="text" class="form-control" id="jkTag" disabled="disabled">
                        </div>
                        <label class="col-sm-2 control-label">站点编号</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="jkNo">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">流媒体IP</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control"  id="jkSIP">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">直播IP</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="jkDIP">
                        </div>
                        <label class="col-sm-2 control-label">回放IP</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="jkBIP">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">直播账号</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control"  id="jkDname">
                        </div>
                        <label class="col-sm-2 control-label">回放账号</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="jkBname">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">直播密码</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="jkDpwd">
                        </div>
                        <label class="col-sm-2 control-label">回放密码</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control"  id="jkBpwd">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">直播频道</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control"  id="jkDcl">
                        </div>
                        <label class="col-sm-2 control-label">回放频道</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control"  id="jkBcl">
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