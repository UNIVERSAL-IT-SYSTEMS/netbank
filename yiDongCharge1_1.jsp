<!-------------------------------------------------------------------
                          ��׼ҳ������������
						  
						  
--------------------------------------------------------------------->
<%@ page language="java" contentType="text/html;charset=GBK"%>
<%@ page import="com.bocom.midserv.gz.*"%>
<%@ page import="com.viatt.util.*" %>
<%
	GzLog log = new GzLog("c:/gzLog");
	String dse_sessionId = MessManTool.changeChar(request.getParameter("dse_sessionId"));//��ȡdse_sessionId
	String biz_id=MessManTool.changeChar(request.getParameter("biz_id"));
	String step_id = MessManTool.changeChar(request.getParameter("step_id"));
	
  String cssFileName = request.getParameter("cssFileName");//��ȡ�ͻ���ǰʹ�õ�CSS��ʽ
	if(cssFileName ==null){
		cssFileName = "skin.css";
	}		
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
		<meta http-equiv="Content-Type" content="text/html; charset=GBK">
		<title>��ͨ�������Ϸ���</title>
		<link rel="stylesheet" type="text/css" href="/personbank/css/<%=cssFileName%>">
	</head>
	
	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
		<center>
			<div class="indent">
				<table width="100%" align="center" cellpadding="1" cellspacing="1" class="tab">
					<tr align="left"> 
						<td class="tab_title">�� ѡ �� ǩ Լ �� ��</td>
					</tr>
		
					
					
					<form action="/personbank/HttpProxy" method=post name="f1">
					<input type="hidden"   name="dse_sessionId"	value="<%=dse_sessionId%>">
					<input type="hidden"   name="URL"           value="/midserv/yiDongCharge2.jsp">
					<input type="hidden"   name=biz_id          value="<%=biz_id %>">
					<input type="hidden"   name=step_id 		value="2">
					
					
					<tr class="tab_tr">
							<td width="40%" align="right" height="22" class="InputTip">
								ǩԼ����:   
							</td>
							<td width="60%" align="left" height="22" class="InputTip">
									<select name="signType">
										<option value="1">����ǩԼ</option>
										<option value="2">����ǩԼ</option>
									</select>
							</td>
					</tr>
						
						
				
					
					<tr class="tab_result">
						<td align="center" colspan="2">
							<input type="button" onclick="submit();" value="��һ��" class="button_bg">
							<input type="button" onclick="window.history.back();" value="�� ��"	class="button_bg">
						</td>
					</tr>
					</table>
					
				</form>
				
			</DIV>
		</center>
	</body>
</html>
