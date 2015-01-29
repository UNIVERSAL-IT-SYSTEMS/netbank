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
        <!-- ���ж����ֶ� -->
        <input type="hidden" name="URL" value="/midserv/Gds_Pub_Confirm.jsp"/>
        <input type="hidden" name="dse_sessionId" value="<%=dse_sessionId%>"/>

<%
    //��ȡ��ǩԼ����
    String signResult = request.getParameter("Gds_signResult");
    String Gds_GdsBIds = request.getParameter("Gds_GdsBIds");

    //����ע����ֻ������ֶ�,������Ҫ���������ͽ������֣����ĵ���û���ر�Ҫ�󣬶���
    //��Ѷ�ɷѵȽ���Ҳ�����ֽ���������
    String loginType = request.getParameter("loginType");
%>
    <!-- �����ֻ���̬�����ֶ� -->
    <input type="hidden" name="sendPass" value="1"/>

    <!-- ��ɫҵ���ֶ� -->
    <input type="hidden" name="Gds_signResult" value="<%=signResult%>"/>
    <input type="hidden" name="Gds_GdsBIds" value="<%=Gds_GdsBIds%>"/>

	<table width="90%" align="center" cellpadding="1" cellspacing="1" class="tab">
<%

    String[] gdsBids = Gds_GdsBIds.split(",");
    Map business = GdsPubData.getSignBusiness();
    for(int i=0; i<gdsBids.length; i++){
        if( null==gdsBids[i] || ("".equals(gdsBids[i])) ){
            continue;
        }

        String businessId = gdsBids[i];
        String businessName = (String) business.get(businessId);
        if(businessId.equals(GdsPubData.businessOfMobile)){
%>
      <tr align="center" class="tab_sub_title"> 
        <td colspan="2">
        <%=businessName %>
        </td>
      </tr>
      <tr class="tab_tr"> 
        <td align="right" width="50%">
        <%="��ѡ��ǩԼ����:" %>
        </td>
        <td align="left" width="50%">
        <input type='radio' name='TAgtTp<%=businessId %>' value='1'
            onclick=TCusId.style.display='none' >����ǩԼ</input>
        <input type='radio' name='TAgtTp<%=businessId %>' value='2'
            onclick=TCusId.style.display='block' >����ǩԼ</input>
        </td>
      </tr>
      <tr class="tab_tr"> 
        <td align="right" width="50%">
        <%="������"+businessName+"����:" %>
        </td>
        <td align="left" width="50%">
        <input type='text' name='MCusId<%=businessId %>' />
        </td>
      </tr>
      <tr class="tab_tr" id='TCusId' style="display:none"> 
        <td align="right">
        <%="������"+businessName+"����:" %>
        </td>
        <td align="left">
        <input type='text' name='TCusId<%=businessId %>' />
        </td>
      </tr>
<%

        }else{
%>
      <tr align="center" class="tab_sub_title"> 
        <td colspan="2">
        <%=businessName %>
        </td>
      </tr>
      <tr class="tab_tr"> 
        <td align="right" width="50%">
        <%="������"+businessName+"�ɷѺ�:" %>
        </td>
        <td align="left" width="50%">
        <input type='text' name='TCusId<%=businessId %>' />
        </td>
      </tr>
      <tr class="tab_tr"> 
        <td align="right">
        <%="������"+businessName+"�ɷѻ���:" %>
        </td>
        <td align="left">
        <input type='text' name='TCusNm<%=businessId %>' />
        </td>
      </tr>
<%
        }
    }
%>

	  <tr>
      <tr class="tab_result"> 
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