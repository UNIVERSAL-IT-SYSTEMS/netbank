<%@ page pageEncoding="GBK"%>
<%@ page language="java" contentType="text/html; charset=GBK" %>
<% request.setCharacterEncoding("GBK");%>

<%@ page import="com.bocom.midserv.gz.*"%>
<%@ page import="com.viatt.bean.*"%>
<%@ page import="com.viatt.util.*"%>
<%@ page import="java.text.DecimalFormat"%>
<%@ page import="java.util.*"%>
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
    com.bocom.midserv.gz.GzLog log = new com.bocom.midserv.gz.GzLog("c:/gzLog");
    log.Write(cardNo+"����["+uri+"]");

%>

<html>
    <head>
        <title>��ͨ�������Ϸ���</title>
        <!-- ������ʽ����������ɫ������ȸ�ʽ -->
        <link rel="stylesheet" type="text/css" href="/personbank/css/<%=cssFileName%>">
        <!-- ������ʽ��������䡢�����Ӹ�ʽ -->
        <link rel="stylesheet" type="text/css"
            href="/personbank/HttpProxy?URL=/midserv/css/css.css&dse_sessionId=<%=dse_sessionId%>">
    </head>

    <body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0"  oncontextmenu=self.event.returnValue=false onselectstart="return false" >

    <div class="indent">
    <form action="/personbank/HttpProxy" method=post name="form1">
        <!-- ���ж����ֶ� -->
        <input type="hidden" name="URL" value="/midserv/Gds_GdsBIds.jsp"/>
        <input type="hidden" name="dse_sessionId" value="<%=dse_sessionId%>"/>
<%
	//��ȡ��ǩԼ����
	String signResult = request.getParameter("Gds_signResult");
%>
        <!-- ��ɫҵ���ֶ� -->
        <input type="hidden" name="Gds_signResult" value="<%=signResult%>"/>

		<table width="90%" align="center" cellpadding="1" cellspacing="1" class="tab">
<%
    //����ǩԼ�Ľ����б�
    Map business = GdsPubData.getSignBusiness();
    Iterator itBusiness = business.keySet().iterator();
    if(itBusiness.hasNext()){
%>
        <tr align="left" class="tab_title"> 
            <td>
                ������
            </td>
        </tr>
<%
    }

    while (itBusiness.hasNext()) {
        String businessKey = (String) itBusiness.next();
        if (signResult.indexOf(String.valueOf(businessKey)) != -1) {
%>
        <tr class="tab_tr">
            <td align="left">
                <p><%=business.get(businessKey) %></p>
            </td>
        </tr>

<%
        }
    }
%>
        <tr class="tab_title">
            <td align="left">
                ��ѡ��ǩԼҵ�������
            </td>
        </tr>
        <tr class="tab_tr">
            <td align="left">
                <p><a href='/personbank/HttpProxy?URL=/midserv/Gds_Ele_Note.jsp&dse_sessionId=<%=dse_sessionId%>'>��ѻ���</a></p>
            </td>
        </tr>
        <tr class="tab_tr">
            <td align="left">
<%
    itBusiness = business.keySet().iterator();
    while (itBusiness.hasNext()) {
        String businessKey = (String) itBusiness.next();
        if (signResult.indexOf(String.valueOf(businessKey)) < 0) {
            out.println("<p><input type='checkbox' name='GdsBId"
                    +businessKey+"' value='"
                    +businessKey+"' >"
                    +business.get(businessKey)+"</input></p>");
        }
    }

 %>
            </td>
        </tr>
		<tr>
		    <td align="center">
		        <input type="submit"  class="button_bg"  value="ȷ��" style={cursor:hand;}/>
		    <input type="button" class="button_bg" name="Submit3" value="����" onclick="javascript:history.back()" />      
		    </td>      
		</tr>
		</table>
    </form> 
    </div>
    </body>
</html>