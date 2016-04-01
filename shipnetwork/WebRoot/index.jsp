<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>船联网</title>
    <link href="resource/hplus/css/bootstrap.min.css" rel="stylesheet">
    <link href="resource/hplus/css/font-awesome.min.css" rel="stylesheet">
    <link href="resource/hplus/css/animate.min.css" rel="stylesheet">
    <link href="resource/hplus/css/style.min.css" rel="stylesheet">
    <script type="text/javascript" src="resource/hplus/js/jquery.min.js"></script>
    <script type="text/javascript" src="resource/hplus/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="resource/hplus/js/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script type="text/javascript" src="resource/hplus/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
    <script type="text/javascript" src="resource/hplus/js/plugins/layer/layer.min.js"></script>
    <script type="text/javascript" src="resource/hplus/js/hplus.min.js"></script>
    <script type="text/javascript" src="resource/hplus/js/contabs.min.js"></script>
    <script type="text/javascript" src="resource/hplus/js/plugins/pace/pace.min.js"></script>
    <script type="text/javascript">
    $(function(){
    	$.ajax({
    		url:'userinfo',
    		type:'post',
    		dataType:'json',
    		cache:false,
    		success:function(r){
				$('#uname').html(r.loginName);
				$('#rname').html(r.position);
    		}
    	});
    });
    </script>
  </head>
  <body class="fixed-sidebar full-height-layout gray-bg" style="overflow:hidden">
    <div id="wrapper">
    	<!--左侧导航开始-->
        <nav class="navbar-default navbar-static-side" role="navigation">
            <div class="nav-close"><i class="fa fa-times-circle"></i>
            </div>
            <div class="sidebar-collapse">
                <ul class="nav" id="side-menu">
                    <li class="nav-header">
                        <div class="dropdown profile-element">
                            <span><img alt="image" class="img-circle" src="resource/hplus/img/profile_small.jpg" /></span>
                            <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                                <span class="clear">
                               <span class="block m-t-xs"><strong class="font-bold"><span id="uname">Beaut-zihan</span></strong></span>
                                <span class="text-muted text-xs block"><span id="rname">超级管理员</span><b class="caret"></b></span>
                                </span>
                            </a>
                            <ul class="dropdown-menu animated fadeInRight m-t-xs">
                                <li><a class="J_menuItem" href="xgmm.jsp">修改密码 </a>
                                </li>
                                <li class="divider"></li>
                                <li><a href="logout">安全退出</a>
                                </li>
                            </ul>
                        </div>
                        <div class="logo-element"></div>
                    </li>
                    <li>
                        <a class="J_menuItem" href="zhzx.jsp"><i class="fa fa-home"></i> <span class="nav-label">指挥中心</span></a>
                    </li>
                    <li>
                        <a class="J_menuItem" href="jcjl.jsp"><i class="fa fa-list"></i> <span class="nav-label">监测记录</span></a>
                    </li>
                    <li>
                        <a class="J_menuItem" href="cbhc.jsp"><i class="fa fa-desktop"></i> <span class="nav-label">船舶监控</span></a>
                    </li>
                    <li>
                        <a class="J_menuItem" href="jkgl.jsp"><i class="fa fa-cutlery"></i> <span class="nav-label">监控管理</span></a>
                    </li>
                    <li>
                        <a class="J_menuItem" href="zhgl.jsp"><i class="fa fa-user"></i> <span class="nav-label">账号管理</span></a>
                    </li>
                    <li>
                        <a class="J_menuItem" href="menu_mtgl.jsp"><i class="fa fa-user"></i> <span class="nav-label">码头管理</span></a>
                    </li>
                </ul>
            </div>
        </nav>
        <!--左侧导航结束-->
        <!--右侧部分开始-->
        <div id="page-wrapper" class="gray-bg dashbard-1">
            <div class="row border-bottom">
                <nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0">
                    <div class="navbar-header">
                    	<a class="navbar-minimalize btn btn-primary" style="margin: 14px 5px 5px 20px;float: left;" href="#"><i class="fa fa-bars"></i> </a>
                    	<h2 style="margin: 14px 5px 5px 50px;float: left;"> 湖州船联网 &nbsp;&nbsp;The Internet Of Inland Ships</h2>
                    	    
                    </div>
                </nav>
            </div>
            <div class="row content-tabs">
                <button class="roll-nav roll-left J_tabLeft"><i class="fa fa-backward"></i>
                </button>
                <nav class="page-tabs J_menuTabs">
                    <div class="page-tabs-content">
                        <a href="javascript:;" class="active J_menuTab" data-id="welcome.jsp">首页</a>
                    </div>
                </nav>
                <button class="roll-nav roll-right"><i class="fa fa-forward"></i>
                </button>
            </div>
            <div class="row J_mainContent" id="content-main">
                <iframe class="J_iframe" name="iframe0" width="100%" height="100%" src="welcome.jsp" frameborder="0" data-id="welcome.jsp" seamless></iframe>
            </div>
        </div>
        <!--右侧部分结束-->
    </div>
  </body>
</html>