<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<%@ page language="java" contentType="text/html; charset=GBK" %>
<%
	String dse_sessionId = request.getParameter("dse_sessionId");//获取dse_sessionId
    if (Double.parseDouble(request.getParameter("loginType"))==2){
		
    	response.sendRedirect("errorlogintype.html");
		return;
	 }
	String cssFileName =request.getParameter("cssFileName");//获取客户当前使用的CSS样式
	if(cssFileName ==null){
		cssFileName = "skin.css";
	}
%>
<html> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK"/>
<title>业务列表页面</title>
<script language="JavaScript" src="/personbank/HttpProxy?URL=/midserv/js/public.js&dse_sessionId=<%=dse_sessionId%>"></script>
<link rel="stylesheet" type="text/css" href="/personbank/css/<%=cssFileName%>"/>

<style type="text/css">
<!--
.content_box{width:100%; height:535px; margin-top:20px; background:url(../img/bg/rcontent_bg2.gif) 0 0 repeat-x; border:solid 0px #dedede; border-top:none;}
.content_box .tent{ width:65px; height:auto; float:left; margin-left:38px; text-align:center;  }
.content_box .tent p{width:65px; height:65px; margin:0px;}
.content_box .tent p a{display:block;}
.content_box .tent dl{ width:65px; height:auto;}
.content_box .tent dl dd{ line-height:0px;}
.content_box .tent dl dt a{color:#004B9D }
.content_box .tent dl dd span{color:#656565;}
.lanse{color:#254e90; font-weight:700;}
a.hui:link {
	font-size: 9pt;	color: #666666;		
}
a.hui:visited {
	font-size: 9pt; color: #666666; 
}
a.hui:hover {
	font-size: 9pt; color: #666666;	
}
.STYLE1 {
	color: #0460AB;
	font-weight: bold;
}
//-->
</style>
<style type="text/css">
<!--
body {
 background-color: #F6F6F6;
}
-->
</style>
</head>
<body style="bgcolor">
<form action="/personbank/HttpProxy" method="post" name="f1">
			<input type="hidden" name="dse_sessionId" value="<%=dse_sessionId%>"/>
			<div class="content_box">
				<div class="tent">
					 <p><a href="/personbank/HttpProxy?URL=/midserv/dsfbank_zc6.jsp&dse_sessionId=<%=dse_sessionId%>">
					 <img src="/personbank/HttpProxy?URL=/midserv/images/sgdzengjia.png&dse_sessionId=<%=dse_sessionId%>"  border="0"></a></p>
					 <dl>
					     <dt><a href="/personbank/HttpProxy?URL=/midserv/dsfbank_zc6.jsp&dse_sessionId=<%=dse_sessionId%>">增加</a></dt>
					 </dl>	   
				</div>
				<div class="tent">
					 <p><a href="/personbank/HttpProxy?URL=/midserv/dsfbank_zc4.jsp&dse_sessionId=<%=dse_sessionId%>&FUNFLG=1">
					 <img src="/personbank/HttpProxy?URL=/midserv/images/sgdxiugai.png&dse_sessionId=<%=dse_sessionId%>&FUNFLG=1"  border="0"></a></p>
					 <dl>
					     <dt><a href="/personbank/HttpProxy?URL=/midserv/dsfbank_zc4.jsp&dse_sessionId=<%=dse_sessionId%>&FUNFLG=1">修改</a></dt>
					 </dl>	   
				</div>
				<div class="tent">
					 <p><a href="/personbank/HttpProxy?URL=/midserv/dsfbank_zc4.jsp&dse_sessionId=<%=dse_sessionId%>&FUNFLG=2">
					  <img src="/personbank/HttpProxy?URL=/midserv/images/sgdxiaohu.png&dse_sessionId=<%=dse_sessionId%>&FUNFLG=2"  border="0"/></p>
					 <dl>
					     <dt><a href="/personbank/HttpProxy?URL=/midserv/dsfbank_zc4.jsp&dse_sessionId=<%=dse_sessionId%>&FUNFLG=2">销户与恢复</a></dt>
					 </dl>	   
				</div>
				<div class="tent">
					 <p><a href="/personbank/HttpProxy?URL=/midserv/dsfbank_zc4.jsp&dse_sessionId=<%=dse_sessionId%>&FUNFLG=3">
					  <img src="/personbank/HttpProxy?URL=/midserv/images/sgdchaxun.png&dse_sessionId=<%=dse_sessionId%>&FUNFLG=3"  border="0"/></p>
					 <dl>
					     <dt><a href="/personbank/HttpProxy?URL=/midserv/dsfbank_zc4.jsp&dse_sessionId=<%=dse_sessionId%>&FUNFLG=3">查询</a></dt>
					 </dl>	   
				</div>
		</div>
</form>
</body>
</html>
