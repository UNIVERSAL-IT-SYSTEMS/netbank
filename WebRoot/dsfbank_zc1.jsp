<!--��׼ҳ������������-->
<%@ page language="java" contentType="text/html;charset=GBK" %>
<%@ page import="com.viatt.util.*"%>
<%@ page import="java.util.*" %>
<%@ page import="com.gdbocom.util.communication.*" %>
<%@ page import="com.gdbocom.util.format.*" %>
<%@ include file="IPconinf.inc" %>
<%		
		
		request.setCharacterEncoding("GBK");
		//��ֹ���˹��ܷ�ֹҳ���ظ��ύ ��ÿ��ҳ�涼��Ҫ��ӡ�
		response.setHeader("Pragma", "no-cache"); 
		response.setHeader("Cache-Control", "no-store"); 
		response.setDateHeader("Expires", -1); 
		//------------------------ǩ����ʼ--------------------
		String logonUserDn="";
		String isVerifySign="0";
		String remoteIp  = request.getParameter("remoteIp");
		String loginType = request.getParameter("loginType");//���͵�¼��� 0��ע���û�(�ֻ���) 1��֤���û� 20120418
		//------------------------ǩ������-------------------- 
		
	  	String dse_sessionId = request.getParameter("dse_sessionId");
		
	  	//��ȡ�ͻ���ǰʹ�õ�CSS��ʽ
	  	String cssFileName   = request.getParameter("cssFileName");
	  	String FUNFLG = request.getParameter("FUNFLG");
	  	String CLI_IDENTITY_CARD = request.getParameter("CLI_IDENTITY_CARD");
	  	String CLI_NAME = request.getParameter("CLI_NAME");
        String CLI_SEX = request.getParameter("CLI_SEX");
        String CLI_AGE = request.getParameter("CLI_AGE");
        String CLI_EMAIL = request.getParameter("CLI_EMAIL");
        String CLI_STATUS = request.getParameter("CLI_STATUS");
        String CLI_HOME_TELEPHONE = request.getParameter("CLI_HOME_TELEPHONE"); 
        String CLI_MENO = request.getParameter("CLI_MENO");
     	  String SEX = null;
   	  if(CLI_SEX.equals("0")){
	      SEX="Ů";
	  }else if(CLI_SEX.equals("1")){
	     SEX="��";
	  }
      String STATUS = null;
      if(CLI_STATUS.equals("1")){
         STATUS="����";
      }else if(CLI_STATUS.equals("2")){
         STATUS="��ͣ";
      }else if(CLI_STATUS.equals("3")){
         STATUS="����";
      }
		if(cssFileName ==null){
			cssFileName = "skin.css";
		}
	    if (Double.parseDouble(request.getParameter("loginType")) == 0) {
		
		
		
		 //��ȡע����Ϣ
   	  
	}
	    
	    //System.out.println(request.getParameter("loginType")+"===1111========loginType");
	//ǩ��2
	if (Double.parseDouble(request.getParameter("loginType"))==1){
	 
		logonUserDn = request.getParameter("logonUserDn");//��ȡ��¼֤��DN
	 	isVerifySign="1";
	%>
	<script language=JavaScript src="/personbank/js/public.js"></script> 
	<script language=JavaScript> writeSignActivxObject('/personbank/')</script>
	<%
	}
%>
<!--��׼JavaScript������-->
<script language="JavaScript" src="/personbank/js/writeNewActivxObjectForProxy.js"></script> <%--�������ж˹���JS������Ҫ����HttpProxy--%>
<script language="JavaScript" src="/personbank/HttpProxy?URL=/midserv/js/public.js&dse_sessionId=<%=dse_sessionId%>"></script>
<script language="JavaScript" src="/personbank/HttpProxy?URL=/midserv/js/public_card.js&dse_sessionId=<%=dse_sessionId%>"></script>
<script language="JavaScript"> 
	try{
	if (window.Event) 
		document.captureEvents(Event.MOUSEUP); 
	}catch(e){}
	function nocontextmenu(){
		event.cancelBubble = true
		event.returnValue = false;
		return false;
	}
	function norightclick(e) {
		if (window.Event){
		 try{
			if (e.which == 2 || e.which == 3)
			return false;
			}catch(e){
			}
		}
		else if (event.button == 2 || event.button == 3){
			event.cancelBubble = true
			event.returnValue = false;
			return false;
		}
	}
	document.oncontextmenu = nocontextmenu; // for IE5+
	document.onmousedown = norightclick; // for all others
</script>
<html>
<head>
<title>��ͨ���и�����������</title>
<link rel="stylesheet" type="text/css"	href="/personbank/css/skin.css" />
<style>
.tail_info{
	display:block;
	text-align:left;
	color:#407fab;
	line-height:22px;
	margin-top:10px;
}
.td_input{height:20;}
</style>
	<!--��ǰҳ��JavaScript�������֣������ύ��֤��ҳ�涯��������Ŀ��ȴ���-->

<!--ҳ��HTML���ֲ���-->
<link rel="stylesheet" type="text/css" href="/personbank/css/<%=cssFileName%>">
<script language="JavaScript" src="js/public.js"></script>
<script language="JavaScript" src="/personbank/js/writeNewActivxObjectForProxy.js"></script> <%--�������ж˹���JS������Ҫ����HttpProxy--%>
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<div class="indent">
 <script language=JavaScript> writeNewCommitActivxObject('/personbank/')</script>
<form action="/personbank/HttpProxy" method="post" name="form1" >
	<input type="hidden" name="dse_sessionId" value="<%=dse_sessionId%>"/>
	<input type="hidden" name="URL" value="/midserv/dsfbank_zc2.jsp"/>
	<table cellpadding="1" cellspacing="1" class="tab" width="100%" >
   <tr align="left"> 
          <td  colspan= "2" class="tab_title">���ո�����ע�� </td>
    </tr>		
	  
    <tr>
     <td   width="30%"  class="tab_th"  align="left">�ͻ�������</td>
     <td width="60%"  class="tab_tr" align="left"><%=CLI_NAME %></td>
  </tr>
      <tr>
     <td   width="30%"  class="tab_th"  align="left">�ͻ��Ա�: </td>
     <td width="60%"  class="tab_tr" align="left"><%=SEX %></td>
  </tr>
      <tr>
     <td   width="30%"  class="tab_th"  align="left">�ͻ����䣺</td>
     <td width="60%"  class="tab_tr" align="left"><%=CLI_AGE %></td>
  </tr>
      <tr>
     <td   width="30%"  class="tab_th"  align="left">��ϵ�绰��</td>
     <td width="60%"  class="tab_tr" align="left"><%=CLI_HOME_TELEPHONE%></td>
  </tr>
       <tr>
     <td   width="30%"  class="tab_th"  align="left">E_mail��</td>
     <td width="60%"  class="tab_tr" align="left"><%=CLI_EMAIL %></td>
  </tr>
       <tr>
     <td   width="30%"  class="tab_th"  align="left">��    ע��</td>
     <td width="60%"  class="tab_tr" align="left"><%=CLI_MENO %></td>
  </tr>
	  <tr>
	     <td width="30%" align="left" class="tab_th">��ϸ״̬��</td>
	     <td width="60%" align="left"  class="tab_tr"><%=STATUS %>
		</td>
	  </tr>	
    <tr class="tab_result">
	   	 <td align="center" colspan="2">
	   	     <input type="hidden" name="CLI_NAME" value="<%=CLI_NAME %>" />
	   	     <input type="hidden" name="CLI_SEX" value="<%=CLI_SEX %>" />
	   	     <input type="hidden" name="CLI_AGE" value="<%=CLI_AGE %>" />
	   	     <input type="hidden" name="CLI_EMAIL" value="<%=CLI_EMAIL %>" />
	   	     <input type="hidden" name="CLI_STATUS" value="<%=CLI_STATUS %>" />
	   	     <input type="hidden" name="CLI_HOME_TELEPHONE" value="<%=CLI_HOME_TELEPHONE %>" />
	   	     <input type="hidden" name="CLI_MENO" value="<%=CLI_MENO %>" />
	   	     <input type="hidden" name="CLI_IDENTITY_CARD" value="<%=CLI_IDENTITY_CARD %>" />
	   	     <input type="hidden" name="FUNFLG" value="<%=FUNFLG %>" />
	   	     <input type="submit" class="button_bg" name="Submit" value="�ύ"/>
			
	         <input type="button" class="button_bg" name="Submit2" onclick="javascript:history.back(1)" value="����">
	     </td>  	
	     </tr>
  </table> 
</form>	 
</div>
</body>
</html>