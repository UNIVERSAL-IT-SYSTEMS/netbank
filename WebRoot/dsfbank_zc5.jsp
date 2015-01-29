
<!--标准页面服务对象引用-->
<%@ page language="java" contentType="text/html;charset=GBK" %>
<%@ page import="com.viatt.util.*"%>
<%@ page import="java.util.*" %>
<%@ page import="com.gdbocom.util.communication.*" %>
<%@ page import="com.gdbocom.util.format.*" %>
<%@ include file="IPconinf.inc" %>
<%
	  String TXNCNL = "2";
	  /***********************/
	  request.setCharacterEncoding("GBK");
	  //静止后退功能防止页面重复提交  【每个页面都需要添加】
 	  response.setHeader("Pragma", "no-cache"); 
	  response.setHeader("Cache-Control", "no-store"); 
	  response.setDateHeader("Expires", -1); 
      //获取登陆类型
      String loginType=request.getParameter("loginType");
      //System.out.println("===============loginType:"+loginType+"=================");
   	  loginType="1";
   	  //获取dse_sessionId
   	  
     	String FUNFLG = request.getParameter("FUNFLG");
     	//System.out.println("FUNFLG:"+FUNFLG);
        String CLI_IDENTITY_CARD = request.getParameter("CLI_IDENTITY_CARD");
   	   
   	    String cssFileName =request.getParameter("cssFileName");
		if(cssFileName ==null){
			cssFileName = "skin.css";
		}
	    
		pageContext.setAttribute("TXNCNL", TXNCNL, PageContext.SESSION_SCOPE);
    	pageContext.setAttribute("CLI_IDENTITY_CARD", CLI_IDENTITY_CARD, PageContext.SESSION_SCOPE);
 	
    	Map responseValues = new HashMap();
        responseValues.putAll(
				Transation.createMapSend(pageContext,"466602","@SGD_A",TransationFactory.SGD466602)
			);
		
   	 //System.out.println("=============================");
   	  String dse_sessionId = request.getParameter("dse_sessionId");
   	  //System.out.println("==============="+dse_sessionId+"============");
   	  
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
			          <td  colspan= "2" class="tab_title">客户信息：</td>
			    </tr>	
			    <%if(responseValues.get("MsgTyp").equals("N")){
			          String CLI_NAME = responseValues.get("CLI_NAME").toString();
                      String CLI_SEX = responseValues.get("CLI_SEX").toString();
                      String CLI_AGE = responseValues.get("CLI_AGE").toString();
                      String CLI_EMAIL = responseValues.get("CLI_EMAIL").toString().trim();
                     String CLI_STATUS = responseValues.get("CLI_STATUS").toString();
                     String CLI_HOME_TELEPHONE = responseValues.get("CLI_HOME_TELEPHONE").toString(); 
                       String CLI_MENO = responseValues.get("CLI_MENO").toString().trim();
                       if(CLI_MENO.equals("无")){
                            CLI_MENO = "";
                       }
                       if(CLI_EMAIL.equals("guangzhou@126.com")){
                          CLI_EMAIL = "";
                       }
                       String SEX = null;
                       if(CLI_SEX.equals("0")){
                    	   SEX="女";
                    	}else if(CLI_SEX.equals("1")){
                     	   SEX="男";
                    	}
                        	String STATUS = null;
                    	if(CLI_STATUS.equals("1")){
                     	   STATUS="正常";
                      	}else if(CLI_STATUS.equals("2")){
                       	   STATUS="暂停";
                     	}else if(CLI_STATUS.equals("3")){
                          	   STATUS="销户";
                          	}
			        if(FUNFLG.equals("1")){
			        
			     %>	
		       		<tr>
		   			   		<td width="30%" align="left" class="tab_th">
		   			   		客户姓名：
		   			   		</td>
		   			   		<td width="60%" align="left"  class="tab_tr">
								<input type="text" name="CLI_NAME"  value="<%=CLI_NAME %>" /><font color="red"> *</font>
							</td>
				   </tr>
				
  				<tr>
		   			   		<td width="30%" align="left" class="tab_th">
							客户年龄：
							</td>
							<td width="60%" align="left"  class="tab_tr">
								<input type="text" name="CLI_AGE" value="<%=CLI_AGE %>" /><font color="red"> *</font>
				  			</td>
  				</tr>
  				<tr>
		   			   		<td width="30%" align="left" class="tab_th">
							联系电话：
							</td>
							<td width="60%" align="left"  class="tab_tr">
								<input type="text" name="CLI_HOME_TELEPHONE"  value="<%=CLI_HOME_TELEPHONE %>" /><font color="red"> *</font>
				  			</td>
  				</tr>
  				<tr>
		   			   		<td width="30%" align="left" class="tab_th">
							E_mail：
							</td>
							<td width="60%" align="left"  class="tab_tr">
								<input type="text" name="CLI_EMAIL"  value="<%=CLI_EMAIL %>" />
				  			</td>
  				</tr>
  				<tr>
		   			   		<td width="30%" align="left" class="tab_th">
							备         注：
							</td>
							<td width="60%" align="left"  class="tab_tr">
								<textarea rows="3" cols="20" name="CLI_MENO" class="text"><%=CLI_MENO %></textarea>
				  			</td>
  				</tr>
  				<tr class="tab_result">
				   <td align="center" colspan="2">
				   <input type="hidden" name="CLI_STATUS" value="<%=CLI_STATUS %>" />
				   <input type="hidden" name="CLI_NAME" value="<%=CLI_NAME %>" />
				   <input type="hidden" name="CLI_AGE" value="<%=CLI_AGE %>" />
				   <input type="hidden" name="CLI_SEX" value="<%=CLI_SEX %>" />
				   <input type="hidden" name="CLI_EMAIL" value="<%=CLI_EMAIL %>" />
				   <input type="hidden" name="CLI_HOME_TELEPHONE" value="<%=CLI_HOME_TELEPHONE %>" />
				   <input type="hidden" name="CLI_MENO" value="<%=CLI_MENO %>" />
				   <input type="hidden" name="FUNFLG" value="<%=FUNFLG %>" />
				   <input type="hidden" name="CLI_IDENTITY_CARD" value="<%=CLI_IDENTITY_CARD %>" />
				   <input type="hidden" name="URL" value="/midserv/dsfbank_zc1.jsp">
					  <input type="submit" class="button_bg" name="Submit" value="修改">
			          <input type="button" class="button_bg" name="Submit2" onclick="javascript:history.back(1)" value="返回">
			       </td>  	
				</tr>
				   <%}else if(FUNFLG.equals("2")){ %>
				   
				  <tr>
                    <td   width="30%"  class="tab_th"  align="left">客户姓名：</td>
                    <td width="60%"  class="tab_tr" align="left"><%=CLI_NAME %></td>
                  </tr>
                  <tr>
                    <td   width="30%"  class="tab_th"  align="left">客户性别: </td>
                    <td width="60%"  class="tab_tr" align="left"><%=SEX %></td>
                  </tr>
                  <tr>
                    <td   width="30%"  class="tab_th"  align="left">客户年龄：</td>
                    <td width="60%"  class="tab_tr" align="left"><%=CLI_AGE %></td>
                 </tr>
                 <tr>
                    <td   width="30%"  class="tab_th"  align="left">联系电话：</td>
                    <td width="60%"  class="tab_tr" align="left"><%=CLI_HOME_TELEPHONE%></td>
                 </tr>
                 <tr>
                    <td   width="30%"  class="tab_th"  align="left">E_mail：</td>
                   <td width="60%"  class="tab_tr" align="left"><%=CLI_EMAIL %></td>
                </tr>
                <tr>
                   <td   width="30%"  class="tab_th"  align="left">备    注：</td>
                   <td width="60%"  class="tab_tr" align="left"><%=CLI_MENO %></td>
               </tr>
            	  <tr>
            	     <td width="30%" align="left" class="tab_th">明细状态：</td>
            	     <td width="60%" align="left"  class="tab_tr"><%=STATUS %>
          		     </td>
            	  </tr>	
  				<tr class="tab_result">
				   <td align="center" colspan="2">
				   
					  <input type="button" class="button_bg" name="addqy" onclick="location.href='/personbank/HttpProxy?URL=/midserv/dsfbank_zc1.jsp&dse_sessionId=<%=dse_sessionId%>&CLI_IDENTITY_CARD=<%=CLI_IDENTITY_CARD %>&CLI_NAME=<%=CLI_NAME %>&CLI_SEX=<%=CLI_SEX %>&CLI_AGE=<%=CLI_AGE %>&CLI_HOME_TELEPHONE=<%=CLI_HOME_TELEPHONE %>&CLI_EMAIL=<%=CLI_EMAIL %>&CLI_MENO=<%=CLI_MENO %>&FUNFLG=<%=FUNFLG %>&CLI_STATUS=2'" value="暂停">
					  <input type="button" class="button_bg" name="addqy1" onclick="location.href='/personbank/HttpProxy?URL=/midserv/dsfbank_zc1.jsp&dse_sessionId=<%=dse_sessionId%>&CLI_IDENTITY_CARD=<%=CLI_IDENTITY_CARD %>&CLI_NAME=<%=CLI_NAME %>&CLI_SEX=<%=CLI_SEX %>&CLI_AGE=<%=CLI_AGE %>&CLI_HOME_TELEPHONE=<%=CLI_HOME_TELEPHONE %>&CLI_EMAIL=<%=CLI_EMAIL %>&CLI_MENO=<%=CLI_MENO %>&FUNFLG=<%=FUNFLG %>&CLI_STATUS=3'" value="销户">
					  <input type="button" class="button_bg" name="addqy2" onclick="location.href='/personbank/HttpProxy?URL=/midserv/dsfbank_zc1.jsp&dse_sessionId=<%=dse_sessionId%>&CLI_IDENTITY_CARD=<%=CLI_IDENTITY_CARD %>&CLI_NAME=<%=CLI_NAME %>&CLI_SEX=<%=CLI_SEX %>&CLI_AGE=<%=CLI_AGE %>&CLI_HOME_TELEPHONE=<%=CLI_HOME_TELEPHONE %>&CLI_EMAIL=<%=CLI_EMAIL %>&CLI_MENO=<%=CLI_MENO %>&FUNFLG=<%=FUNFLG %>&CLI_STATUS=1'" value="恢复">
					  
			          <input type="button" class="button_bg" name="Submit2" onclick="javascript:history.back(1)" value="返回">
			       </td>  	
				</tr>
				   
				   <%}else if(FUNFLG.equals("3")){  %>
				   
				    <tr>
                    <td   width="30%"  class="tab_th"  align="left">客户姓名：</td>
                    <td width="60%"  class="tab_tr" align="left"><%=CLI_NAME %></td>
                  </tr>
                  <tr>
                    <td   width="30%"  class="tab_th"  align="left">客户性别: </td>
                    <td width="60%"  class="tab_tr" align="left"><%=SEX %></td>
                  </tr>
                  <tr>
                    <td   width="30%"  class="tab_th"  align="left">客户年龄：</td>
                    <td width="60%"  class="tab_tr" align="left"><%=CLI_AGE %></td>
                 </tr>
                 <tr>
                    <td   width="30%"  class="tab_th"  align="left">联系电话：</td>
                    <td width="60%"  class="tab_tr" align="left"><%=CLI_HOME_TELEPHONE%></td>
                 </tr>
                 <tr>
                    <td   width="30%"  class="tab_th"  align="left">E_mail：</td>
                   <td width="60%"  class="tab_tr" align="left"><%=CLI_EMAIL %></td>
                </tr>
                <tr>
                   <td   width="30%"  class="tab_th"  align="left">备    注：</td>
                   <td width="60%"  class="tab_tr" align="left"><%=CLI_MENO %></td>
               </tr>
            	  <tr>
            	     <td width="30%" align="left" class="tab_th">明细状态：</td>
            	     <td width="60%" align="left"  class="tab_tr"><%=STATUS %>
          		     </td>
            	  </tr>	
  				<tr class="tab_result">
				   <td align="center" colspan="2">
			          <input type="button" class="button_bg" name="Submit2" onclick="javascript:history.back(1)" value="返回">
			       </td>  	
				</tr>
				   
				   
				   <%}
				   }else{ %>
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
	