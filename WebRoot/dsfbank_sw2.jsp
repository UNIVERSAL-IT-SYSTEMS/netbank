<!--标准页面服务对象引用-->
<%@ page language="java" contentType="text/html;charset=GBK" %>
<%@ page import="com.viatt.util.*"%>
<%@ page import="java.util.*" %>
<%@ page import="com.gdbocom.util.communication.*" %>
<%@ page import="com.gdbocom.util.format.*" %>
<%@ include file="IPconinf.inc" %>
<%@ page import="java.net.*" %>
<%
	String TXNCNL = "2";
	/*************************/
	request.setCharacterEncoding("GBK");
	String LOGNO = request.getParameter("LOGNO");
	String PAYFLG = request.getParameter("PAYFLG");
	String BUSTYPE = request.getParameter("BUSTYPE");
	String BUSTYPEHAN = request.getParameter("BUSTYPEHAN");
	String PAYACT = request.getParameter("PAYACT");
	String ACCNAM = request.getParameter("ACCNAM");
	String bocomPwd = request.getParameter("bocomPwd");
	String TXNAMT = request.getParameter("TXNAMT");
	String RSPMSG = null;
	String errPage = "";
 	pageContext.setAttribute("TXNCNL", TXNCNL, PageContext.SESSION_SCOPE);
 	pageContext.setAttribute("PAYTYPE", "02", PageContext.SESSION_SCOPE);
 	pageContext.setAttribute("LOGNO", LOGNO, PageContext.SESSION_SCOPE);
 	pageContext.setAttribute("PAYFLG", PAYFLG, PageContext.SESSION_SCOPE);
 	pageContext.setAttribute("PAYACT", PAYACT, PageContext.SESSION_SCOPE);
 	pageContext.setAttribute("PAYNAM", ACCNAM, PageContext.SESSION_SCOPE);
 	pageContext.setAttribute("PINBLK", bocomPwd, PageContext.SESSION_SCOPE);
 	Map responseValues = new HashMap();
	responseValues.putAll(
			Transation.createMapSend(pageContext,"466612","@SGD_A",TransationFactory.SGD466612)
		);
%>
<!--页面HTML表现部分-->
<script language="JavaScript" src="js/public.js"></script>
<script language="JavaScript" src="/personbank/js/writeNewActivxObjectForProxy.js"></script> <%--引用总行端公用JS，不需要引用HttpProxy--%>
<link rel="stylesheet" type="text/css"	href="/personbank/css/skin.css" />
</head>
		<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
				<div class="indent">
				<script language=JavaScript> writeNewCommitActivxObject('/personbank/')</script>
						<form method='post' action='' >
								<%	
									if(responseValues.get("MsgTyp").equals("N")){
								   
								 %>
								
								<table cellpadding="1" cellspacing="1" class="tab" width="100%" >
                                   <tr align="left"> 
                                       <td  colspan= "2" class="tab_title">代收付——缴费 </td>
                                   </tr>	
                                   <tr>
                                       <td   width="30%"  class="tab_th"  align="left">交易成功，谢谢您的使用！</td>
     
                                   </tr>
                                   <tr>
                                       <td   width="30%"  class="tab_th"  align="left">业务种类：: </td>
                                       <td width="60%"  class="tab_tr" align="left"><%=BUSTYPEHAN %></td>
                                   </tr>
                                   <tr>
                                       <td   width="30%"  class="tab_th"  align="left">付款账号：</td>
                                       <td width="60%"  class="tab_tr" align="left"><%=PAYACT %></td>
                                   </tr>
                                   <tr>
                                       <td   width="30%"  class="tab_th"  align="left">缴费标识：</td>
                                       <td width="60%"  class="tab_tr" align="left"><%=PAYFLG%></td>
                                   </tr>
                                   <tr>
                                       <td   width="30%"  class="tab_th"  align="left">缴纳金额：</td>
                                       <td width="60%"  class="tab_tr" align="left"><%=TXNAMT %></td>
                                    </tr>

                                </table>
								<%
									}else{
									
									%>
										<label><%=responseValues.get("RspMsg") %></label>
									<%
									}
								 %>
						</form>
				</div>
		</body>
</html>