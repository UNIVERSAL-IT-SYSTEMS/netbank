<%@ page language="java" contentType="text/html;charset=GBK" %>
<%@ page import="com.viatt.util.*"%>
<%@ page import="java.util.*" %>
<%@ page import="com.gdbocom.util.communication.*" %>
<%@ page import="com.viatt.util.GzLog" %>
<%@ page import="com.gdbocom.util.format.*" %>
 
<%   
  String cssFileName = request.getParameter("cssFileName");
 String loginType = request.getParameter("loginType");//传送登陆类别
	if(cssFileName ==null){
		cssFileName = "skin.css";
	}		
  String cdno = request.getParameter("cardNo");
	String tradeName = "广东省联通账单缴费";
	GzLog log = new GzLog("c:/gzLog");
	log.Write("=============="+tradeName+"========begin========================");
	String dse_sessionId = MessManTool.changeChar(request.getParameter("dse_sessionId"));//获取dse_sessionId
	String biz_id = MessManTool.changeChar(request.getParameter("biz_id")); //我想问这个是从哪里得到的？？？？？？？？
	//if (biz_id.equals("") ) {
		
	//}
	log.Write("=============="+tradeName+"========step1:输入编号查询业务：i_biz_id=["+biz_id+"]"+"卡号CDNO=["+cdno+"]================");  
	//经过测试，上面的卡号和biz_id都能正确无误接收到！
	request.setAttribute("BUSCLA", "05");
	String areanum =  request.getParameter("areanum");
 	pageContext.setAttribute("BUSCLA", "05", PageContext.SESSION_SCOPE);

	Map responseValues = new HashMap();
	try{
		 responseValues.putAll(
				Transation.createMapSend(pageContext,"466670","@SGD_A",TransationFactory.SGD466670)
			);
	}catch(Exception e){
		String RspCod = "LOT999";
		String RspMsg = "通讯故障"; 
		//gzLog.Write("["+uri+"]MGID不正确");
		StringBuffer forwardString = new StringBuffer();
		forwardString.append("RspCod").append("=").append(RspCod);
		forwardString.append("&");
		forwardString.append("RspMsg").append("=").append(RspMsg);
	}
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
</head>
<body leftmargin="0" topmargin="0" oncontextmenu=self.event.returnValue=false onselectstart="return false">
<center>
	<div  class="indent">
		<table width="100%" align="center" cellpadding="1" cellspacing="1" class="tab">
			
									<tr align="left"> 
										<td class="tab_title" colspan="2">请输入查询联通账单信息</td>
									</tr>
		<form action="/personbank/HttpProxy" method=post name="form1" id="form1">
			<input type="hidden" name="URL" value="/midserv/unionJiaofei2.jsp">
			<input type="hidden" name="dse_sessionId" value="<%=dse_sessionId%>">
			<input type="hidden" name=biz_id value="<%=biz_id%>">
			<input type="hidden" name=cdno value="<%=cdno%>">
			<input type="hidden" name=step_id value="1">
      <input type="hidden" name="sendPass" value="<%=loginType.endsWith("0")?"1":"0" %>"> 
			  <tr class="tab_tr">
						<td width="50%" align="right" height="22" class="InputTip">
											缴费卡号:
						</td>
						<td width="50%" align="left" height="22" class="InputTip">
								<%=cdno%>
							</td>
					</tr>
				<tr class="tab_tr">
					<td width="50%" align="right" height="22" class="InputTip">业务类型:</td>
	         <td width="50%" align="left" height="22" class="InputTip">
             <select name="areanum">
			   	  <%
					List loopBody = (List)responseValues.get("LoopBody");
			        String keyOrder[] = new String[]{"CODE"};
			    	//设置需要显示的值的类型
			    	Map keyType = new HashMap();
			    	//设置循环体需要显示的值和名称,
			    	Map loopShowKey = new HashMap();
			    	loopShowKey.put("CODE", "地域");
			    	keyType.put("BetLin", WelFormatter.getSingleton(WelFormatter.BETNUM));
			        for(int recordIndex=0; recordIndex<loopBody.size(); recordIndex++){
			        		Map oneRecord = (Map)loopBody.get(recordIndex);
			        		for(int keyIndex=0; keyIndex<1; keyIndex++){
			        			//英文值，类似"DrawId"
			        			String key = keyOrder[keyIndex];
			        			//显示的中文名字，类似"投注期号"
			        			//String showName = (String)loopShowKey.get(key);
			        			//使用的格式化对象，类似 WelFormatter.getSingleton(WelFormatter.BETNUM)
			        			FormatterInterface type = (FormatterInterface)keyType.get(key);
			        			//为格式化的值
			        			String originValue = (String)oneRecord.get(key);
			        			%>
			        			    <option value="<%=originValue.trim() %>"><%=originValue.substring(2).trim() %></option>
			        			<%
			        		}
			        }
					%>
   			   </select>
         </td>
				</tr>
      <tr class="tab_tr">
					<td width="50%" align="right" height="22" class="InputTip">电话号码:</td>
					<td width="50%" align="left" height="22" class="InputTip">
						<input type="text" name="TelNum" size="20" value="" maxlength="21">
					</td>
				</tr>
      <tr class="tab_tr">
					<td width="50%" align="right" height="22" class="InputTip">账单年月:</td>
					<td width="50%" align="left" height="22" class="InputTip">
						<input type="text" name="chkDate" size="20" value="" maxlength="21">
					</td>
				</tr>
      	<tr class="tab_result">
  	<td align="center" colspan="2">
   			<input type="button" class="button_bg" name="Submitpage"  value="提交" onclick="javascript:condition_tcusid()"></input>
            <input type="reset" class="button_bg" name="Submitpage" value="重填"></input>
    </td>  	
  </tr>
     <tr class="tab_result">
       <td align="center" colspan="2">
		  	<input type="button" onclick="tj1();" value="确定" >
			<input type="button" class="IN" name="Submit3" value="返回" onclick="javascript:history.back()" > 	
     </td> 
    </tr> 
	</table>
   <br/>
<label>
    账单年月输入方式：查询特定年月的账单，请输入6位号码，前4位为年份，后2位为月份，如：201202.
</label>
		</form>
	</div>
</center>
	</body>
</html>