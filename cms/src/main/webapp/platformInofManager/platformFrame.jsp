<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
%> 
<%-- <iframe src="<%=path %>/platformInofManager/platformInof.jsp" height="500px" frameborder="0" width="100%"></iframe> --%>
<iframe src="<%=path %>/info!initPlatForm.action?infoTypeId=" height="450px" frameborder="0" width="100%"></iframe>