<%@ page import="com.gdbocom.util.*"%>
<%
	request.setCharacterEncoding("GBK");
	/* ��ȡ����ȫ�ֲ��� */
	//��ȡ�ͻ���ǰʹ�õ�CSS��ʽ
	String cssFileName = request.getParameter("cssFileName");
	//��ȡdse_sessionId
	String dse_sessionId = request.getParameter("dse_sessionId");
	
	PrintTheReqeustHeaderUtils.printParam(request);   
	PrintTheReqeustHeaderUtils.printAttr(request);   
%>