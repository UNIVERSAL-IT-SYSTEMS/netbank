<!--��׼ҳ������������-->
<%@ page language="java" contentType="text/html;charset=GBK" %>
<%@ page import="com.viatt.util.*"%>
<%@ page import="java.util.*" %>
<%@ page import="com.gdbocom.util.communication.*" %>
<%@ page import="com.gdbocom.util.format.*" %>
<%@ include file="IPconinf.inc" %>
<%		
		 String TXNCNL = "2";
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
		//loginType="1";
		
		//------------------------ǩ������-------------------- 
		String areanum = request.getParameter("areanum");
		//��ȡdse_sessionId
	  	String dse_sessionId = request.getParameter("dse_sessionId");
		//��̬У����
		String dynamicCode=request.getParameter("dynamicCode");
		AppParam.setParam(dse_sessionId,dynamicCode);
		//У�������к�
		String dynamicCodeSeq=request.getParameter("dynamicCodeSeq");
		//��ȡ���� 
	    String BUSCLA =request.getParameter("BUSCLA");
		//��ȡ����
	  	String cardNo=request.getParameter("cardNo");
	  	//��ȡ�ͻ���ǰʹ�õ�CSS��ʽ
	  	String cssFileName   = request.getParameter("cssFileName");
	  	//��ȡ������Ϣ  
 	    String FUNFLG = request.getParameter("FUNFLG");
	  	String BUSTYPE = request.getParameter("zl").substring(0, 2);
	  	String BUSTYPEHAN = request.getParameter("zl").substring(2).trim();
	  	
	  	pageContext.setAttribute("TXNCNL", TXNCNL, PageContext.SESSION_SCOPE);
	  	pageContext.setAttribute("BUSCLA", request.getParameter("BUSCLA"), PageContext.SESSION_SCOPE);
	 	pageContext.setAttribute("TXNCNL", "2", PageContext.SESSION_SCOPE);
	 	pageContext.setAttribute("BUSTYPE", request.getParameter("zl").substring(0, 2), PageContext.SESSION_SCOPE);
	 	pageContext.setAttribute("COMPNO", request.getParameter("qy").substring(0, 6), PageContext.SESSION_SCOPE);
	 	pageContext.setAttribute("PAYFLG", request.getParameter("FUNFLG"), PageContext.SESSION_SCOPE);
		Map responseValues = new HashMap();
		responseValues.putAll(
				Transation.createMapSend(pageContext,"466611","@SGD_A",TransationFactory.SGD466611)
			);
		//��ȡ���п���  
		pageContext.setAttribute("ACTNO", cardNo, PageContext.SESSION_SCOPE);
		Map responseValue = new HashMap();
		responseValue.putAll(
			Transation.createMapSend(pageContext,"466676","@SGD_A",TransationFactory.SGD466676));
		String ACCNAM = null;
		if(responseValue.get("MsgTyp").equals("N")){
		    ACCNAM = responseValue.get("ACTNAM").toString().trim();
		}
		//����ȱ�ٵ�½������ʾ������Ϣ
	   	if (Double.parseDouble(loginType)==2){
			
	  		response.sendRedirect("errorlogintype.html");
			return;
		}
		if(cssFileName ==null){
		
			cssFileName = "skin.css";
		}
	    if (Double.parseDouble(loginType) == 0) {
		//����ʱ�����ʾ��ҳ��
		if (iDynamic == 1) {
			//out.println("��̬����:" + dynamicCode + "_"+dynamicCodeSeq);
		}
	}
	//ǩ��2
	if (Double.parseDouble(loginType)==1){
	 
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
	<script language="JavaScript">
		document.oncontextmenu = function() { return false;}
	</script>
	<!--��ǰҳ��JavaScript�������֣������ύ��֤��ҳ�涯��������Ŀ��ȴ���-->
<script language="JavaScript">
	var clickBoolean = true;
	function logonSubmit(){
    if(document.safeInput1.isValid()){
     
		alert("���벻�Ϸ���������Ϸ�������");
		return ;
    }
    <%if(Double.parseDouble(loginType)==0){%>
    if(document.getElementById("dynamic").value!=<%=dynamicCode%>){
    	alert("�����������벻��ȷ");
		return ;
    }
    <%}%>
	//------------------------ǩ��3��ʼ--------------------
	var loginType ='<%=loginType%>';
	if(loginType=="1")
	{
		
		var LOGNO =this.document.form1.LOGNO.value;
		var PAYFLG =this.document.form1.PAYFLG.value;
		var PAYACT =this.document.form1.PAYACT.value;
		var ACCNAM =this.document.form1.ACCNAM.value;
		var TXNAMT =this.document.form1.TXNAMT.value;
		var CLI_NAME =this.document.form1.CLI_NAME.value;
		var signData ='|LOGNO=' + LOGNO +  '|PAYFLG=' + PAYFLG+'|PAYACT=' + PAYACT +'|ACCNAM=' + ACCNAM +'|TXNAMT=' + TXNAMT  +'|CLI_NAME=' + CLI_NAME ;
		InfoSecNetSign1.NSServerMode = 0;
		InfoSecNetSign1.NSSetPlainText(signData);
		this.document.form1.signData.value= InfoSecNetSign1.NSAttachedSign('<%=logonUserDn%>');
			if (!this.document.form1.signData.value)
			{
				alert("ǩ������ȡ����");
				return ;
			}
	}		
	//------------------------ǩ��3����--------------------
    if(clickBoolean){
	    document.safeInput1.commit("safeCommit1");
	    document.safeCommit1.submit("form1");
	    clickBoolean = false;
    }
}
</script>
<!--ҳ��HTML���ֲ���-->
<link rel="stylesheet" type="text/css" href="/personbank/css/<%=cssFileName%>">
<script language="JavaScript" src="js/public.js"></script>
<script language="JavaScript" src="/personbank/js/writeNewActivxObjectForProxy.js"></script> <%--�������ж˹���JS������Ҫ����HttpProxy--%>
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<div class="indent">
 <script language=JavaScript> writeNewCommitActivxObject('/personbank/')</script>
 <%
 	String TXNAMT ="";
 	String LOGNO ="";
 	String CLI_NAME ="";
   if(responseValues.get("MsgTyp").equals("N")){
	   
	    	TXNAMT = responseValues.get("TXNAMT").toString().trim();
			LOGNO = responseValues.get("LOGNO").toString().trim();
			CLI_NAME = responseValues.get("MACTXT").toString().trim();
   }
	if(responseValue.get("MsgTyp").equals("N")){
	    ACCNAM = responseValue.get("ACTNAM").toString().trim();
	}
	if(responseValues.get("MsgTyp").equals("N")&&responseValue.get("MsgTyp").equals("N")){
		
%>
<form action="/personbank/HttpProxy" method="post" name="form1" >
	<input type="hidden" name="dse_sessionId" value="<%=dse_sessionId%>"/>
	<input type="hidden" name="URL" value="/midserv/dsfbank_sw2.jsp"/>
	<input type="hidden" name="ActNo" value="<%=cardNo%>">
	<input type="hidden" name="TXNAMT" value="<%=TXNAMT%>">
	<input type="hidden" name="CLI_NAME" value="<%=CLI_NAME%>">
	<input type="hidden" name="bocomPwd" value="">
	<table cellpadding="1" cellspacing="1" class="tab" width="100%" >
   <tr align="left"> 
          <td  colspan= "2" class="tab_title">���ո������ɷ� </td>
    </tr>		
	  <tr>
     <td   width="30%"  class="tab_th"  align="left">�ɷѵ�����</td>
     <td width="60%"  class="tab_tr" align="left"><%=strbranchName %></td>
  </tr>
    <tr>
     <td   width="30%"  class="tab_th"  align="left">�ͻ�������</td>
     <td width="60%"  class="tab_tr" align="left"><%=CLI_NAME %></td>
  </tr>
      <tr>
     <td   width="30%"  class="tab_th"  align="left">����ţ�</td>
     <td width="60%"  class="tab_tr" align="left"><%=cardNo %></td>
  </tr>
      <tr>
     <td   width="30%"  class="tab_th"  align="left">�˺Ż�����</td>
     <td width="60%"  class="tab_tr" align="left"><%=ACCNAM %></td>
  </tr>
      <tr>
     <td   width="30%"  class="tab_th"  align="left">ҵ�����ࣺ</td>
     <td width="60%"  class="tab_tr" align="left"><%=BUSTYPEHAN%></td>
  </tr>
       <tr>
     <td   width="30%"  class="tab_th"  align="left">�ɷѱ�ʶ��</td>
     <td width="60%"  class="tab_tr" align="left"><%=FUNFLG %></td>
  </tr>
       <tr>
     <td   width="30%"  class="tab_th"  align="left">����ɽ�</td>
     <td width="60%"  class="tab_tr" align="left"><%=TXNAMT %></td>
  </tr>
	  <tr>
	     <td width="30%" align="left" class="tab_th">�������룺</td>
	     <td width="60%" align="left"  class="tab_tr">
	<SCRIPT language=JavaScript> writeNewPwdActivxObjectLenClass('safeInput1','safeInput1','/personbank/','bocomPwd',20,6,'20','120','<%=dse_sessionId%>')</SCRIPT>		
		</td>
	  </tr>
	    <input type='hidden' name='AREANUM'  value="<%=request.getParameter("qy").substring(0, 6) %>"/>
		<input type='hidden' name='LOGNO'  value='<%=LOGNO %>'/>
		<input type='hidden' name='PAYFLG'  value="<%=request.getParameter("FUNFLG") %>"/>
		<input type='hidden' name='BUSTYPE'  value="<%=BUSTYPE %>"/>
		<input type='hidden' name='BUSTYPEHAN'  value="<%=BUSTYPEHAN %>"/>
		<input type='hidden' name='TXNAMT'  value="<%=TXNAMT %>"/>
		<input type='hidden' name='PAYACT'  value="<%=cardNo%>"/> <!-- cardNo -->
		<input type='hidden' name='ACCNAM'  value="<%=ACCNAM %>"/>
<%if (Double.parseDouble(loginType)==0){ %>
	  <tr>
	     <td width="30%" align="left" class="tab_th">�ֻ���̬���룺</td>
	     <td width="60%" align="left"  class="tab_tr">
	     	<input type="text" name="dynamic" value="">
	       	���к�<%=dynamicCodeSeq%>
	        <div id='resendprompt'>
	       	<a href="#" onClick="resend()">���û�յ��ֻ���֤�룬��������ط���</a>
	       	</div></td>
	  </tr>
<%
  }  
%>
<%  
//-------------------------------ǩ��4----------------------------------
if (Double.parseDouble(loginType)==1){ %>
	<input type="hidden" name="isVerifySign"	value="<%=isVerifySign%>"/>			
	<input type="hidden" name="signKey" 		value="<%=cardNo%>"/>	
	<input type="hidden" name="signTranCode"	value="466670"/>		
	<input type="hidden" name="signData"/>							
<%
//-------------------------------ǩ��4---------------------------------
}%>		
    <tr class="tab_result">
	   	 <td align="center" colspan="2">
			 <input type="button" class="button_bg" name="SubmitNo"  onClick="javascript:logonSubmit()"   value="�ύ">
	         <input type="button" class="button_bg" name="Submit2" onclick="javascript:history.back(1)" value="����">
	     </td>  	
	</tr>
  </table> 
</form>	
<% }else{
	
	if(responseValues.get("MsgTyp").equals("E")){
		%>
		<label><%=responseValues.get("RspMsg") %></label>
		<%
	}else if(responseValue.get("MsgTyp").equals("E")){	
%>
		<label><%=responseValue.get("RspMsg") %></label>
<%
}
}
	%>
<script type="text/javascript">
function resend(){
  var http=new ActiveXObject("Microsoft.XMLHTTP");
  if(http){
    
	  http.open ("POST","/personbank/HttpProxy",false);
      http.setRequestHeader ("Content-Type","application/x-www-form-urlencoded");
      http.send ("URL=/servlet/TransServlet&dse_sessionId=<%=dse_sessionId%>&sendPass=2");
  }
  document.getElementById("resendprompt").innerHTML = "�ֻ���̬��֤�����ٴη��ͣ�����ա�";
}
</script>
</div>
</body>
</html>