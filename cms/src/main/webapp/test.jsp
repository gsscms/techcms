<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%
    String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en-us">
<head>
<title>jCarousel Examples</title>
<link href="<%=path %>/test/style.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="<%=path%>/js/jquery-1.4.2.min.js"></script>

<script type="text/javascript" src="<%=path %>/js/jquery.jcarousel.min.js"></script>

<link rel="stylesheet" type="text/css" href="<%=path %>/tango/skin.css" />

<script type="text/javascript">

jQuery(document).ready(function() {
    jQuery('#mycarousel').jcarousel({
    	wrap: 'circular',
		scroll: 1,
		animation:'slow'
    });
});

</script>

</head>
<body>
<div id="wrap">
  <h1>jCarousel</h1>
  <h2>Riding carousels with jQuery</h2>

  <h3>Circular carousel</h3>
  <p>
    This example shows a simple circular carousel.
  </p>



<div class="jcarousel-skin-tango" id="mycarousel">
	<div class="jcarousel-container">
		<div class="jcarousel-clip">
			<ul>
				<li class="jcarousel-item-1"><img src="<%=path %>/images/alpic01.png"/></li>
				<li class="jcarousel-item-2"><img src="<%=path %>/images/alpic02.png"/></li>
				<li class="jcarousel-item-3"><img src="<%=path %>/images/alpic03.png" /></li>
				<li class="jcarousel-item-4"><img src="<%=path %>/images/alpic04.png"/></li>
				<li class="jcarousel-item-5"><img src="<%=path %>/images/alpic05.png" /></li>
				<li class="jcarousel-item-6"><img src="<%=path %>/images/alpic06.png" /></li>
				<li class="jcarousel-item-7"><img src="<%=path %>/images/alpic07.png" /></li>
			</ul>
		</div>
		<div disabled="disabled" class="jcarousel-prev jcarousel-prev-disabled">
			<img id="showcase_thumb_prev" src="<%=path %>/images/index_65.png" style="cursor:pointer;"/>
		</div>
		<div class="jcarousel-next">
			<img id="showcase_thumb_next" src="<%=path %>/images/index_68.png" style="cursor:pointer;"/>
		</div>
	</div>
</div>
</div>
</body>
</html>