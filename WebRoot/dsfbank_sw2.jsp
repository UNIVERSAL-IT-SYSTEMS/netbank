<!--��׼ҳ������������-->
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
<!--ҳ��HTML���ֲ���-->
<script language="JavaScript" src="js/public.js"></script>
<script language="JavaScript" src="/personbank/js/writeNewActivxObjectForProxy.js"></script> <%--�������ж˹���JS������Ҫ����HttpProxy--%>
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
                                       <td  colspan= "2" class="tab_title">���ո������ɷ� </td>
                                   </tr>	
                                   <tr>
                                       <td   width="30%"  class="tab_th"  align="left">���׳ɹ���лл����ʹ�ã�</td>
     
                                   </tr>
                                   <tr>
                                       <td   width="30%"  class="tab_th"  align="left">ҵ�����ࣺ: </td>
                                       <td width="60%"  class="tab_tr" align="left"><%=BUSTYPEHAN %></td>
                                   </tr>
                                   <tr>
                                       <td   width="30%"  class="tab_th"  align="left">�����˺ţ�</td>
                                       <td width="60%"  class="tab_tr" align="left"><%=PAYACT %></td>
                                   </tr>
                                   <tr>
                                       <td   width="30%"  class="tab_th"  align="left">�ɷѱ�ʶ��</td>
                                       <td width="60%"  class="tab_tr" align="left"><%=PAYFLG%></td>
                                   </tr>
                                   <tr>
                                       <td   width="30%"  class="tab_th"  align="left">���ɽ�</td>
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