
<!--标准页面服务对象引用-->
<%@ page language="java" contentType="text/html;charset=GBK" %>
<%@ page import="com.viatt.util.*"%>
<%@ page import="java.util.*" %>
<%@ page import="com.gdbocom.util.communication.*" %>
<%@ page import="com.gdbocom.util.format.*" %>
<%@ include file="IPconinf.inc" %>
<%
	  String TXNCNL = "2";
	  /*************************/
	  request.setCharacterEncoding("GBK");
	  //静止后退功能防止页面重复提交  【每个页面都需要添加】
 	  response.setHeader("Pragma", "no-cache"); 
	  response.setHeader("Cache-Control", "no-store"); 
	  response.setDateHeader("Expires", -1); 
      //获取登陆类型
      String loginType=request.getParameter("loginType");
   	  loginType="1";
   	  //获取dse_sessionId
   	  
   	  String FUNFLG = request.getParameter("FUNFLG");
   	  String CLI_NAME = request.getParameter("CLI_NAME");
        String CLI_SEX = request.getParameter("CLI_SEX");
        String CLI_AGE = request.getParameter("CLI_AGE");
        String CLI_EMAIL = request.getParameter("CLI_EMAIL");
        String CLI_STATUS = request.getParameter("CLI_STATUS");
        String CLI_HOME_TELEPHONE = request.getParameter("CLI_HOME_TELEPHONE"); 
        String CLI_MENO = request.getParameter("CLI_MENO");
        String CLI_IDENTITY_CARD = request.getParameter("CLI_IDENTITY_CARD");

   	    String cssFileName =request.getParameter("cssFileName");
		if(cssFileName ==null){
			cssFileName = "skin.css";
		}
	    pageContext.setAttribute("TXNCNL", TXNCNL, PageContext.SESSION_SCOPE);
		 pageContext.setAttribute("CLI_STATUS", CLI_STATUS, PageContext.SESSION_SCOPE);
        pageContext.setAttribute("CLI_MENO", CLI_MENO, PageContext.SESSION_SCOPE);
        pageContext.setAttribute("CLI_HOME_TELEPHONE", CLI_HOME_TELEPHONE, PageContext.SESSION_SCOPE);
    	pageContext.setAttribute("FUNFLG", FUNFLG, PageContext.SESSION_SCOPE);
    	pageContext.setAttribute("CLI_TYPE", "01", PageContext.SESSION_SCOPE);
    	pageContext.setAttribute("CLI_IDENTITY_CARD", CLI_IDENTITY_CARD, PageContext.SESSION_SCOPE);
    	pageContext.setAttribute("CLI_NAME", CLI_NAME, PageContext.SESSION_SCOPE);
    	pageContext.setAttribute("CLI_SEX", CLI_SEX, PageContext.SESSION_SCOPE);
    	pageContext.setAttribute("CLI_AGE", CLI_AGE, PageContext.SESSION_SCOPE);
    	pageContext.setAttribute("CLI_EMAIL", CLI_EMAIL, PageContext.SESSION_SCOPE);
 	
    	Map responseValues = new HashMap();
        responseValues.putAll(
				Transation.createMapSend(pageContext,"466601","@SGD_A",TransationFactory.SGD466601)
			);
		
   	  
   	  
   	  String dse_sessionId = request.getParameter("dse_sessionId");
   	  
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
		<input type="hidden" name="URL" value="/midserv/dsfbank_zc1.jsp">
		<%
		//sendPass标志 是否发送验证码 1发送 （loginType=0注册用户时需要 ）
		if (Double.parseDouble(request.getParameter("loginType"))==0){	
		%>
				<input type="hidden" name="sendPass" value="1">
		<%	}
		if (Double.parseDouble(request.getParameter("loginType"))==1){%>
				<input type="hidden" name="sendPass" value="0">
		<%}%>
		
	    <table cellpadding="1" cellspacing="1" class="tab" width="100%" >
	     		<tr align="left"> 
			          <td  colspan= "2" class="tab_title">交易结果：</td>
			    </tr>	
			    <%if(responseValues.get("MsgTyp").equals("N")){ %>	
		       		<tr>
		   			   		<td width="30%" align="left" class="tab_th">
		   			   		   交易成功
		   			   		</td>
		   			   		
				   </tr>
				   <%}else{ %>
				   <tr>
				        <td width="30%" align="left" class="tab_th">
		   			   		   <%=responseValues.get("RspMsg") %>
		   			   		</td>
		   		</tr>
				   <%} %>
		
		</table>
		
</form>
</div>
</body>
</html>
	