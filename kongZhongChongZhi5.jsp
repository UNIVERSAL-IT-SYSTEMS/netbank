<%@ page language="java"  pageEncoding="gbk"%>
<%@ page import="com.bocom.midserv.gz.*"%>
<%@ page import="java.util.Date" %>
<%@ page import="com.viatt.bean.*"%>
<%@ page import="com.viatt.util.*" %>
<%
	String dse_sessionId = MessManTool.changeChar(request.getParameter("dse_sessionId"));//��ȡdse_sessionId	
	GzLog log = new GzLog("c:/gzLog");
	String step_id = MessManTool.changeChar(request.getParameter("step_id"));
	
	String password = MessManTool.changeChar(request.getParameter("password"));//��������
	if(password.equals("")){
		System.out.println("��������Ϊ��");
			AppParam.setParam(dse_sessionId+"midErr1","��������");
			AppParam.setParam(dse_sessionId+"midErr2","��������Ϊ��");
%>
<script type="text/javascript">
	window.location="/personbank/HttpProxy?URL=/midserv/midservError.jsp&dse_sessionId=<%=dse_sessionId%>";
</script>
<%
		return;
	}
//	if(password != null)
//	{
//		password = EBDES.decryptoDES(password, dse_sessionId);//���ܺ�����
//	}
	String biz_id = MessManTool.changeChar(request.getParameter("biz_id"));
	if (biz_id.equals("")) {
		System.out.println("�����������ȷ");
	}
	String loginType = request.getParameter("loginType");//���͵�½��� 0��ע���û�(�ֻ���) 1��֤���û� 2�������û�
	if(loginType.equals("0")){
		String dynamicCode1=AppParam.getParam(dse_sessionId);
		String dynamicCode=MessManTool.changeChar(request.getParameter("dynamicCode"));
		if(!dynamicCode.equals(dynamicCode1)){
			System.out.println("��̬���벻��");
			AppParam.setParam(dse_sessionId+"midErr1","��������");
			AppParam.setParam(dse_sessionId+"midErr2","��̬���벻��");
%>
<script type="text/javascript">
	window.location="/personbank/HttpProxy?URL=/midserv/midservError.jsp&dse_sessionId=<%=dse_sessionId%>";
</script>
<%
		return;
		}
	}
	String frequence=MessManTool.changeChar(request.getParameter("frequence1"))+"00"+MessManTool.changeChar(request.getParameter("frequence2"));
	String limite=MessManTool.changeChar(request.getParameter("limite"));
	String card1=MessManTool.changeChar(request.getParameter("card1"));
	if(card1.equals("")||card1.length()<8){
		System.out.println("���ͨ���Ų��ԣ�");
		AppParam.setParam(dse_sessionId+"midErr1","ʧ��");
		AppParam.setParam(dse_sessionId+"midErr2","���ͨ����С��8λ");
%>
<script type="text/javascript">
	window.location="/personbank/HttpProxy?URL=/midserv/midservError.jsp&dse_sessionId=<%=dse_sessionId%>";
</script>
<%
		return;	
	}
	if(card1.length()==8){
		card1="01"+card1;
	}else if(card1.length()==9){
		card1="0"+card1;
	}
	if(limite.equals("")){
		limite="000000000000";
	}else if(limite.length()==2){
		limite="00000000"+limite+"00";
	}else if(limite.length()==3){
		limite="0000000"+limite+"00";
	}
	String tmp = "";
	String cdno = MessManTool.changeChar(request.getParameter("cardNo"));
	String content = "biz_id,"+biz_id+"|biz_step_id,2|sign_flag,0|inst_no,��ͨ����|live_flag,1|tran_flag,1"
	+"|bank_acc,"+cdno
	+"|paper_no,"+MessManTool.changeChar(request.getParameter("IDTyp"))+MessManTool.changeChar(request.getParameter("paper_no"))
	+"|cust_name,"+MessManTool.changeChar(request.getParameter("cust_name"))
	+"|sex_code,"+MessManTool.changeChar(request.getParameter("sex_code"))
	+"|phone_no,"+MessManTool.changeChar(request.getParameter("phone_no"))
	+"|mobile_no,"+MessManTool.changeChar(request.getParameter("mobile_no"))
	+"|post_no,"+MessManTool.changeChar(request.getParameter("post_no"))
	+"|address,"+MessManTool.changeChar(request.getParameter("address"))
	+"|email,"+MessManTool.changeChar(request.getParameter("email"))
	+"|card1,"+card1
	+"|PSWD,"+password 
	+"|card2,|card3,|card4,|limite,000000005000"
	+"|frequence,D001|";
	MidServer midServer = new MidServer();
	//System.out.println("===1"+content);
	BwResult bwResult = midServer.sendMessage(content);
	if (bwResult == null || bwResult.getCode() == null
			|| !bwResult.getCode().equals("000")) {
			System.out.println("ǩԼʧ��");
			AppParam.setParam(dse_sessionId+"midErr1","ʧ��");
			AppParam.setParam(dse_sessionId+"midErr2",bwResult.getContext());
%>
<script type="text/javascript">
	window.location="/personbank/HttpProxy?URL=/midserv/midservError.jsp&dse_sessionId=<%=dse_sessionId%>";
</script>
<%
	return;	
	}
	tmp = bwResult.getContext();
	MessManTool messManTool = new MessManTool();
%>

<!-------------------------------------------------------------------
                          ��׼JavaScript������
--------------------------------------------------------------------->
<script language="JavaScript" src="/personbank/HttpProxy?URL=/midserv/js/public.js&dse_sessionId=<%=dse_sessionId%>"></script>
<script language="JavaScript" src="/personbank/HttpProxy?URL=/midserv/js/common.js&dse_sessionId=<%=dse_sessionId%>"></script>
<script language="JavaScript" src="/personbank/HttpProxy?URL=/midserv/js/date.js&dse_sessionId=<%=dse_sessionId%>"></script>
<!--------------------------------------------------------------------
   ��ǰҳ��JavaScript�������֣������ύ��֤��ҳ�涯��������Ŀ��ȴ���
---------------------------------------------------------------------->

<!--------------------------------------------------------------------
                          ҳ��HTML���ֲ���    
---------------------------------------------------------------------->

<html>
	<head>
		<title>��ͨ�������Ϸ���</title>
		<link rel="stylesheet"
			href="/personbank/HttpProxy?URL=/midserv/css/personbank.css&dse_sessionId=<%=dse_sessionId%>">
		<link rel="stylesheet"
			href="/personbank/HttpProxy?URL=/midserv/css/midserv.css&dse_sessionId=<%=dse_sessionId%>">
		<link href="/personbank/css/csspt.css" rel="stylesheet"
			type="text/css">
		<link href="/personbank/css/content.css" rel="stylesheet" type="text/css">
	</head>

	<body leftmargin="0" topmargin="0" oncontextmenu=self.event.returnValue=false onselectstart="return false">
		<center>
			<DIV align=center>
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td
							background="/personbank/HttpProxy?URL=/midserv/images/pageTitle.gif&dse_sessionId=<%=dse_sessionId%>"
							class="pageTitle">
							&nbsp;&nbsp;ǩԼ���׳ɹ���������Ϣ���£�
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
				<FORM action="/personbank/HttpProxy" method=post>
					<input type="hidden" name="dse_sessionId"
						value="<%=dse_sessionId%>">
					<input type="hidden" name="URL" value="/midserv/kongZhongChongZhi1.jsp">
					<input type="hidden" name=biz_id value="<%=biz_id %>">
					<input type="hidden" name=step_id value="1">
					<table border="0" cellspacing="2" cellpadding="0" align="center"
						width="78%">
						<tr>
							<td width="50%" align="right" height="22" class="InputTip">
								�û�����:
							</td>
							<td width="50%" align="left" height="22" class="InputTip">
								<%=MessManTool.changeChar(request.getParameter("cust_name"))%>
							</td>
						</tr>
						<tr>
							<td width="50%" align="right" height="22" class="InputTip">
								�û����֤:
							</td>
							<td width="50%" align="left" height="22" class="InputTip">
								<%=request.getParameter("paper_no")%>
							</td>
						</tr>
						<tr>
							<td width="50%" align="right" height="22" class="InputTip">
								�Ա�:
							</td>
							<td width="50%" align="left" height="22" class="InputTip">
								<%
									String sex_code=MessManTool.changeChar(request.getParameter("sex_code"));
									String sex_code_name="";
									if(sex_code.equals("0")){
										sex_code_name="��";
									}else if(sex_code.equals("1")){
										sex_code_name="Ů";
									}
								%>
								<%=sex_code_name %>
							</td>
						</tr>
						<tr>
							<td width="50%" align="right" height="22" class="InputTip">
								�ֻ�����:
							</td>
							<td width="50%" align="left" height="22" class="InputTip">
								<%=MessManTool.changeChar(request.getParameter("mobile_no")) %>
							</td>
						</tr>
						<tr>
							<td width="50%" align="right" height="22" class="InputTip">
								���ͨ����:
							</td>
							<td width="50%" align="left" height="22" class="InputTip">
								<%=MessManTool.changeChar(request.getParameter("card1")) %>
							</td>
						</tr>
					</table>
				</FORM>
				<table>
					<tr>
						<td>
							<input type="button" onclick="tj();" value="����" class="button_bg">
						</td>
					</tr>
				</table>
				<br>
				<br>
				<br>
				<br>
				<table>
					<tr>
						<td rowspan="3">
						��ܰ��ʾ��
						</td>
						<td>
						����ǩԼ�Ѿ��ɹ�,���ڵڶ������߸������յ����ڸ�������ڴ���
						</td>
					</tr>
					<tr>
						<td>
							���ͨ�Զ���ֵ�ն˽��м����ɺ󼴿������ݵĳ�ֵ�����ˡ�
						</td>
					</tr>
					<tr>
						<td>
								�������ʿ���ѯ���ͨ�������ߣ�020��87692005���пͷ�95559��
						</td>
					</tr>
				</table>
			</DIV>
		</center>
	</body>
</html>
