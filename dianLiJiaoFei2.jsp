<%@ page language="java" pageEncoding="gbk"%>
<%@ page import="com.bocom.midserv.gz.*"%>
<%@ page import="com.viatt.bean.*"%>
<%@ page import="com.viatt.util.*"%>
<%@ page import="java.text.DecimalFormat"%>
<%@ page import="java.util.*"%>
<%@ page import="java.lang.Double"%>



<%

	GzLog log = new GzLog("c:/gzLog");
	String loginType = request.getParameter("loginType");//传送登陆类别 0－注册用户(手机版) 1－证书用户 2－大众用户
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
		log.Write("biz_id为空");
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
	
	
	//这个正常测试的时候的代码===begin======
	
	MidServerDirectResponse midServer = new MidServerDirectResponse();	
	BwResult bwResult = midServer.sendMessage(sendContext);
	//这个正常测试的时候的代码===end======
	
	
	
	
	
	log.Write("===bwResult Object===="+bwResult);
	
	
	if (bwResult == null ) 
	{
			log.Write("交易结果不对");
			AppParam.setParam(dse_sessionId+"midErr1","解约操作失败");
			AppParam.setParam(dse_sessionId+"midErr2","交易过程中网络出现问题，此次交易失败！");
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
			log.Write("交易不成功");
			log.Write("交易不成功 其原因是："+message);
			
			String rspMsg=MessManTool.getValueByName(message,"RspMsg");			
			
			AppParam.setParam(dse_sessionId+"midErr1","交易情况");
			AppParam.setParam(dse_sessionId+"midErr2",rspMsg);
		
%>
			<script type="text/javascript">
				window.location="/personbank/HttpProxy?URL=/midserv/midservError.jsp&dse_sessionId=<%=dse_sessionId%>";
			</script>
<%
			return;
	}
	

	

	MessManTool messManTool = new MessManTool();
	
	//获取查询回来去得到的值
	String TxnAmt = messManTool.getValueByName(message, "TxnAmt");
	String ChkTim = messManTool.getValueByName(message, "ChkTim");
	String UsrNam = messManTool.getValueByName(message, "UsrNam");
	String UsrAdd = messManTool.getValueByName(message, "UsrAdd");
	
	//用来将数字格式化

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
		<title>交通银行网上服务</title>
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
						<td class="tab_title">电费查询信息反馈</td>
					</tr>
					<tr class="tab_tr">
							<td width="50%" align="center" height="22" class="InputTip">
								缴费卡号:
							</td>
							<td width="50%" align="center" height="22" class="InputTip">
								<%=cdno%>
							</td>
					</tr>
					<tr class="tab_tr">
							<td width="50%" align="center" height="22" class="InputTip">
								应交金额:
							</td>
							<td width="50%" align="center" height="22" class="InputTip">
							<%=displayTxnAmt%> 元
							</td>
					</tr>
					<tr class="tab_tr">
							<td width="50%" align="center" height="22" class="InputTip">
								用户姓名:
							</td>
							<td width="50%" align="center" height="22" class="InputTip">
								<%=UsrNam%>
							</td>
					</tr>
					<tr class="tab_tr">
							<td width="50%" align="center" height="22" class="InputTip">
								用电地址:
							</td>
							<td width="50%" align="center" height="22" class="InputTip">
								<%=UsrAdd%>
							</td>
					</tr>

					<tr class="tab_result">
						<td align="center" colspan="2">
							<input type="button" onclick="tj();" value="下一步" class="button_bg">
							<input type="button" onclick="window.history.back();" value="返 回"	class="button_bg">
						</td>
					</tr>
				</table>
				</FORM>
			</div>
		</center>
	</body>

	
</HTML>


















