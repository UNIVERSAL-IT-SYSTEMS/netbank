<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@ page import="com.bocom.midserv.gz.*"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<%@ page import="com.viatt.util.*"%>
<%
	GzLog log = new GzLog("c:/gzLog");
	String loginType = request.getParameter("loginType");//���͵�½��� 0��ע���û�(�ֻ���) 1��֤���û� 2�������û�
	String dse_sessionId = MessManTool.changeChar(request.getParameter("dse_sessionId"));//��ȡdse_sessionId
	String cdno = MessManTool.changeChar(request.getParameter("cardNo"));
	String step_id = MessManTool.changeChar(request.getParameter("step_id"));
	String biz_id = MessManTool.changeChar(request.getParameter("biz_id"));
	String dynamicCode = MessManTool.changeChar(request.getParameter("dynamicCode"));
	AppParam.setParam(dse_sessionId,dynamicCode);
	String dzyhj = MessManTool.changeChar(request.getParameter("dzyhj"));
	String gmzs = MessManTool.changeChar(request.getParameter("gmzs"));
	double zjr=0.00; 
	if(dzyhj.equals("")||gmzs.equals("")){
		zjr=0.00;
	}else{
		zjr=Double.parseDouble(dzyhj)*Integer.parseInt(gmzs);
	}
%>

<!-------------------------------------------------------------------
                          ��׼JavaScript������
--------------------------------------------------------------------->
<script language="JavaScript" src="/personbank/HttpProxy?URL=/midserv/js/common.js&dse_sessionId=<%=dse_sessionId%>"></script>
<!--------------------------------------------------------------------
   ��ǰҳ��JavaScript�������֣������ύ��֤��ҳ�涯��������Ŀ��ȴ���
---------------------------------------------------------------------->

<!--------------------------------------------------------------------
                          ҳ��HTML���ֲ���    
---------------------------------------------------------------------->

<html>
	<title>��ͨ�������Ϸ���</title>
	<head>
		<link rel="stylesheet" type="text/css" href="css/csspt.css">   
		<link rel="stylesheet" type="text/css" href="css/public.css">
		<script language="JavaScript" src="/personbank/js/public.js"></script>
		<script language=JavaScript src="/personbank/js/writeActivxObject.js"></script>
		<link rel="stylesheet"
			href="/personbank/HttpProxy?URL=/midserv/css/personbank.css&dse_sessionId=<%=dse_sessionId%>">
		<link rel="stylesheet"
			href="/personbank/HttpProxy?URL=/midserv/css/midserv.css&dse_sessionId=<%=dse_sessionId%>">
		<link href="/personbank/css/csspt.css" rel="stylesheet"
			type="text/css">
		<link href="/personbank/css/public.css" rel="stylesheet"
			type="text/css">
		<link href="/personbank/css/content.css" rel="stylesheet" type="text/css">
			<script type="text/javascript">
				var clickBoolean=true;
				function tj1(){
					if(clickBoolean){
						document.safeInput1.commit("safeCommit1");
		    			document.safeCommit1.submit("f1"); 
		    			clickBoolean=false;
		    			//tj();
					}
					
				}
			</script>
	</head>

	<body leftmargin="0" topmargin="0" oncontextmenu=self.event.returnValue=false onselectstart="return false">
	<SCRIPT language=JavaScript> writeCommitActivxObject('')</SCRIPT>
		<center>
			<DIV align=center>
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td
							background="/personbank/HttpProxy?URL=/midserv/images/pageTitle.gif&dse_sessionId=<%=dse_sessionId%>"
							class="pageTitle">
							&nbsp;&nbsp;�� �� �� �� �룺
						</td>
						<td rowspan="2" align="right" valign="top">
							&nbsp;
						</td>
					</tr>
					<tr>
						<td>
							<img
								src="/personbank/HttpProxy?URL=/midserv/images/xianb.gif&dse_sessionId=<%=dse_sessionId%>"
								width="100" height="20">
						</td>
					</tr>
				</table>
				
				<FORM action="/personbank/HttpProxy" method=post name="f1">
					<input type="hidden" name="dse_sessionId"
						value="<%=dse_sessionId%>">
					<input type="hidden" name="URL" value="/midserv/yinLvTong6.jsp">
					<input type="hidden" name="password"/>
					<input type="hidden" name="reqCode"/>
					<input type="hidden" name=biz_id value="<%=biz_id %>">
					<input type="hidden" name=step_id value="5">
					<input type="hidden" name=ticketCode value="<%=MessManTool.changeChar(request.getParameter("ticketCode")) %>" >
					<input type="hidden" name=mpj value="<%=MessManTool.changeChar(request.getParameter("mpj")) %>" >
					<input type="hidden" name=zjr value="<%=zjr %>" >
					<input type="hidden" name=sjlx value="<%=MessManTool.changeChar(request.getParameter("sjlx")) %>" >
					<input type="hidden" name=sjhm1 value="<%=MessManTool.changeChar(request.getParameter("sjhm1")) %>">
					<input type="hidden" name=yxrq value="<%=MessManTool.changeChar(request.getParameter("yxrq")) %>">
					<input type="hidden" name=sightName value="<%=MessManTool.changeChar(request.getParameter("sightName"))%>">
					<input type="hidden" name=sightCode value="<%=MessManTool.changeChar(request.getParameter("sightCode"))%>">
					<input type="hidden" name=mpms value="<%=MessManTool.changeChar(request.getParameter("mpms")) %>">
					<input type="hidden" name=dzyhj value="<%=MessManTool.changeChar(request.getParameter("dzyhj")) %>">
					<input type="hidden" name=gmzs value="<%=MessManTool.changeChar(request.getParameter("gmzs")) %>">
					<input type="hidden" name=mprq value="<%=MessManTool.changeChar(request.getParameter("mprq")) %>">
					<input type="hidden" name=yxrq value="<%=MessManTool.changeChar(request.getParameter("yxrq")) %>">
					<input type="hidden" name=bz value="<%=MessManTool.changeChar(request.getParameter("bz")) %>">
					<table border="0" cellspacing="2" cellpadding="0" align="center"
						width="86%">
						<tr>
							<td align="right" height="22" class="InputTip">
								��������:
							</td>
							<td align="left" height="22" class="InputTip">
								<%=MessManTool.changeChar(request.getParameter("sightName")) %>
							</td>
						</tr>
						<tr>
							<td align="right" height="22" class="InputTip">
								��Ʊ����:
							</td>
							<td align="left" height="22" class="InputTip">
								<%=MessManTool.changeChar(request.getParameter("mpms")) %>
							</td>
						</tr>
						<tr>
							<td align="right" height="22" class="InputTip">
								�ͻ��ֻ�����:
							</td>
							<td align="left" height="22" class="InputTip">
								<%=MessManTool.changeChar(request.getParameter("sjhm1")) %>
							</td>
						</tr>
						<tr>
							<td align="right" height="22" class="InputTip">
								�����Żݼ۸�:
							</td>
							<td align="left" height="22" class="InputTip">
								<%=MessManTool.changeChar(request.getParameter("dzyhj")) %>
							</td>
						</tr>
						<tr>
							<td align="right" height="22" class="InputTip">
								��Ʊ����:
							</td>
							<td align="left" height="22" class="InputTip">
								<%=MessManTool.changeChar(request.getParameter("gmzs")) %>
							</td>
						</tr>
						<tr>
							<td align="right" height="22" class="InputTip">
								����֧�����:
							</td>
							<td align="left" height="22" class="InputTip">
								<%=zjr %>
							</td>
						</tr>
						<tr>
							<td align="right" height="22" class="InputTip">
								ʹ������:
							</td>
							<td align="left" height="22" class="InputTip">
								<%=MessManTool.changeChar(request.getParameter("mprq")) %>
							</td>
						</tr>
						<tr>
							<td align="right" height="22" class="InputTip">
								��Ч����:
							</td>
							<td align="left" height="22" class="InputTip">
								<%=MessManTool.changeChar(request.getParameter("yxrq")) %>
							</td>
						</tr>
						<tr>
							<td align="right" height="22" class="InputTip">
								��������:
							</td>
							<td align="left" height="22" class="InputTip">
<SCRIPT language=JavaScript> writePwdActivxObjectLenClass('safeInput1','safeInput1','','password',6,6,'20','153','/ZomnYmq1MnNjizoVo2E7bjgVAr2ePAWzY4s6FaNhO34UlGH/zfcB/2aJp2JqtTJWxCKiMnQswZhMfJzDfHD8w==')</SCRIPT>
							</td>
						</tr>
						<%if(loginType.equals("0")){ %>
						<tr>
							<td align="right" height="22" class="InputTip">
								��̬����<%=dynamicCode%>:
							</td>
							<td align="left" height="22" class="InputTip">
								<input type="text" name="dynamicCode" size="6" maxlength="6" onkeypress="onlyMunNoPointer();">
							</td>
						</tr>
						<%} %>
					</table>
					<table width="80%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td>
							<b>��ܰ��ʾ��</b>
						</td>
					</tr>
					<tr>
						<td>
								����ʹ������֮�����Ч������ʹ�ã�������ڣ�
						</td>
					</tr>
				</table>
				</FORM>
				<table>
					<tr>
						<td>
							<input type="button" onclick="tj1();" value="ȷ��" class="button_bg">
							<input type="button" onclick="window.history.back();" value="�� ��" class="button_bg">
							
						</td>
					</tr>
				</table>
			</DIV>
		</center>
	</body>
</html>
