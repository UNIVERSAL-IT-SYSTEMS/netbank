<%@ page language="java" pageEncoding="gbk"%>
<%@ page import="com.bocom.midserv.gz.*"%>
<%@ page import="com.viatt.bean.*"%>
<%@ page import="com.viatt.util.*"%>
<%@ page import="java.text.DecimalFormat"%>
<%@ page import="java.util.*"%>
<%@ page import="java.lang.Double"%>



<%

	GzLog log = new GzLog("c:/gzLog");
	String loginType = request.getParameter("loginType");//���͵�½��� 0��ע���û�(�ֻ���) 1��֤���û� 2�������û�
	String cssFileName = request.getParameter("cssFileName");
	if(cssFileName ==null){
		cssFileName = "skin.css";
	}
	log.Write("======The cssFileName is :"+cssFileName);

	String biz_step_id="1";  

    String cdno = request.getParameter("cardNo");

	
	log.Write("/n===========dianLiJiaoFei2.jsp====begin========================");
	String dse_sessionId = request.getParameter("dse_sessionId");
	String biz_id = request.getParameter("biz_id"); 
	if (biz_id.equals("") ) {
		log.Write("biz_idΪ��");
	}
	log.Write("############biz_id=["+biz_id+"]"+"#######CDNO=["+cdno+"]===========#######"); 
	
	String cardNum = request.getParameter("cdno");
	String clientID =request.getParameter("accountNo");
	String lchkTm = request.getParameter("chkDate");
	
	if(lchkTm.length()==6){
		lchkTm = lchkTm+"99";
	}
	else if (lchkTm.length()==1){
		lchkTm = "99999999";
	}
	
	
	
	
	
	
	
	String sendContext = "biz_id,31|biz_step_id,1|TXNSRC,WE441|CDNO,"+cdno+"|TCusId,"+clientID+"|LChkTm,"+lchkTm+"|";
	
	log.Write("===sendContext===="+sendContext);
	
	
	//����������Ե�ʱ��Ĵ���===begin======
	
	MidServerDirectResponse midServer = new MidServerDirectResponse();	
	BwResult bwResult = midServer.sendMessage(sendContext);
	//����������Ե�ʱ��Ĵ���===end======
	
	
	
	
	
	log.Write("===bwResult Object===="+bwResult);
	
	
	if (bwResult == null ) 
	{
			log.Write("���׽������");
			AppParam.setParam(dse_sessionId+"midErr1","��Լ����ʧ��");
			AppParam.setParam(dse_sessionId+"midErr2","���׹���������������⣬�˴ν���ʧ�ܣ�");
			%>
			<script type="text/javascript">
				window.location="/personbank/HttpProxy?URL=/midserv/midservError.jsp&dse_sessionId=<%=dse_sessionId%>";
			</script>
			<%
			return;
	}
	
	
	
	String message ="";
	message = bwResult.getContext();
	log.Write("bwResult.getContext= "+message);
	
	
	String info=MessManTool.getValueByName(message,"MGID");	
	if(!info.equals("000000")){
			log.Write("���ײ��ɹ�");
			log.Write("���ײ��ɹ� ��ԭ���ǣ�"+message);
			
			String rspMsg=MessManTool.getValueByName(message,"RspMsg");			
			
			AppParam.setParam(dse_sessionId+"midErr1","�������");
			AppParam.setParam(dse_sessionId+"midErr2",rspMsg);
		
%>
			<script type="text/javascript">
				window.location="/personbank/HttpProxy?URL=/midserv/midservError.jsp&dse_sessionId=<%=dse_sessionId%>";
			</script>
<%
			return;
	}
	

	

	MessManTool messManTool = new MessManTool();
	
	//��ȡ��ѯ����ȥ�õ���ֵ
	String TxnAmt = messManTool.getValueByName(message, "TxnAmt");
	String ChkTim = messManTool.getValueByName(message, "ChkTim");
	String UsrNam = messManTool.getValueByName(message, "UsrNam");
	String UsrAdd = messManTool.getValueByName(message, "UsrAdd");
	
	//���������ָ�ʽ��

	DecimalFormat df = new DecimalFormat("###,###,##0.00"); 
    double dblTxnAmt = Double.parseDouble(TxnAmt);
    String displayTxnAmt = df.format(dblTxnAmt / 100.0D);
	
	
	log.Write("displayTxnAmt= "+displayTxnAmt);

%>




<script language="JavaScript"
	src="/personbank/HttpProxy?URL=/midserv/js/public.js&dse_sessionId=<%=dse_sessionId%>"></script>
<script language="JavaScript"
	src="/personbank/HttpProxy?URL=/midserv/js/common.js&dse_sessionId=<%=dse_sessionId%>"></script>
<script language="JavaScript"
	src="/personbank/HttpProxy?URL=/midserv/js/date.js&dse_sessionId=<%=dse_sessionId%>"></script>


<HTML>
	<head>
		<title>��ͨ�������Ϸ���</title>
		<link rel="stylesheet" type="text/css" href="/personbank/css/<%=cssFileName%>">
	
	</head>

	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
		<center>
			<div class="indent">
				<table width="100%" align="center" cellpadding="1" cellspacing="1" class="tab">
				<FORM action="/personbank/HttpProxy" method=post name="f1" id="f1">
					<input type="hidden" name="dse_sessionId"	value="<%=dse_sessionId%>">
					<input type="hidden" name="URL"	value="/midserv/dianLiJiaoFei3.jsp">
					<input type="hidden" name=biz_id value="<%=biz_id%>">
					<input type="hidden" name=TxnAmt value="<%=TxnAmt%>">
					<input type="hidden" name=step_id value="3">
					<input type="hidden" name=message value="<%=message%>">
					<input type="hidden" name=clientID value="<%=clientID%>">
					<input type="hidden" name=lchkTm value="<%=lchkTm%>">
					<input type="hidden" name=displayTxnAmt value="<%=displayTxnAmt%>">
					<input type="hidden" name="sendPass" value="<%=loginType.endsWith("0")?"1":"0" %>">
					<tr align="left"> 
						<td class="tab_title">��Ѳ�ѯ��Ϣ����</td>
					</tr>
					<tr class="tab_tr">
							<td width="50%" align="center" height="22" class="InputTip">
								�ɷѿ���:
							</td>
							<td width="50%" align="center" height="22" class="InputTip">
								<%=cdno%>
							</td>
					</tr>
					<tr class="tab_tr">
							<td width="50%" align="center" height="22" class="InputTip">
								Ӧ�����:
							</td>
							<td width="50%" align="center" height="22" class="InputTip">
							<%=displayTxnAmt%> Ԫ
							</td>
					</tr>
					<tr class="tab_tr">
							<td width="50%" align="center" height="22" class="InputTip">
								�û�����:
							</td>
							<td width="50%" align="center" height="22" class="InputTip">
								<%=UsrNam%>
							</td>
					</tr>
					<tr class="tab_tr">
							<td width="50%" align="center" height="22" class="InputTip">
								�õ��ַ:
							</td>
							<td width="50%" align="center" height="22" class="InputTip">
								<%=UsrAdd%>
							</td>
					</tr>

					<tr class="tab_result">
						<td align="center" colspan="2">
							<input type="button" onclick="tj();" value="��һ��" class="button_bg">
							<input type="button" onclick="window.history.back();" value="�� ��"	class="button_bg">
						</td>
					</tr>
				</table>
				</FORM>
			</div>
		</center>
	</body>

	
</HTML>


















