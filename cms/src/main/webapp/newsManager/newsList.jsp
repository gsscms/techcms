<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
%>
<html>
<head>
	<title>消息列表管理</title>
	<link rel="stylesheet" type="text/css" href="<%=path %>/jqGrid/css/ui.jqgrid.css" />    
	 <link rel=stylesheet type="text/css" href="<%=path %>/css/admin/basic.css" />
    <link type="text/css" href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.21/themes/redmond/jquery-ui.css" rel="stylesheet" />
    <script type="text/javascript" src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.21/jquery-ui.min.js"></script>
    <script type="text/javascript" src="<%=path %>/js/jquery.form.js"></script>
    <script type="text/javascript" src="<%=path %>/js/jquery.validate_cn.min.js"></script>
    <script src="<%=path %>/ckeditor/adapters/jquery.js"></script>
    <script src="<%=path %>/jqGrid/js/jquery.jqGrid.min.js"></script>
    <script src="<%=path %>/jqGrid/js/i18n/grid.locale-cn.js" type="text/javascript"></script>  

	<style>
	body{
		font: 14px "Trebuchet MS", sans-serif;
	}
	.head{
		padding: 10px 0px 5px 5px;
		height:25px;
		width:100%;
		color:#345;
		background:#eee;
		border-bottom:1px solid #ccc;
	}
	.head .round{
		background:url(../icons/application_home.png) no-repeat 10px 50%;
		padding-left:35px;
	}
	.head a{
		color:#345;
		text-decoration :none;
	}
	.mainbox{
		border:1px dotted #ccc;
		padding:5px;
	}
	.functionbar {
		height:30px;
		width:100%;
		background:#cfe;
		padding:5px 5px;
		margin:0px 0px 2px;
	}
	.ui-priority-secondary{
		background:#ddd;
	}
	.ui-jqgrid-titlebar{
		background-position:50% 50%;
		border-bottom:1px solid #ccc;
	}
	.ui-jqgrid-view span{
		font-size:14px;
		color:#fff;
		padding-left:10px;
	}
	th,td{
		font-size:14px;
	}
	th *{
		heihgt:20px;
		line-height:16px;
		font-weight:bold;
	}
	</style>
	
	<script>
	function publicInfo(){
	    window.location.href="<%= path%>/newsManager/addPublicInfo.jsp"; 
	}
	$(function() {
	       
		    jQuery("#moduleList").jqGrid({
		   	url:'/jqGrid01',
			datatype: "json",
			prmNames: {search: "search"},   //(1)  
			jsonReader: {  
			            root:"gridModel",       // (2)  
			            records: "record",      // (3)  
			            repeatitems : false     // (4)  
			}, 
			loadComplete: function() {//如果数据不存在，提示信息
				    var rowNum = $("#moduleList").jqGrid('getGridParam','records');
				   // var list = $("#moduleList").jqGrid('getGridParam','root');
				    if (rowNum == 0){
				    	if($("#norecords").html() == null){
				            $("#moduleList").parent().append("</pre><div id='norecords' style='color:red;text-align:center;padding:5px;font-size:14px;'>没有查询记录！</div><pre>");
				        }
				        $("#norecords").show();
				    }else{//如果存在记录，则隐藏提示信息。
				        $("#norecords").hide();
			       }
				},
			colNames: ["标题","类型"],//"版块类型",
			colModel: [
			         //   {name: "idx",index:"idx",width:10,hidden:false,resizable: false, sortable:false,align:"center"},
			            {name: "title",index:"title",width:30,hidden:false, key:true,resizable: false,align:"center"},
			            {name: "typeName",index:"typeName",width:30,hidden:false, key:true,resizable: false,align:"center"}
			       //     {name: "descpt",index:"descpt",width:30,resizable: true, sortable:true, editable:true,edittype:'textarea'},
			        //    {name: "amount",index:"amount",width:30, resizable: false,hidden:false, sortable:true, align:"right"}
			        ],
		   	height:350,
		   	rowNum:10,
		   	rowList:[10,20,30],
		   	pager: '#pager1',
		   	sortname: 'id',
		    viewrecords: true,
		    sortorder: "desc",
		    altRows:true,
		    viewrecords: true,
		    loadui: "disable",
		    emptyrecords:"没有相应的记录",
			hidegrid:false,
			autowidth: true,
		    caption:"消息列表"
		});
		jQuery("#moduleList").jqGrid('navGrid','#pager1',{edit:false,add:false,del:false});
	});
	</script>
</head>
<body>

<div class="mainbox">
  	<div class="functionbar">
  		<table>
  			<tr>
  				<td>
  					<input type="button" style="width:80px;height:25px;" value="发布消息" onclick="publicInfo()"/>
					<input type="button" style="width:80px;height:25px;" value="删除消息" onclick="delInfo()">
				</td>
  			</tr>
  		</table>
		
  	</div>
	<table id="moduleList"></table>
	<div id="pager1"></div>
</div>
</body>
</html>