<!-------------------------------------------------------------------
                          ��׼ҳ������������
-------------------------------------------------------------------->
<%@ page language="java" contentType="text/html;charset=GBK" %>

<%@ page import="javax.servlet.http.HttpSession"%>
<%@ page import="java.io.*" %>
<%@ page import="com.viatt.util.*"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.bocom.midserv.base.*" %>
<%@ page import="com.bocom.midserv.web.*" %>
<%@ page import="com.bocom.midserv.gz.*"%>

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

	String cssFileName = request.getParameter("cssFileName");//��ȡ�ͻ���ǰʹ�õ�CSS��ʽ
	if(cssFileName ==null){
		cssFileName = "skin.css";
	}
	
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
		<link rel="stylesheet" type="text/css" href="/personbank/css/<%=cssFileName%>">
		<script language="JavaScript"	src="/personbank/HttpProxy?URL=/midserv/js/common.js&dse_sessionId=<%=dse_sessionId%>"></script>
    <script language=JavaScript>writeSignActivxObject('/personbank/')</script>

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

	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
		<center>
			<div class="indent">
				<script language=JavaScript src="/personbank/js/writeNewActivxObjectForProxy.js"></script>
				<table width="100%" align="center" cellpadding="1" cellspacing="1" class="tab">
					<tr align="left"> 
          	<td colspan="2" class="tab_title">�� �� �� �� �룺</td>
        	</tr>
				<script language=JavaScript> writeNewCommitActivxObject('/personbank')</script>					
				<FORM action="/personbank/HttpProxy" method=post name="f1">
					<input type="hidden" name="dse_sessionId"
						value="<%=dse_sessionId%>">
					<input type="hidden" name="URL" value="/midserv/yinLvTong6.jsp">
					<input type="hidden" name="bocomPwd"/>
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
	
						<tr class="tab_tr">
							<td align="right" height="22" class="InputTip">
								��������:
							</td>
							<td align="left" height="22" class="InputTip">
								<%=MessManTool.changeChar(request.getParameter("sightName")) %>
							</td>
						</tr>
						<tr class="tab_tr">
							<td align="right" height="22" class="InputTip">
								��Ʊ����:
							</td>
							<td align="left" height="22" class="InputTip">
								<%=MessManTool.changeChar(request.getParameter("mpms")) %>
							</td>
						</tr>
						<tr class="tab_tr">
							<td align="right" height="22" class="InputTip">
								�ͻ��ֻ�����:
							</td>
							<td align="left" height="22" class="InputTip">
								<%=MessManTool.changeChar(request.getParameter("sjhm1")) %>
							</td>
						</tr>
						<tr class="tab_tr">
							<td align="right" height="22" class="InputTip">
								�����Żݼ۸�:
							</td>
							<td align="left" height="22" class="InputTip">
								<%=MessManTool.changeChar(request.getParameter("dzyhj")) %>
							</td>
						</tr>
						<tr class="tab_tr">
							<td align="right" height="22" class="InputTip">
								��Ʊ����:
							</td>
							<td align="left" height="22" class="InputTip">
								<%=MessManTool.changeChar(request.getParameter("gmzs")) %>
							</td>
						</tr>
						<tr class="tab_tr">
							<td align="right" height="22" class="InputTip">
								����֧�����:
							</td>
							<td align="left" height="22" class="InputTip">
								<%=zjr %>
							</td>
						</tr>
						<tr class="tab_tr">
							<td align="right" height="22" class="InputTip">
								ʹ������:
							</td>
							<td align="left" height="22" class="InputTip">
								<%=MessManTool.changeChar(request.getParameter("mprq")) %>
							</td>
						</tr>
						<tr class="tab_tr">
							<td align="right" height="22" class="InputTip">
								��Ч����:
							</td>
							<td align="left" height="22" class="InputTip">
								<%=MessManTool.changeChar(request.getParameter("yxrq")) %>
							</td>
						</tr>
						<tr class="tab_tr">
							<td align="right" height="22" class="InputTip">
								��������:
							</td>
							<!--td align="left" height="22" class="InputTip"><SCRIPT language=JavaScript> writePwdActivxObjectLenClass('safeInput1','safeInput1','','password',6,6,'20','153','/ZomnYmq1MnNjizoVo2E7bjgVAr2ePAWzY4s6FaNhO34UlGH/zfcB/2aJp2JqtTJWxCKiMnQswZhMfJzDfHD8w==')</SCRIPT-->
							<td class="InputTip"><SCRIPT language=JavaScript> writeNewPwdActivxObjectLenClass ('safeInput1','safeInput1','/personbank/','bocomPwd',20,6,'20','153','<%=dse_sessionId%>')</SCRIPT></td>  
							</td>
						</tr>
						<%if(loginType.equals("0")){ %>
						<tr class="tab_tr">
							<td align="right" height="22" class="InputTip">
								��̬����:
							</td>
							<td align="left" height="22" class="InputTip">
								<input type="text" name="dynamicCode" size="6" maxlength="6" onkeypress="onlyMunNoPointer();">
							</td>
						</tr>
						<%} %>
						
						<div class="guide">
         			<ul>��ܰ��ʾ��
         	  		<li>*&nbsp;&nbsp;����ʹ������֮�����Ч������ʹ�ã�������ڣ�</li>
         			</ul>
    				</div>
						
						<tr class="tab_result">
							<td align="center" colspan="2">
								<input type="button" onclick="tj1();" value="ȷ��" class="button_bg">
								<input type="button" onclick="window.history.back();" value="�� ��" class="button_bg">
								
							</td>
						</tr>

					</table>
		
					
				</FORM>
				
			</DIV>
		</center>
	</body>
</html>
