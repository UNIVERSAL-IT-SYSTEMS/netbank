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

    //�ֻ���̬�����ֶ�
    String sendPass = request.getParameter("sendPass");
    if(!("0".equals(sendPass)||"1".equals(sendPass))){
        response.sendRedirect("Gds_Pub_Agree.jsp");
    }
    String dynamicCode = request.getParameter("dynamicCode");
    String dynamicCodeSeq = request.getParameter("dynamicCodeSeq");
    log.Write( "sendPass=["+sendPass+"] ��̬����=["+dynamicCode+"] ��̬�������=["+dynamicCodeSeq+"]" );

%>

<html>
    <head>
        <title>��ͨ�������Ϸ���</title>
        <link rel="stylesheet" type="text/css" href="/personbank/css/<%=cssFileName%>">

        <!--�������ж˹��ð�ȫ���������Ҫ����HttpProxy-->
		<script language="JavaScript" src="/personbank/js/public.js"></script>
		<script language=JavaScript src="/personbank/js/writeActivxObject.js"></script>
		<script language="JavaScript">
		   var clickBoolean=true;
			function beforeSubmit(){
	            if(clickBoolean){
	                if(document.safeInput1.allType()!="10000"
                        || document.safeInput1.isValid()){
	                    alert("������Ϸ�������");
	                    return;
	                }
	                if(document.form1.DynamicCode.value
	                        !='<%=request.getParameter("dynamicCode")%>'){
	                    alert('��̬���벻��');
	                    return false;
	                }

	                document.safeInput1.commit("safeCommit1");
	                document.safeCommit1.submit("form1"); 
	                clickBoolean=false;
	            }
			}
		</script>
    </head>


    <body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0"  oncontextmenu=self.event.returnValue=false onselectstart="return false" >
    <SCRIPT language=JavaScript> writeCommitActivxObject('')</SCRIPT>
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
        <input type="hidden" name="password"/>

<%
	String gds_GdsBIds = request.getParameter("Gds_GdsBIds");
	String[] gdsBids = gds_GdsBIds.split(",");
	Map business = GdsPubData.getSignBusiness();
	for(int i=0; i<gdsBids.length; i++){
        if( null==gdsBids[i] || ("".equals(gdsBids[i])) ){
            continue;
        }

        String businessId = gdsBids[i];
        String businessName = (String) business.get(businessId);
        if(businessId.equals(GdsPubData.businessOfMobile)){
            String tAgtTp = request.getParameter("TAgtTp"+businessId);
            String mCusId = request.getParameter("MCusId"+businessId);
            String tCusId = request.getParameter("TCusId"+businessId);
%>
        <input type='hidden' name='TAgtTp<%=businessId %>' value="<%=tAgtTp%>" />
        <input type='hidden' name='MCusId<%=businessId %>' value="<%=mCusId%>" />
        <input type='hidden' name='TCusId<%=businessId %>' value="<%=tCusId%>" />

<%

        }else{
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
        if( null==gdsBids[i] || ("".equals(gdsBids[i])) ){
            continue;
        }

        String businessId = gdsBids[i];
        String businessName = (String) business.get(businessId);
        if(businessId.equals(GdsPubData.businessOfMobile)){
            String tAgtTp = request.getParameter("TAgtTp"+businessId);
            String mCusId = request.getParameter("MCusId"+businessId);
            String tCusId = request.getParameter("TCusId"+businessId);
%>
          <tr align="center" class="tab_sub_title"> 
            <td colspan="2">
            <%=businessName %>:
            </td>
          </tr>
          <tr class="tab_tr"> 
            <td align="right" width="50%">
            ǩԼ����:
            </td>
            <td align="left" width="50%">
            <%=tAgtTp.equals("1")?"����ǩԼ":"����ǩԼ" %>
            </td>
          </tr>
          <tr class="tab_tr"> 
            <td align="right" width="50%">
            ����:
            </td>
            <td align="left" width="50%">
            <%=mCusId %>
            </td>
          </tr>
          <tr class="tab_tr"> 
            <td align="right" width="50%">
            ����:
            </td>
            <td align="left" width="50%">
            <%=tCusId %>
            </td>
          </tr>

<%

        }else{
            String tCusId = request.getParameter("TCusId"+businessId);
            String tCusNm = request.getParameter("TCusNm"+businessId);
%>
          <tr align="center" class="tab_sub_title"> 
            <td colspan="2">
            <%=businessName %>:
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
<SCRIPT language=JavaScript> writePwdActivxObjectLenClass('safeInput1','safeInput1','','password',20,6,'20','153')</SCRIPT>
        </td>
      </tr>
      <tr class="tab_tr"> 
        <td align="right">
            �������ֻ���̬���룺
        </td>
        <td align="left">
            <input type="text" name="DynamicCode">��ţ���<%=dynamicCodeSeq %>��
        </td>
      </tr>
      <tr class="tab_result"> 
        <td align="right">
            <input type="button" class="button_bg" onclick="javascript:beforeSubmit();" value="�ύ" style={cursor:hand;}>
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