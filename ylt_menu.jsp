<!-------------------------------------------------------------------
                          ��׼ҳ������������
--------------------------------------------------------------------->
<%@ page contentType="text/html;charset=GBK"%>

<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.bocom.midserv.base.*"%>
<%@ page import="com.bocom.midserv.web.*"%>
<%@ page import="com.bocom.midserv.gz.*"%>
<%@ page import="com.bocom.eb.des.EBDES"%>

<%
	int i_step_id = Integer.parseInt(request.getParameter("step_id").trim());
	int i_biz_id = Integer.parseInt(request.getParameter("biz_id").trim());
	String cdno = request.getParameter("cardNo");
	String dse_sessionId = request.getParameter("dse_sessionId");
	String loginType = request.getParameter("loginType");
%>

<!-------------------------------------------------------------------
                          ��׼JavaScript������
--------------------------------------------------------------------->
<script language="JavaScript" src="/personbank/HttpProxy?URL=/midserv/js/public.js&dse_sessionId=<%=dse_sessionId%>"></script>
<script language="JavaScript" src="/personbank/HttpProxy?URL=/midserv/js/public_card.js&dse_sessionId=<%=dse_sessionId%>"></script>

<!--------------------------------------------------------------------
   ��ǰҳ��JavaScript�������֣������ύ��֤��ҳ�涯��������Ŀ��ȴ���
---------------------------------------------------------------------->

<!--------------------------------------------------------------------
                          ҳ��HTML���ֲ���    
---------------------------------------------------------------------->
<html>
	<head>
		<title>��ͨ�������Ϸ���</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		<link rel="stylesheet"
			href="/personbank/HttpProxy?URL=/midserv/css/personbank.css&dse_sessionId=<%=dse_sessionId%>">

<SCRIPT language=javascript event=onkeydown for=document>   
if( event.keyCode == 13 )
{   
	return false ;
}   
</SCRIPT>
	</head>

	<body leftmargin="0" topmargin="0">
		<CENTER>
			<DIV align=center>
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td background="/personbank/HttpProxy?URL=/midserv/images/pageTitle.gif&dse_sessionId=<%=dse_sessionId%>" class="pageTitle">
							�� ѡ �� �� �� ͨ ҵ �� �� �ࣺ
						</td>
						<td rowspan="2" align="right" valign="top">
							&nbsp;
						</td>
					</tr>
					<tr>
						<td>
							<img src="/personbank/HttpProxy?URL=/midserv/images/xianb.gif&dse_sessionId=<%=dse_sessionId%>" width="100" height="20">
						</td>
					</tr>
				</table>

				<FORM action="/personbank/HttpProxy" method=post name="form1">
					<input type="hidden" name="dse_sessionId" value="<%=dse_sessionId%>">
					<input type="hidden" name="biz_id" value="<%=i_biz_id%>">
					<input type="hidden" name="biz_no" value="">
					<input type="hidden" name="step_id" value="<%=i_step_id%>">
					<input type="hidden" name="stepCount" value="1">
					<input type="hidden" name="URL" value="">
					
					<table border="0" cellspacing="2" cellpadding="0" align="center" width="50%">
					  <tr>
					     <td width="50%" align="center" height="22" class="InputTip">
					     <A onClick="
					     this.document.form1.URL.value='/midserv/midServStep1.jsp';
					     this.document.form1.submit();
					     return false;
					     " HREF=""><font color="blue">���νɷ�</font></A>
					     </td>
					  </tr>
					  <tr>
					     <td width="50%" align="center" height="22" class="InputTip">
					     <A onClick="
					     this.document.form1.URL.value='/midserv/midServStep1.jsp';
					     this.document.form1.submit();
					     return false;
					     " HREF=""><font color="blue">������Ʊ</font></A>
					     </td>
					  </tr>					  
					</table>  
				</FORM>

				<%@ include file="bottom.jsp"%>
			</DIV>
		</CENTER>
	</BODY>
</HTML>
