<!-------------------------------------------------------------------
                          ��׼ҳ������������
--------------------------------------------------------------------->
<%@ page language="java" contentType="text/html;charset=GBK" %>

<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.bocom.midserv.base.*" %>
<%@ page import="com.bocom.midserv.web.*" %>
<%@ page import="com.bocom.midserv.base.MidDbTools" %>
<%@ page import="com.bocom.eb.des.EBDES" %>

<% MidObjectView midObjectView =  new MidObjectView();
   ResultSet rs = midObjectView.getMidViewList();

   //String dse_sessionId = request.getParameter("dse_sessionId");//��ȡdse_sessionId
%>

<!-------------------------------------------------------------------
                          ��׼JavaScript������
--------------------------------------------------------------------->
<script language="JavaScript" src="/midserv/js/public.js"></script>

<!--------------------------------------------------------------------
   ��ǰҳ��JavaScript�������֣������ύ��֤��ҳ�涯��������Ŀ��ȴ���
---------------------------------------------------------------------->

<!--------------------------------------------------------------------
                          ҳ��HTML���ֲ���    
---------------------------------------------------------------------->
<html>
<head>
<title>��ͨ�������Ϸ���</title>
<script language="JavaScript" type="text/JavaScript">
</script>
<link rel="stylesheet" href="/midserv/css/personbank.css">
</head>

<body leftmargin="0" topmargin="0" >
<center>
<DIV align=center>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>    	
  	<td background="/midserv/images/pageTitle.gif" class="pageTitle">&nbsp;&nbsp;�� ѡ �� �� �� ҵ �� �� ��</td>
  	<td rowspan="2" align="right" valign="top">&nbsp;</td>
  </tr>
  <tr>
  	<td><img src="/midserv/images/xianb.gif" width="100" height="20"></td>
  </tr>
</table>

<FORM action="/midserv/t_midServStep1.jsp" method=post name="f1">
<input type="hidden" name=biz_id value="1">
<input type="hidden" name=step_id value="1">
<table border="0" cellspacing="2" cellpadding="0" align="center" width="50%" >
<% while (rs.next()) { %>
  <tr>
     <td width="50%" align="center" height="22" class="InputTip">
     <A onClick="
     this.document.f1.biz_id.value=<%=rs.getInt("biz_id")%>;
     this.document.f1.step_id.value=1;
     this.document.f1.submit();
     return false;
     " HREF=""><font color="blue"><%=rs.getString("biz_memo").trim()%></font></A>
     </td>
  </tr> 
<%}
rs.close();
midObjectView.releaseDBConnection();
%>
</table>
<br>
<br>
<br>
<br>
</form>
</DIV>
</center>
</body>
</html>