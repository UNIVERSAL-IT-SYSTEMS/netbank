<%@ page language="java" contentType="text/html;charset=GBK" %>
<%@ page import="java.text.DecimalFormat"%>
<%@ page import="com.bocom.midserv.gz.*"%>
<%@ page import="com.viatt.bean.*"%>
<%@ page import="com.viatt.util.*"%>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.lang.*" %>
<%@ page import="com.bocom.midserv.base.*" %>
<%@ page import="com.bocom.midserv.web.*" %>
<%@ page import="com.bocom.eb.des.EBDES" %>

<%

	String cssFileName = request.getParameter("cssFileName");//获取客户当前使用的CSS样式
  String loginType = request.getParameter("loginType");//传送登陆类别 0－注册用户(手机版) 1－证书用户 2－大众用户
	String biz_step_id="1";  

  String cardNum = request.getParameter("cdno");
	String YwLei =request.getParameter("YwLei");
	String lchkTm = request.getParameter("chkDate");

    String TelNum = request.getParameter("TelNum");
    String cdno = request.getParameter("cdno");

	GzLog log = new GzLog("c:/gzLog");
	log.Write("==============这里是 联通缴费的第2个jsp文件========begin========================");
	String dse_sessionId = MessManTool.changeChar(request.getParameter("dse_sessionId"));//获取dse_sessionId
	String biz_id = MessManTool.changeChar(request.getParameter("biz_id")); 
	
	log.Write("==============联通缴费460621======step2:	接受查询号码并准备返回结果：i_biz_id=["+biz_id+"]"+"卡号CDNO=["+cdno+"]===========");  
	
    String dynamicCode="";
	String dynamicCodeSeq="";
	String sendPass = "";
	
	if(loginType.equals("0")){
	//动态密码方面
		sendPass=MessManTool.changeChar(request.getParameter("sendPass"));//1--需要 0--不需要;
		if(sendPass.equals("1")||sendPass.equals("2")){
			
			dynamicCode=request.getParameter("dynamicCode");
			dynamicCodeSeq=request.getParameter("dynamicCodeSeq");
			
			
		}
		
	}
	
	
	
	log.Write("loginType 传送登陆类别 0－注册用户(手机版) 1－证书用户 2－大众用户="+loginType+"|dynamicCode="+dynamicCode+"|dynamicCodeSeq="+dynamicCodeSeq);
	

String sendContext = "biz_id,35|biz_step_id,1|TXNSRC,WE441|CDNO,"+cdno+"|YwLei,"+YwLei+"|TelNum,"+TelNum+"|"+"ZdanNy,"+lchkTm+"|";
	
	log.Write("===sendContext===="+sendContext);
	
	
	//这个正常测试的时候的代码===begin======
	
	MidServer midServer = new MidServer();
	BwResult bwResult = midServer.sendMessage(sendContext);
	//这个正常测试的时候的代码===end======
	
	
	
	
	
	log.Write("===bwResult Object===="+bwResult);
	
	
	if (bwResult == null ) 
	{
			log.Write("交易结果不对");
			AppParam.setParam(dse_sessionId+"midErr1","操作失败");
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
	
	MessManTool messManTool = new MessManTool();
	String info=MessManTool.getValueByName(message,"MGID");	
  //获取查询回来去得到的值
  String FfNo = messManTool.getValueByName(message, "FfNo");
	String TxnAmt = messManTool.getValueByName(message, "MonSum");
  log.Write("bwResult.getContext=MGID: "+info);
  log.Write("bwResult.getContext=FfNo: "+FfNo);
  log.Write("bwResult.getContext=TxnAmt: "+TxnAmt);

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
	

	

	
	
	

	
	//用来将数字格式化

 	DecimalFormat df = new DecimalFormat("###,###,##0.00"); 
    double dblTxnAmt = Double.parseDouble(TxnAmt);
    String displayTxnAmt = df.format(dblTxnAmt / 100.0D);
	
	
	log.Write("displayTxnAmt= "+displayTxnAmt);
Enumeration en = request.getParameterNames();
while(en.hasMoreElements()){
	String str = (String)en.nextElement();
	System.out.println(str + "----" + request.getParameter(str));
}

%>




<script language="JavaScript" src="/personbank/HttpProxy?URL=/midserv/js/public.js&dse_sessionId=<%=dse_sessionId%>"></script>
<script language="JavaScript" src="/personbank/HttpProxy?URL=/midserv/js/public_card.js&dse_sessionId=<%=dse_sessionId%>"></script>

<html>
	<head>
		<title>交通银行网上服务</title>
   <meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312"> 
    <script type="text/javascript">
			var clickBoolean=true;
			function tj1(){
				if(clickBoolean){
        clickBoolean=false;
        document.safeInput1.commit("safeCommit1");
				document.safeCommit1.submit("f1"); 
		    	
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
						<td class="tab_title" align="center" colspan="6">请确认联通缴费账单信息：</td>
					</tr>
             <script language=JavaScript> writeNewCommitActivxObject('/personbank')</script>
				   <form action="/personbank/HttpProxy" method=post name="f1">
					<input type="hidden" name="URL"	value="/midserv/unionJiaofei3.jsp"/>
          <input type="hidden" name="dse_sessionId"	value="<%=dse_sessionId%>"/>
					<input type="hidden" name=biz_id value="<%=biz_id%>"/>
					<input type="hidden" name="TxnAmt" value="<%=TxnAmt%>"/>
          <input type="hidden" name="TelNum" value="<%=TelNum%>"/>
          <input type="hidden" name="FfNo" value="<%=FfNo%>"/>
					<input type="hidden" name=step_id value="2"/>
					<input type="hidden" name="YwLei" value="<%=YwLei%>"/>
					<input type="hidden" name="lchkTm" value="<%=lchkTm%>"/>
					<input type="hidden" name="displayTxnAmt" value="<%=displayTxnAmt%>"/>
          <input type="hidden" name="bocomPwd"/>
         <%if(loginType.equals("0")){ %>
					<input type="hidden" name="dynamicCode" value="<%=dynamicCode%>">
					<input type="hidden" name="dynamicCodeSeq" value="<%=dynamicCodeSeq%>">
					<%} %>
					
					<tr class="tab_tr">
							<td width="50%" align="right" height="22" class="InputTip">
								缴费卡号:
							</td>
							<td width="50%" align="left" height="22" class="InputTip">
								<%=cdno%>
							</td>
					</tr>
          <tr class="tab_tr">
							<td width="50%" align="right" height="22" class="InputTip">
								电话号码:
							</td>
							<td width="50%" align="left" height="22" class="InputTip">
								<%=TelNum%>
							</td>
					</tr>
         <tr class="tab_tr">
							<td width="50%" align="right" height="22" class="InputTip">
								账单年月:
							</td>
							<td width="50%" align="left" height="22" class="InputTip">
								<%=lchkTm%>
							</td>
					</tr>
					<tr class="tab_tr">
							<td width="50%" align="right" height="22" class="InputTip">
								欠费合计:
							</td>
							<td width="50%" align="left" height="22" class="InputTip">
							<%=displayTxnAmt%> 元
							</td>
					</tr>
						<tr class="tab_tr">
							<td align="right" height="22" class="InputTip">
								交易密码:
							</td>
							<td class="InputTip">
								<SCRIPT language=JavaScript> writeNewPwdActivxObjectLenClass ('safeInput1','safeInput1','/personbank/','bocomPwd',20,6,'20','153','<%=dse_sessionId%>')</SCRIPT>
							</td>
           </tr>

	        <%if(loginType.equals("0")){ %>
						<tr class="tab_tr">
							<td align="right" height="22" class="InputTip">
								动态密码:
							</td>
							<td align="left" height="22" class="InputTip">
								<input type="text" name="dynamicCodeMan" size="6" maxlength="6" onkeypress="onlyMunNoPointer();">		
                密码序号:<%=dynamicCodeSeq%>				
							</td>
						</tr>
						<%} %>

					<tr class="tab_result">
						<td align="center" colspan="2">
							<input type="button" onclick="tj1();" value="确 定" class="button_bg">
							<input type="button" onclick="window.history.back();" value="返 回"	class="button_bg">
						</td>
					</tr>
				</table>
				</form>
			</div>
		</center>
	</body>

</html>