<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
%>
<style>
.login{color: #012BB1;
    float: right;}
</style>
<div class='header'>
<!-- 			<a class="login" href="">登陆</a> -->
            <div class='img'></div>
            
        </div>
        <div class='nav'>
			<ul>
				<li><a href='<%=path%>/web/home.jsp'>首页</a>|</li>
				<li><a href='<%=path%>/web/introduction.jsp'>平台介绍</a>|</li>
				<li><a href='<%=path%>/web/technology.jsp'>技术展示</a>|</li>
				<li><a href='<%=path%>/web/skillIdenty.jsp'>技术征集</a>|</li>
				<li><a href='<%=path%>/web/correlation.jsp'>相关课题</a>|</li>
				<li><a href='<%=path%>/web/training.jsp'>交流培训 </a>|</li>
				<li><a href='<%=path%>/web/inform.jsp'>公告通知</a>|</li>
				<li><a href='<%=path%>/web/contact.jsp'>联系我们</a></li>
			</ul>
</div>