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
    <form action="/personbank/HttpProxy" method="post" name="form1">
        <!-- ���ж����ֶ� -->
        <input type="hidden" name="URL" value="/midserv/Wel_Fix_Sel.jsp"/>
        <input type="hidden" name="dse_sessionId" value="<%=dse_sessionId%>"/>
        <table width="90%" align="center" cellpadding="1" cellspacing="1"  class="tab">
		  <tr align="center" class="tab_title">
		    <td align="left" colspan="2">
		     ��Ͷҵ����:
		    </td>
		  </tr>
		  <tr></tr>
		 <tr class="tab_tr"> 
	        <td align="right">
	             ���:
	        </td>
	        <td align="left"> 
				<label>˫ɫ�������й�������Ʊ���й������ķ��е�һ���Ʊ�淨��˫ɫ���ƱͶע����Ϊ��ɫ�����������ɫ���������˫ɫ��ÿעͶע������6����ɫ������1����ɫ�������ɡ���ɫ������1-33��ѡ����ɫ������1-16��ѡ��˳���ޣ�ÿע2Ԫ��ÿ�ܶ����ġ�����20:50�������ͻ�����Ͷҵ��󣬸������Ľ�ÿ���Զ����տͻ��ύ�ĺ��롢�ײ����͵���ϢΪ�ͻ������Զ�����Ŀǰ�������а���˫ɫ��306��Ͷ�ײ�306Ԫ����153�ڣ���152Ԫ����76�ڣ������ͻ��н�����ע����С�ڵ���1��Ԫʱ�������Զ�ת��ͻ����п��˻�����ע�������1��Ԫ�����ɸ������Ŀͷ���Ա�˹�֪ͨ�ͻ�Я���������֤ǰ������������ȡ��</label>
	        </td>
	     </tr>
	     <tr class="tab_result"> 
	        <td align="center" colspan="2">
	            <input type="submit" class="button_bg" value="ȷ��" style="cursor:hand;"/>
	            <input type="button" class="button_bg" name="Submit3" value="����" onclick="javascript:history.back()" />
	        </td>
	     </tr>
	     </table>
		</form>
	</div>
	</body>
</html>
