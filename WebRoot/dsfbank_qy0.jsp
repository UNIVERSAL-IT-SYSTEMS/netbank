<!--标准页面服务对象引用-->
<%@ page language="java" contentType="text/html;charset=GBK" %>
<%@ page import="com.viatt.util.*"%>
<%@ page import="java.util.*" %>
<%@ page import="com.gdbocom.util.communication.*" %>
<%@ page import="com.gdbocom.util.format.*" %>
<%@ include file="IPconinf.inc" %>
<%
	  //静止后退功能防止页面重复提交 【每个页面都需要添加】
 	  response.setHeader("Pragma", "no-cache"); 
	  response.setHeader("Cache-Control", "no-store"); 
	  response.setDateHeader("Expires", -1); 
	  
      //获取登陆类型
      String loginType=request.getParameter("loginType");
   	  loginType="1";
   	  //获取功能选项1：新增 2：修改
   	  String GNXX=request.getParameter("GNXX");
   	  
   	  if (Double.parseDouble(loginType)==2){
		response.sendRedirect("errorlogintype.jsp");
		return;
	  }
   	  //根据分类 获取地区信息  
   	  String buscla = request.getParameter("buscla");
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
<script language="JavaScript" src="js/public.js"></script>
<!--------------------------------------------------------------------
   当前页面JavaScript函数部分，包括提交验证，页面动作，具体目标等代码

<!--------------------------------------------------------------------
                          页面HTML表现部分    
---------------------------------------------------------------------->
<html>
<head>
<title>交通银行网上服务</title>
<link rel="stylesheet" type="text/css" href="/personbank/css/<%=cssFileName%>">
</head>
	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
		<div class="indent">
		<form action="/personbank/HttpProxy" method=post onsubmit="return condition_tcusid();">
			   <input type="hidden" name="buscla" value="<%=buscla %>"/>
			   <input type="hidden" name="dse_sessionId" value="<%=dse_sessionId %>"/>
			   <input type="hidden" name="URL" value="/midserv/dsfbank_qy1.jsp">
	          <table cellpadding="1" cellspacing="1" class="tab" width="100%" class="tab" >
	        		<tr align="center" collspan="2"> 
	          			<td class="tab_title" >请输入要签约的证件号：</td>
	    			</tr>
	  				<tr>
					  	<td collspan="2" style="font-size: 10pt" align="center">
					  		 客户证件号：<input type="text" name="CLI_IDENTITY_CARD"  value=""/>
					  	</td>
	  				</tr>
				    <tr class="tab_result">
					   <td align="center" colspan="2">
					    <input type="submit" class="button_bg" name="Submit" value="查询">
				        <input type="button" class="button_bg" name="Submit2" onclick="javascript:history.back(1)" value="返回">
				       </td>  	
					</tr>
			  </table>
          </form> 
        </div>
    </body>
</html>
