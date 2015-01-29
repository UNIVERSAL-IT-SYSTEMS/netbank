<!--标准页面服务对象引用-->
<%@ page language="java" contentType="text/html;charset=GBK" %>
<%@ page import="com.viatt.util.*"%>
<%@ page import="java.util.*" %>
<%@ page import="com.gdbocom.util.communication.*" %>
<%@ page import="com.gdbocom.util.format.*" %>
<%@ include file="IPconinf.inc" %>
<%		
		 String TXNCNL = "2";
		 request.setCharacterEncoding("GBK");
		//静止后退功能防止页面重复提交 【每个页面都需要添加】
		response.setHeader("Pragma", "no-cache"); 
		response.setHeader("Cache-Control", "no-store"); 
		response.setDateHeader("Expires", -1); 
		//------------------------签名开始--------------------
		String logonUserDn="";
		String isVerifySign="0";
		String remoteIp  = request.getParameter("remoteIp");
		String loginType = request.getParameter("loginType");//传送登录类别 0－注册用户(手机版) 1－证书用户 20120418
		//loginType="1";
		
		//------------------------签名结束-------------------- 
		String areanum = request.getParameter("areanum");
		//获取dse_sessionId
	  	String dse_sessionId = request.getParameter("dse_sessionId");
		//动态校验码
		String dynamicCode=request.getParameter("dynamicCode");
		AppParam.setParam(dse_sessionId,dynamicCode);
		//校验码序列号
		String dynamicCodeSeq=request.getParameter("dynamicCodeSeq");
		//获取分类 
	    String BUSCLA =request.getParameter("BUSCLA");
		//获取卡号
	  	String cardNo=request.getParameter("cardNo");
	  	//获取客户当前使用的CSS样式
	  	String cssFileName   = request.getParameter("cssFileName");
	  	//获取地区信息  
 	    String FUNFLG = request.getParameter("FUNFLG");
	  	String BUSTYPE = request.getParameter("zl").substring(0, 2);
	  	String BUSTYPEHAN = request.getParameter("zl").substring(2).trim();
	  	
	  	pageContext.setAttribute("TXNCNL", TXNCNL, PageContext.SESSION_SCOPE);
	  	pageContext.setAttribute("BUSCLA", request.getParameter("BUSCLA"), PageContext.SESSION_SCOPE);
	 	pageContext.setAttribute("TXNCNL", "2", PageContext.SESSION_SCOPE);
	 	pageContext.setAttribute("BUSTYPE", request.getParameter("zl").substring(0, 2), PageContext.SESSION_SCOPE);
	 	pageContext.setAttribute("COMPNO", request.getParameter("qy").substring(0, 6), PageContext.SESSION_SCOPE);
	 	pageContext.setAttribute("PAYFLG", request.getParameter("FUNFLG"), PageContext.SESSION_SCOPE);
		Map responseValues = new HashMap();
		responseValues.putAll(
				Transation.createMapSend(pageContext,"466611","@SGD_A",TransationFactory.SGD466611)
			);
		//获取银行卡号  
		pageContext.setAttribute("ACTNO", cardNo, PageContext.SESSION_SCOPE);
		Map responseValue = new HashMap();
		responseValue.putAll(
			Transation.createMapSend(pageContext,"466676","@SGD_A",TransationFactory.SGD466676));
		String ACCNAM = null;
		if(responseValue.get("MsgTyp").equals("N")){
		    ACCNAM = responseValue.get("ACTNAM").toString().trim();
		}
		//后退缺少登陆类型提示错误信息
	   	if (Double.parseDouble(loginType)==2){
			
	  		response.sendRedirect("errorlogintype.html");
			return;
		}
		if(cssFileName ==null){
		
			cssFileName = "skin.css";
		}
	    if (Double.parseDouble(loginType) == 0) {
		//测试时候可显示在页面
		if (iDynamic == 1) {
			//out.println("动态密码:" + dynamicCode + "_"+dynamicCodeSeq);
		}
	}
	//签名2
	if (Double.parseDouble(loginType)==1){
	 
		logonUserDn = request.getParameter("logonUserDn");//获取登录证书DN
	 	isVerifySign="1";
	%>
	<script language=JavaScript src="/personbank/js/public.js"></script> 
	<script language=JavaScript> writeSignActivxObject('/personbank/')</script>
	<%
	}
%>
<!--标准JavaScript库引用-->
<script language="JavaScript" src="/personbank/js/writeNewActivxObjectForProxy.js"></script> <%--引用总行端公用JS，不需要引用HttpProxy--%>
<script language="JavaScript" src="/personbank/HttpProxy?URL=/midserv/js/public.js&dse_sessionId=<%=dse_sessionId%>"></script>
<script language="JavaScript" src="/personbank/HttpProxy?URL=/midserv/js/public_card.js&dse_sessionId=<%=dse_sessionId%>"></script>
<script language="JavaScript"> 
	try{
	if (window.Event) 
		document.captureEvents(Event.MOUSEUP); 
	}catch(e){}
	function nocontextmenu(){
		event.cancelBubble = true
		event.returnValue = false;
		return false;
	}
	function norightclick(e) {
		if (window.Event){
		 try{
			if (e.which == 2 || e.which == 3)
			return false;
			}catch(e){
			}
		}
		else if (event.button == 2 || event.button == 3){
			event.cancelBubble = true
			event.returnValue = false;
			return false;
		}
	}
	document.oncontextmenu = nocontextmenu; // for IE5+
	document.onmousedown = norightclick; // for all others
</script>
<html>
<head>
<title>交通银行个人网上银行</title>
<link rel="stylesheet" type="text/css"	href="/personbank/css/skin.css" />
<style>
.tail_info{
	display:block;
	text-align:left;
	color:#407fab;
	line-height:22px;
	margin-top:10px;
}
.td_input{height:20;}
</style>
	<script language="JavaScript">
		document.oncontextmenu = function() { return false;}
	</script>
	<!--当前页面JavaScript函数部分，包括提交验证，页面动作，具体目标等代码-->
<script language="JavaScript">
	var clickBoolean = true;
	function logonSubmit(){
    if(document.safeInput1.isValid()){
     
		alert("密码不合法，请输入合法的密码");
		return ;
    }
    <%if(Double.parseDouble(loginType)==0){%>
    if(document.getElementById("dynamic").value!=<%=dynamicCode%>){
    	alert("短信密码输入不正确");
		return ;
    }
    <%}%>
	//------------------------签名3开始--------------------
	var loginType ='<%=loginType%>';
	if(loginType=="1")
	{
		
		var LOGNO =this.document.form1.LOGNO.value;
		var PAYFLG =this.document.form1.PAYFLG.value;
		var PAYACT =this.document.form1.PAYACT.value;
		var ACCNAM =this.document.form1.ACCNAM.value;
		var TXNAMT =this.document.form1.TXNAMT.value;
		var CLI_NAME =this.document.form1.CLI_NAME.value;
		var signData ='|LOGNO=' + LOGNO +  '|PAYFLG=' + PAYFLG+'|PAYACT=' + PAYACT +'|ACCNAM=' + ACCNAM +'|TXNAMT=' + TXNAMT  +'|CLI_NAME=' + CLI_NAME ;
		InfoSecNetSign1.NSServerMode = 0;
		InfoSecNetSign1.NSSetPlainText(signData);
		this.document.form1.signData.value= InfoSecNetSign1.NSAttachedSign('<%=logonUserDn%>');
			if (!this.document.form1.signData.value)
			{
				alert("签名操作取消！");
				return ;
			}
	}		
	//------------------------签名3结束--------------------
    if(clickBoolean){
	    document.safeInput1.commit("safeCommit1");
	    document.safeCommit1.submit("form1");
	    clickBoolean = false;
    }
}
</script>
<!--页面HTML表现部分-->
<link rel="stylesheet" type="text/css" href="/personbank/css/<%=cssFileName%>">
<script language="JavaScript" src="js/public.js"></script>
<script language="JavaScript" src="/personbank/js/writeNewActivxObjectForProxy.js"></script> <%--引用总行端公用JS，不需要引用HttpProxy--%>
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<div class="indent">
 <script language=JavaScript> writeNewCommitActivxObject('/personbank/')</script>
 <%
 	String TXNAMT ="";
 	String LOGNO ="";
 	String CLI_NAME ="";
   if(responseValues.get("MsgTyp").equals("N")){
	   
	    	TXNAMT = responseValues.get("TXNAMT").toString().trim();
			LOGNO = responseValues.get("LOGNO").toString().trim();
			CLI_NAME = responseValues.get("MACTXT").toString().trim();
   }
	if(responseValue.get("MsgTyp").equals("N")){
	    ACCNAM = responseValue.get("ACTNAM").toString().trim();
	}
	if(responseValues.get("MsgTyp").equals("N")&&responseValue.get("MsgTyp").equals("N")){
		
%>
<form action="/personbank/HttpProxy" method="post" name="form1" >
	<input type="hidden" name="dse_sessionId" value="<%=dse_sessionId%>"/>
	<input type="hidden" name="URL" value="/midserv/dsfbank_sw2.jsp"/>
	<input type="hidden" name="ActNo" value="<%=cardNo%>">
	<input type="hidden" name="TXNAMT" value="<%=TXNAMT%>">
	<input type="hidden" name="CLI_NAME" value="<%=CLI_NAME%>">
	<input type="hidden" name="bocomPwd" value="">
	<table cellpadding="1" cellspacing="1" class="tab" width="100%" >
   <tr align="left"> 
          <td  colspan= "2" class="tab_title">代收付——缴费 </td>
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
     <td   width="30%"  class="tab_th"  align="left">付款卡号：</td>
     <td width="60%"  class="tab_tr" align="left"><%=cardNo %></td>
  </tr>
      <tr>
     <td   width="30%"  class="tab_th"  align="left">账号户名：</td>
     <td width="60%"  class="tab_tr" align="left"><%=ACCNAM %></td>
  </tr>
      <tr>
     <td   width="30%"  class="tab_th"  align="left">业务种类：</td>
     <td width="60%"  class="tab_tr" align="left"><%=BUSTYPEHAN%></td>
  </tr>
       <tr>
     <td   width="30%"  class="tab_th"  align="left">缴费标识：</td>
     <td width="60%"  class="tab_tr" align="left"><%=FUNFLG %></td>
  </tr>
       <tr>
     <td   width="30%"  class="tab_th"  align="left">需缴纳金额：</td>
     <td width="60%"  class="tab_tr" align="left"><%=TXNAMT %></td>
  </tr>
	  <tr>
	     <td width="30%" align="left" class="tab_th">交易密码：</td>
	     <td width="60%" align="left"  class="tab_tr">
	<SCRIPT language=JavaScript> writeNewPwdActivxObjectLenClass('safeInput1','safeInput1','/personbank/','bocomPwd',20,6,'20','120','<%=dse_sessionId%>')</SCRIPT>		
		</td>
	  </tr>
	    <input type='hidden' name='AREANUM'  value="<%=request.getParameter("qy").substring(0, 6) %>"/>
		<input type='hidden' name='LOGNO'  value='<%=LOGNO %>'/>
		<input type='hidden' name='PAYFLG'  value="<%=request.getParameter("FUNFLG") %>"/>
		<input type='hidden' name='BUSTYPE'  value="<%=BUSTYPE %>"/>
		<input type='hidden' name='BUSTYPEHAN'  value="<%=BUSTYPEHAN %>"/>
		<input type='hidden' name='TXNAMT'  value="<%=TXNAMT %>"/>
		<input type='hidden' name='PAYACT'  value="<%=cardNo%>"/> <!-- cardNo -->
		<input type='hidden' name='ACCNAM'  value="<%=ACCNAM %>"/>
<%if (Double.parseDouble(loginType)==0){ %>
	  <tr>
	     <td width="30%" align="left" class="tab_th">手机动态密码：</td>
	     <td width="60%" align="left"  class="tab_tr">
	     	<input type="text" name="dynamic" value="">
	       	序列号<%=dynamicCodeSeq%>
	        <div id='resendprompt'>
	       	<a href="#" onClick="resend()">如果没收到手机验证码，点击这里重发。</a>
	       	</div></td>
	  </tr>
<%
  }  
%>
<%  
//-------------------------------签名4----------------------------------
if (Double.parseDouble(loginType)==1){ %>
	<input type="hidden" name="isVerifySign"	value="<%=isVerifySign%>"/>			
	<input type="hidden" name="signKey" 		value="<%=cardNo%>"/>	
	<input type="hidden" name="signTranCode"	value="466670"/>		
	<input type="hidden" name="signData"/>							
<%
//-------------------------------签名4---------------------------------
}%>		
    <tr class="tab_result">
	   	 <td align="center" colspan="2">
			 <input type="button" class="button_bg" name="SubmitNo"  onClick="javascript:logonSubmit()"   value="提交">
	         <input type="button" class="button_bg" name="Submit2" onclick="javascript:history.back(1)" value="返回">
	     </td>  	
	</tr>
  </table> 
</form>	
<% }else{
	
	if(responseValues.get("MsgTyp").equals("E")){
		%>
		<label><%=responseValues.get("RspMsg") %></label>
		<%
	}else if(responseValue.get("MsgTyp").equals("E")){	
%>
		<label><%=responseValue.get("RspMsg") %></label>
<%
}
}
	%>
<script type="text/javascript">
function resend(){
  var http=new ActiveXObject("Microsoft.XMLHTTP");
  if(http){
    
	  http.open ("POST","/personbank/HttpProxy",false);
      http.setRequestHeader ("Content-Type","application/x-www-form-urlencoded");
      http.send ("URL=/servlet/TransServlet&dse_sessionId=<%=dse_sessionId%>&sendPass=2");
  }
  document.getElementById("resendprompt").innerHTML = "手机动态验证码已再次发送，请查收。";
}
</script>
</div>
</body>
</html>