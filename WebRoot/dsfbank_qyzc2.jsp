<!--��׼ҳ������������-->
<%@ page language="java" contentType="text/html;charset=GBK" %>
<%@ page import="com.viatt.util.*"%>
<%@ page import="java.util.*" %>
<%@ page import="com.gdbocom.util.communication.*" %>
<%@ page import="com.gdbocom.util.format.*" %>
<%@ include file="IPconinf.inc" %>
<%
	    String TXNCNL = "2";
	    /*****************************/
	    request.setCharacterEncoding("GBK");
		//��ֹ���˹��ܷ�ֹҳ���ظ��ύ  ��ÿ��ҳ�涼��Ҫ��ӡ�
		response.setHeader("Pragma", "no-cache"); 
		response.setHeader("Cache-Control", "no-store"); 
		response.setDateHeader("Expires", -1); 
			  //��ȡdse_sessionId
        String dse_sessionId = request.getParameter("dse_sessionId");
		//��ȡ��½����
		String loginType=request.getParameter("loginType");
			  loginType="1";
			  //��ȡ�ͻ���ǰʹ�õ�CSS��ʽ
		String cssFileName =request.getParameter("cssFileName");
		if(cssFileName ==null){
			
			  cssFileName = "skin.css";
		 }
		String CrdNo = request.getParameter("cardNo");  //���п��� 
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
		String sjNo = request.getHeader("MBK_MOBILE");  //�ֻ�����
		String CLI_TRADE_FLAG = request.getParameter("BUSTYPE");  //ҵ������
		String AREANUM = request.getParameter("AREANUM").substring(0, 2);
		String CLI_UNIT_CODE = request.getParameter("ENTERID");	//�շѵ�λ����
		String BUSCLA = request.getParameter("BUSCLA");			
		String CLI_TRADE_IDENT = request.getParameter("CLI_TRADE_IDENT").toString();
		String FENLEI = request.getParameter("FENLEI");
		String CLI_IDENTITY_CARD = request.getParameter("CLI_IDENTITY_CARD");
		String CLI_CODE = request.getParameter("CLI_CODE");
		String CLI_NAME = request.getParameter("CLI_NAME");
		String FUNFLG = "1"; //�ж��޸Ļ�������   ������1  �޸���2  
		String CLI_CODE_STATUS = "1";  //1������״̬ 
	 	String bocomPwd = request.getParameter("bocomPwd");
		String errPage = "";
		pageContext.setAttribute("TXNCNL", TXNCNL, PageContext.SESSION_SCOPE);
			pageContext.setAttribute("CLI_IDENTITY_CARD", CLI_IDENTITY_CARD, PageContext.SESSION_SCOPE);
			pageContext.setAttribute("FUNFLG", FUNFLG, PageContext.SESSION_SCOPE);
			pageContext.setAttribute("CLI_CODE", CLI_CODE, PageContext.SESSION_SCOPE);
			pageContext.setAttribute("CLI_NAME", CLI_NAME, PageContext.SESSION_SCOPE);
			pageContext.setAttribute("BUSCLA", BUSCLA, PageContext.SESSION_SCOPE);
			pageContext.setAttribute("AREANUM", AREANUM, PageContext.SESSION_SCOPE);
			pageContext.setAttribute("CLI_UNIT_CODE", CLI_UNIT_CODE, PageContext.SESSION_SCOPE);
			pageContext.setAttribute("CLI_TRADE_FLAG", CLI_TRADE_FLAG, PageContext.SESSION_SCOPE);
			pageContext.setAttribute("CLI_BANK_ACCOUNT", CrdNo, PageContext.SESSION_SCOPE);
			pageContext.setAttribute("PIN", bocomPwd, PageContext.SESSION_SCOPE);
			pageContext.setAttribute("CLI_BANK_ACCNAM", ACCNAM, PageContext.SESSION_SCOPE);
			pageContext.setAttribute("CLI_TRADE_IDENT", CLI_TRADE_IDENT, PageContext.SESSION_SCOPE);
			pageContext.setAttribute("CLI_CODE_STATUS", CLI_CODE_STATUS, PageContext.SESSION_SCOPE);
			Map responseValues = new HashMap();
			 responseValues.putAll(
					Transation.createMapSend(pageContext,"466607","@SGD_A",TransationFactory.SGD466607)
				);
	 

%>
<!-------------------------------------------------------------------
                          ��׼JavaScript������
--------------------------------------------------------------------->
<script language="JavaScript" src="/personbank/HttpProxy?URL=/midserv/js/public.js&dse_sessionId=<%=dse_sessionId%>"></script>
<script language="JavaScript" src="/personbank/HttpProxy?URL=/midserv/js/public_card.js&dse_sessionId=<%=dse_sessionId%>"></script>
  
<!--------------------------------------------------------------------
   ��ǰҳ��JavaScript�������֣������ύ��֤��ҳ�涯��������Ŀ��ȴ���

<!--------------------------------------------------------------------
                          ҳ��HTML���ֲ���    
---------------------------------------------------------------------->
<html>
<head>
<title>��ͨ�������Ϸ���</title>
<script language="JavaScript" src="js/public.js"></script>

<link rel="stylesheet" type="text/css" href="/personbank/css/<%=cssFileName%>">
</head>
	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
		<div class="indent">
<form action="/personbank/HttpProxy" method=post name="form1" onsubmit="return condition_tcusid();">
		<input type="hidden" name="dse_sessionId" value="<%=dse_sessionId%>">
		<input type="hidden" name="URL" value="">
		<input type="hidden" name="BUSCLA" value="<%=BUSCLA %>">
		 
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
