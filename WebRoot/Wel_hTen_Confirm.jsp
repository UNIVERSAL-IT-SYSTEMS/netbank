<%@page import="org.apache.commons.lang.StringUtils"%>
<%@ page language="java" contentType="text/html;charset=GBK"%>
<%@ page import="java.net.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.viatt.util.*"%>
<%@ page import="com.bocom.midserv.gz.*"%>
<%@ page import="com.gdbocom.util.communication.*" %>
<%@ page import="com.gdbocom.Transactions.WelLot" %>
<%@include file="/includeFiles/common.jsp" %>
<%
String loginType =ReqParamUtil.reqParamTirm(request,"loginType");//���͵�½��� 0��ע���û�(�ֻ���) 1��֤���û� 2�������û�
String cdno = ReqParamUtil.getParamAttr(request,"cardNo");
//�������������Ҫ��ת��ҳ��
String forwardPage = "Wel_Confirm.jsp";
//���ó��������Ҫ��ת��ҳ��
String errPage = "errPage.jsp";
//�������ҵ�����ݣ�������request��Attribute��
HpTenBallCreater.processData(request,response);
String showNum=ReqParamUtil.getParamAttr(request,"showNum");
String BetAmtShow=ReqParamUtil.getParamAttr(request,"BetAmtShow");
%>
<html>
    <head>
        <title>��ͨ�������Ϸ���</title>
        <link rel="stylesheet" type="text/css" href="/personbank/css/<%=cssFileName%>"></link>
    </head>
    <body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0"  oncontextmenu="self.event.returnValue=false" onselectstart="return false">
    <div class="indent">
    <form action="/personbank/HttpProxy" method="post" name="form1">
        <!-- ���ж����ֶ� -->
        <input type="hidden" name="URL" value="/midserv/Wel_hTen_pwd.jsp"/>
        <input type="hidden" name="dse_sessionId" value="<%=dse_sessionId%>"/>
        <input type="hidden" name="sendPass" value="<%=loginType.endsWith("0")?"1":"0" %>">
        <table width="90%" align="center" cellpadding="1" cellspacing="1"  class="tab">
		  <tr align="center" class="tab_title">
		    <td align="left" colspan="2">
		       ȷ��Ͷע��Ϣ:
		    </td>
		  </tr>
		  <tr></tr>
		 <tr class="tab_tr"> 
	        <td align="right">
	             ���п���:
	        </td>
	        <td align="left"> 
	        	<label><%=cdno%></label>
	        </td>
	     </tr>
	     <tr class="tab_tr"> 
	        <td align="right">
	             Ͷע����:
	        </td>
	        <td align="left"> 
	        	<label><%=showNum%></label>
	        </td>
	     </tr>
	     <tr class="tab_tr"> 
	        <td align="right">
	             ���׽��:
	        </td>
	        <td align="left"> 
	        	<label><%=BetAmtShow%>Ԫ</label>
	        </td>
	     </tr>
	     <tr class="tab_result"> 
	        <td align="center" colspan="2">
	            <input type="submit" class="button_bg" value="ȷ��" style="cursor:hand;"/>
	            <input type="button" class="button_bg" name="Submit3" value="����" onclick="javascript:history.back()" />
	        </td>
	     </tr>
	     </table>
	     <%=
			ReqParamUtil.reqParamAttrToHtmlStr(request)
		 %>
		</form>
	</div>
	</body>
</html>