<!--��׼ҳ������������-->
<%@ page language="java" contentType="text/html;charset=GBK" %>
<%@ page import="com.viatt.util.*"%>
<%@ page import="java.util.*" %>
<%@ page import="com.gdbocom.util.communication.*" %>
<%@ page import="com.gdbocom.util.format.*" %>
<%@ include file="IPconinf.inc" %>
<%@ page import="java.net.*" %>
<%
String FUNFLG = "2";//����ѡ��
String TXNCNL="2";
/*********************************/
request.setCharacterEncoding("GBK");
	//GzLog gzLog = new GzLog("c:/gzLog_sj");
String uri = request.getRequestURI();
String CrdNo = request.getParameter("cardNo");  //�����˻�
String CLI_BANK_ACCOUNT = request.getParameter("CLI_BANK_ACCOUNT");
pageContext.setAttribute("ACTNO", CrdNo, PageContext.SESSION_SCOPE);
Map responseValue = new HashMap();
try{
	 
	 responseValue.putAll(
			Transation.createMapSend(pageContext,"466676","@SGD_A",TransationFactory.SGD466676)
		);
	
}catch(Exception e){
	String RspCod = "LOT999";
	String RspMsg = "ͨѶ����"; 
	//gzLog.Write("["+uri+"]MGID����ȷ");

	StringBuffer forwardString = new StringBuffer();
	forwardString.append("RspCod").append("=").append(RspCod);
	forwardString.append("&");
	forwardString.append("RspMsg").append("=").append(RspMsg);
    pageContext.forward(forwardString.toString());
}
String ACCNAM = null;
if(responseValue.get("MsgTyp").equals("N")){
    ACCNAM = responseValue.get("ACTNAM").toString().trim();
}
String CLI_TRADE_FLAG = request.getParameter("CLI_TRADE_FLAG");  //�ֻ�����
String AREACOD = request.getParameter("AREACOD");
String CLI_UNIT_CODE = request.getParameter("CLI_UNIT_CODE");
String BUSCLA = request.getParameter("BUSCLA");
String CLI_TRADE_IDENT = request.getParameter("CLI_TRADE_IDENT").toString();
String FENLEI = request.getParameter("FENLEI");
String CLI_IDENTITY_CARD = request.getParameter("CLI_IDENTITY_CARD");
String CLI_CODE = request.getParameter("CLI_CODE");
String CLI_NAME = request.getParameter("CLI_NAME");

String CLI_CODE_STATUS = request.getParameter("CLI_CODE_STATUS");

//String yewufenlei = request.getParameter("yewufenlei");
//System.out.print("ҵ����ࣺ"+yewufenlei);


String errPage = "";
pageContext.setAttribute("TXNCNL", TXNCNL, PageContext.SESSION_SCOPE);
	pageContext.setAttribute("CLI_IDENTITY_CARD", CLI_IDENTITY_CARD, PageContext.SESSION_SCOPE);
	pageContext.setAttribute("FUNFLG", FUNFLG, PageContext.SESSION_SCOPE);
	pageContext.setAttribute("CLI_CODE", CLI_CODE, PageContext.SESSION_SCOPE);
	pageContext.setAttribute("CLI_NAME", CLI_NAME, PageContext.SESSION_SCOPE);
	pageContext.setAttribute("BUSCLA", BUSCLA, PageContext.SESSION_SCOPE);
	pageContext.setAttribute("AREANUM", AREACOD, PageContext.SESSION_SCOPE);
	pageContext.setAttribute("CLI_UNIT_CODE", CLI_UNIT_CODE, PageContext.SESSION_SCOPE);
	pageContext.setAttribute("CLI_TRADE_FLAG", CLI_TRADE_FLAG, PageContext.SESSION_SCOPE);
	pageContext.setAttribute("CLI_BANK_ACCOUNT", CLI_BANK_ACCOUNT, PageContext.SESSION_SCOPE);
	pageContext.setAttribute("PIN", "7EB3FE2C1A278F18", PageContext.SESSION_SCOPE);
	pageContext.setAttribute("CLI_BANK_ACCNAM", ACCNAM, PageContext.SESSION_SCOPE);
	pageContext.setAttribute("CLI_TRADE_IDENT", CLI_TRADE_IDENT, PageContext.SESSION_SCOPE);
	pageContext.setAttribute("CLI_CODE_STATUS", CLI_CODE_STATUS, PageContext.SESSION_SCOPE);
	
	Map responseValues = new HashMap();
try{
	 
	 responseValues.putAll(
			Transation.createMapSend(pageContext,"466607","@SGD_A",TransationFactory.SGD466607)
		);
	
}catch(Exception e){
	String RspCod = "LOT999";
	String RspMsg = "ͨѶ����"; 
	//gzLog.Write("["+uri+"]MGID����ȷ");

	StringBuffer forwardString = new StringBuffer();
	forwardString.append(errPage).append("?");
	forwardString.append("RspCod").append("=").append(RspCod);
	forwardString.append("&");
	forwardString.append("RspMsg").append("=").append(RspMsg);
    pageContext.forward(forwardString.toString());
}

%>
<!--ҳ��HTML���ֲ���-->
<script language="JavaScript" src="js/public.js"></script>
<script language="JavaScript" src="/personbank/js/writeNewActivxObjectForProxy.js"></script> <%--�������ж˹���JS������Ҫ����HttpProxy--%>
<link rel="stylesheet" type="text/css"	href="/personbank/css/skin.css" />
</head>
		<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
				<div class="indent">
				<script language=JavaScript> writeNewCommitActivxObject('/personbank/')</script>
						<form method='post' action='' >
						
						<table cellpadding="1" cellspacing="1" class="tab" width="100%" >
	     		<tr align="left"> 
			          <td  colspan= "2" class="tab_title">���׽����</td>
			    </tr>	
			    <%if(responseValues.get("MsgTyp").equals("N")){ %>	
		       		<tr>
		   			   		<td width="30%" align="left" class="tab_th">
		   			   		   ���׳ɹ�!
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