<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%
    String path = request.getContextPath();
%> 
<!doctype html>
<html >
<head>
  <title>栏目管理</title>
  <link rel="stylesheet" href="<%=path %>/jquery-ui-1.10.4.custom/development-bundle/themes/redmond/jquery-ui.css">
  <script src="<%=path %>/jquery-ui-1.10.4.custom/js/jquery-1.10.2.js"></script>
  <script src="<%=path %>/jquery-ui-1.10.4.custom/js/jquery-ui-1.10.4.custom.js"></script>
   	<script type="text/javascript" src="<%=path %>/js/mySelect.js"></script>
   <link rel="stylesheet" type="text/css" href="<%=path %>/jqGrid/css/ui.jqgrid.css" />    
   <script src="<%=path %>/jqGrid/js/jquery.jqGrid.min.js"></script>
   <script src="<%=path %>/jqGrid/js/i18n/grid.locale-cn.js" type="text/javascript"></script>  
    <link type="text/css" href="<%=path %>/css/myGrid.css"  rel="stylesheet"/>
    <link type="text/css" href="<%=path %>/css/myCombox.css"  rel="stylesheet"/> 
  <style>
   
    #dialog-form label, #dialog-form label input { display:block; }
    #dialog-form input.text { margin-bottom:12px; width:95%; padding: .4em; }
    #dialog-form fieldset { padding:0; border:0; margin-top:25px; }
    #dialog-form h1 { font-size: 1.2em; margin: .6em 0; }
    #dialog-form .ui-dialog .ui-state-error { padding: .3em; }
    #dialog-form .validateTips { border: 1px solid transparent; padding: 0.3em; }   
 
	
  </style>
  <script>
	
	$(function() {

	    $( "#combobox" ).combobox();
		    jQuery("#moduleList").jqGrid({
		   	url:'<%= path%>/dictAction!initDictList',
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
			colNames: ["id","字典类型","字典值","操作"],//"版块类型",
			colModel: [
			            {name: "id",index:"id",width:10,hidden:true,resizable: false, sortable:false,align:"center"},
			            {name: "type",index:"type",width:25,hidden:false, key:true,resizable: false,align:"center",
		        		formatter:function (cellvalue, options, rowdata){
		        		    switch(rowdata.type){
		        		    case '001':return "针对病症";
		        		    case '002':return "技术类型";
		        		    case '003':return "技术来源";
		        		    case '004':return "公告类别";
		        		    case '005':return "相关课题";
		        		    case '006':return "交流培训";
		        		    default :return "";
		        		    }
		        		}
			            },
			            {name: "value",index:"value",width:25,hidden:false, key:true,resizable: false,align:"center"},
			            {name: "value",index:"value",width:25,hidden:false, key:true,resizable: false,align:"center",
				        	formatter:function (cellvalue, options, rowdata){
				        	    return "<a href='#' style='color:#0072bc' onclick=editDict('"+rowdata.id+"')>【编辑】</a>&nbsp;&nbsp;<a href='#' style='color:#0072bc' onclick=delDict('"+rowdata.id+"')>【删除】</a>"; 
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
 		  alert($("#dictValue").val());
          if ( bValid ) {
            document.forms[0].action="<%=path%>/dictAction!saveDict";
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
 	        $( "#dictType" ).combobox();
        	$( "#dialog-form" ).dialog( "open" );
        	$("#id").val("");
      });
    
    $( "#queryBtn" )
    .button()
    .click(function(){
		
    });

  });
  
  function delClick(id){
	   
	$.ajax({
	    url:"<%=path%>/dictAction!delDict",
	    dataType:"json",
	    data:{
			id:id
	    },
	    success:function(data){
			$("#moduleList").trigger('reloadGrid');  
	    }
	});

  }
  
  </script>
</head>
<body>
 
<div id="dialog-form" title="添加字典记录">

 
  <form>
	  <fieldset>
	    <label for="dictType">字典类型：</label>
	    <select id="dictType" name="dict.type">
				<option value="">---请选择</option>
				<option value="001">针对病症</option>
				<option value="002">技术类型</option>
				<option value="003">技术来源</option>
				<option value="004">公告类别</option>
				<option value="005">相关课题</option>
				<option value="006">交流培训</option>
			</select>
	    <label for="value">字典值：</label>
	    <input type="text" id="dictValue" name="dict.value" id="value" value="" class="text ui-widget-content ui-corner-all">
	 
	  </fieldset>
  </form>
</div>
 
 
<table>
	<tr>
		<td width="300px">字典类型：
			<select id="combobox">
				<option value="">---请选择</option>
				<option value="001">针对病症</option>
				<option value="002">技术类型</option>
				<option value="003">技术来源</option>
				<option value="004">公告类别</option>
				<option value="005">相关课题</option>
				<option value="006">交流培训</option>
			</select>
			
		</td>
		<td><button id="queryBtn">查询</button></td>
		<td>
			<button id="create-menu">添加字典记录</button>

		</td>

	</tr>
</table>

 <table id="moduleList"></table>
 	<div id="pager1"></div>
</body>
</html>