<%@ page pageEncoding="GBK"%>
<%@ page language="java" contentType="text/html; charset=GBK" %>
<% request.setCharacterEncoding("GBK");%>

<%@ page import="com.bocom.midserv.gz.*"%>
<%@ page import="com.viatt.bean.*"%>
<%@ page import="com.viatt.util.*"%>
<%@ page import="java.text.DecimalFormat"%>
<%@ page import="java.util.*"%>
<%@ page import="weblogic.utils.StringUtils" %>
<%@ page import="com.gdbocom.util.communication.custom.gds.*"%>
<%

	String uri = request.getRequestURI();
	/* ��ȡ����ȫ�ֲ��� */
	//��ȡ�ͻ���ǰʹ�õ�CSS��ʽ
	String cssFileName = request.getParameter("cssFileName");
	//��ȡdse_sessionId
	String dse_sessionId = request.getParameter("dse_sessionId");
	//��ȡ����
	String cardNo = request.getParameter("cardNo");
	//��ȡ����
	String custName = request.getParameter("custName");
	
	//������־ʵ��
	GzLog log = new GzLog("c:/gzLog");
	log.Write(cardNo+"����["+uri+"]");


%>

<html>
    <head>
        <title>��ͨ�������Ϸ���</title>
        <link rel="stylesheet" type="text/css" href="/personbank/css/<%=cssFileName%>">
    </head>


    <body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0"  oncontextmenu=self.event.returnValue=false onselectstart="return false" >
    <div class="indent">
    <form action="/personbank/HttpProxy" method=post name="form1">
		<table width="90%" align="center" cellpadding="1" cellspacing="1" class="tab">
		  <tr align="center" class="tab_title"> 
		    <td>
		    ��������������ǩԼ���롣
		    </td>
		  </tr>
		  <tr class="tab_tr">
		    <td align="left">
		    ��ί����Ŀ���Զ����ɷ�ҵ�������״οۿ�ɹ�֮����ͨ����ȷ������ǩԼ���п��ʻ������㣬������ǩԼ���п��ۿ����֪ͨ����л���Խ��е�֧��!
		    </td>
		  </tr>
		</table>
    </form>
    </div>
    </body>
</html>