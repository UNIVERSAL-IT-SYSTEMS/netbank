<%@ page language="java" contentType="text/html;charset=GBK" %>

<%@ page import="com.bocom.midserv.gz.*"%>
<%@ page import="com.viatt.bean.*"%>
<%@ page import="com.viatt.util.*"%>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.lang.*" %>
<%@ page import="com.bocom.midserv.base.*" %>
<%@ page import="com.bocom.midserv.web.*" %>
<%@ page import="com.bocom.midserv.gz.*" %>
<%@ page import="com.bocom.eb.des.EBDES" %>

<%

	String cssFileName = request.getParameter("cssFileName");//获取客户当前使用的CSS样式
  String loginType = request.getParameter("loginType");//传送登陆类别 0－注册用户(手机版) 1－证书用户 2－大众用户
	String biz_step_id="1";  

    String TelNum = request.getParameter("TelNum");
    String cdno = request.getParameter("cdno");

	GzLog log = new GzLog("c:/gzLog");
	log.Write("==============这里是 联通充值的第2个jsp文件========begin========================");
	String dse_sessionId = MessManTool.changeChar(request.getParameter("dse_sessionId"));//获取dse_sessionId
	String biz_id = MessManTool.changeChar(request.getParameter("biz_id")); 
	
	log.Write("==============联通充值======step2:	接受查询号码并准备返回结果：i_biz_id=["+biz_id+"]"+"卡号CDNO=["+cdno+"]===========");  
	
	
	log.Write("2222222222联通充值===step2:	接受查询号码并准备返回结果：手机号=["+TelNum+"]===========22222222");
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

    <script type="text/JavaScript">		
			
			
			//提交函数
			function tiJiao(){
	     
				var txns=document.getElementsByName("TxnAmt");
				for(var i=0; i<txns.length; i++){
					if(txns[i].checked){
						alert(txns[i].value);
					}
				}
        return;
				if (txn=0){
				alert("充值金额为空，请补充!");
        return;
				}
				else{
					document.getElementById("form1").submit();
				}				
			}		
		</script>

	</head>


<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0"  oncontextmenu=self.event.returnValue=false onselectstart="return false">
	<center>
   <div class="indent">
     

   <table width="100%" align="center" cellpadding="1" cellspacing="1" class="tab">
      
       <tr class="tab_tr">
						<td class="tab_title">请输入充值金额</td>
		  </tr>
      <form action="/personbank/HttpProxy" method=post name="form1">	    
    	<input type="hidden" name="URL" value="/midserv/unionCharge3.jsp"/>
			<input type="hidden" name="dse_sessionId" value="<%=dse_sessionId%>"/>
			<input type="hidden" name=biz_id value="<%=biz_id%>">
     <input type="hidden" name="TelNum" value="<%=TelNum%>"/>
     <input type="hidden" name="sendPass" value="<%=loginType.endsWith("0")?"1":"0" %>">
    <tr class="tab_tr">
			 <td width="70%" align="center" height="22" class="InputTip">
			    <input type="radio" name="TxnAmt" value="2000" checked>20元</input>
          <input type="radio" name="TxnAmt" value="3000">30元</input>
          <input type="radio" name="TxnAmt" value="5000">50元</input>
			    <input type="radio" name="TxnAmt" value="10000">100元</input>
			    <input type="radio" name="TxnAmt" value="20000">200元</input>
			    <input type="radio" name="TxnAmt" value="30000">300元</input>
          <input type="radio" name="TxnAmt" value="50000">500元</input>
          
      </td>
	   </tr>
				<tr class="tab_result">
					<td align="center">
						<input type="submit"  class="button_bg"  value="下一步" />
						<input type="button" class="button_bg" name="Submit3" value="返回" onclick="javascript:history.back()" /> 	 
					</td>
				</tr>
			</table>  
	    </form>	
		</div>
  </center>
	</body>
</html>