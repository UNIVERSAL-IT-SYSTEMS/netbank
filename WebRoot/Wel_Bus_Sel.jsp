<%@ page language="java" contentType="text/html;charset=GBK"%>
<%@ page import="java.util.*" %>
<%@ page import="com.viatt.util.*"%>
<%@ page import="com.bocom.midserv.gz.*"%>
<%@ page import="com.gdbocom.Transactions.WelLot" %>
<%@include file="/includeFiles/common.jsp" %>
<!-------------------------------------------------------------------
                          ��׼JavaScript������
--------------------------------------------------------------------->
<script language="JavaScript" src="/personbank/HttpProxy?URL=/midserv/js/public.js&dse_sessionId=<%=dse_sessionId%>"></script>
<html>
	<head>
		<title>��ͨ�������Ϸ���</title>
        <!-- ������ʽ����������ɫ������ȸ�ʽ -->
        <link rel="stylesheet" type="text/css" href="/personbank/css/<%=cssFileName%>">
        <!-- ������ʽ��������䡢�����Ӹ�ʽ -->
        <link rel="stylesheet" type="text/css"
            href="/personbank/HttpProxy?URL=/midserv/css/css.css&dse_sessionId=<%=dse_sessionId%>">
	</head>
    <body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0"  oncontextmenu="self.event.returnValue=false" onselectstart="return false">
    <div class="indent">
    <form action="/personbank/HttpProxy" method="post" name="form1">
        <!-- ���ж����ֶ� -->
        <input type="hidden" name="URL" value="/midserv/Wel_Bus_Red.jsp"/>
        <input type="hidden" name="dse_sessionId" value="<%=dse_sessionId%>"/>
    	<table width="90%" align="center" cellpadding="1" cellspacing="1"  class="tab">
		  <tr align="center" class="tab_title">
		    <td align="left" colspan="2">
		     ��ѡ��ҵ�����:
		    </td>
		  </tr>
		  <tr></tr>
		 <tr class="tab_tr"> 
	        <td align="right">
	             ҵ�����:
	        </td>
	        <td align="left"> 
	        	<SELECT name="Bus"> 
					<OPTION value='<%=WelLot.ADDREG%>' selected="selected">�û�ע��</OPTION>
					<OPTION value='<%=WelLot.UPDREG%>'>�����û�ע��</OPTION>
					<OPTION value='<%=WelLot.DOUBLEBUY%>'>˫ɫ��ʵʱͶע</OPTION>
					<OPTION value='<%=WelLot.DOUBLEFIXBUY%>'>˫ɫ��Ͷ</OPTION>
					<OPTION value='<%=WelLot.TENBUY%>'>����ʮ��ʵʱͶע</OPTION>
				</SELECT>
	        </td>
	      </tr>
	     <tr class="tab_result"> 
	        <td align="center" colspan="2">
	            <input type="submit" class="button_bg" value="ȷ��" style="cursor:hand;"/>
	        </td>
	     </tr>
	     </table>
		</form>
    </div>
    </body>
</html>