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
          	<td class="tab_title">�� ѡ �� �� Ӧ �� �� �� ��</td>
        	</tr>
				
				<form name="f1" method="post" action="/personbank/HttpProxy">
					<input type="hidden" name="dse_sessionId"	value="<%=dse_sessionId%>">
					<input type="hidden" name="URL" value="/midserv/yinLvTong2.jsp">
					<input type="hidden" name=biz_id value="<%=biz_id %>">
					<input type="hidden" name=step_id value="1">
					
						<tr class="tab_tr">
							<td width="100%" align="center" class="InputTip">	
								<A
									onClick="
     this.document.f1.URL.value='/midserv/yinLvTong2.jsp';
     this.document.f1.biz_id.value=<%=biz_id %>;
     this.document.f1.submit();
     return false;
     "
									HREF="">������Ʊ
								</A>
							</td>
						</tr>
						<tr class="tab_tr">
							<td width="100%" align="center" class="InputTip">	
								<A
									onClick="
     this.document.f1.URL.value='/midserv/midServStep1.jsp';
     this.document.f1.biz_id.value=<%=biz_id %>;
     this.document.f1.submit();
     return false;
     "
									HREF="">���νɷ�
								</A>
							</td>
						</tr>
						<tr class="tab_tr">
							<td width="100%" align="center" class="InputTip">	
								<A
									onClick="
	 this.document.f1.URL.value='/midserv/yinLvTong7.jsp';
     this.document.f1.biz_id.value=<%=biz_id %>;
     this.document.f1.submit();
     return false;
     "
									HREF="">��ʷ���ײ�ѯ
								</A>
							</td>
						</tr>
						<tr class="tab_result">
	    				<td align="center" colspan="2">
             		<input type="button" class="button_bg" value="�� ��" onClick="history.go(-2);"/>
           		</td>  	
	    			</tr>
					</table>
				</FORM>
			</DIV>
		</center>
	</body>
</html>
