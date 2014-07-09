<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%
    String path = request.getContextPath();
%> 
<!doctype html>
<html >
<head>
  <meta charset="utf-8">
  <title>jQuery UI 对话框（Dialog） - 模态表单</title>
  <link rel="stylesheet" href="<%=path %>/jquery-ui-1.10.4.custom/development-bundle/themes/redmond/jquery-ui.css">
  <script src="<%=path %>/jquery-ui-1.10.4.custom/js/jquery-1.10.2.js"></script>
  <script src="<%=path %>/jquery-ui-1.10.4.custom/js/jquery-ui-1.10.4.custom.js"></script>
   
   <link rel="stylesheet" type="text/css" href="<%=path %>/jqGrid/css/ui.jqgrid.css" />    
   <script src="<%=path %>/jqGrid/js/jquery.jqGrid.min.js"></script>
   <script src="<%=path %>/jqGrid/js/i18n/grid.locale-cn.js" type="text/javascript"></script>  
 	 <link type="text/css" href="<%=path %>/css/myGrid.css"  rel="stylesheet"/>
  <script>
	
	$(function() {
	       
		    jQuery("#moduleList").jqGrid({
		   	url:'<%= path%>/topicAction!initTopicList',
			datatype: "json",
			//prmNames: {search: "search"},   //(1)  
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
			colNames: ["id","标题","课题分类","创建时间","操作"],//"版块类型",
			colModel: [
			            {name: "id",index:"id",width:10,hidden:true,resizable: false, sortable:false,align:"center"},
			            {name: "title",index:"title",width:30,hidden:false, key:true,resizable: false,align:"center"},
			            {name: "dictName",index:"dictName",width:30,hidden:false, key:true,resizable: false,align:"center"},
			            {name: "createTime",index:"createTime",width:30,hidden:false, key:true,resizable: false,align:"center",formatter:"date",formatoptions: {srcformat:'Y-m-d H:i:s',newformat:'Y/m/d'}},
			            {name: "dictName",index:"dictName",width:30,hidden:false, key:true,resizable: false,align:"center",
			        	formatter:function (cellvalue, options, rowdata){
			        	    return "<a href='#' style='color:#0072bc' onclick=editPublicInfo('"+rowdata.id+"')>【编辑】</a>&nbsp;&nbsp;<a href='#' style='color:#0072bc' onclick=delPublicInfo('"+rowdata.id+"')>【删除】</a>"; 
			            }
		            }  
			    ],
		   	height:250,
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
		

		    $( "#create-menu" )
		      .button()
		      .click(function() {
			  	window.location.href="<%= path%>/topicManager/topic.jsp"; 
		      });
		    $( "#edit-menu" )
		    .button()
		    .click(function() {
				var selectedId = $("#moduleList").jqGrid("getGridParam", "selrow");  
			    if(selectedId!=null) {
					var rowData = $("#moduleList").jqGrid("getRowData", selectedId);  		      					
			    }
			    
		     
		    });
		    $( "#del-menu" )
		    .button()
		    .click(function() {
				var selectedId = $("#moduleList").jqGrid("getGridParam", "selrow");  
			    if(selectedId!=null) {
					var rowData = $("#moduleList").jqGrid("getRowData", selectedId);  
					
					
			    }
			    
		     
		    });
		    $( "#editFlag" )
		    .button()
		    .click(function() {
				var selectedId = $("#moduleList").jqGrid("getGridParam", "selrow");  
			    if(selectedId!=null) {
					var rowData = $("#moduleList").jqGrid("getRowData", selectedId);  
					
					$.ajax({ 
					    url: "<%=path %>/topicAction!setWebDisplay", 
					    dataType: "json", 
					    data: { 
							infoId: rowData.id
							},
					    success: function(data){
						 alert("设置成功");
					}});
					
			    }
			    else{
					alert("请选择课题");
			    }
		     
		    });
	});
	
			function delPublicInfo(id){
				   
				$.ajax({
				    url:"<%=path%>/info!deleteInfo",
				    dataType:"json",
				    data:{
						infoId:id
				    },
				    success:function(data){
						$("#moduleList").trigger('reloadGrid');  
				    }
				});
		}

		function editPublicInfo(id){
			window.location.href="<%= path%>/topicAction!editTopic?infoId="+id; 
		}
	</script>

</head>
<body>
 
<table>
	<tr>
		<td>
			<button id="create-menu">添加</button>
<!-- <button id="edit-menu">编辑课题</button> -->
<!-- <button id="del-menu">删除课题</button> -->
<button id="editFlag">设置前台首页显示</button>
		</td>
	</tr>

</table>



 <table id="moduleList"></table>
 <div id="pager1"></div>
</body>
</html>