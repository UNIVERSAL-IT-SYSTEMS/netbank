<!-------------------------------------------------------------------
                          ��׼ҳ������������
--------------------------------------------------------------------->
<%@ page contentType="text/html;charset=GBK" %>
 
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.bocom.midserv.base.*" %>
<%@ page import="com.bocom.midserv.web.*" %>
<%@ page import="com.bocom.midserv.gz.*" %>
<%@ page import="com.bocom.eb.des.EBDES" %>
<% 
   int i_step_id	= Integer.parseInt(request.getParameter("step_id").trim());
   int i_biz_id		= Integer.parseInt(request.getParameter("biz_id").trim());
	 String cdno = request.getParameter("cardNo");
	 
   MidObjectView midObjectView =  new MidObjectView();
   if (midObjectView.getMidObjectView(i_biz_id) != true) 
   	System.exit(1);
   
   MidObjectStepView midObjectStepView =  new MidObjectStepView();
   //int maxstep=midObjectStepView.getMaxStepId(i_biz_id);
   
   String dse_sessionId = request.getParameter("dse_sessionId");//��ȡdse_sessionId
   String loginType = request.getParameter("loginType");
   GzLog log = new GzLog("c:/gzLog");
   log.Write("step1_dev:	loginType=["+loginType+"] ҵ��i_biz_id=["+i_biz_id+"] i_step_id=[" + i_step_id + "]");  

  String cssFileName = request.getParameter("cssFileName");//��ȡ�ͻ���ǰʹ�õ�CSS��ʽ
	if(cssFileName ==null){
		cssFileName = "skin.css";
	}		

%>

<!-------------------------------------------------------------------
                          ��׼JavaScript������
--------------------------------------------------------------------->
<script language="JavaScript" src="/personbank/HttpProxy?URL=/midserv/js/public.js&dse_sessionId=<%=dse_sessionId%>"></script>
<script language="JavaScript" src="/personbank/HttpProxy?URL=/midserv/js/public_card.js&dse_sessionId=<%=dse_sessionId%>"></script>

<!--------------------------------------------------------------------
   ��ǰҳ��JavaScript�������֣������ύ��֤��ҳ�涯��������Ŀ��ȴ���
---------------------------------------------------------------------->
<%
//�������
out.print(midObjectView.writeCondition(i_biz_id,i_step_id));
//i_step_id=i_step_id+1;
%>

<!--------------------------------------------------------------------
                          ҳ��HTML���ֲ���    
---------------------------------------------------------------------->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>��ͨ�������Ϸ���</title>
<script language="JavaScript" type="text/JavaScript">
</script>
<link rel="stylesheet" type="text/css" href="/personbank/css/<%=cssFileName%>">
</head>

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<CENTER>
<div class="indent">
<table width="100%" align="center" cellpadding="1" cellspacing="1" class="tab">
  <tr align="left">
  	<td colspan="3" class="tab_title"><%=midObjectView.get_biz_memo().trim()%>���ڶ�����</td>
  </tr>

<FORM action="/personbank/HttpProxy" method=post name="form1">
<input type="hidden" name="dse_sessionId" value="<%=dse_sessionId%>">
<%
log.Write("step1_dev:	1111");
if( loginType.equals("0") )
{
log.Write("step1_dev:	2222");
%>
	<input type="hidden" name="URL" value="/midserv/midServStep2.jsp">
<%
}
else
{		
%>
	<input type="hidden" name="URL" value="/midserv/midServStep3.jsp">
<%
}
%>
<input type="hidden" name="biz_id" value="<%=midObjectView.get_biz_id()%>">
<input type="hidden" name="biz_no" value="<%=midObjectView.get_biz_no().trim()%>">
<input type="hidden" name="step_id" value="<%=i_step_id+1%>">

<%
log.Write("step1_dev:	3333"); 
ResultSet rs = midObjectStepView.getStepViewNotHidByBizIdAndStepId(i_biz_id,i_step_id);
   while (rs.next()) { %>
  <tr class="tab_tr">
     <td width="20%" align="center" height="22" class="InputTip"><%=rs.getString("input_lable").trim()%>��</td>
     <td width="30%" align="left" height="22" class="InputTip"><input type="<%=rs.getString("input_type").trim()%>" name="<%=rs.getString("input_name").trim()%>" size="<%=rs.getInt("input_size")%>" value="<%=rs.getString("input_value").trim()%>"></td>
  </tr> 
<%
log.Write("step1_dev:	4444"); 
}
	rs.close();
	midObjectStepView.releaseDBConnection();
%>

<tr class="tab_result">
	<td align="center" colspan="3">
		<input type="submit" class="button_bg" name="Submit" value="�ύ">
    <input type="reset" class="button_bg" name="Submit2" value="����">
  	<input type="button" onclick="window.history.back();" value="����" class="button_bg">
	</td>
</tr>
</table>

<br>
<p>��ע��<%=midObjectView.get_biz_detail().trim()%></p>
</FORM>
<%@ include file="bottom.jsp" %>
</DIV></CENTER></BODY></HTML>
