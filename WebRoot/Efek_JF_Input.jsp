<%@ page pageEncoding="GBK"%>
<%@ page language="java" contentType="text/html; charset=GBK" %>
<% request.setCharacterEncoding("GBK");%>

<%@ page import="com.bocom.midserv.gz.*"%>

<%
    String uri = request.getRequestURI();
    /* ��ȡ����ȫ�ֲ��� */
    //��ȡ�ͻ���ǰʹ�õ�CSS��ʽ
    String cssFileName = request.getParameter("cssFileName");
    //��ȡdse_sessionId
    String dse_sessionId = request.getParameter("dse_sessionId");
    //��ȡ����
    String CrdNo = request.getParameter("cardNo");
    //��ȡ����
    String custName = request.getParameter("custName");

    //������־ʵ��
    GzLog log = new GzLog("c:/gzLog");
    log.Write(CrdNo+"����["+uri+"]");


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


    <body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0"  oncontextmenu=self.event.returnValue=false onselectstart="return false">
    <div class="indent">
        <form action="/personbank/HttpProxy" method=post name="form1">
            <input type="hidden" name="URL" value="/midserv/Efek_JF_460410.jsp"/>
            <input type="hidden" name="dse_sessionId" value="<%=dse_sessionId%>"/>

            <table width="90%" align="center" cellpadding="1" cellspacing="1" class="tab">
                <tr align="center" class="tab_title"> 
                    <td colspan="2">�������ֵ��Ϣ</td>
                </tr>
                <tr class="tab_tr">
                    <td align="right">
                    	�ɷѿ��ţ�
                    </td>
                    <td align="left">
                    	<%=CrdNo%>
                    </td>
                </tr>
                <tr class="tab_tr">
                    <td align="right">
                    	�ɷѺţ�
                    </td>
                    <td align="left">
                    	<input type='text' name='JFH'/>
                    </td>
                </tr>
                <tr class="tab_tr">
                    <td align="right">
                    	������£�
                    </td>
                    <td align="left">
                    	<input type='text' name='DFNY'/>
                    	�������ʽΪYYYYMM���磺201408��
                    </td>
                </tr>
                <tr class="tab_tr">
                    <td align="right">
                    	��ѯ��ʽ��
                    </td>
                    <td align="left">
                    	<input type='radio' name='CXFS' value='1'>����ǩԼ</input>
        				<input type='radio' name='' value='2' >����ǩԼ</input>
                    </td>
                </tr>
                <tr class="tab_result">
                    <td align="center">
			            <input type="submit"  class="button_bg"  value="ȷ��" style={cursor:hand;}/>
			            <input type="button" class="button_bg" name="Submit3" value="����" onclick="javascript:history.back()" />      
                     </td>      
               </tr>
           </table>
			<input type='hidden' name='CrdNo' value="<%=CrdNo%>"/><br/>
        </form> 
    </div>
    </body>
</html>