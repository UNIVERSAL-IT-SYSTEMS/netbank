<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<%@ page language="java" contentType="text/html; charset=GBK" %>
<%
	String dse_sessionId = request.getParameter("dse_sessionId");//��ȡdse_sessionId
    if (Double.parseDouble(request.getParameter("loginType"))==2){
		
    	response.sendRedirect("errorlogintype.html");
		return;
	 }
	String cssFileName =request.getParameter("cssFileName");//��ȡ�ͻ���ǰʹ�õ�CSS��ʽ
	if(cssFileName ==null){
		cssFileName = "skin.css";
	}
	
	String CLI_IDENTITY_CARD =request.getParameter("CLI_IDENTITY_CARD");
%>
<html> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK"/>
<title>ҵ���б�ҳ��</title>
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
				<div class="content_box" align="left">
					<!-- <div class="tent">
						 <p><a href="/personbank/HttpProxy?URL=/midserv/dsfbank_qyzc.jsp&dse_sessionId=<!--%=dse_sessionId%>&buscla=01&CLI_IDENTITY_CARD=<!--%=CLI_IDENTITY_CARD%>">
						 <img src="/personbank/HttpProxy?URL=/midserv/images/sgdshuiwu.png&dse_sessionId=<!--%=dse_sessionId%>&buscla=01&CLI_IDENTITY_CARD=<!--%=CLI_IDENTITY_CARD%>"  border="0"></a></p>
						 <dl>
						     <dt><a href="/personbank/HttpProxy?URL=/midserv/dsfbank_qyzc.jsp&dse_sessionId=<!--%=dse_sessionId%>&buscla=01&CLI_IDENTITY_CARD=<!--%=CLI_IDENTITY_CARD%>">˰��</a></dt>
						 </dl>	   
					</div>
					<div class="tent">
						 <p><a href="/personbank/HttpProxy?URL=/midserv/dsfbank_qyzc.jsp&dse_sessionId=<!--%=dse_sessionId%>&buscla=02&CLI_IDENTITY_CARD=<!--%=CLI_IDENTITY_CARD%>">
						 <img src="/personbank/HttpProxy?URL=/midserv/images/sgdshebao.png&dse_sessionId=<!--%=dse_sessionId%>&buscla=02&CLI_IDENTITY_CARD=<!--%=CLI_IDENTITY_CARD%>"  border="0"/></p>
						 <dl>
						     <dt><a href="/personbank/HttpProxy?URL=/midserv/dsfbank_qyzc.jsp&dse_sessionId=<!--%=dse_sessionId%>&buscla=02&CLI_IDENTITY_CARD=<!--%=CLI_IDENTITY_CARD%>">�籣</a></dt>
						 </dl>	   
					</div>
	    			<div class="tent">
						 <p><a href="/personbank/HttpProxy?URL=/midserv/dsfbank_qyzc.jsp&dse_sessionId=<!--%=dse_sessionId%>&buscla=03&CLI_IDENTITY_CARD=<!--%=CLI_IDENTITY_CARD%>" >
						 <img src="/personbank/HttpProxy?URL=/midserv/images/sgdyanglaobaoxian.png&dse_sessionId=<!--%=dse_sessionId%>&buscla=03&CLI_IDENTITY_CARD=<!--%=CLI_IDENTITY_CARD%>"  border="0"></a></p>
						 <dl>
						     <dt><a href="/personbank/HttpProxy?URL=/midserv/dsfbank_qyzc.jsp&dse_sessionId=<!--%=dse_sessionId%>&buscla=03&CLI_IDENTITY_CARD=<!--%=CLI_IDENTITY_CARD%>" >�������ϱ���</a></dt>
						 </dl>	   
					</div>		-->		
			      	<div class="tent">
						 <p><a  href="/personbank/HttpProxy?URL=/midserv/dsfbank_qyzc.jsp&dse_sessionId=<%=dse_sessionId%>&buscla=04&CLI_IDENTITY_CARD=<%=CLI_IDENTITY_CARD%>" >
						 <img src="/personbank/HttpProxy?URL=/midserv/images/sgdtongxun.png&dse_sessionId=<%=dse_sessionId%>&buscla=04&CLI_IDENTITY_CARD=<%=CLI_IDENTITY_CARD%>" border="0"></a></p>
						 <dl>
						     <dt><a  href="/personbank/HttpProxy?URL=/midserv/dsfbank_qyzc.jsp&dse_sessionId=<%=dse_sessionId%>&buscla=04&CLI_IDENTITY_CARD=<%=CLI_IDENTITY_CARD%>">ͨѶ</a></dt>
						 </dl>	   
					</div>
					<div class="tent">
						 <p><a href="/personbank/HttpProxy?URL=/midserv/dsfbank_qyzc.jsp&dse_sessionId=<%=dse_sessionId%>&buscla=05&CLI_IDENTITY_CARD=<%=CLI_IDENTITY_CARD%>">
						 <img src="/personbank/HttpProxy?URL=/midserv/images/sgdshuifei.png&dse_sessionId=<%=dse_sessionId%>&buscla=05&CLI_IDENTITY_CARD=<%=CLI_IDENTITY_CARD%>"  border="0"></a></p>
						 <dl>
						     <dt><a   href="/personbank/HttpProxy?URL=/midserv/dsfbank_qyzc.jsp&dse_sessionId=<%=dse_sessionId%>&buscla=05&CLI_IDENTITY_CARD=<%=CLI_IDENTITY_CARD%>">ˮ��</a></dt>
						 </dl>	   
					</div>
					<div class="tent">
						 <p><a href="/personbank/HttpProxy?URL=/midserv/dsfbank_qyzc.jsp&dse_sessionId=<%=dse_sessionId%>&buscla=06&CLI_IDENTITY_CARD=<%=CLI_IDENTITY_CARD%>">
						 <img src="/personbank/HttpProxy?URL=/midserv/images/sgddianfei.png&dse_sessionId=<%=dse_sessionId%>&buscla=06&CLI_IDENTITY_CARD=<%=CLI_IDENTITY_CARD%>"  border="0"></a></p>
						 <dl>
						     <dt><a href="/personbank/HttpProxy?URL=/midserv/dsfbank_qyzc.jsp&dse_sessionId=<%=dse_sessionId%>&buscla=06&CLI_IDENTITY_CARD=<%=CLI_IDENTITY_CARD%>">���</a></dt>
						 </dl>	   
					</div>
					<div class="tent">
						 <p><a href="/personbank/HttpProxy?URL=/midserv/dsfbank_qyzc.jsp&dse_sessionId=<%=dse_sessionId%>&buscla=07&CLI_IDENTITY_CARD=<%=CLI_IDENTITY_CARD%>">
						 <img src="/personbank/HttpProxy?URL=/midserv/images/sgdranqi.png&dse_sessionId=<%=dse_sessionId%>&buscla=07&CLI_IDENTITY_CARD=<%=CLI_IDENTITY_CARD%>"  border="0"></a></p>
						 <dl>
						     <dt><a href="/personbank/HttpProxy?URL=/midserv/dsfbank_qyzc.jsp&dse_sessionId=<%=dse_sessionId%>&buscla=07&CLI_IDENTITY_CARD=<%=CLI_IDENTITY_CARD%>">ȼ����</a></dt>
						 </dl>	   
					</div>				
					<!-- <div class="tent">
						 <p><a href="/personbank/HttpProxy?URL=/midserv/dsfbank_qyzc.jsp&dse_sessionId=<!--%=dse_sessionId%>&buscla=08&CLI_IDENTITY_CARD=<!==%=CLI_IDENTITY_CARD%>">
						 <img src="/personbank/HttpProxy?URL=/midserv/images/sgddianshi.png&dse_sessionId=<!--%=dse_sessionId%>&buscla=08&CLI_IDENTITY_CARD=<!--%=CLI_IDENTITY_CARD%>"  border="0"></a></p>
						 <dl>
						     <dt><a href="/personbank/HttpProxy?URL=/midserv/dsfbank_qyzc.jsp&dse_sessionId=<!--%=dse_sessionId%>&buscla=08&CLI_IDENTITY_CARD=<!--%=CLI_IDENTITY_CARD%>">����</a></dt>
						 </dl>	   
					</div> -->						
					<div class="tent">
						 <p><a href="/personbank/HttpProxy?URL=/midserv/dsfbank_qyzc.jsp&dse_sessionId=<%=dse_sessionId%>&buscla=09&CLI_IDENTITY_CARD=<%=CLI_IDENTITY_CARD%>">
						 <img src="/personbank/HttpProxy?URL=/midserv/images/sgdwuye.png&dse_sessionId=<%=dse_sessionId%>&buscla=09&CLI_IDENTITY_CARD=<%=CLI_IDENTITY_CARD%>"  border="0"></a></p>
						 <dl>
						     <dt><a href="/personbank/HttpProxy?URL=/midserv/dsfbank_qyzc.jsp&dse_sessionId=<%=dse_sessionId%>&buscla=09&CLI_IDENTITY_CARD=<%=CLI_IDENTITY_CARD%>">��ҵ</a></dt>
						 </dl>	   
					</div>	
		</div>
</form>
</body>
</html>