
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
      response.setContentType("text/html;charset=GBK"); 
request.setCharacterEncoding("GBK"); 

   String dse_sessionId = request.getParameter("dse_sessionId");//��ȡdse_sessionId
   
//   if ( request.getParameter("card_no") != null )
//  	 session.putValue("card_no",request.getParameter("card_no").trim());
//   if ( request.getParameter("pssd_no") != null )
//  	 session.putValue("pssd_no",request.getParameter("pssd_no").trim());

   
%>

 
<!-------------------------------------------------------------------
                          ��׼JavaScript������
--------------------------------------------------------------------->
<script language="JavaScript" src="/personbank/HttpProxy?URL=/midserv/js/public.js&dse_sessionId=<%=dse_sessionId%>"></script>



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
<link rel="stylesheet" href="/personbank/HttpProxy?URL=/midserv/css/personbank.css&dse_sessionId=<%=dse_sessionId%>">
</head>

<body leftmargin="0" topmargin="0">
<center>

<DIV align=center>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>    	
  	<td background="/personbank/HttpProxy?URL=/midserv/images/pageTitle.gif&dse_sessionId=<%=dse_sessionId%>" class="pageTitle">&nbsp;&nbsp;�� ѡ �� �� �� ҵ �� �� ��</td>
  	<td rowspan="2" align="right" valign="top">&nbsp;</td>
  </tr>
  <tr>
  <td><img src="/personbank/HttpProxy?URL=/midserv/images/xianb.gif&dse_sessionId=<%=dse_sessionId%>" width="100" height="20"></td>
  </tr>
</table>

<FORM action="/personbank/HttpProxy" method=post name="f1">
<input type="hidden" name="dse_sessionId" value="<%=dse_sessionId%>">
<input type="hidden" name="URL" value="/midserv/midServStep1.jsp">
<input type=hidden name=biz_id value="1">
<input type=hidden name=step_id value="1">
<CENTER>
<table border="0" cellspacing="2" cellpadding="0" align="center" width="50%" >
<% 
   ResultSet rs = midObjectView.getMidViewList();
   while (rs.next()) { %>
  <tr>
     <td width="50%" align="center" height="22" class="InputTip">
     <A onClick="
     this.document.f1.biz_id.value=<%=rs.getInt("biz_id")%>;
     this.document.f1.step_id.value=1;
     this.document.f1.submit();
     return false;
     " HREF=""><font color="blue"><%=rs.getString("biz_memo").trim()%></font></A>     
     </td>
     </td>
  </tr> 
<%}
rs.close();
midObjectView.releaseDBConnection();
%>
</table>
<br>
<br>
</DIV>

<br>
<br>
</form>
</body>
</html>