<%@ page language="java" contentType="text/html;charset=GBK"%>
<%@ page import="java.util.*" %>
<%@ page import="com.viatt.util.*"%>
<%@ page import="com.bocom.midserv.gz.*"%>
<%@ page import="com.gdbocom.Transactions.WelLot" %>
<%@include file="/includeFiles/common.jsp" %>
<html>
    <head>
        <title>��ͨ�������Ϸ���</title>
        <link rel="stylesheet" type="text/css" href="/personbank/css/<%=cssFileName%>"></link>
    </head>
    <body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0"  oncontextmenu="self.event.returnValue=false" onselectstart="return false">
    <div class="indent">
    <form action="/personbank/HttpProxy" method="post" name="form1" id="form1">
        <!-- ���ж����ֶ� -->
        <input type="hidden" name="URL" value="/midserv/Wel_hTen_buyRed.jsp"/>
        <input type="hidden" name="dse_sessionId" value="<%=dse_sessionId%>"/>
        <table width="90%" align="center" cellpadding="1" cellspacing="1"  class="tab">
		  <tr align="center" class="tab_title">
		    <td align="left" colspan="2">
		     ��ѡ��Ͷע��ʽ:
		    </td>
		  </tr>
		  <tr></tr>
		 <tr class="tab_tr"> 
	        <td align="right">
	             Ͷע��ʽ:
	        </td>
	        <td align="left"> 
				<SELECT name="buyMode" id="buyMode">
					<option value='<%=WelLot.HpTenBuy.ONE%>' selected="selected">ѡһ��Ͷ</option>
					<option value='<%=WelLot.HpTenBuy.ONE_RED%>' >ѡһ��Ͷ</option>
					<option value='<%=WelLot.HpTenBuy.TWO%>' >��ѡ��</option>
					<option value='<%=WelLot.HpTenBuy.TWO_LINE%>'>ѡ����ֱ</option>
					<option value='<%=WelLot.HpTenBuy.TWO_GROUP%>'>ѡ������</option>
					<option value='<%=WelLot.HpTenBuy.THREE%>'>��ѡ��</option>
					<option value='<%=WelLot.HpTenBuy.THREE_LINE%>'>ѡ��ǰֱ</option>
					<option value='<%=WelLot.HpTenBuy.THREE_GROUP%>'>ѡ��ǰ��</option>
					<option value='<%=WelLot.HpTenBuy.FOUR%>'>��ѡ��</option>
					<option value='<%=WelLot.HpTenBuy.FIVE%>'>��ѡ��</option> 
				</SELECT>
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
