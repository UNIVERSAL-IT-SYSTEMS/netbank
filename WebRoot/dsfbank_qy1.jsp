<!--标准页面服务对象引用-->
<%@ page language="java" contentType="text/html;charset=GBK" %>
<%@ page import="com.viatt.util.*"%>
<%@ page import="java.util.*" %>
<%@ page import="com.gdbocom.util.communication.*" %>
<%@ page import="com.gdbocom.util.format.*" %>
<%@ include file="IPconinf.inc" %>
<%
	  request.setCharacterEncoding("GBK");
	  //静止后退功能防止页面重复提交  【每个页面都需要添加】
 	  response.setHeader("Pragma", "no-cache"); 
	  response.setHeader("Cache-Control", "no-store"); 
	  response.setDateHeader("Expires", -1); 
      //获取登陆类型
      String loginType=request.getParameter("loginType");
   	  loginType="1";
   	  //获取客户证件号
   	  String CLI_IDENTITY_CARD = request.getParameter("CLI_IDENTITY_CARD");
	  pageContext.setAttribute("CLI_IDENTITY_CARD", CLI_IDENTITY_CARD, PageContext.SESSION_SCOPE);
	  Map responseValues = new HashMap();
	  responseValues.putAll(Transation.createMapSend(pageContext,"466603","@SGD_A",TransationFactory.SGD466603));
	  Map responseValue = null;
	  if(responseValues.get("MsgTyp").equals("N")){
		  
	     String CLI_CODE = responseValues.get("CLI_CODE2").toString();
	     String CLI_NAME = responseValues.get("CLI_NAME2").toString();
	     pageContext.setAttribute("CLI_CODE", CLI_CODE, PageContext.SESSION_SCOPE);
	     responseValue = new HashMap();
	     responseValue.putAll(Transation.createMapSend(pageContext,"466604","@SGD_A",TransationFactory.SGD466604));
	  }
   	  //获取dse_sessionId
   	  String dse_sessionId = request.getParameter("dse_sessionId");
   	  //获取客户当前使用的CSS样式
   	  String cssFileName =request.getParameter("cssFileName");
	  if(cssFileName ==null){
		  cssFileName = "skin.css";
	   }
%>
<!-------------------------------------------------------------------
                          标准JavaScript库引用
--------------------------------------------------------------------->
<script language="JavaScript" src="/personbank/HttpProxy?URL=/midserv/js/public.js&dse_sessionId=<%=dse_sessionId%>"></script>
<script language="JavaScript" src="/personbank/HttpProxy?URL=/midserv/js/public_card.js&dse_sessionId=<%=dse_sessionId%>"></script>
<!--------------------------------------------------------------------
   当前页面JavaScript函数部分，包括提交验证，页面动作，具体目标等代码

<!--------------------------------------------------------------------
                          页面HTML表现部分    
---------------------------------------------------------------------->
<html>
<head>
<title>交通银行网上服务</title>
<script language="JavaScript" src="js/public.js"></script>
<script language="JavaScript" >
function condition(){
	var checked= false;
	var redios = document.getElementsByName("mingxi");
	for(var i =0;i<redios.length;i++){
		if(redios[i].checked){
			
			checked= true;
			return true;
		}
	}
	if(!checked){
		
		alert("请选择要修改的项目");
		return false;
	}
}
 
</script>
<link rel="stylesheet" type="text/css" href="/personbank/css/<%=cssFileName%>">
</head>
	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
    <div class="indent">
    <form action="/personbank/HttpProxy" method=post name="form1" onsubmit="return condition();">
		<input type="hidden" name="dse_sessionId" value="<%=dse_sessionId%>">
		<input type="hidden" name="URL" value="/midserv/dsfbank_qy2.jsp">
		
		<%
		//sendPass标志 是否发送验证码 1发送 （loginType=0注册用户时需要 ）
		if (Double.parseDouble(request.getParameter("loginType"))==0){	
		%>
				<input type="hidden" name="sendPass" value="1">
		<%	}
		if (Double.parseDouble(request.getParameter("loginType"))==1){%>
				<input type="hidden" name="sendPass" value="0">
		<%	}%>
		
	    <table cellpadding="1" cellspacing="1" class="tab" width="100%" >
	    		<tr align="left"> 
					<td colspan="5" class="tab_title">代收付——签约 </td>
				</tr>		
        		<tr> 
        		    <td   width="20%"  class="tab_tr"  align="center"></td>
          			<td   width="20%"  class="tab_tr"  align="center">收费企业代码</td>
          			<td   width="20%"  class="tab_tr"  align="center">业务种类</td>
          			<td   width="20%"  class="tab_tr"  align="center">缴费标识</td>
          			<td   width="20%"  class="tab_tr"  align="center">明细状态</td>
    			</tr>
    			<%
    			if(responseValues.get("MsgTyp").equals("N")){
				 if(responseValue.get("MsgTyp").equals("N")){
					    
					 	String list1="";
						List loopBody = (List) responseValue.get("LoopBody");
						String keyOrder[] = new String[] { "CLI_UNIT_CODE",
								"CLI_TRADE_FLAG", "CLI_TRADE_IDENT","CLI_CODE_STATUS" };
						//设置需要显示的值的类型
						Map keyType = new HashMap();
						//设置循环体需要显示的值和名称,
						Map loopShowKey = new HashMap();
						keyType.put("BetLin",
								WelFormatter.getSingleton(WelFormatter.BETNUM));
						for (int recordIndex = 0; recordIndex < loopBody.size(); recordIndex++) {
							Map oneRecord = (Map) loopBody.get(recordIndex);
				%>
  				<tr>
  				<td   width="20%"  class="tab_tr"  align="center"><input type="radio" name="mingxi" value="<%=recordIndex %>"/></td>
				  	<%
				  	for (int keyIndex = 0; keyIndex < keyOrder.length; keyIndex++) {

						String key = keyOrder[keyIndex];
						FormatterInterface type = (FormatterInterface) keyType.get(key);
						//为格式化的值
						String originValue = (String) oneRecord.get(key);
						list1 = list1+originValue;
						if(key.equals("CLI_TRADE_FLAG")){
						   if(originValue.equals("24")){
						      originValue = "仁化伟达服务";
						   }else if(originValue.equals("26")){
						      originValue = "物业";
						   }else if(originValue.equals("51")){
						      originValue = "联通";
						   }else if(originValue.equals("61")){
						      originValue = "电信/铁通";
						   }else if(originValue.equals("63")){
						      originValue = "燃气";
						   }else if(originValue.equals("65")){
						      originValue = "水费";
						   }else if(originValue.equals("66")){
						      originValue = "卫生";
						   }else if(originValue.equals("67")){
						      originValue = "垃圾";
						   }else if(originValue.equals("68")){
						      originValue = "电";
						   }else if(originValue.equals("70")){
						      originValue = "电视";
						   }else if(originValue.equals("81")){
						      originValue = "税务";
						   }else if(originValue.equals("85")){
						      originValue = "社保";
						   }else if(originValue.equals("90")){
						      originValue = "养老保险";
						   }
						}
						
						if(key.equals("CLI_CODE_STATUS")){
						   if(originValue.trim().equals("1")){
						      originValue = "正常";
						   }else if(originValue.trim().equals("2")){
						      originValue = "暂停";
						   }else if(originValue.trim().equals("3")){
						      originValue = "销户";
						   }
						}
					%>
				  	<td   width="20%"  class="tab_tr"  align="center">
				  	   <%=originValue.trim() %>
					</td>
  				<%
					      	}
					  }
				%>
					</tr>
			    <tr class="tab_result">
				   <td align="center" colspan="4">
				   	  <input type="hidden" name="CLI_IDENTITY_CARD" value="<%=CLI_IDENTITY_CARD %>"/>
				   	  <input type="hidden" name="list" value="<%=list1 %>"/>
					  <input type="button" class="button_bg" name="addqy" onclick="location.href='/personbank/HttpProxy?URL=/midserv/SGbank_qySelect.jsp&dse_sessionId=<%=dse_sessionId%>&CLI_IDENTITY_CARD=<%=CLI_IDENTITY_CARD %>'" value="新增">
					  <input type="submit" class="button_bg" name="Submit" value="修改" >
			          <input type="button" class="button_bg" name="Submit2" onclick="javascript:history.back(1)" value="返回">
			       </td>  	
				</tr>
				<%}else{ %>
							<tr>	
								<td colspan="4"  class="tab_tr"  align="center">
									<label><%=responseValue.get("RspMsg") %></label></td>
							</tr>
							<tr class="tab_result">
							   <td align="center" colspan="4">
							      <input type="button" class="button_bg" name="addqy" onclick="location.href='/personbank/HttpProxy?URL=/midserv/SGbank_qySelect.jsp&dse_sessionId=<%=dse_sessionId%>&CLI_IDENTITY_CARD=<%=CLI_IDENTITY_CARD %>'" value="新增">
						          <input type="button" class="button_bg" name="Submit2" onclick="javascript:history.back(1)" value="返回">
						       </td>  	
							</tr>
			<%}
			}else{ %>
			  <tr>	
								<td colspan="4"  class="tab_tr"  align="center">
									<label><%=responseValues.get("RspMsg") %></label></td>
							</tr>
							<tr class="tab_result">
							   <td align="center" colspan="4">
						          <input type="button" class="button_bg" name="Submit2" onclick="javascript:history.back(1)" value="返回">
						       </td>  	
							</tr>
			<%} %>	   		
		</table>
</form>
</div>
</body>
</html>
