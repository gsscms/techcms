<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <meta http-equiv="Content-Language" content="zh-cn" />
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <!--可用参数all|none|index|noindex|follow|nofollow-->
    <meta name="Robots" content="all" />
    <meta name="keywords" content="all" />
    <meta name="description" content="" />
    <meta name="author" content="slime" />
    <meta name=copyright content="2014" />
    <title>中医独特诊疗技术研究平台后台管理</title>
    <link rel=stylesheet type="text/css" href="css/admin/basic.css" />
   
    <link type="text/css" href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.21/themes/redmond/jquery-ui.css" rel="stylesheet" /> 
    <script type="text/javascript" src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.7.2.min.js"></script>
<!-- 	<script src="/jquery-1.9.1/jquery-1.9.1.min.js"></script> -->
    <script type="text/javascript" src="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.21/jquery-ui.min.js"></script>
    <script type="text/javascript" src="js/jquery.form.js"></script>
    <script type="text/javascript" src="js/jquery.validate_cn.min.js"></script>
    <script type="text/javascript" src="js/common.js"></script>
<!--     <script type="text/javascript" src="js/jqzoom.pack.1.0.1.js"></script> -->
    <script src="/ckeditor/ckeditor.js"></script>
    <script src="/ckfinder/ckfinder.js"></script>
    <script src="/ckeditor/adapters/jquery.js"></script>
    <script src="/jqGrid/js/jquery.jqGrid.min.js"></script>
    <script src="/jqGrid/js/i18n/grid.locale-cn.js" type="text/javascript"></script>  
	<style>
	    .footer{height:120px;background:#047959;line-height:30px;text-align:center;font-size:12px;color:white;padding-top:10px;} 
	
	</style>
	
</head>
<body id="sl-index">
    <div id="dialog"></div>
<div id="sl-wrap" class="ui-widget-content">
  <div id="sl-header" class="ui-widget-header">
        <h1>中医独特诊疗技术研究平台后台管理</h1>
  </div>
  <div id="sl-main-nav">
        <div id="sl-accordion">
             <h3><a href="#">网站运营管理</a></h3>
            <div>
               <ol class="sl-selectable">
  										 <li class = "ui-widget-content" link = "display-module">前台展示设置</li>
<!--                                         <li class = "ui-widget-content" link = "webMenu-module">网站栏目维护</li> -->
                                        <li class = "ui-widget-content" link = "train—module">交流培训维护</li>                                     
<!--                 						<li class = "ui-widget-content" link = "contact-module">联系信息维护</li> -->
                						<li class = "ui-widget-content" link = "publicInfo-module">公告通知维护</li>
                						<li class = "ui-widget-content" link = "topic-module">相关课题维护</li>
                					 
<!--                 						<li class = "ui-widget-content" link = "dict-module">字典维护</li> -->
                </ol>
            </div>
             <h3><a href="#">技术征集</a></h3>
            <div>
               <ol class="sl-selectable">
                                       <li class = "ui-widget-content" link = "skill-module">独特技术审查</li>
<!--                                         <li class = "ui-widget-content" link = "articles-manage">独特技术审查</li> -->
<!--                                         <li class = "ui-widget-content" link = "articles-classes">认证发布</li> -->
                                    </ol>
            </div>
            
                        <h3><a href="#">用户管理</a></h3>
            <div>
               			<ol class="sl-selectable">
                                      	<li class = "ui-widget-content" link = "user-modules">注册用户管理</li>
                                    
                        </ol>
            </div>

           </div>
  </div>
  <div id="sl-content">
      <div id="sl-tabs">
	<ul>
		<li></li>
	</ul>
     </div>
  </div>
  <div id="sl-footer" class="ui-widget-header">
 	 <br/>
      <p>中国中医科学院信息管理中心 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
		<br/>
  </div>
</div>
  </body>
</html>
