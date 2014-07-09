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
   	<script type="text/javascript" src="<%=path %>/js/mySelect.js"></script>
   	 <link type="text/css" href="<%=path %>/css/myCombox.css"  rel="stylesheet"/> 
   	 <link type="text/css" href="<%=path %>/css/myGrid.css"  rel="stylesheet"/>
  <style>
   
   
    #dialog-form label, #dialog-form label input { display:block; }
    #dialog-form input.text { margin-bottom:12px; width:95%; padding: .4em; }
    #dialog-form fieldset { padding:0; border:0; margin-top:25px; }
    #dialog-form h1 { font-size: 1.2em; margin: .6em 0; }
    #dialog-form .ui-dialog .ui-state-error { padding: .3em; }
    #dialog-form .validateTips { border: 1px solid transparent; padding: 0.3em; }
 
	
  </style>
  <script>
  
  	function setHot(id){
  	  $.ajax({
  	    url: "<%=path %>/trainGridAction!setHot", 
  	    dataType:"json",
  	    data:{
  			id:id
  	    },
  	    success:function(){
  			alert("设置成功");
  			var type =$("#select").find("option:selected").val();
	  		var param =
	  				{typeId:type,title:$("#titleInput").val()}
	  		
	  		//var info =
	  		$("#moduleList").jqGrid("setGridParam", { postData: param});
	 		
	 		var postData = $("#moduleList").jqGrid("getGridParam", "postData");
	 		$("#moduleList").trigger('reloadGrid'); 
  	    }
  	  });
  	}
  	
	function cencleHot(id){
	    $.ajax({
	  	    url: "<%=path %>/trainGridAction!cencelHot", 
	  	    dataType:"json",
	  	    data:{
	  			id:id
	  	    },
	  	    success:function(){
	  			alert("设置成功");
	  			
	  			var type =$("#select").find("option:selected").val();
		  		var param =
		  				{typeId:type,title:$("#titleInput").val()}
		  		
		  		//var info =
		  		$("#moduleList").jqGrid("setGridParam", { postData: param});
		 		
		 		var postData = $("#moduleList").jqGrid("getGridParam", "postData");
		 		$("#moduleList").trigger('reloadGrid'); 
	  	    }
	  	  });
  	}
	
	$(function() {
	    
		$.ajax({ 
		    url: "<%=path %>/trainGridAction!trainDict", 
		    success: function(data){
			    var types=data; 

			   		var $select = $("#combobox").parent().html("<select id=\"select\" />").find("#select");
			   		$select.append($("<option />").attr("value", "").text("---请选择"));
			   		$.each(types, function (i,item) {
			     		var option = $("<option />").attr("value", item.id).text(item.value);
			    		 $select.append(option);
			   		});

			
			 $select.find("option[value='<s:property value="info.dictCode" />']").attr("selected",true);
			 $select.combobox();
			
		}});
	       
		    jQuery("#moduleList").jqGrid({
		   	url:'<%= path%>/trainGridAction!initTrain',
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
			colNames: ["id","标题","类型","创建时间","操作"],//"版块类型",
			colModel: [
			           {name: "id",index:"id",width:10,hidden:true,resizable: false, sortable:false,align:"center"},
			            {name: "title",index:"title",width:30,hidden:false, key:true,resizable: false,align:"center"},
			            {name: "dictName",index:"dictName",width:30,hidden:false, key:true,resizable: false,align:"center"},
			            {name: "createTime",index:"createTime",width:20,hidden:false, key:true,resizable: false,align:"center",formatter:"date",formatoptions: {srcformat:'Y-m-d H:i:s',newformat:'Y/m/d'}},{
				               name: "id",index:"id",width:20,hidden:false, key:true,resizable: false,align:"center",
				               formatter:function(cellvalue, options, rowdata){
				        	    return "<a href='#' style='color:#0072bc' onclick=editPublicInfo('"+rowdata.id+"')>【编辑】</a>&nbsp;&nbsp;<a href='#' style='color:#0072bc' onclick=delPublicInfo('"+rowdata.id+"')>【删除】</a>"; 
							
// 				        	   		if(rowdata.flag==1)
// 				        	   		   return "<a href='#' style='color:#0072bc; text-decoration : underline' onclick=cencleHot('"+rowdata.id+"')>【取消热点】</a>"; 
// 				        	   		  else
// 					        	   		   return "<a href='#' style='color:#0072bc; text-decoration : underline' onclick=setHot('"+rowdata.id+"')>【设置热点】</a>"; 
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
		    caption:"交流培训列表"
		});
		jQuery("#moduleList").jqGrid('navGrid','#pager1',{edit:false,add:false,del:false});
		

		    $( "#create-train" )
		      .button()
		      .click(function() {
			  	window.location.href="<%= path%>/train/train.jsp"; 
		      });
		    $( "#edit-train" )
		    .button()
		    .click(function() {
			 
			   var selectedId = $("#moduleList").jqGrid("getGridParam", "selrow");  
			    if(selectedId==null) {
					alert("请选择交流培训");		      					
			    }
			    var rowData = $("#moduleList").jqGrid("getRowData", selectedId); 
			    var id = rowData.id;
			   
			    window.location.href="<%= path%>/trainGridAction!editTrain?id="+id; 
		     
		    });
		    $( "#del-train" )
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
// 							alert("删除成功");
							$("#moduleList").trigger('reloadGrid');  
					    }
					});
						    
		     
		    });
		    
		    
		   
		    
		    
		    $( "#addDictType" )
		      .button()
		      .click(function() {
		        $( "#dialog-form" ).dialog( "open" );
		      });
		    
		      $( "#query-train" )
		      .button()
		      .click(function(){
			  		 			  		
			  		var type =$("#select").find("option:selected").val();
			  		var param =
			  				{typeId:type,title:$("#titleInput").val()}
			  		
			  		//var info =
			  		$("#moduleList").jqGrid("setGridParam", { postData: param});
			 		
			 		var postData = $("#moduleList").jqGrid("getGridParam", "postData");
			 		$("#moduleList").trigger('reloadGrid');  

		      }    
		      );
	});
	
	
	function delPublicInfo(id){
		   
		$.ajax({
		    url:"<%=path%>/info!deleteInfo",
		    dataType:"json",
		    data:{
				infoId:id
		    },
		    success:function(data){
//					alert("删除成功");
				$("#moduleList").trigger('reloadGrid');  
		    }
		});
}

		function editPublicInfo(id){
		    window.location.href="<%= path%>/trainGridAction!editTrain?id="+id; 
		}
	</script>

</head>
<body>

<table>
	<tr>
		<td>类型:</td>
		<td> <select id="combobox"></select></td>
		<td align="right" width="100px">标题:</td>
		<td width="200px"> <input id="titleInput" class="text ui-widget-content ui-corner-all title" />	</td>
		<td><button id="query-train">查询</button></td>
		<td><button id="create-train">添加</button></td>
<!-- 		<td><button id="edit-train">编辑</button></td> -->
<!-- 		<td><button id="del-train">删除</button></td> -->
	</tr>

</table>
<table id="moduleList"></table>
 <div id="pager1"></div>
 
</body>
</html>