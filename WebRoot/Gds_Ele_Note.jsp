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

    String cssFileName = request.getParameter("cssFileName");//��ȡ�ͻ���ǰʹ�õ�CSS��ʽ

    //String biz_step_id="1";  

    GzLog log = new GzLog("c:/gzLog");
    String cardNo = request.getParameter("cardNo");
    String uri = request.getRequestURI();
    log.Write(cardNo+"����["+uri+"]");

    String dse_sessionId = MessManTool.changeChar(request
            .getParameter("dse_sessionId"));//��ȡdse_sessionId

%>

<html>
    <head>
        <title>��ͨ�������Ϸ���</title>
        <link rel="stylesheet" type="text/css" href="/personbank/css/<%=cssFileName%>">
    </head>


    <body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0"  oncontextmenu=self.event.returnValue=false onselectstart="return false">
    <div class="indent">
		<table width="90%" align="center" cellpadding="1" cellspacing="1" class="tab">
        <tr class="tab_tr">
            <td align="left">
                <p><font style="color:red;">��ܰ��ʾ��</font>�ݲ�֧�ֵ�ѵĵ�������ί��ǩԼ������ֱ��ͨ�����н����������̳ǣ��ֻ����л�����ͨ�ն˽��������ɷѣ���Я�����֤����һ�ڽɷѷ�Ʊ����ͨ�����������ǩԼ������</p>
            </td>
        </tr>
		<tr class="tab_result">
		    <td align="center">
		        <input type="button" class="button_bg" name="Submit3" value="����" onclick="javascript:history.back()" />      
		    </td>      
		</tr>
		</table>
    </div>
    </body>
</html>