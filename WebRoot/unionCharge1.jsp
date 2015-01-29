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
  String cssFileName = request.getParameter("cssFileName");
	if(cssFileName ==null){
		cssFileName = "skin.css";
	}		
  String cdno = request.getParameter("cardNo");
	String tradeName = "广东省联通充值";
	GzLog log = new GzLog("c:/gzLog");
	log.Write("=============="+tradeName+"========begin========================");
	String dse_sessionId = MessManTool.changeChar(request.getParameter("dse_sessionId"));//获取dse_sessionId
	String biz_id = MessManTool.changeChar(request.getParameter("biz_id")); //我想问这个是从哪里得到的？？？？？？？？
	if (biz_id.equals("") ) {
		System.out.println("传入参数不正确");
	}
	log.Write("=============="+tradeName+"========step1:输入编号查询业务：i_biz_id=["+biz_id+"]"+"卡号CDNO=["+cdno+"]================");  
	//经过测试，上面的卡号和biz_id都能正确无误接收到！

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
		
			var doubleClick = false;
			var dateCheck = false;
			function beforeSubmit(){
				//alert(document.form1.TCusId.value);
				//alert(document.form1.LChkTm.value);
				//对于输入日期的一种判断和提示：
				if (PhoneCheck(document.form1.TelNum.value)){
					dateCheck = true;
				}else{
					alert("手机号输入不合法!");
					dateCheck = false;
				}
				return dateCheck;
			}
	
			function tiJiao(){
				//避免重复提交
				if(beforeSubmit()&&!doubleClick){
					doubleClick = true;
						document.getElementById("form1").submit();
				}
			}	
	</script>			
</head>
	

				


<body leftmargin="0" topmargin="0" oncontextmenu=self.event.returnValue=false onselectstart="return false">
<center>
	<div  class="indent">
		<table width="100%" align="center" cellpadding="1" cellspacing="1" class="tab">
			
									<tr align="left"> 
										<td class="tab_title" colspan="2">请输入联通充值号码</td>
									</tr>
		<form action="/personbank/HttpProxy" method=post name="form1" id="form1">
			<input type="hidden" name="URL" value="/midserv/unionCharge2.jsp">
			<input type="hidden" name="dse_sessionId" value="<%=dse_sessionId%>">
			<input type="hidden" name=biz_id value="<%=biz_id%>">
			<input type="hidden" name=cdno value="<%=cdno%>">
			<input type="hidden" name=step_id value="1">
			
				<tr class="tab_tr">
					<td width="50%" align="right" height="22" class="InputTip">充值号码:</td>
					<td width="50%" align="left" height="22" class="InputTip">
						<input type="text" name="TelNum" size="20" value="" maxlength="21">
					</td>
				</tr>
      
    <tr class="tab_result">
       <td align="center" colspan="2">
		  	<input type="button" onclick="tiJiao();" value="确定" >
			<input type="reset" class="IN" name="Submit2" value="重填">
			<input type="button" class="IN" name="Submit3" value="返回" onclick="javascript:history.back()" > 	
     </td> 
    </tr> 
	</table>
		</form>
	</div>
</center>
	</body>
</html>