<%@ page language="java" contentType="text/html;charset=GBK"%>
<%@ page import="com.bocom.midserv.gz.*"%>
<%@ page import="com.viatt.util.*" %>
<%
	GzLog log = new GzLog("c:/gzLog");
	log.Write("==============电力缴费：=====1ST PAGE======begin====================");
	String dse_sessionId = MessManTool.changeChar(request.getParameter("dse_sessionId"));//
	String biz_id=MessManTool.changeChar(request.getParameter("biz_id"));
	String step_id = MessManTool.changeChar(request.getParameter("step_id"));
	String cdno = request.getParameter("cardNo");
	log.Write("==========step1:	电力缴费：dianLiJiaoFei1.jsp _biz_id=["+biz_id+"]"+"####CDNO=["+cdno+"]================##############");  
	
  String cssFileName = request.getParameter("cssFileName");//
	if(cssFileName ==null){
		cssFileName = "skin.css";
	}		
%>

<script language="JavaScript"
	src="/personbank/HttpProxy?URL=/midserv/js/public.js&dse_sessionId=<%=dse_sessionId%>"></script>
<script language="JavaScript"
	src="/personbank/HttpProxy?URL=/midserv/js/common.js&dse_sessionId=<%=dse_sessionId%>"></script>
<script language="JavaScript"
	src="/personbank/HttpProxy?URL=/midserv/js/date.js&dse_sessionId=<%=dse_sessionId%>"></script>
	



<html>
	<head>
		<title>交通银行网上服务</title>
		<link rel="stylesheet" type="text/css" href="/personbank/css/<%=cssFileName%>">
		
		
		<script type="text/javascript">
			function tj1(){

						
					var tmp2=document.getElementById("chkDate").value;
					
					if(tmp2.length==1||tmp2.length==6){
					
						document.getElementById("f1").submit(); 
					
					}
					
					else {
						alert("查询日期格式输入错误，请重新输入！");
						return;
					}
					
									
			}
		</script>
		
	</head>
	

	
	
	<body>
		
				<div class="indent">
				<table width="100%" align="center" cellpadding="1" cellspacing="1" class="tab">
				
						<FORM action="/personbank/HttpProxy" method=post name="f1" id="f1">
							<input type="hidden" name="dse_sessionId"	value="<%=dse_sessionId%>">
							<input type="hidden" name="URL"	value="/midserv/dianLiJiaoFei2.jsp">
							<input type="hidden" name=biz_id value="<%=biz_id%>">
							<input type="hidden" name=step_id value="3">
							
							
							
									<tr align="left"> 
										<td class="tab_title">请输入电费单查询信息</td>
									</tr>
									<tr class="tab_tr">
										<td width="50%" align="center" height="22" class="InputTip">
											缴费卡号:
										</td>
										<td width="50%" align="center" height="22" class="InputTip">
											<input type="text" name="cdno" value="<%=cdno%>" readonly="readonly">
										</td>
									</tr>
									
									<tr class="tab_tr">
										<td width="50%" align="center" height="22" class="InputTip">
											客户编号:
										</td>
										<td width="50%" align="center" height="22" class="InputTip">
											<input type="text" name="accountNo"  maxlength="21" value="">
										</td>
									</tr>
									<tr class="tab_tr">
										<td width="50%" align="center" height="22" class="InputTip">
											查询日期:
										</td>
										<td width="50%" align="center" height="22" class="InputTip">
											<input type="text" name="chkDate"  maxlength="6"  value="">
										</td>
									</tr>
									
									
									<tr class="tab_result">
										<td align="center" colspan="2">
											<input type="button" onclick="tj1();" value="下一步" class="button_bg">
											<input type="button" onclick="window.history.back();" value="返 回"	class="button_bg">
										</td>
									</tr>
							</table>
							
						</FORM>
						
					<label>查询日期输入方式：<br/>
											1: 查询特定年月的电费，请输入6位号码，前4位为年份，后2位为月份，如：201202
					</label>
					<br/>
					<label>
											2: 如果想查询所有电费账单，输入任意1位数字即可。
					</label>
									
				</div>
		
	</body>
</html>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	