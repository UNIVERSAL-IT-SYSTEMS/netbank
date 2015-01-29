<%@ page language="java"  pageEncoding="gbk"%>
<%@ page import="com.bocom.midserv.gz.*"%>
<%@ page import="com.viatt.bean.*"%>
<%@ page import="com.viatt.util.*" %>
<%
	String dse_sessionId = MessManTool.changeChar(request.getParameter("dse_sessionId"));//获取dse_sessionId	
	GzLog log = new GzLog("c:/gzLog");
	String step_id = MessManTool.changeChar(request.getParameter("step_id"));
	
	String biz_id = MessManTool.changeChar(request.getParameter("biz_id"));
	if (biz_id.equals("")) {
		System.out.println("传入参数不正确");
	}
	
	String cssFileName = request.getParameter("cssFileName");//获取客户当前使用的CSS样式
	if(cssFileName ==null){
		cssFileName = "skin.css";
	}		
		
	String currpage=MessManTool.changeChar(request.getParameter("page"));
	String tmp=""; 
	String card1 = MessManTool.changeChar(request.getParameter("card1"));
	String cdno = MessManTool.changeChar(request.getParameter("cardNo"));
	String content = "biz_id,"+biz_id+"|biz_step_id,3|sign_flag,0|TXNSRC,WE441|inst_no,交通银行|bank_acc,"+cdno+"|card1,"+card1+"|card2,|card3,|";
	MidServer midServer = new MidServer();
	BwResult bwResult = midServer.sendMessage(content);
	if (bwResult == null || bwResult.getCode() == null|| !bwResult.getCode().equals("000")) {
		AppParam.setParam(dse_sessionId+"midErr1","失败");
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
			<div class="indent">
				<table width="100%" align="center" cellpadding="1" cellspacing="1" class="tab">
					<tr align="left"> 
						<td class="tab_title">;签 约 解 除</td>
					</tr>
					
				<FORM action="/personbank/HttpProxy" method=post name="f1">
					<input type="hidden" name="dse_sessionId"	value="<%=dse_sessionId%>">
					<input type="hidden" name="URL" value="/midserv/midSelect.jsp">
					<input type="hidden" name=biz_id value="<%=biz_id %>">
					<input type="hidden" name=step_id value="1">
					<input type="hidden" name=page value="<%=currpage %>">
					<input type="hidden" name=card1 value="<%=card1 %>">
					
					<tr class="tab_tr">
						<td align="center" class="InputTip">
							签约解除成功！
						</td>
					</tr>
					
					<tr class="tab_result">
						<td align="center">
							<input type="button" onclick="tj();" value="返回" class="button_bg">
						</td>
					</tr>

					</table>
				</FORM>
				
			</DIV>
		</center>
	</body>
</html>