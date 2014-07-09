<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%
    String path = request.getContextPath();
	String typeId = request.getParameter("typeId");
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
   <link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/redmond/jquery-ui.css">	
   
   	<script src="<%=path %>/jquery-ui-1.10.4.custom/development-bundle/ui/jquery.ui.core.js"></script>
	<script src="<%=path %>/jquery-ui-1.10.4.custom/development-bundle/ui/jquery.ui.widget.js"></script>
	<script src="<%=path %>/jquery-ui-1.10.4.custom/development-bundle/ui/jquery.ui.button.js"></script>
	<script src="<%=path %>/jquery-ui-1.10.4.custom/development-bundle/ui/jquery.ui.position.js"></script>
	<script src="<%=path %>/jquery-ui-1.10.4.custom/development-bundle/ui/jquery.ui.menu.js"></script>
	<script src="<%=path %>/jquery-ui-1.10.4.custom/development-bundle/ui/jquery.ui.autocomplete.js"></script>
	<script src="<%=path %>/jquery-ui-1.10.4.custom/development-bundle/ui/jquery.ui.tooltip.js"></script>
	 <script type="text/javascript" src="<%=path %>/js/mySelect.js"></script>
   	 <link type="text/css" href="<%=path %>/css/myCombox.css"  rel="stylesheet"/> 
 	 <link type="text/css" href="<%=path %>/css/myGrid.css"  rel="stylesheet"/>
  	<style>

	.querytext{
		height: 1.7em;
		top: 0.1em;
		width:15em;
	}
	</style>

  <script>
	
	

  
	$(function() {
	    
	   
	    $( "#source" ).combobox();
	  
	   
	    
		    jQuery("#moduleList").jqGrid({
		   	url:'<%= path%>/skillAction!initDisplaySkill',
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
			colNames: ["id","选择","技术名称","技术类型","技术来源","针对病症","创建时间"],//"版块类型",,"操作"
			colModel: [
						{name: "id",index:"id",width:10,hidden:true, key:true,resizable: false,align:"center"},
						{name: "id",index:"id",width:10,hidden:false, key:true,resizable: false,align:"center",
						
						    formatter:function (cellvalue, options, rowdata) {
			        	   		if(rowdata.flag==1)
	            					return "<input type='checkbox' name='ids' checked value='"+rowdata.id+"'/>";
	            				else
	            				return "<input type='checkbox' name='ids'value='"+rowdata.id+"'/>";
	            			}
						},
			            {name: "name",index:"name",width:20,hidden:false, key:true,resizable: false,align:"center"},
			            {name: "typeText",index:"typeText",width:10,hidden:false, key:true,resizable: false,align:"center"},
			            {name: "sourceText",index:"sourceText",width:10,hidden:false, key:true,resizable: false,align:"center"},
// 			            {name: "type",index:"type",hidden:true, key:true,resizable: false,align:"center"},
// 			            {name: "source",index:"source",hidden:true, key:true,resizable: false,align:"center"},
			            {name: "disease",index:"disease",width:20,hidden:false, key:true,resizable: false,align:"center"},
			            {name: "createTime",index:"createTime",width:10,hidden:false, key:true,resizable: false,align:"center",formatter:"date",formatoptions: {srcformat:'Y-m-d H:i:s',newformat:'Y/m/d'}}
			            

// 			            {name: "h",index:"h",width:10,hidden:false, key:true,resizable: false,align:"center"
// 			        	}
			            
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
		    caption:"消息列表",
		    postData:{
				type:<%=typeId%>
		    }
		});
		jQuery("#moduleList").jqGrid('navGrid','#pager1',{edit:false,add:false,del:false});
		
		$.ajax({ 
		    url: "<%=path %>/webSkill!initSkillTypeDict", 
		    success: function(data){
			    var types=data; 
			   $.each(types, function (i,item) {
			       $("#type").append($("<option />").attr("value", item.id).text(item.value));
			   });
			
		}});
		
		
		$.ajax({ 
		    url: "<%=path %>/webSkill!initSourceDict", 
		    success: function(data){
			    var types=data; 
			   $.each(types, function (i,item) {
			       $("#source").append($("<option />").attr("value", item.id).text(item.value));
			   });
		}});
		
		
		  $( "#queryBtn" ).button()
			.click(function(){
			    		
			    		 
	  					var param ={type:<%=typeId%>,
	  								source:$("#source").val(),
	  								name:$("#name").val(),
	  								disease:$("#disease").val()
	  								};
	  		
	  		
	  						$("#moduleList").jqGrid("setGridParam", { postData: param});
	 		
	 						var postData = $("#moduleList").jqGrid("getGridParam", "postData");
	 						$("#moduleList").trigger('reloadGrid');  
			});
		  $( "#saveBtn" ).button()
		  				.click(function(){
		  				var ids=$("input[name=ids][checked]");
		  				if(ids.length>2){
		  				    aler("前台页面只能显示两项技术！");
		  				}
		  				$.ajax({ 
		  				    url: " <%=path%>/skillAction!doBatchDisplay", 
		  				    type: "POST",
		  				    dataType:"json",
		  				    data:$('#myForm').serialize(),
		  				    success: function(data){
		  					var param ={type:<%=typeId%>,
  								source:$("#source").val(),
  								name:$("#name").val(),
  								disease:$("#disease").val()
  								};
  		
  		
  								$("#moduleList").jqGrid("setGridParam", { postData: param});
 		
 								var postData = $("#moduleList").jqGrid("getGridParam", "postData");
 								$("#moduleList").trigger('reloadGrid');  
		  					}});
		  				  
		  				});
		  
		  $( "#backBtn" ).button()
		  				.click(function(){
		  				  	document.forms[0].action="<%=path%>skillManager/skillDisplay.jsp";
		  					document.forms[0].submit();
		  				});
		
	});
	</script>

</head>
<body> 
 <table>
	<tr>
		
		<td>技术来源：</td>
		<td  width="250px">
			<select id="source">
				<option value="" selected="selected">--请选择</option>
			</select>
		</td>
		<td><label>技术名称:</label></td>
		<td >
			<input class="text ui-widget-content ui-corner-all querytext" id="nameText"/>
		</td>
		<td>针对病症：</td>
		<td>
			<input class="text ui-widget-content ui-corner-all querytext" id="diseaseText"/>
		</td>
		<td >
			
			<button id="queryBtn">查询</button>
		</td>
	</tr>	
	<tr>
		

		
		
		
	</tr>
 </table>
 
 <form action="" onsubmit="return false;" id="myForm">
 <table id="moduleList"></table>
 <div id="pager1"></div>
 <input type="submit" value="保存" id="saveBtn"/>
 <input type="button" value="返回类型设置" id="backBtn">
 </form>
</body>
</html>