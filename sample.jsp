<%--
	����������������ɫҵ��֤���û���ǩ����
	���ߣ�chenp@bankcomm.com
	�������ڣ�2006-02-13
--%>
<%@ page language="java" contentType="text/html; charset=GBK" %>
<%@ page import="com.bocom.eb.des.EBDES" %>

<%
	String webAppPath = "/personbank/";
	
	String dse_sessionId = request.getParameter("dse_sessionId");//��ȡdse_sessionId
	String cardNo = request.getParameter("cardNo");//��ȡ���׿���
	String passWord = request.getParameter("passWord");//��������
	if(passWord != null)
	{
		passWord = EBDES.decryptoDES(passWord, dse_sessionId);//���ܺ�����
	}
	String remoteIp = request.getParameter("remoteIp");//��ȡ�ͻ���IP
	
	//ǩ�����Ӳ���0 BEGIN
	String loginType = request.getParameter("loginType");//���͵�½��� 0��ע���û�(�ֻ���) 1��֤���û� 2�������û�
	String logonUserDn = request.getParameter("logonUserDn");//��ȡ��½֤��DN
	//ǩ�����Ӳ���0 END
%>

<!--------------------------------------------------------------------
                          ҳ��HTML���ֲ���    
---------------------------------------------------------------------->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>��ͨ���и�����������</title>
<%--ǩ�����Ӳ���1 BEGIN--%>
<script language=JavaScript src="<%=webAppPath%>js/public.js"></script><%--�������ж˹���JS������Ҫ����HttpProxy--%>
<script language=JavaScript> writeSignActivxObject('<%=webAppPath%>')</script>
<%--ǩ�����Ӳ���1 END--%>
<script language=JavaScript>
var clickBoolean = true;	//��ֹ�����ύ
function beforeSubmit()
{
	var cardNo = '<%=cardNo%>';
	var loginType = '<%=loginType%>';
	var mobPhone = document.form1.mobPhone.value;
	var dealBal = document.form1.dealBal.value;
	var remoteIp = '<%=remoteIp%>';
	<%-- ƴ����Ҫ��ǩ���ݣ�����������ʾ --%>
	var signData = 'cardNo=' + cardNo + '|dealBal=' + dealBal + '|mobPhone=' + mobPhone + '|remoteIp=' + remoteIp;
	<%-- ǩ�����Ӳ���2 BEGIN --%>
	alert( signData );
	InfoSecNetSign1.NSServerMode = 0;
	alert( InfoSecNetSign1.NSServerMode );
	InfoSecNetSign1.NSSetPlainText(signData);
	alert( "22" );
	document.form2.signData.value = InfoSecNetSign1.NSAttachedSign('<%=logonUserDn%>');
	alert( document.form2.signData.value );
	if (!form2.signData.value)
	{
		alert("ǩ������ȡ����");
		return;
	}
	if(clickBoolean)//��ֹform�����ύ��ע���ڴ��������¼��У���onClick�¼��������ף���Ҫ��href���Ӵ���
	{
		alert( "33" );
		form2.submit();
		clickBoolean = false;
	}
	<%-- ǩ�����Ӳ���2 END --%>
}
</script>
</head>

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0"> 
<form name="form1">
	�ֻ���ֵ<br><br>
	�ֻ����룺<input name="mobPhone" type="text" maxlength="20"><br>
	���׽�<input name="dealBal" type="text" maxlength="20"><br>
</form>

<input type="button" onclick="javascript:beforeSubmit();" value="submit" style={cursor:hand;}>

<form name="form2" method="post" action="/personbank/HttpProxy">
	<input type="hidden" name="URL" 			value="/servlet/TransServlet"/>
	<input type="hidden" name="dse_sessionId" 	value="<%=dse_sessionId%>"/>
	<%--ǩ�����Ӳ���3 BEGIN--%>
	<input type="hidden" name="isVerifySign"	value="1"/>			<%--��ǩ��־,��1������ʶ�ý���Ϊ��Ҫ��ǩ���� ����������Ҫ��ǩ--%>
	<input type="hidden" name="signKey" 		value="12345678"/>	<%--ǩ�����ݹؼ��ֶΣ��ñʽ��׵Ĺؼ���ʶ�������Ψһ��ʶ�����ڼ�ǩ���ݵĲ�ѯ�����ж��Լ����ɣ�,���ж˻ᱣ��ùؼ��ֶ�--%>
	<input type="hidden" name="signTranCode"	value="89343"/>		<%--ǩ���ֶ� ������ɫҵ������(���ڼ�ǩ���ݵĲ�ѯ�����ж˸����Լ�ʵ�ʽ�������ṩ)�����ж˻ᱣ��ý�����--%>
	<input type="hidden" name="signData"/>							<%--ǩ������--%>
	<%--ǩ�����Ӳ���3 END--%>
</form> 

</body>
</html>