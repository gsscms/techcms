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
    <script type="text/javascript" src="<%=path %>/js/mySelect.js"></script>
   	 <link type="text/css" href="<%=path %>/css/myCombox.css"  rel="stylesheet"/> 
   	 	<style>

	.querytext{
		height: 1.7em;
		top: 0.1em;
		width:15em;
	}
	</style>
  <script>
	
	$(function() {
	    
	    $( "#queryBtn" ).button()
	    				.click(function(){
	    				    var type =$("#select").find("option:selected").val();
	   						var param = {
	   							infoType:type,
	   							title:$("#titleText").val()
	   						};
	   						$("#moduleList").jqGrid("setGridParam", { postData: param});
	   				 		
	   				 		var postData = $("#moduleList").jqGrid("getGridParam", "postData");
	   				 		$("#moduleList").trigger('reloadGrid');  
	    				    
	    				});
	    
// 	    $( "#combobox" ).combobox();
		
		$.ajax({ 
		    url: "<%=path %>/publicInfoGridAction!publicDict", 
		    success: function(data){
			    var types=data; 
			   var $select = $("#combobox").parent().html("<select id=\"select\" name=\"info.dictCode\"/>").find("#select");
			   $select.append($("<option />").attr("value", ""));
			   $.each(types, function (i,item) {
			     $select.append($("<option />").attr("value", item.id).text(item.value));
			   });
			   $select.combobox();
		}});
	       
		    jQuery("#moduleList").jqGrid({
		   	url:'<%= path%>/publicInfoGridAction!initPublicInfoList',
			datatype: "json",
			//prmNames: {search: "search"},   //(1)  
			jsonReader: {  
			            root:"gridModel",       // (2)  
			            records: "record",      // (3)  
			            repeatitems : false     // (4)  
			}, 
			loadComplete: function() {//如果数据不存在，提示信息
				    var rowNum = $("#moduleList").jqGrid('getGridParam','records');
				    if (rowNum == 0){
				    	if($("#norecords").html() == null){
				            $("#moduleList").parent().append("</pre><div id='norecords' style='color:red;text-align:center;padding:5px;font-size:14px;'>没有查询记录！</div><pre>");
				        }
				        $("#norecords").show();
				    }else{//如果存在记录，则隐藏提示信息。
				        $("#norecords").hide();
			       }
				},
			colNames: ["id","标题","公告类型","创建日期","操作"],//"版块类型",
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
			  	window.location.href="<%= path%>/publicInfoManager/publicInfo.jsp"; 
		      });
		    $( "#edit-menu" )
		    .button()
		    .click(function() {
				
				var selectedId = $("#moduleList").jqGrid("getGridParam", "selrow");  
			    if(selectedId==null) {
					alert("请选择公告信息");		      					
			    }
			    var rowData = $("#moduleList").jqGrid("getRowData", selectedId); 
			    var id = rowData.id;
			   
			    window.location.href="<%= path%>/publicInfoGridAction!editPublicInfo?id="+id; 
			    
		     
		    });
		    $( "#del-menu" )
		    .button()
		    .click(function() {
			    var selectedId = $("#moduleList").jqGrid("getGridParam", "selrow");  
			    if(selectedId==null) {
					alert("请选择交流培训");		      					
			    }
			    var rowData = $("#moduleList").jqGrid("getRowData", selectedId);  
			    var id = rowData.id;
			   
					$.ajax({
					    url:"<%=path%>/info!deleteInfo",
					    dataType:"json",
					    data:{
							infoId:id
					    },
					    success:function(data){
//							alert("删除成功");
							$("#moduleList").trigger('reloadGrid');  
					    }
					});
						    
		     
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
	    window.location.href="<%= path%>/publicInfoGridAction!editPublicInfo?id="+id; 
	}
	</script>

</head>
<body>
 
<table>
	<tr>
<!-- 		<td>公告类型：</td> -->
<%-- 		<td  width="250px"><select id="combobox" name="info.dictCode"><option value="">请选择...</option></select></td> --%>
		<td>标题：</td>
		<td width="250px"><input class="text ui-widget-content ui-corner-all querytext" id="titleText"/></td>
		<td><button  id="queryBtn">查询</button></td>
		<td><button id="create-menu">添加</button></td>
<!-- 		<td><button id="edit-menu">编辑</button></td> -->
<!-- 		<td><button id="del-menu">删除</button></td> -->
	</tr>
</table>




 <table id="moduleList"></table>
 <div id="pager1"></div>
</body>
</html>