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
	com.bocom.midserv.gz.GzLog log = new com.bocom.midserv.gz.GzLog("c:/gzLog");
	log.Write(cardNo+"����["+uri+"]");

    //������Ҫ��ʾ��ֵ������
    boolean isNull = false;
    //������Ҫ��ʾ��ֵ�����ƺ���Դ��
    //    ��ʽ��CrdNo,ǩԼ����,[reqHead|request|session]
    //String showKey = request.getParameter("showKey");

%>

<html>
    <head>
        <title>��ͨ�������Ϸ���</title>
        <link rel="stylesheet" type="text/css" href="/personbank/css/<%=cssFileName%>">
    </head>


    <body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0"  oncontextmenu=self.event.returnValue=false onselectstart="return false" >
    <div class="indent">
    <form action="/personbank/HttpProxy" method=post name="form1">
        <!-- ���ж����ֶ� -->
        <input type="hidden" name="URL" value="/midserv/Gds_Qry_9998.jsp"/>
        <input type="hidden" name="dse_sessionId" value="<%=dse_sessionId%>"/>

<%
    //��ȡ��ǩԼ����
    String signResult = request.getParameter("Gds_signResult");
    String Gds_GdsBIds = request.getParameter("Gds_GdsBIds");

%>
        <!-- ��ɫҵ���ֶ� -->
        <input type="hidden" name="Gds_signResult" value="<%=signResult%>"/>
        <input type="hidden" name="Gds_GdsBIds" value="<%=Gds_GdsBIds%>"/>

<%
	String gds_GdsBIds = request.getParameter("Gds_GdsBIds");
	String[] gdsBids = gds_GdsBIds.split(",");
	Map business = GdsPubData.getSignBusiness();
	for(int i=0; i<gdsBids.length; i++){
	    if( null!=gdsBids[i] && (!"".equals(gdsBids[i])) ){
	        String businessId = gdsBids[i];
	        String businessName = (String) business.get(businessId);
	
	        String tCusId = request.getParameter("TCusId"+businessId);
	        String tCusNm = request.getParameter("TCusNm"+businessId);
%>
         <input type="hidden" name="TCusId<%=businessId %>" value="<%=tCusId%>"/>
         <input type="hidden" name="TCusNm<%=businessId %>" value="<%=tCusNm%>"/>
<%
	    }
	}

%>
		<table width="90%" align="center" cellpadding="1" cellspacing="1" class="tab">
		  <tr align="center" class="tab_title"> 
		    <td colspan="2">
		    ��ȷ�ϳ�ֵ��Ϣ:
		    </td>
		  </tr>
	      <tr class="tab_tr"> 
	        <td align="right" width="50%">
            ǩԼ����:
	        </td>
	        <td align="left" width="50%">
	        <%=cardNo %>
	        </td>
	      </tr>
<%
    for(int i=0; i<gdsBids.length; i++){
        if( null!=gdsBids[i] && (!"".equals(gdsBids[i])) ){
            String businessId = gdsBids[i];
            String businessName = (String) business.get(businessId);
    
            String tCusId = request.getParameter("TCusId"+businessId);
            String tCusNm = request.getParameter("TCusNm"+businessId);
%>
          <tr align="center" class="tab_sub_title"> 
            <td colspan="2">
            <%=businessName %>����:
            </td>
          </tr>
          <tr class="tab_tr"> 
            <td align="right" width="50%">
            <%=businessName %>�ɷѺ�:
            </td>
            <td align="left" width="50%">
            <%=tCusId %>
            </td>
          </tr>
          <tr class="tab_tr"> 
            <td align="right" width="50%">
            <%=businessName %>�ɷ���:
            </td>
            <td align="left" width="50%">
            <%=tCusNm %>
            </td>
          </tr>
<%
        }
    }
%>
      <tr class="tab_tr"> 
        <td align="right">
            �����뽻�����룺
        </td>
        <td align="left">
            <input type="password" name="Submit3" />
        </td>
      </tr>
      <tr class="tab_tr"> 
        <td align="right">
            <input type="submit"  class="button_bg"  value="ȷ��" style={cursor:hand;}/>
        </td>
        <td align="left">
            <input type="button" class="button_bg" name="Submit3" value="����" onclick="javascript:history.back()" />      
        </td>
      </tr>
	</table>


    </form> 
    </div>
    </body>
</html>