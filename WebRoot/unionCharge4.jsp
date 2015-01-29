<%@ page language="java"  pageEncoding="gbk"%>
<%@ page import="com.bocom.midserv.gz.*"%>
<%@ page import="java.util.Date" %>
<%@ page import="com.viatt.bean.*"%>
<%@ page import="com.viatt.util.*" %>
<%@ page import="java.text.DecimalFormat"%>
<%
				
 	String loginType = request.getParameter("loginType");//传送登陆类别 0－注册用户(手机版) 1－证书用户 2－大众用户
	String cdno = request.getParameter("cardNo");
	GzLog log = new GzLog("c:/gzLog");
	log.Write("============== 联通充值的第4个jsp文件========begin========================");
	String dse_sessionId = MessManTool.changeChar(request.getParameter("dse_sessionId"));//获取dse_sessionId
	String biz_id = MessManTool.changeChar(request.getParameter("biz_id")); 
	String TelNum = MessManTool.changeChar(request.getParameter("TelNum"));
	String TxnAmt = MessManTool.changeChar(request.getParameter("TxnAmt"));
	String password= MessManTool.changeChar(request.getParameter("bocomPwd"));//加密密码
	log.Write("#####联通充值第四个页面====TelNum|TxnAmt==="+TelNum+"|"+TxnAmt);
  String cssFileName = request.getParameter("cssFileName");//获取客户当前使用的CSS样式
	if(cssFileName ==null){
		cssFileName = "skin.css";
	}			
		
	
  
Enumeration en = request.getParameterNames();
while(en.hasMoreElements()){
	String str = (String)en.nextElement();
	System.out.println(str + "----" + request.getParameter(str));
}
System.out.println("======================");
Enumeration en1 = request.getHeaderNames();
while(en1.hasMoreElements()){
	String str = (String)en1.nextElement();
	System.out.println(str + "----" + request.getHeader(str));
}

	

	log.Write("receivedPassword is "+password);

	String dynamicCodeMan="";
	String dynamicCodeSeqMan="";
	String dynamicCode="";
	String dynamicCodeSeq="";
	
	if(loginType.equals("0")){
		dynamicCode=MessManTool.changeChar(request.getParameter("dynamicCode"));
		dynamicCodeSeq=MessManTool.changeChar(request.getParameter("dynamicCodeSeq"));
		
		dynamicCodeMan=MessManTool.changeChar(request.getParameter("dynamicCodeMan"));
		dynamicCodeSeqMan=MessManTool.changeChar(request.getParameter("dynamicCodeSeqMan"));
		
		log.Write("显示的动态密码："+dynamicCodeMan+" 系统的动态密码: "+dynamicCode+" 显示的动态密码序号: "+dynamicCodeSeqMan+" 系统的动态密码序号："+dynamicCodeSeq);
		
		if(!dynamicCodeMan.equals(dynamicCode)){
			System.out.println("动态密码错误！");
			log.Write("动态密码错误！");
			AppParam.setParam(dse_sessionId+"midErr1","参数错误");
			AppParam.setParam(dse_sessionId+"midErr2","动态密码错误！");
			
%>
			<script type="text/javascript">
					window.location="/personbank/HttpProxy?URL=/midserv/midservError.jsp&dse_sessionId=<%=dse_sessionId%>";
			</script>
<%
			return ;
		}
	}

	//开始拼装送往网关的报文
	
	String content = "biz_id,33|biz_step_id,2|TelNum,"+TelNum+"|CrdNo,"+cdno+"|TxnAmt,"+TxnAmt+"|PinBlk,"+password; 
	MidServer midServer = new MidServer();	
	
	
	
	log.Write(">>>>>>>>>>>>联通充值第4个页面>>>发出去的报文:"+content);
	
		
	BwResult bwResult = midServer.sendMessage(content);
  
	
	
	if (bwResult == null ) {
			log.Write("交易结果不对");
			AppParam.setParam(dse_sessionId+"midErr1","充值操作失败");
			AppParam.setParam(dse_sessionId+"midErr2","交易过程中网络出现问题，此次交易失败！");
}

	String tmp ="";
    tmp = bwResult.getContext();
 log.Write("<<<<<<<<<<<<联通充值第4个页面><<<返回的报文:"+tmp);
	String info=MessManTool.getValueByName(tmp,"MGID");
	
	log.Write("the RspCode is ="+info);

	if(info==null||info.equals("")||!info.equals("000000")){
			log.Write("交易不成功");
			log.Write("交易不成功 其原因是："+tmp);
			AppParam.setParam(dse_sessionId+"midErr1","失败");
			AppParam.setParam(dse_sessionId+"midErr2",tmp);
%>
<script type="text/javascript">
	window.location="/personbank/HttpProxy?URL=/midserv/midservError.jsp&dse_sessionId=<%=dse_sessionId%>";
</script>
<%
	return;
	}
     String TckNo = MessManTool.getValueByName(tmp,"TckNo");
	  DecimalFormat df = new DecimalFormat("###,###,##0.00"); 
    double dblTxnAmt = Double.parseDouble(TxnAmt);
    String displayTxnAmt = df.format(dblTxnAmt / 100.0D);
%>


<!-------------------------------------------------------------------
                          标准JavaScript库引用
--------------------------------------------------------------------->
<script language="JavaScript" src="/personbank/HttpProxy?URL=/midserv/js/public.js&dse_sessionId=<%=dse_sessionId%>"></script>
<script language="JavaScript" src="/personbank/HttpProxy?URL=/midserv/js/common.js&dse_sessionId=<%=dse_sessionId%>"></script>
<script language="JavaScript" src="/personbank/HttpProxy?URL=/midserv/js/date.js&dse_sessionId=<%=dse_sessionId%>"></script>
<!--------------------------------------------------------------------
   当前页面JavaScript函数部分，包括提交验证，页面动作，具体目标等代码
---------------------------------------------------------------------->

<!--------------------------------------------------------------------
                          页面HTML表现部分    
---------------------------------------------------------------------->

<html>
	<head>
	  <meta http-equiv="Content-Type" content="text/html; charset=GBK">
		<title>交通银行网上服务</title>
		<link rel="stylesheet" type="text/css" href="/personbank/css/<%=cssFileName%>">
	</head>

	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
		<center>
			<DIV align=center>
				<table width="100%" align="center" cellpadding="1" cellspacing="1" class="tab">
					<tr align="left"> 
						<td class="tab_title" align="center" colspan="6">联通充值交易成功!</td>
					</tr>
					
				<FORM action="/personbank/HttpProxy" method=post name="f1">
					<input type="hidden" name="dse_sessionId"	value="<%=dse_sessionId%>">
					<input type="hidden" name="URL" value="/midserv/midSelect.jsp">
					<input type="hidden" name=biz_id value="<%=biz_id %>">
					<input type="hidden" name=step_id value="1">
					
						
						<tr class="tab_tr">
	           <td  align="right" height="22" class="InputTip">
								充值号码：
							</td>
							<td  align="left" height="22" class="InputTip">
								<%=TelNum%>
							</td>
          </tr>
          <tr class="tab_tr">
							<td  align="right" height="22" class="InputTip">
								充值金额：
							</td>
							<td  align="left" height="22" class="InputTip">
								<%=displayTxnAmt%> 元
							</td>
					</tr>
						<tr class="tab_tr">
							<td  align="right" height="22" class="InputTip">
								交易流水号：
							</td>
							<td  align="left" height="22" class="InputTip">
								<%=TckNo%>
							</td>
						</tr>
						
						
					</table>
				</FORM>

			</DIV>
		</center>	  	
	</body>
</html>
