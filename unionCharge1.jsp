<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@ page import="com.bocom.midserv.gz.*"%>
<%@ page import="com.viatt.bean.*"%>
<%@ page import="com.viatt.util.*"%>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.lang.*" %>
<%@ page import="com.bocom.midserv.base.*" %>
<%@ page import="com.bocom.midserv.web.*" %>
<%@ page import="com.bocom.midserv.gz.*" %>
<%@ page import="com.bocom.eb.des.EBDES" %>
<%
    String cdno = request.getParameter("cardNo");
	String tradeName = "�㶫ʡ��ͨ��ֵ";
	GzLog log = new GzLog("c:/gzLog");
	log.Write("=============="+tradeName+"========begin========================");
	String dse_sessionId = MessManTool.changeChar(request.getParameter("dse_sessionId"));//��ȡdse_sessionId
	String biz_id = MessManTool.changeChar(request.getParameter("biz_id")); //����������Ǵ�����õ��ģ���������������
	if (biz_id.equals("") ) {
		System.out.println("�����������ȷ");
	}
	log.Write("=============="+tradeName+"========step1:�����Ų�ѯҵ��i_biz_id=["+biz_id+"]"+"����CDNO=["+cdno+"]================");  
	//�������ԣ�����Ŀ��ź�biz_id������ȷ������յ���

%>
<html>

	<head>
		<title>��ͨ�������Ϸ���</title>
		<!-- ����CSS�ļ� -->
		<link href="/personbank/css/csspt.css" rel="stylesheet"
			type="text/css">
		<link href="/personbank/css/content.css" rel="stylesheet"
			type="text/css">
		<!-- ����CSS�ļ� -->
		<link rel="stylesheet"
			href="/personbank/HttpProxy?URL=/midserv/css/personbank.css&dse_sessionId=<%=dse_sessionId%>">
		<!-- link rel="stylesheet"
			href="/personbank/HttpProxy?URL=/midserv/css/midserv.css&dse_sessionId=<%=dse_sessionId%>"-->
		<!-- ����Ϸ����ж����ַ�ת������ -->
        <script language="JavaScript"
            src="/personbank/HttpProxy?URL=/midserv/js/public.js&dse_sessionId=<%=dse_sessionId%>"></script>
		<!-- ����Ϸ����ж� -->
        <script language="JavaScript"
            src="/personbank/HttpProxy?URL=/midserv/js/common.js&dse_sessionId=<%=dse_sessionId%>"></script>
		<!-- ��������ؼ� -->
        <script language="JavaScript"
            src="/personbank/HttpProxy?URL=/midserv/js/date.js&dse_sessionId=<%=dse_sessionId%>"></script>
		
		<script language="JavaScript" type="text/JavaScript">
		
			var doubleClick = false;
			var dateCheck = false;
			function beforeSubmit(){
				//alert(document.form1.TCusId.value);
				//alert(document.form1.LChkTm.value);
				//�����������ڵ�һ���жϺ���ʾ��
				if (PhoneCheck(document.form1.TelNum.value)){
					dateCheck = true;
				}else{
					alert("�ֻ������벻�Ϸ�!");
					dateCheck = false;
				}
				return dateCheck;
			}
	
			function tiJiao(){
				//�����ظ��ύ
				if(beforeSubmit()&&!clickBoolean){
					clickBoolean = true;
					tj();
				}
			}	
		</script>			
	</head>
	
	<body leftmargin="0" topmargin="0">
	<DIV align=center>
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td
					background="/personbank/HttpProxy?URL=/midserv/images/pageTitle.gif&dse_sessionId=<%=dse_sessionId%>"
					class="pageTitle">
					&nbsp;&nbsp;<%=tradeName %>
				</td>
			</tr>
			<tr>
				<td>
					<img src="/personbank/HttpProxy?URL=/midserv/images/xianb.gif&dse_sessionId=<%=dse_sessionId%>"
						 width="100" height="20">
				</td>
			</tr>
		</table>
	

		<FORM action="/personbank/HttpProxy" method=post name="form1">
			<input type="hidden" name="URL" value="/midserv/unionCharge2.jsp">
			<input type="hidden" name="dse_sessionId" value="<%=dse_sessionId%>">
			<input type="hidden" name=biz_id value="<%=biz_id%>">
			<input type="hidden" name=cdno value="<%=cdno%>">
			<input type="hidden" name=step_id value="1">
			
			<table border="0" cellspacing="2" cellpadding="0" align="center" width="78%">
				<tr>
					<td width="50%" align="right" height="22" class="InputTip">��ֵ����:</td>
					<td width="50%" align="left" height="22" class="InputTip">
						<input type="text" name="TelNum" size="20" value="" maxlength="21">
					</td>
				</tr>
			</table>
			<br>

		  	<input type="button" onclick="tiJiao();" value="ȷ��" style={cursor:hand;}>
			<input type="reset" class="IN" name="Submit2" value="����">
			<input type="button" class="IN" name="Submit3" value="����" onclick="javascript:history.back()" > 	
		<br>
		<br>
		</FORM>
	</div>
	</body>
</html>