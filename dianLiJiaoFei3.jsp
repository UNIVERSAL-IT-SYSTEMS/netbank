<!-------------------------------------------------------------------
                          ��׼ҳ������������
-------------------------------------------------------------------->
<%@ page language="java" contentType="text/html;charset=GBK" %>

<%@ page import="java.util.Date" %>
<%@ page import="com.viatt.bean.*"%>
<%@ page import="com.viatt.util.*" %>
<%@ page import="com.bocom.midserv.base.*" %>
<%@ page import="com.bocom.midserv.web.*" %>
<%@ page import="com.bocom.midserv.gz.*"%>
<%
	GzLog log = new GzLog("c:/gzLog");
	log.Write("/n===========dianLiJiaoFei3.jsp====begin========================");
	
	String loginType = request.getParameter("loginType");//���͵�½��� 0��ע���û�(�ֻ���) 1��֤���û� 2�������û�
	String dse_sessionId = MessManTool.changeChar(request.getParameter("dse_sessionId"));//��ȡdse_sessionId
	String step_id = MessManTool.changeChar(request.getParameter("step_id"));
	String biz_id = MessManTool.changeChar(request.getParameter("biz_id"));
	String displayTxnAmt = MessManTool.changeChar(request.getParameter("displayTxnAmt"));
	String message = MessManTool.changeChar(request.getParameter("message"));
	String lchkTm = MessManTool.changeChar(request.getParameter("lchkTm"));
	String clientID = MessManTool.changeChar(request.getParameter("clientID"));
	
	
    String cssFileName = request.getParameter("cssFileName");//��ȡ�ͻ���ǰʹ�õ�CSS��ʽ
	if(cssFileName ==null){
		cssFileName = "skin.css";
	}		
	
	
	String dynamicCode="";
	String dynamicCodeSeq="";
	String sendPass = "";
	
	if(loginType.equals("0")){
	//��̬���뷽��
		sendPass=MessManTool.changeChar(request.getParameter("sendPass"));//1--��Ҫ 0--����Ҫ;
		if(sendPass.equals("1")||sendPass.equals("2")){
			
			dynamicCode=request.getParameter("dynamicCode");
			dynamicCodeSeq=request.getParameter("dynamicCodeSeq");
			
			
		}
		
	}
	
	
	log.Write("message==="+message);
	log.Write("loginType ���͵�½��� 0��ע���û�(�ֻ���) 1��֤���û� 2�������û�="+loginType+"|dynamicCode="+dynamicCode+"|dynamicCodeSeq="+dynamicCodeSeq);
	
		
%>

<!-------------------------------------------------------------------
                          ��׼JavaScript������
--------------------------------------------------------------------->
<script language="JavaScript" src="/personbank/HttpProxy?URL=/midserv/js/public.js&dse_sessionId=<%=dse_sessionId%>"></script>
<script language="JavaScript" src="/personbank/HttpProxy?URL=/midserv/js/public_card.js&dse_sessionId=<%=dse_sessionId%>"></script>

<!--------------------------------------------------------------------
   ��ǰҳ��JavaScript�������֣������ύ��֤��ҳ�涯��������Ŀ��ȴ���
---------------------------------------------------------------------->

<!--------------------------------------------------------------------
                          ҳ��HTML���ֲ���    
---------------------------------------------------------------------->

<html>
	<head>
		<title>��ͨ�������Ϸ���</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		
		<script type="text/javascript">
			var clickBoolean=true;
			function tj1(){
				if(clickBoolean){
					document.safeInput1.commit("safeCommit1");
					document.safeCommit1.submit("f1"); 
					clickBoolean=false;
				}
					
			}
			function tj2(){
				if(clickBoolean){
					clickBoolean=false;
					Window.location="/personbank/HttpProxy?dse_sessionId=<%=dse_sessionId %>&URL=/midserv/midSelect.jsp";
				}
			}
		</script>
		<link rel="stylesheet" type="text/css" href="/personbank/css/<%=cssFileName%>">
		<script language="JavaScript"	src="/personbank/HttpProxy?URL=/midserv/js/common.js&dse_sessionId=<%=dse_sessionId%>"></script>
	</head>
	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
		<center>
			<div class="indent">
				<script language=JavaScript src="/personbank/js/writeNewActivxObjectForProxy.js"></script>
				<table width="100%" align="center" cellpadding="1" cellspacing="1" class="tab">
					<tr align="left"> 
						<td class="tab_title">�� �� �� �� �� �� �� �� �� ��</td>
					</tr>
				<script language=JavaScript> writeNewCommitActivxObject('/personbank')</script>	
				<FORM action="/personbank/HttpProxy" method=post name="f1">
					<input type="hidden" name="dse_sessionId"	value="<%=dse_sessionId%>">
					<input type="hidden" name="URL" value="/midserv/dianLiJiaoFei4.jsp">
					<input type="hidden" name=biz_id value="<%=biz_id %>">
					<input type="hidden" name=step_id value="2">
					<input type="hidden" name="bocomPwd"/>
					<input type="hidden" name=message value="<%=message%>">
					<input type="hidden" name=displayTxnAmt value="<%=displayTxnAmt%>">
					<input type="hidden" name=lchkTm value="<%=lchkTm%>">
					<input type="hidden" name=clientID value="<%=clientID%>">
					<%if(loginType.equals("0")){ %>
					<input type="hidden" name="dynamicCode" value="<%=dynamicCode%>">
					<input type="hidden" name="dynamicCodeSeq" value="<%=dynamicCodeSeq%>">
					<%} %>
					
						
						<tr class="tab_tr">
							<td width="50%" align="right" height="22" class="InputTip">
								�ɷѽ�
							</td>
							<td width="50%" align="left" height="22" class="InputTip">
								<%=displayTxnAmt%>  Ԫ
						    </td>
						</tr>
				
						
						<tr class="tab_tr">
							<td align="right" height="22" class="InputTip">
								��������:
							</td>
							<!--td align="left" height="22" class="InputTip"><SCRIPT language=JavaScript> writePwdActivxObjectLenClass('safeInput1','safeInput1','/personbank/','bocomPwd',20,6,'20','153','/ZomnYmq1MnNjizoVo2E7bjgVAr2ePAWzY4s6FaNhO34UlGH/zfcB/2aJp2JqtTJWxCKiMnQswZhMfJzDfHD8w==')</SCRIPT></td-->
							<td class="InputTip"><SCRIPT language=JavaScript> writeNewPwdActivxObjectLenClass ('safeInput1','safeInput1','/personbank/','bocomPwd',20,6,'20','153','<%=dse_sessionId%>')</SCRIPT></td>  						
						</tr>
						
						<%if(loginType.equals("0")){ %>
						<tr class="tab_tr">
							<td align="right" height="22" class="InputTip">
								��̬����:
							</td>
							<td align="left" height="22" class="InputTip">
								<!--input type="text" name="dynamicCodeMan" size="6" maxlength="6" onkeypress="onlyMunNoPointer();"-->								
								<input type="text" name="dynamicCodeMan" value="<%=dynamicCode%>">								
							</td>
						</tr>
						<tr class="tab_tr">
							<td align="right" height="22" class="InputTip">
								�������:
							</td>
							<td align="left" height="22" class="InputTip">
								<input type="text" name="dynamicCodeSeqMan" value="<%=dynamicCodeSeq%>"  readonly="readonly">
							</td>
						</tr>
						
						<%} %>
					
					<tr class="tab_result">
						<td align="center" colspan="3">
							<input type="button" onclick="tj1();" value="ȷ ��" class="button_bg">
							<input type="button" onclick="window.history.back();" value="�� ��"	class="button_bg">
							<!--input type="button" onclick="tj2();" value="����" class="button_bg"-->
						</td>
					</tr>
				
					</table>
				</FORM>
				
			</DIV>
		</center>
	</body>
</html>
