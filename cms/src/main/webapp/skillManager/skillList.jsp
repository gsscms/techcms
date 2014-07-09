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
	    
	    $( "#type" ).combobox();
	    $( "#source" ).combobox();
	    $( "#status" ).combobox();
	  
	   
	    
		    jQuery("#moduleList").jqGrid({
		   	url:'<%= path%>/skillAction!initSkill',
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
			colNames: ["id","技术名称","技术类型","技术来源","针对病症","创建时间","状态","操作"],//"版块类型",
			colModel: [
						{name: "id",index:"id",width:10,hidden:true, key:true,resizable: false,align:"center"},
			            {name: "name",index:"name",width:20,hidden:false, key:true,resizable: false,align:"center"},
			            {name: "typeText",index:"typeText",width:10,hidden:false, key:true,resizable: false,align:"center"},
			            {name: "sourceText",index:"sourceText",width:10,hidden:false, key:true,resizable: false,align:"center"},
// 			            {name: "type",index:"type",hidden:true, key:true,resizable: false,align:"center"},
// 			            {name: "source",index:"source",hidden:true, key:true,resizable: false,align:"center"},
			            {name: "disease",index:"disease",width:20,hidden:false, key:true,resizable: false,align:"center"},
			            {name: "createTime",index:"createTime",width:10,hidden:false, key:true,resizable: false,align:"center",formatter:"date",formatoptions: {srcformat:'Y-m-d H:i:s',newformat:'Y/m/d'}},
			            
			            {name: "status",index:"status",width:10,hidden:false, key:true,resizable: false,align:"center",formatter:function(obj){
				        		switch(obj){
				        		case "01":return "待审核";break;
				        		case "02":return "审核通过";break;
				        		case "03":return "审核不通过";break;
				        		default: return "";
				        		}
			            	}
			            },
			            {name: "h",index:"h",width:10,hidden:false, key:true,resizable: false,align:"center",formatter:function(cellvalue, options, rowdata){
			        		return "<a style= 'color:#0072bc; text-decoration : underline' href='"+"<%=path%>/skillAction!skillDetail?techId="+rowdata.id+"'>明细</a>";
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
			    		
			    		    
			            var homeflag = $("#homeflag").is(":checked")==true?$("#homeflag").val():0;
			            var displayflag = $("#displayflag").is(":checked")==true?$("#homeflag").val():0;
	  					var param ={type:$("#type").val(),
	  								source:$("#source").val(),
	  								status:$("#status").val(),
	  								name:$("#name").val(),
	  								disease:$("#disease").val(),
	  								homeflag:homeflag,
	  								displayflag:displayflag
	  								};
	  		
	  		
	  						$("#moduleList").jqGrid("setGridParam", { postData: param});
	 		
	 						var postData = $("#moduleList").jqGrid("getGridParam", "postData");
	 						$("#moduleList").trigger('reloadGrid');  
			});
		
		
	});
	</script>

</head>
<body> 
 <table>
	<tr>
		<td>技术类型：</td>
		<td width="250px">
			<select id="type">
				<option value="" selected="selected">--请选择</option>
			</select>
		</td>
		<td>技术来源：</td>
		<td  width="250px">
			<select id="source">
				<option value="" selected="selected">--请选择</option>
			</select>
		</td>
		<td>审核状态：</td>
		<td>
			<select id="status">
			    <option value="" selected="selected">--请选择</option>
				<option value="01">待审核</option>
				<option value="02">审核通过</option>
				<option value="03">审核没通过</option>
			</select>
		</td>
	</tr>	
	<tr>
		<td><label>技术名称:</label></td>
		<td >
			<input class="text ui-widget-content ui-corner-all querytext" id="nameText"/>
		</td>

		<td>针对病症：</td>
		<td>
			<input class="text ui-widget-content ui-corner-all querytext" id="diseaseText"/>
		</td>
		<td colspan="2">
			<input type="checkbox" class="text ui-widget-content ui-corner-all" value="1" id="homeflag"/>首页显示
			<input type="checkbox" class="text ui-widget-content ui-corner-all" value="1" id="displayflag"/>技术展示页面显示
			<button id="queryBtn">查询</button>
		</td>
		
	</tr>
 </table>
 <table id="moduleList"></table>
 <div id="pager1"></div>
</body>
</html>