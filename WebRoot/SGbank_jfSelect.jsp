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
				<div class="content_box" align="center">
					<!-- <div class="tent">
						 <p><a href="/personbank/HttpProxy?URL=/midserv/dsfbank_sw0.jsp&dse_sessionId=<!--%=dse_sessionId%>&buscla=01">
						 <img src="/personbank/HttpProxy?URL=/midserv/images/sgdshuiwu.png&dse_sessionId=<!--%=dse_sessionId%>&buscla=01"  border="0"></a></p>
						 <dl>
						     <dt><a href="/personbank/HttpProxy?URL=/midserv/dsfbank_sw0.jsp&dse_sessionId=<!--%=dse_sessionId%>&buscla=01">税务</a></dt>
						 </dl>	   
					</div> -->
					<div class="tent">
						 <p><a href="/personbank/HttpProxy?URL=/midserv/dsfbank_sw0.jsp&dse_sessionId=<%=dse_sessionId%>&buscla=02">
						 <img src="/personbank/HttpProxy?URL=/midserv/images/sgdshebao.png&dse_sessionId=<%=dse_sessionId%>&buscla=02"  border="0"/></p>
						 <dl>
						     <dt><a href="/personbank/HttpProxy?URL=/midserv/dsfbank_sw0.jsp&dse_sessionId=<%=dse_sessionId%>&buscla=02">社保</a></dt>
						 </dl>	   
					</div>
	    			<!-- <div class="tent">
						 <p><a href="/personbank/HttpProxy?URL=/midserv/dsfbank_sw0.jsp&dse_sessionId=<!--%=dse_sessionId%>&buscla=03" >
						 <img src="/personbank/HttpProxy?URL=/midserv/images/sgdyanglaobaoxian.png&dse_sessionId=<!--%=dse_sessionId%>&buscla=03"  border="0"></a></p>
						 <dl>
						     <dt><a href="/personbank/HttpProxy?URL=/midserv/dsfbank_sw0.jsp&dse_sessionId=<!--%=dse_sessionId%>&buscla=03" >居民养老保险</a></dt>
						 </dl>	   
					</div>	 -->			
			      	<div class="tent">
						 <p><a  href="/personbank/HttpProxy?URL=/midserv/dsfbank_sw0.jsp&dse_sessionId=<%=dse_sessionId%>&buscla=04" >
						 <img src="/personbank/HttpProxy?URL=/midserv/images/sgdtongxun.png&dse_sessionId=<%=dse_sessionId%>&buscla=04" border="0"></a></p>
						 <dl>
						     <dt><a  href="/personbank/HttpProxy?URL=/midserv/dsfbank_sw0.jsp&dse_sessionId=<%=dse_sessionId%>&buscla=04">通讯</a></dt>
						 </dl>	   
					</div>
					<!-- <div class="tent">
						 <p><a href="/personbank/HttpProxy?URL=/midserv/dsfbank_sw0.jsp&dse_sessionId=<!--%=dse_sessionId%>&buscla=05">
						 <img src="/personbank/HttpProxy?URL=/midserv/images/sgdshuifei.png&dse_sessionId=<!--%=dse_sessionId%>&buscla=05"  border="0"></a></p>
						 <dl>
						     <dt><a   href="/personbank/HttpProxy?URL=/midserv/dsfbank_sw0.jsp&dse_sessionId=<!--%=dse_sessionId%>&buscla=05">水费</a></dt>
						 </dl>	   
					</div>
					<div class="tent">
						 <p><a href="/personbank/HttpProxy?URL=/midserv/dsfbank_sw0.jsp&dse_sessionId=<!--%=dse_sessionId%>&buscla=06">
						 <img src="/personbank/HttpProxy?URL=/midserv/images/sgddianfei.png&dse_sessionId=<!--%=dse_sessionId%>&buscla=06"  border="0"></a></p>
						 <dl>
						     <dt><a href="/personbank/HttpProxy?URL=/midserv/dsfbank_sw0.jsp&dse_sessionId=<!--%=dse_sessionId%>&buscla=06">电费</a></dt>
						 </dl>	   
					</div>
					<div class="tent">
						 <p><a href="/personbank/HttpProxy?URL=/midserv/dsfbank_sw0.jsp&dse_sessionId=<!--%=dse_sessionId%>&buscla=07">
						 <img src="/personbank/HttpProxy?URL=/midserv/images/sgdranqi.png&dse_sessionId=<!--%=dse_sessionId%>&buscla=07"  border="0"></a></p>
						 <dl>
						     <dt><a href="/personbank/HttpProxy?URL=/midserv/dsfbank_sw0.jsp&dse_sessionId=<!--%=dse_sessionId%>&buscla=07">燃气费</a></dt>
						 </dl>	   
					</div>				
					<div class="tent">
						 <p><a href="/personbank/HttpProxy?URL=/midserv/dsfbank_sw0.jsp&dse_sessionId=<!--%=dse_sessionId%>&buscla=08">
						 <img src="/personbank/HttpProxy?URL=/midserv/images/sgddianshi.png&dse_sessionId=<!--%=dse_sessionId%>&buscla=08"  border="0"></a></p>
						 <dl>
						     <dt><a href="/personbank/HttpProxy?URL=/midserv/dsfbank_sw0.jsp&dse_sessionId=<!--%=dse_sessionId%>&buscla=08">电视</a></dt>
						 </dl>	   
					</div>						
					<div class="tent">
						 <p><a href="/personbank/HttpProxy?URL=/midserv/dsfbank_sw0.jsp&dse_sessionId=<!--%=dse_sessionId%>&buscla=09">
						 <img src="/personbank/HttpProxy?URL=/midserv/images/sgdwuye.png&dse_sessionId=<!--%=dse_sessionId%>&buscla=09"  border="0"></a></p>
						 <dl>
						     <dt><a href="/personbank/HttpProxy?URL=/midserv/dsfbank_sw0.jsp&dse_sessionId=<!--%=dse_sessionId%>&buscla=09">物业</a></dt>
						 </dl>	   
					</div>	-->
		</div>
</form>
</body>
</html>