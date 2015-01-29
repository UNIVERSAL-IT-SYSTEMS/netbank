<!--标准页面服务对象引用-->
<%@ page language="java" contentType="text/html;charset=GBK" %>
<%@ page import="com.viatt.util.*"%>
<%@ page import="java.util.*" %>
<%@ page import="com.gdbocom.util.communication.*" %>
<%@ page import="com.gdbocom.util.format.*" %>
<%@ include file="IPconinf.inc" %>
<%
	  
	  //静止后退功能防止页面重复提交  【每个页面都需要添加】
	  request.setCharacterEncoding("GBK");
 	  response.setHeader("Pragma", "no-cache"); 
	  response.setHeader("Cache-Control", "no-store"); 
	  response.setDateHeader("Expires", -1); 
      //获取登陆类型
      String FUNFLG= request.getParameter("FUNFLG");
      String loginType= request.getParameter("loginType");
   	  loginType="1";
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
 <script language="javascript" type="text/javascript">
  function condition_tcusid(){
  	
  }
  </script>
<!--------------------------------------------------------------------
   当前页面JavaScript函数部分，包括提交验证，页面动作，具体目标等代码

<!--------------------------------------------------------------------
                          页面HTML表现部分    
---------------------------------------------------------------------->
<html>
<head>
<title>交通银行网上服务</title>
<script language="JavaScript" src="js/public.js"></script>

<link rel="stylesheet" type="text/css" href="/personbank/css/<%=cssFileName%>">
</head>
	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
		<div class="indent">
<form action="/personbank/HttpProxy" method=post name="form1" onsubmit="return condition_tcusid();">
		<input type="hidden" name="dse_sessionId" value="<%=dse_sessionId%>">
		<input type="hidden" name="URL" value="/midserv/dsfbank_zc5.jsp">
		<input type="hidden" name="FUNFLG" value="<%=FUNFLG %>" />
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
			          <td  colspan= "2" class="tab_title">请填写要查询的证件号：</td>
			    </tr>		
		       		<tr>
		   			   		<td width="30%" align="left" class="tab_th">
		   			   		客户证件号：
		   			   		</td>
		   			   		<td width="60%" align="left"  class="tab_tr">
								 <input type="text" name="CLI_IDENTITY_CARD"  value="" /><font color="red"> *</font>
							</td>
				   </tr>
			    <tr class="tab_result">
				   <td align="center" colspan="2">
				      
					  <input type="submit" class="button_bg" name="Submit" value="下一步">
			          <input type="button" class="button_bg" name="Submit2" onclick="javascript:history.back(1)" value="返回">
			       </td>  	
				</tr>
		</table>
		<div class="guide">
		         <ul>提示： <li>*&nbsp;&nbsp;前加*是必填项</li></ul>
		</div>
</form>
</div>
</body>
</html>
