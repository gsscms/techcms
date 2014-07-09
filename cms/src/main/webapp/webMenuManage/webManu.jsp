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
  <script>
	

  
  function setDisplay(id) {
      $("#id").val(id);
	 document.forms[0].action="<%=path%>/webMenu!setDisplay";
	 document.forms[0].submit();
  }
  function setNoDisplay(id) {
      $("#id").val(id);
	 document.forms[0].action="<%=path%>/webMenu!setNoDisplay";
	 document.forms[0].submit();
}
  
	$(function() {
	       
		    jQuery("#moduleList").jqGrid({
		   	url:'<%= path%>/webMenu!initWebMenu',
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
			colNames: ["id","栏目名称","栏目连接","描述","前台显示"],//"版块类型",
			colModel: [
			           {name: "id",index:"id",width:10,hidden:true,resizable: false, sortable:false,align:"center"},
			            {name: "name",index:"name",width:25,hidden:false, key:true,resizable: false,align:"center"},
			            {name: "url",index:"url",width:25,hidden:false, key:true,resizable: false,align:"center"},
			            {name: "remark",index:"remark",width:25,hidden:false, key:true,resizable: false,align:"center"},
			            {name: "flag",index:"flag",width:25,hidden:false, key:true,resizable: false,align:"center",formatter:
							function (cellvalue, options, rowdata) {
					              var lable="";
					              var click="";
					              switch(cellvalue){
					              	case 1: lable="取消显示";click="setNoDisplay";break;
					              	case 2: lable="设置显示";click="setDisplay";break;
					              	default: click="setDisplay";lable="设置显示";
					              }
		            		return "<a href='#'  'color:#0072bc; text-decoration : underline' onclick="+click+"('"+rowdata.id+"') >" + lable + "</a>";
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
	});
	</script>
  <script>
  
  
  
  $(function() {
    var name = $( "#name" ),
    url = $( "#url" ),desc=$( "#desc" );

      allFields = $( [] ).add( name ).add( url ).add( desc ),
      tips = $( ".validateTips" );
 
    function updateTips( t ) {
      tips
        .text( t )
        .addClass( "ui-state-highlight" );
      setTimeout(function() {
        tips.removeClass( "ui-state-highlight", 1500 );
      }, 500 );
    }
 
    function checkLength( o, n, min, max ) {
      if ( o.val().length > max || o.val().length < min ) {
        o.addClass( "ui-state-error" );
        updateTips( "" + n + " 的长度必须在 " +
          min + " 和 " + max + " 之间。" );
        return false;
      } else {
        return true;
      }
    }
 
    function checkRegexp( o, regexp, n ) {
      if ( !( regexp.test( o.val() ) ) ) {
        o.addClass( "ui-state-error" );
        updateTips( n );
        return false;
      } else {
        return true;
      }
    }
 
    $( "#dialog-form" ).dialog({
      autoOpen: false,
      height: 380,
      width: 350,
      modal: true,
      buttons: {
        "保存": function() {
          var bValid = true;
          allFields.removeClass( "ui-state-error" );
 
          if ( bValid ) {
            document.forms[0].action="<%=path%>/webMenu!saveMenu";
			document.forms[0].submit();
            $( this ).dialog( "close" );
          }
        },
        "取消": function() {
          $( this ).dialog( "close" );
        }
      },
      close: function() {
        allFields.val( "" ).removeClass( "ui-state-error" );
      }
    });
 
    $( "#create-menu" )
      .button()
      .click(function() {
        	$( "#dialog-form" ).dialog( "open" );
        	$("#id").val("");
      });
    $( "#edit-menu" )
    .button()
    .click(function() {
		var selectedId = $("#moduleList").jqGrid("getGridParam", "selrow");  
	    if(selectedId!=null) {
			var rowData = $("#moduleList").jqGrid("getRowData", selectedId);  
			$("#id").val(rowData.id);
			$("#name").val(rowData.name);
			$("#url").val(rowData.url);
			$("#remark").val(rowData.remark);
			$("#flag").val(rowData.flag);	
		    $( "#dialog-form" ).dialog( "open" );
	    }
	    
     
    });
    
    
    $("#noDisplay").button().click(
		function(){
		    var selectedId = $("#moduleList").jqGrid("getGridParam", "selrow");  
		    if(selectedId!=null) {
				var rowData = $("#moduleList").jqGrid("getRowData", selectedId);  
				$("#name").val(rowData.name);
				$("#url").val(rowData.url);
				$("#remark").val(rowData.remark);
				$("#id").val(rowData.id);
				 document.forms[0].action="<%=path%>/webMenu!setNoDisplay";
				 document.forms[0].submit();
		    }
		    else{
				alert("请选择栏目");
		    }
		}    
    );
    
    $("#display").button().click(
		function(){
		    var selectedId = $("#moduleList").jqGrid("getGridParam", "selrow");  
		    if(selectedId!=null) {
				var rowData = $("#moduleList").jqGrid("getRowData", selectedId);  
				$("#name").val(rowData.name);
				$("#url").val(rowData.url);
				$("#remark").val(rowData.remark);
				$("#id").val(rowData.id);
				 document.forms[0].action="<%=path%>/webMenu!setDisplay";
				 document.forms[0].submit();
		    }
		    else{
				alert("请选择栏目");
		    }
		}    
);
    
    $( "#del-menu" )
    .button()
    .click(function() {
		var selectedId = $("#moduleList").jqGrid("getGridParam", "selrow");  
	    if(selectedId!=null) {
			var rowData = $("#moduleList").jqGrid("getRowData", selectedId);  
			$("#name").val(rowData.name);
			$("#url").val(rowData.url);
			$("#remark").val(rowData.remark);
			$("#id").val(rowData.id);
			 document.forms[0].action="<%=path%>/webMenu!delWebMenu";
			 document.forms[0].submit();
	    }
	    
     
    });
  });
  </script>
</head>
<body>
 
<div id="dialog-form" title="添加新栏目">

 
  <form>
	  <fieldset>
	    <label for="name">栏目名称：</label>
	    <input type="text" name="menu.name" id="name" class="text ui-widget-content ui-corner-all">
	    <label for="url">链接：</label>
	    <input type="text" name="menu.url" id="url" value="" class="text ui-widget-content ui-corner-all">
	    <label for="remark">描述</label>

		<textarea rows="3" cols="40" name="menu.remark"  id="remark" class="text ui-widget-content ui-corner-all"></textarea>
		<s:hidden name="menu.id" id="id"></s:hidden>
		<s:hidden nam="menu.flag" id="flag"></s:hidden>
	  </fieldset>
  </form>
</div>
 
 
<table>
	<tr>
		<td>
			<button id="create-menu">添加新栏目</button>
			<button id="edit-menu">编辑新栏目</button>
			<button id="del-menu">删除新栏目</button>
<!-- 			<button id="display">设置前台显示</button> -->
<!-- 			<button id="noDisplay">取消前台显示</button> -->
		</td>
	</tr>
</table>

 <table id="moduleList"></table>
 	<div id="pager1"></div>
</body>
</html>