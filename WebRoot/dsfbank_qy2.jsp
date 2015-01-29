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
   	  //获取dse_sessionId
   	  String dse_sessionId = request.getParameter("dse_sessionId");
   	  //获取客户当前使用的CSS样式
   	  String cssFileName =request.getParameter("cssFileName");
	  if(cssFileName ==null){
		  cssFileName = "skin.css";
	   }
	  
		String uri = request.getRequestURI();
		String CrdNo = request.getHeader("MBK_ACCOUNT"); //银行账户
		String sjNo = request.getHeader("MBK_MOBILE"); //手机号码
		String CLI_IDENTITY_CARD = request.getParameter("CLI_IDENTITY_CARD");
		String radio = request.getParameter("mingxi");
		int a = Integer.parseInt(radio);
		String list = request.getParameter("list");
		
		
		String CLI_UNIT_CODE = "";
		String CLI_TRADE_FLAG = "";
		String CLI_TRADE_IDENT = "";
		
		    CLI_UNIT_CODE = list.substring(a*29, 6+a*29);
	    	
	    	CLI_TRADE_FLAG = list.substring(6+a*29, 8+a*29);
	    	
	    	CLI_TRADE_IDENT = list.substring(8+a*29, 23+a*29).trim();
	    	
		String errPage = "";
		pageContext.setAttribute("CLI_UNIT_CODE", CLI_UNIT_CODE,
		PageContext.SESSION_SCOPE);
		pageContext.setAttribute("CLI_TRADE_FLAG", CLI_TRADE_FLAG,
		PageContext.SESSION_SCOPE);
		pageContext.setAttribute("CLI_TRADE_IDENT", CLI_TRADE_IDENT,
		PageContext.SESSION_SCOPE);
		Map responseValues = new HashMap();
		responseValues.putAll(Transation.createMapSend(pageContext,	"466675", "@SGD_A", TransationFactory.SGD466675));
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
	 function logonSubmit(){
		 
		 var val = document.getElementById("jfbz").value;
		 if(val==""){
			 
			 alert("请输入缴费标志");
			 return false;
		 }
	 }
</script>
<link rel="stylesheet" type="text/css" href="/personbank/css/<%=cssFileName%>">
</head>
	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
		<div class="indent">
<form action="/personbank/HttpProxy" method=post name="form1" onsubmit="return logonSubmit();">
		<input type="hidden" name="dse_sessionId" value="<%=dse_sessionId%>">
		<input type="hidden" name="URL" value="/midserv/dsfbank_qy3.jsp">
		<%
		//sendPass标志 是否发送验证码 1发送 （loginType=0注册用户时需要 ）
		if (Double.parseDouble(request.getParameter("loginType"))==0){	
		%>
				<input type="hidden" name="sendPass" value="1">
		<%	}
		if (Double.parseDouble(request.getParameter("loginType"))==1){%>
				<input type="hidden" name="sendPass" value="0">
		<%	} 	
		
			if(responseValues.get("MsgTyp").equals("N")){
			String CLI_CODE = responseValues.get("CLI_CODE").toString();
			String CLI_NAME = responseValues.get("CLI_NAME").toString();
			String BUSCLA = responseValues.get("BUSCLA").toString();
			String AREACOD = responseValues.get("AREACOD").toString();
			
			String CLI_BANK_ACCOUNT = responseValues.get("CLI_BANK_ACCOUNT").toString();
			String CLI_BANK_ACCNAM = responseValues.get("CLI_BANK_ACCNAM").toString();
			String FLAG = null;
			if(CLI_TRADE_FLAG.equals("24")){
						      FLAG = "仁化伟达服务";
						   }else if(CLI_TRADE_FLAG.equals("26")){
						      FLAG = "物业";
						   }else if(CLI_TRADE_FLAG.equals("51")){
						      FLAG = "联通";
						   }else if(CLI_TRADE_FLAG.equals("61")){
						      FLAG = "电信/铁通";
						   }else if(CLI_TRADE_FLAG.equals("63")){
						      FLAG = "燃气";
						   }else if(CLI_TRADE_FLAG.equals("65")){
						      FLAG = "水费";
						   }else if(CLI_TRADE_FLAG.equals("66")){
						      FLAG = "卫生";
						   }else if(CLI_TRADE_FLAG.equals("67")){
						      FLAG = "垃圾";
						   }else if(CLI_TRADE_FLAG.equals("68")){
						      FLAG = "电";
						   }else if(CLI_TRADE_FLAG.equals("70")){
						      FLAG = "电视";
						   }else if(CLI_TRADE_FLAG.equals("81")){
						      FLAG = "税务";
						   }else if(CLI_TRADE_FLAG.equals("85")){
						      FLAG = "社保";
						   }else if(CLI_TRADE_FLAG.equals("90")){
						      FLAG = "养老保险";
						   }
		
		 %>
		 
		<table cellpadding="1" cellspacing="1" class="tab" width="100%" >
		  <tr align="left"> 
		          <td  colspan= "2" class="tab_title">代收付——签约 </td>
		  </tr>		
		  <tr>
		     <td   width="30%"  class="tab_th"  align="left">缴费地区：</td>
		     <td width="60%"  class="tab_tr" align="left"><%=strbranchName %></td>
		  </tr>
		  <tr>
		     <td   width="30%"  class="tab_th"  align="left">客户姓名：</td>
		     <td width="60%"  class="tab_tr" align="left"><%=CLI_NAME %></td>
		  </tr>
		  <tr>
		     <td   width="30%"  class="tab_th"  align="left">客户证件号：</td>
		     <td width="60%"  class="tab_tr" align="left"><%=CLI_IDENTITY_CARD %></td>
		  </tr>
		  <tr>
		     <td   width="30%"  class="tab_th"  align="left">签约账号：</td>
		     <td width="60%"  class="tab_tr" align="left"><%=CLI_BANK_ACCOUNT %></td>
		  </tr>
		  <tr>
		     <td   width="30%"  class="tab_th"  align="left">签约户名：</td>
		     <td width="60%"  class="tab_tr" align="left"><%=CLI_BANK_ACCNAM%></td>
		  </tr>
		  <tr>
			     <td   width="30%"  class="tab_th"  align="left">业务种类：</td>
			     <td width="60%"  class="tab_tr" align="left"><%=FLAG %></td>
		  </tr>
		  <tr>
			     <td   width="30%"  class="tab_th"  align="left">收款企业代码：</td>
			     <td width="60%"  class="tab_tr" align="left"><%=CLI_UNIT_CODE %></td>
		  </tr>
		  <tr>
			     <td   width="30%"  class="tab_th"  align="left">缴费标识: </td>
			     <td width="60%"  class="tab_tr" align="left"><input  type="text" id="jfbz" name="CLI_TRADE_IDENT" maxlength="15" value="<%=CLI_TRADE_IDENT %>"  /></td>
		  </tr>
		  <tr>
			     <td   width="30%"  class="tab_th"  align="left">明细状态：</td>
			     <td width="60%"  class="tab_tr" align="left">
			    	<select name="CLI_CODE_STATUS"  >
				        <option value="1">正常</option>
				        <option value="2">暂停</option>
				        <option value="3">销户</option>
			        </select>
			     </td>
		  </tr>
   
		<input type='hidden' name='CLI_UNIT_CODE'  value='<%=CLI_UNIT_CODE %>'/>
		<input type='hidden' name='CLI_TRADE_FLAG'  value='<%=CLI_TRADE_FLAG %>'/>
		<input type='hidden' name='AREACOD'  value='<%=AREACOD %>'/>
		<input type='hidden' name='BUSCLA'  value='<%=BUSCLA %>'/>
		<input type='hidden' name='CLI_CODE' value='<%=CLI_CODE %>'/>
		<input type='hidden' name='CLI_NAME' value='<%=CLI_NAME %>'/>
		<input type='hidden' name='CLI_BANK_ACCOUNT'  value='<%=CLI_BANK_ACCOUNT %>'/>
		<input type='hidden' name='CLI_BANK_ACCNAM'  value='<%=CLI_BANK_ACCNAM %>'/>
		<input type='hidden' name='CLI_TRADE_FLAG'  value='<%=CLI_TRADE_FLAG %>'/>
		<input type='hidden' name='CLI_IDENTITY_CARD'  value='<%=CLI_IDENTITY_CARD %>'/>
		<tr class="tab_result">
	   	 <td align="center" colspan="2">
			 <input type="submit" class="button_bg" name="SubmitNo"   value="提交">
	         <input type="button" class="button_bg" name="Submit2" onclick="javascript:history.back(1)" value="返回">
	     </td>  	
		</tr>
		<%}else{ %>
				<tr class="tab_result">
			   	 <td align="center" colspan="2">
					<label><%=responseValues.get("RspMsg") %></label>
					<input type="button" class="button_bg" name="Submit2" onclick="javascript:history.back(1)" value="返回">
			     </td>  	
				</tr>
					
			<%} %>	   	
	 </table>	
</form>
</div>
</body>
</html>
