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
        <script type="text/javascript" src="/personbank/HttpProxy?URL=/midserv/js/jquery-1.11.1.min.js&dse_sessionId=<%=dse_sessionId%>"></script>
        <script type="text/javascript"  charset="UTF-8" src="/personbank/HttpProxy?URL=/midserv/js/formValidator.js&dse_sessionId=<%=dse_sessionId%>"></script>
        <script type="text/javascript"  charset="UTF-8" src="/personbank/HttpProxy?URL=/midserv/js/formValidatorRegex.js&dse_sessionId=<%=dse_sessionId%>"></script>
        <script type="text/javascript">
	    	jQuery(document).ready(function(){
	    		jQuery("#btn_back").click(function(){
	    			jQuery("#form1").submit();
	    		});
	    	});
        </script>
    </head>
    <body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0"  oncontextmenu="self.event.returnValue=false" onselectstart="return false">
    <div class="indent">
    <form action="/personbank/HttpProxy" method="post" name="form1">
        <!-- ���ж����ֶ� -->
        <input type="hidden" name="URL" value="/midserv/Wel_Fix_Red.jsp"/>
        <input type="hidden" name="dse_sessionId" value="<%=dse_sessionId%>"/>
        <input type='hidden' name='preSaveKey' value='Bus' />
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
					<option value='<%=WelLot.DOUBLE_FIX_SUMMARY%>' selected="selected">ҵ����</option>
					<option value='<%=WelLot.DOUBLE_FIX_BUY%>'>��Ͷ����</option>
					<option value='<%=WelLot.DOUBLE_FIX_QRY%>'>��Ͷ��ѯ������</option>
					<option value='<%=WelLot.DOUBLE_FIX_WINQRY%>'>�н���ѯ</option>
				</SELECT>
	        </td>
	     </tr>
	     <tr class="tab_result"> 
	        <td align="center" colspan="2">
	            <input type="submit" class="button_bg" value="ȷ��" style="cursor:hand;"/>
	            <input type="button" class="button_bg" value="����" id="btn_back" style="cursor:hand;"/>
	        </td>
	     </tr>
	     </table>
		</form>
	</div>
		<form action="/personbank/HttpProxy" method="post" id="form1">
        	<input type="hidden" name="URL" value="/midserv/Wel_Bus_Sel.jsp"/>
        	<input type="hidden" name="dse_sessionId" value="<%=dse_sessionId%>"/>
	    </form>
	</body>
</html>
