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
	log.Write("============== 联通缴费的第3个jsp文件========begin========================");
	String dse_sessionId = MessManTool.changeChar(request.getParameter("dse_sessionId"));//获取dse_sessionId
	String biz_id = MessManTool.changeChar(request.getParameter("biz_id")); 
	String TelNum = MessManTool.changeChar(request.getParameter("TelNum"));
	String FfNo = MessManTool.changeChar(request.getParameter("FfNo"));
	String TxnAmt = MessManTool.changeChar(request.getParameter("TxnAmt"));
  String YwLei = MessManTool.changeChar(request.getParameter("YwLei"));
  String lchkTm = MessManTool.changeChar(request.getParameter("lchkTm"));
	String bocomPwd = MessManTool.changeChar(request.getParameter("bocomPwd"));//加密密码
	log.Write("#####联通缴费第三个页面====TelNum|TxnAmt==="+TelNum+"|"+TxnAmt);
  String cssFileName = request.getParameter("cssFileName");//获取客户当前使用的CSS样式
	if(cssFileName ==null){
		cssFileName = "skin.css";
	}		


		
	log.Write("receivedPassword is "+bocomPwd);
		Object[] names = request.getParameterMap().keySet().toArray();
		for(int i = 0; i<names.length; i++){
			log.Write(names[i] + "");
		}

		//for(Object name : request.getParameterMap().keySet().toArray()){
		//	log.Write("receivedPassword is "+name);
		//}

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
	
	String content = "biz_id,35|biz_step_id,2|TXNSRC,WE441|ActNo,"+cdno+"|BusiType,"+YwLei+"|TCusId,"+lchkTm+"|TCusNm,"+FfNo+"|MonSum,"+TxnAmt+"|IdType,1|IdNo,55555|ActTpe,4|PSWD,"+bocomPwd+"|ActNam,55555|";  //密码字段到时要修改
	MidServer midServer = new MidServer();	
	
	
	
	log.Write(">>>>>>>>>>>>联通缴费第3个页面>>>发出去的报文460622:"+content);
	
		BwResult bwResult = new BwResult();
		bwResult = midServer.sendMessage(content);
	
  
	
	
	if (bwResult == null ) {
			log.Write("交易结果不对");
			AppParam.setParam(dse_sessionId+"midErr1","充值操作失败");
			AppParam.setParam(dse_sessionId+"midErr2","交易过程中网络出现问题，此次交易失败！");
}


   String tmp = bwResult.getContext();
 log.Write("<<<<<<<<<<<<联通缴费第3个页面><<<返回的报文460622:"+tmp);
	String info=MessManTool.getValueByName(tmp,"MGID");
	
	log.Write("the RspCode is MGID="+info);

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
     String TransSeq = MessManTool.getValueByName(tmp,"TransSeq");
     String OppTransSeq = MessManTool.getValueByName(tmp,"OppTransSeq");
	  DecimalFormat df = new DecimalFormat("###,###,##0.00"); 
    double dblTxnAmt = Double.parseDouble(TxnAmt);
    String displayTxnAmt = df.format(dblTxnAmt / 100.0D);
  Enumeration en = request.getParameterNames();
  while(en.hasMoreElements()){
	 String str = (String)en.nextElement();
	 System.out.println(str + "----" + request.getParameter(str));
}
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
						<td class="tab_title" align="center" colspan="6">联通缴费交易成功!</td>
					</tr>
					
				<FORM action="/personbank/HttpProxy" method=post name="f1">
					<input type="hidden" name="dse_sessionId"	value="<%=dse_sessionId%>">
					<input type="hidden" name="URL" value="/midserv/midSelect.jsp">
					<input type="hidden" name=biz_id value="<%=biz_id %>">
					<input type="hidden" name=step_id value="2">
						<tr class="tab_tr">
	           <td  align="right" height="22" class="InputTip">
								缴费号码：
							</td>
							<td  align="left" height="22" class="InputTip">
								<%=TelNum%>
							</td>
          </tr>
　　　　　 <tr class="tab_tr">
	           <td  align="right" height="22" class="InputTip">
								账单年月：
							</td>
							<td  align="left" height="22" class="InputTip">
								<%=lchkTm%>
							</td>
          </tr>
          <tr class="tab_tr">
							<td  align="right" height="22" class="InputTip">
								缴费金额：
							</td>
							<td  align="left" height="22" class="InputTip">
								<%=displayTxnAmt%> 元
							</td>
					</tr>

						<tr class="tab_tr">
							<td  align="right" height="22" class="InputTip">
								银行会计流水号：
							</td>
							<td  align="left" height="22" class="InputTip">
								<%=TransSeq%>
							</td>
						</tr>
						
					</table>
				</FORM>

			</DIV>
		</center>	  	
	</body>
</html>
