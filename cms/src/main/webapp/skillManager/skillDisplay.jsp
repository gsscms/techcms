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
  <title>栏目管理</title>
  <link rel="stylesheet" href="<%=path %>/jquery-ui-1.10.4.custom/development-bundle/themes/redmond/jquery-ui.css">
  <script src="<%=path %>/jquery-ui-1.10.4.custom/js/jquery-1.10.2.js"></script>
  <script src="<%=path %>/jquery-ui-1.10.4.custom/js/jquery-ui-1.10.4.custom.js"></script>
   
   <link rel="stylesheet" type="text/css" href="<%=path %>/jqGrid/css/ui.jqgrid.css" />    
   <script src="<%=path %>/jqGrid/js/jquery.jqGrid.min.js"></script>
   <script src="<%=path %>/jqGrid/js/i18n/grid.locale-cn.js" type="text/javascript"></script>
    <link type="text/css" href="<%=path %>/css/myGrid.css"  rel="stylesheet"/>  
  <style>
 
    #dialog-form label, #dialog-form label input { display:block; }
    #dialog-form input.text { margin-bottom:12px; width:95%; padding: .4em; }
    #dialog-form fieldset { padding:0; border:0; margin-top:25px; }
    #dialog-form h1 { font-size: 1.2em; margin: .6em 0; }
    #dialog-form .ui-dialog .ui-state-error { padding: .3em; }
    #dialog-form .validateTips { border: 1px solid transparent; padding: 0.3em; }

  </style>
  	<style>

	.querytext{
		height: 1.7em;
		top: 0.1em;
		width:15em;
	}
	</style>
  <script>
	function displayImg(path){
	    	$("#picImg").attr("src","<%=path%>"+path);
		    $( "#dialog-form" ).dialog( "open" );
	}
  
	function displaySkill(id){
	    window.location.href="<%= path%>/skillManager/displaySkillList.jsp?typeId="+id; 
	}
	
	$(function() {
	       
		    jQuery("#moduleList").jqGrid({
		   	url:'<%= path%>/dictAction!initSkillTypeDict',
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
			colNames: ["id","选择","类型名称","上传图片","显示图片图片","选择技术"],//，"选择显示技术","设置位置"
			colModel: [
			           {name: "id",index:"id",width:0,hidden:true,resizable: false, sortable:false,align:"center"},
			            {name: "name",index:"name",width:10,hidden:false, key:true,resizable: false,align:"center",
			               formatter:function (cellvalue, options, rowdata) {
			        	   		if(rowdata.flag==1)
	            					return "<input type='checkbox' name='dictIds' checked value='"+rowdata.id+"'/>";
	            				else
	            				return "<input type='checkbox' name='dictIds'value='"+rowdata.id+"'/>";
	            			}
			            },
			           {name: "value",index:"value",width:15,hidden:false, key:true,resizable: false,align:"center"},
			           {name: "id",index:"id",width:40,hidden:false, key:true,resizable: false,align:"center",
			             formatter:function(cellvalue, options, rowdata){
			        	      var inputImag = $("<input/>").attr("type","file") .attr("name","file").addClass("text ui-widget-content ui-corner-all");
				        	  var input = $("<input/>").attr("type","submit").val("上传");
							  var hidden = $("<input/>").attr("type","hidden").val(rowdata.id).attr("name","dictId");
							  var uploadForm= $("<form/>").attr("enctype","multipart/form-data").attr("method","post").attr("action","<%=path%>/file!uploadSkillTypeImage");
							  uploadForm.append(inputImag).append(hidden).append(input);
							  var divF=$("<div/>").append(uploadForm);
							  return divF.html();  
			        	 
			             }
			           },
			           {name: "id",index:"id",width:15,hidden:false, key:true,resizable: false,align:"center",
			               formatter:function(cellvalue, options, rowdata){
			        	   
// 			        	   var img = $("<a />").attr("href","#").append("【点击查看图片】").attr("style","color:red;text-align:center;padding:5px;font-size:14px;");
	 
// 			        	   var divF=$("<div/>").append(img);
			        	   return "<a href='#' style='color:#0072bc; text-decoration : underline' onclick=displayImg('"+rowdata.path+"')>【点击查看图片】</a>"; 
			               }
			           },{
			               name: "id",index:"id",width:10,hidden:false, key:true,resizable: false,align:"center",
			               formatter:function(cellvalue, options, rowdata){
			        	   
			        	   return "<a href='#' style='color:#0072bc; text-decoration : underline' onclick=displaySkill('"+rowdata.id+"')>【选择技术】</a>"; 
			               }
			           }
// 			           ,{
// 			               name: "id",index:"id",width:10,hidden:false, key:true,resizable: false,align:"center",
// 			               formatter:function(cellvalue, options, rowdata){
			        	   
// 			        	   return "<a href='#' style='color:#0072bc; text-decoration : underline' onclick=displaySkill('"+rowdata.id+"')>【选择技术】</a>"; 
// 			               }
// 			           }
			        
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
	});
	</script>
  <script>
  
  
  
  $(function() {
 
    $( "#dialog-form" ).dialog({
	      autoOpen: false,
	      height: 380,
	      width: 350,
	      modal: true,
	      buttons: {
	        "取消": function() {
	          $( this ).dialog( "close" );
	        }
	      },
	      close: function() {
	       // allFields.val( "" ).removeClass( "ui-state-error" );
	      }
	    });
 

    
    $( "#save" ).button();
		
	
   
    $("#query").button().click(function(){
	    var param ={
		    	value:$("#queryTitle").val()
		    	};
		$("#moduleList").jqGrid("setGridParam", { postData: param});
		
		$("#moduleList").trigger('reloadGrid');
    });
   
  });
  </script>
</head>
<body>
 
	<div id="dialog-form" title="图片查看">

  
	  <fieldset>
	    <img alt="" src="" id="picImg">
	  </fieldset>

</div>
 

<table>
	<tr>
		<td>
			<label>类型名称：</label>
			<input type="text" id="queryTitle" class="text ui-widget-content ui-corner-all querytext">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<button id="query" >查询</button>
				
		</td>
	</tr>
</table>
<form action="<%=path %>/webSkill!setDisplaySkillType" id="myForm">
 <table id="moduleList"></table>
 	<div id="pager1"></div>
<input id="save" type="submit" value="保存"/>
</form> 

</body>
</html>