<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@ page import="com.bocom.midserv.gz.*"%>
<%@ page import="com.viatt.bean.*"%>
<%@ page import="com.viatt.util.*"%>
<%
	GzLog log = new GzLog("c:/gzLog");
	String cdno = MessManTool.changeChar(request.getParameter("cardNo"));
	String dse_sessionId = MessManTool.changeChar(request.getParameter("dse_sessionId"));//获取dse_sessionId
	String step_id = MessManTool.changeChar(request.getParameter("step_id"));
	String actionType = MessManTool.changeChar(request.getParameter("actionType"));
	String biz_id = MessManTool.changeChar(request.getParameter("biz_id"));
	if (biz_id.equals("")) {
		System.out.println("传入参数不正确");
	}
	List list = new ArrayList();
	String content = "bocom_mid|biz_id,25|biz_step_id,6|TXNSRC,WE441|CDNO,"+cdno+"|";
	MidServer midServer = new MidServer();
	BwResult bwResult = midServer.sendMessage(content); 
	if (bwResult == null || bwResult.getCode() == null|| !bwResult.getCode().equals("000")) {
		
	}
	String tmp = bwResult.getContext();
	//System.out.println(tmp);
	MessManTool messManTool = new MessManTool();
	list = messManTool.kongZhongChongZhiGetResult3(tmp);
	int total = list.size();
	String currPage1 = request.getParameter("page") != null ? request
			.getParameter("page") : "1";
	int currPage = Integer.parseInt(currPage1);
	PageTools pageTools = new PageTools();
	pageTools.setPageSize(20);
	pageTools.setCurrPage(currPage);
	pageTools.setTotal(total);
	pageTools.setUrl("/personbank/HttpProxy?dse_sessionId="
			+ dse_sessionId + "&URL=/midserv/kongZhongChongZhi8.jsp&biz_id="
			+ biz_id);
	int pageSize = pageTools.getPageSize();
	String pagegetRoll = pageTools.pagegetRoll();
	
  String cssFileName = request.getParameter("cssFileName");//获取客户当前使用的CSS样式
	if(cssFileName ==null){
		cssFileName = "skin.css";
	}			
	
%>
<!-------------------------------------------------------------------
                          标准JavaScript库引用
--------------------------------------------------------------------->
<script language="JavaScript"
	src="/personbank/HttpProxy?URL=/midserv/js/public.js&dse_sessionId=<%=dse_sessionId%>"></script>
<script language="JavaScript"
	src="/personbank/HttpProxy?URL=/midserv/js/common.js&dse_sessionId=<%=dse_sessionId%>"></script>

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
						<td colspan="5" class="tab_title">交 易 历 史</td>
					</tr>
					
				<FORM action="/personbank/HttpProxy" method=post name="f1">
					<input type="hidden" name="dse_sessionId"	value="<%=dse_sessionId%>">
					<input type="hidden" name="URL" value="/midserv/midSelect.jsp">
						<tr class="tab_tr" onclick="selectrow(this);" style="cursor:hand;">
							<td align="left" height="22" class="TableRow2">
								充值羊城通卡号
							</td>
							<td align="left" height="22"  class="TableRow2">
								充值日期
							</td>
							<td align="left" height="22"  class="TableRow2">
								充值会计流水号
							</td>
							<td align="left" height="22"  class="TableRow2">
								充值金额
							</td>
							<td align="left" height="22"  class="TableRow2">
								充值类型
							</td>
						</tr>
						<%
							//System.out.println("=1=2="+total);
							for (int i = 0; i < total; i++) {
								if ((i >= (currPage - 1) * pageSize) && (i < currPage * pageSize)) {
									HashMap map = (HashMap) list.get(i);
						%>
						<tr class="tab_tr">
							<td align="left" height="22"  class="<%=(i + 1) % 2 == 1 ? "TableRow1" : "TableRow2"%>">
								<%
									String tmp2=(String)map.get("param2");
								   	if(tmp2==null){
								      tmp2="";
									   }
									   if(tmp2.substring(0,2).equals("01")){
									   		tmp2=tmp2.substring(2,10);
									   }
									  else if(tmp2.substring(0,1).equals("0")){
									  	tmp2=tmp2.substring(1,10);
									  }
								%>
								<%=tmp2 %>
							</td>
							<td align="left" height="22"  class="<%=(i + 1) % 2 == 1 ? "TableRow1" : "TableRow2"%>">
								<%=map.get("param3")%>
							</td>
							<td align="left" height="22"  class="<%=(i + 1) % 2 == 1 ? "TableRow1" : "TableRow2"%>">
								<%=map.get("param4")%>
							</td>
							<td align="left" height="22"  class="<%=(i + 1) % 2 == 1 ? "TableRow1" : "TableRow2"%>">
								<%
									String tmp5=(String)map.get("param5");
								   	if(tmp5==null){
										tmp5="0.0";
									}else if(tmp5.equals("")){
										tmp5="0.0";
									}
									double tmp3=Double.parseDouble(tmp5.substring(0,tmp5.length()-2));
								%>
								<%=tmp3%>
							</td>
							<td align="left" height="22"  class="<%=(i + 1) % 2 == 1 ? "TableRow1" : "TableRow2"%>">
								<%
									String tmp6=(String)map.get("param6");
								   	if(tmp6==null){
										tmp6="";
									}else if(tmp6.equals("Z01051")){
										tmp6="充值";
									}
									else if(tmp6.equals("Z02011")){
										tmp6="退费";
									}
								%>
								<%=tmp6%>
							</td>
						</tr>
					<%
							}
						}
					%>
						<tr class="tab_tr" >
							<td align="left" height="22" class="InputTip" colspan="12">
								<%=pagegetRoll%>
							</td>
						</tr>

						<tr class="tab_result">
							<td align="center" colspan="5">
								<input type="button" onclick="window.history.back();" value="返 回"
									class="button_bg">
							</td>
						</tr>
	
					</table>
				</FORM>
				
			</DIV>
		</center>
	</body>
</html>
