<%@ page pageEncoding="GBK"%>
<%@ page language="java" contentType="text/html; charset=GBK" %>
<% request.setCharacterEncoding("GBK");%>

<%@ page import="com.bocom.midserv.gz.*"%>
<%@ page import="com.viatt.bean.*"%>
<%@ page import="com.viatt.util.*"%>
<%@ page import="java.text.DecimalFormat"%>
<%@ page import="java.util.*"%>

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


    <body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0"  oncontextmenu=self.event.returnValue=false onselectstart="return false">
    <div class="indent">
        <form action="/personbank/HttpProxy" method=post name="form1">      
            <input type="hidden" name="URL" value="/midserv/Gds_Qry_9901.jsp"/>
            <input type="hidden" name="dse_sessionId" value="<%=dse_sessionId%>"/>

            <table width="90%" align="center" cellpadding="1" cellspacing="1" class="tab">
                <tr align="center" class="tab_title"> 
                    <td>�����������ɷ�һվͨ���ͻ�ǩԼЭ��</td>
                </tr>
                <tr align="center" class="tab_sub_title"> 
                    <td>�ɷ�ͨҵ��ί��Լ��</td>
                </tr>
                <tr class="tab_tr">
                    <td align="left">
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;������ί�н�ͨ���й㶫ʡ���У�����ί�пۻ����շѵ�λ������Ϣ���ۻ�ί�����п������ڵ���Ӧ�������ί���˽�����Ӧ���</p>
<p>1��ί���˱�����ָ��ί�����п��ֿ��ˣ�ָ�����п�����֧��ί���˱��˺����˵���ѡ��Ŀ����ط��á�</p>
<p>2��ί�����ڸ����������ҵ��ί�з�ʵʱ��Ч�����ڿۿ�ǰȷ��ǩԼ�Ƿ�����Ч��������δ��ʱ�ۿ���ɵ�Ƿ����ί�����Ը�����ί����Ŀ���Զ����ɷ�ҵ�������״οۿ�ɹ�֮����ͨ����ί�������й��շѵ�λ������Ϣ���������޷�����ɷѣ���ί�����Ը���</p>
<p>3��ί�нɷ����п����������������ʧ�����ᡢ��������޷����ɷѶ������ĺ������ί�����Ը���</p>
<p>4��ί���˲��ټ�������ί����Ŀ��Ӧ��ʱ������ί���������������н��������ݱ�ί����֮�������ݰ�����ɷ��������ɴ˶���ɵ���ʧ��ί�����Ը���</p>
<p>5��ί��������ֹί�л������п�������ʧ������ͽ���ģ��뼰ʱ������ί������������ĳ���ί����������������ҵ��Ĺ涨����</p>
<p>6��ί������Ȩ���а���ָ���շѵ�λ���͵����ݴ�ί�����п��пۻ���Ӧ������в���ָ���շѵ�λ���͵����ݽ�����ˣ��������ɵĿۻ������ӳ�֧�����е��κ����Ρ�ί���˶Դ��ɵĿ�����������ʱ�������йص�λ��ѯ��ί����������֮��ί�й�ϵ��Ϊ����ת�ˣ�����շѵ�λ��ί����֮��ĸ�������ϵ���ɴ������ľ����������޹ء�</p>
<p>7�����ڴ���ɷ�ҵ��չ��ǰ��Ϊ�շѵ�λ�����д��ں�����ϵ�����һ���йغ�����ϵ��ֹ����صĴ��ɷѷ����Զ���ֹ�����в��е��κ����Ρ����и��ݺ���Э���ṩ��ӡ�ɷѷ�Ʊ�ģ���Ʊ��Ϣ�Խɷ�֮�����������¡�</p>
<p>8��ί�нɷ����п���ͬһʱ�䷢��ί��֧���������ʱ��ί������Ȩ���о���֧��˳���ɴ���ɿ��������ɽ��������޹ء�</p>
<p>9����ί��ҵ���ί�����ݲ��շѣ����б�����ȡ��ط�����õ�Ȩ����</p>
<p>10�������涨����Ȩ�齻ͨ���й㶫ʡ���С�</p>

                    </td>
                </tr>
                <tr class="tab_tr">
                    <td align="left"><p>�������Ķ���ͬ�����ء��ɷ�ͨҵ��ί��Լ�������</p></td>
                </tr>
                <tr>
                    <td align="center">
			            <input type="submit"  class="button_bg"  value="ͬ��" style={cursor:hand;}/>
			            <input type="button" class="button_bg" name="Submit3" value="����" onclick="javascript:history.back()" />      
                     </td>      
               </tr>
           </table>


        </form> 
    </div>
    </body>
</html>