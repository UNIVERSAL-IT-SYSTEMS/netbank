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
   	  //获取dse_sessionId
   	  String dse_sessionId = request.getParameter("dse_sessionId");
      //获取登陆类型
      String loginType=request.getParameter("loginType");
   	  loginType="1";
   	  //获取客户当前使用的CSS样式
   	  String cssFileName =request.getParameter("cssFileName");
	  if(cssFileName ==null){
		
		  cssFileName = "skin.css";
	   }
		String CrdNo = request.getParameter("cardNo");  //银行账户
		pageContext.setAttribute("ACTNO", CrdNo, PageContext.SESSION_SCOPE);
		Map responseValue = new HashMap();
			 responseValue.putAll(
			Transation.createMapSend(pageContext,"466676","@SGD_A",TransationFactory.SGD466676)
		);
	 
		String ACCNAM = null;
		if(responseValue.get("MsgTyp").equals("N")){
		    ACCNAM = responseValue.get("ACTNAM").toString().trim();
		}
		String BUSTYPE = request.getParameter("zl");   
		String AREANUM = request.getParameter("areanum");
		String ENTERID = request.getParameter("qy");
		String BUSCLA = request.getParameter("BUSCLA");
		String BUSCLAHAN=null;
		if(BUSCLA.trim().equals("01")){
		     BUSCLAHAN="税务";
		}else if(BUSCLA.trim().equals("02")){
		     BUSCLAHAN="社保";
		}else if(BUSCLA.trim().equals("03")){
		     BUSCLAHAN="居民养老保险";
		}else if(BUSCLA.trim().equals("04")){
		     BUSCLAHAN="通讯";
		}else if(BUSCLA.trim().equals("05")){
		     BUSCLAHAN="水费";
		}else if(BUSCLA.trim().equals("06")){
		     BUSCLAHAN="电费";
		}else if(BUSCLA.trim().equals("07")){
		     BUSCLAHAN="燃气";
		}else if(BUSCLA.trim().equals("08")){
		     BUSCLAHAN="电视";
		}else if(BUSCLA.trim().equals("09")){
		     BUSCLAHAN="物业";
		}
		
		String PAYFLG = request.getParameter("CLI_TRADE_IDENT").toString();
		String CLI_IDENTITY_CARD = request.getParameter("CLI_IDENTITY_CARD");
		String errPage = "";
	 	pageContext.setAttribute("CLI_IDENTITY_CARD", CLI_IDENTITY_CARD, PageContext.SESSION_SCOPE);
	 	
	 	Map responseValues = new HashMap();
		try{
			 
			 responseValues.putAll(
			Transation.createMapSend(pageContext,"466603","@SGD_A",TransationFactory.SGD466603)
		);
			
		}catch(Exception e){
			String RspCod = "LOT999";
			String RspMsg = "通讯故障"; 
			StringBuffer forwardString = new StringBuffer();
			forwardString.append(errPage).append("?");
			forwardString.append("RspCod").append("=").append(RspCod);
			forwardString.append("&");
			forwardString.append("RspMsg").append("=").append(RspMsg);
	        pageContext.forward(forwardString.toString());
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
<!--script language=JavaScript src="js/writeActivxObject.js"></script-->
<script language="JavaScript" src="/personbank/js/writeNewActivxObjectForProxy.js"></script> <%--引用总行端公用JS，不需要引用HttpProxy--%>
<script language="JavaScript"> writeNewCommitActivxObject ('/personbank/')</script>
<script language="JavaScript">
var clickBoolean = true;
function beforeSubmit(){
    if(clickBoolean){
    	
    	document.safeInput1.commit("safeCommit1");
    	document.safeCommit1.submit("form1");
    	clickBoolean = false;
    }
}
</script>    
<link rel="stylesheet" type="text/css" href="/personbank/css/<%=cssFileName%>">
</head>
	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
		<div class="indent">
<form action="/personbank/HttpProxy" method=post name="form1" >
		<input type="hidden" name="dse_sessionId" value="<%=dse_sessionId%>">
		<input type="hidden" name="URL" value="/midserv/dsfbank_qyzc2.jsp">
		<input type="hidden" name="BUSCLA" value="<%=BUSCLA %>">
		<input type="hidden" name="bocomPwd" value="">
		
		<%	 
		if(responseValues.get("MsgTyp").equals("N")){
	
    		    String CLI_CODE = responseValues.get("CLI_CODE2").toString().trim();
    		    String CLI_NAME = responseValues.get("CLI_NAME2").toString().trim();
    	    	
		 %>
		 <table cellpadding="1" cellspacing="1" class="tab" width="100%" >
	     		<tr align="left"> 
			          <td  colspan= "2" class="tab_title">请选择地区及收费企业：</td>
			    </tr>
			    <tr>
		  			<td width="30%" align="left" class="tab_th">客户证件号：</td>
				  	<td width="60%" align="left"  class="tab_tr"><%=CLI_IDENTITY_CARD %></td>
				 </tr>
				 <tr>
		  			<td width="30%" align="left" class="tab_th">客户姓名：</td>
				  	<td width="60%" align="left"  class="tab_tr"><%=CLI_NAME %></td>
				 </tr>
				 <tr>
		  			<td width="30%" align="left" class="tab_th">付款账号：</td>
				  	<td width="60%" align="left"  class="tab_tr"><%=CrdNo %></td>
				 </tr>
				 <tr>
		  			<td width="30%" align="left" class="tab_th">账号户名：</td>
				  	<td width="60%" align="left"  class="tab_tr"><%=ACCNAM %></td>
				 </tr>
				 <tr>
		  			<td width="30%" align="left" class="tab_th">业务分类：</td>
				  	<td width="60%" align="left"  class="tab_tr"><%=BUSCLAHAN %></td>
				 </tr>
				 <tr>
		  			<td width="30%" align="left" class="tab_th">区      域：</td>
				  	<td width="60%" align="left"  class="tab_tr"><%=AREANUM.substring(2).trim() %></td>
				 </tr>
				 <tr>
		  			<td width="30%" align="left" class="tab_th">收费企业：</td>
				  	<td width="60%" align="left"  class="tab_tr"><%=ENTERID.substring(6).trim() %></td>
				 </tr>
				 <tr>
		  			<td width="30%" align="left" class="tab_th">业务种类：</td>
				  	<td width="60%" align="left"  class="tab_tr"><%=BUSTYPE.substring(2).trim()  %></td>
				 </tr>
				 <tr>
		  			<td width="30%" align="left" class="tab_th">缴费标识：</td>
				  	<td width="60%" align="left"  class="tab_tr"><%=PAYFLG %></td>
				 </tr>
				  <tr>
				     <td width="30%" align="left" class="tab_th">交易密码：</td>
				     <td width="60%" align="left"  class="tab_tr">
					 <SCRIPT language=JavaScript> writeNewPwdActivxObjectLenClass ('safeInput1','safeInput1','/personbank/','bocomPwd',20,6,'20','153','<%=dse_sessionId%>')</SCRIPT>
					</td>
				  </tr>
				 <tr class="tab_result">
				   <td align="center" colspan="2">
					  <input type="button" class="button_bg" name="Submit" onclick="javascript:beforeSubmit();" value="提交" >
			          <input type="button" class="button_bg" name="Submit2" onclick="javascript:history.back(1)" value="返回">
			       </td>  	
				 </tr>
		    <input type='hidden' name='BUSCLA'  value="<%=BUSCLA %>"/>
    		<input type='hidden' name='AREANUM'  value="<%=AREANUM %>"/>
    		<input type='hidden' name='BUSTYPE'  value="<%=BUSTYPE %>"/>
    		<input type='hidden' name='ENTERID'  value="<%=ENTERID %>"/>
    		<input type='hidden' name='CLI_CODE'  value='<%=CLI_CODE %>'/>
    		<input type='hidden' name='CLI_NAME'  value='<%=CLI_NAME %>'/>
    		<input type='hidden' name='CLI_TRADE_IDENT'  value="<%=PAYFLG %>"/>
    		<input type='hidden' name='CLI_IDENTITY_CARD'  value='<%=CLI_IDENTITY_CARD %>'/>
    		<%
    			}else{
			
    			%>
    				<label><%=responseValues.get("RspMsg") %></label>
    			<%
    			}
    		 %>
    		 </table>
</form>
</div>
</body>
</html>
