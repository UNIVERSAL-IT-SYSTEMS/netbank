<!--��׼ҳ������������-->
<%@ page language="java" contentType="text/html;charset=GBK" %>
<%@ page import="com.viatt.util.*"%>
<%@ page import="java.util.*" %>
<%@ page import="com.gdbocom.util.communication.*" %>
<%@ page import="com.gdbocom.util.format.*" %>
<%@ include file="IPconinf.inc" %>
<%
	 
	  request.setCharacterEncoding("GBK");	
	  //��ֹ���˹��ܷ�ֹҳ���ظ��ύ  ��ÿ��ҳ�涼��Ҫ��ӡ�
 	  response.setHeader("Pragma", "no-cache"); 
	  response.setHeader("Cache-Control", "no-store"); 
	  response.setDateHeader("Expires", -1); 
	  
      //��ȡ��½����
      String loginType=request.getParameter("loginType");
   	  loginType="1";
   	  //��ȡdse_sessionId
   	  String dse_sessionId = request.getParameter("dse_sessionId");
   	  //��ȡ�ͻ���ǰʹ�õ�CSS��ʽ
   	  String cssFileName =request.getParameter("cssFileName");
	  if(cssFileName ==null){
		  cssFileName = "skin.css";
	   }
	  
		String uri = request.getRequestURI();
		String CrdNo = request.getHeader("MBK_ACCOUNT"); //�����˻�
		String sjNo = request.getHeader("MBK_MOBILE"); //�ֻ�����
		String CLI_IDENTITY_CARD = request.getParameter("CLI_IDENTITY_CARD");
		String radio = request.getParameter("mingxi");
		int a = Integer.parseInt(radio);
		String list = request.getParameter("list");
		
		
		String CLI_UNIT_CODE = "";
		String CLI_TRADE_FLAG = "";
		String CLI_TRADE_IDENT = "";
		
		    CLI_UNIT_CODE = list.substring(a*29, 6+a*29);
	    	
	    	CLI_TRADE_FLAG = list.substring(6+a*29, 8+a*29);
	    	
	    	CLI_TRADE_IDENT = list.substring(8+a*29, 23+a*29).trim();
	    	
		String errPage = "";
		pageContext.setAttribute("CLI_UNIT_CODE", CLI_UNIT_CODE,
		PageContext.SESSION_SCOPE);
		pageContext.setAttribute("CLI_TRADE_FLAG", CLI_TRADE_FLAG,
		PageContext.SESSION_SCOPE);
		pageContext.setAttribute("CLI_TRADE_IDENT", CLI_TRADE_IDENT,
		PageContext.SESSION_SCOPE);
		Map responseValues = new HashMap();
		responseValues.putAll(Transation.createMapSend(pageContext,	"466675", "@SGD_A", TransationFactory.SGD466675));
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
<script language="JavaScript" >
	 function logonSubmit(){
		 
		 var val = document.getElementById("jfbz").value;
		 if(val==""){
			 
			 alert("������ɷѱ�־");
			 return false;
		 }
	 }
</script>
<link rel="stylesheet" type="text/css" href="/personbank/css/<%=cssFileName%>">
</head>
	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
		<div class="indent">
<form action="/personbank/HttpProxy" method=post name="form1" onsubmit="return logonSubmit();">
		<input type="hidden" name="dse_sessionId" value="<%=dse_sessionId%>">
		<input type="hidden" name="URL" value="/midserv/dsfbank_qy3.jsp">
		<%
		//sendPass��־ �Ƿ�����֤�� 1���� ��loginType=0ע���û�ʱ��Ҫ ��
		if (Double.parseDouble(request.getParameter("loginType"))==0){	
		%>
				<input type="hidden" name="sendPass" value="1">
		<%	}
		if (Double.parseDouble(request.getParameter("loginType"))==1){%>
				<input type="hidden" name="sendPass" value="0">
		<%	} 	
		
			if(responseValues.get("MsgTyp").equals("N")){
			String CLI_CODE = responseValues.get("CLI_CODE").toString();
			String CLI_NAME = responseValues.get("CLI_NAME").toString();
			String BUSCLA = responseValues.get("BUSCLA").toString();
			String AREACOD = responseValues.get("AREACOD").toString();
			
			String CLI_BANK_ACCOUNT = responseValues.get("CLI_BANK_ACCOUNT").toString();
			String CLI_BANK_ACCNAM = responseValues.get("CLI_BANK_ACCNAM").toString();
			String FLAG = null;
			if(CLI_TRADE_FLAG.equals("24")){
						      FLAG = "�ʻ�ΰ�����";
						   }else if(CLI_TRADE_FLAG.equals("26")){
						      FLAG = "��ҵ";
						   }else if(CLI_TRADE_FLAG.equals("51")){
						      FLAG = "��ͨ";
						   }else if(CLI_TRADE_FLAG.equals("61")){
						      FLAG = "����/��ͨ";
						   }else if(CLI_TRADE_FLAG.equals("63")){
						      FLAG = "ȼ��";
						   }else if(CLI_TRADE_FLAG.equals("65")){
						      FLAG = "ˮ��";
						   }else if(CLI_TRADE_FLAG.equals("66")){
						      FLAG = "����";
						   }else if(CLI_TRADE_FLAG.equals("67")){
						      FLAG = "����";
						   }else if(CLI_TRADE_FLAG.equals("68")){
						      FLAG = "��";
						   }else if(CLI_TRADE_FLAG.equals("70")){
						      FLAG = "����";
						   }else if(CLI_TRADE_FLAG.equals("81")){
						      FLAG = "˰��";
						   }else if(CLI_TRADE_FLAG.equals("85")){
						      FLAG = "�籣";
						   }else if(CLI_TRADE_FLAG.equals("90")){
						      FLAG = "���ϱ���";
						   }
		
		 %>
		 
		<table cellpadding="1" cellspacing="1" class="tab" width="100%" >
		  <tr align="left"> 
		          <td  colspan= "2" class="tab_title">���ո�����ǩԼ </td>
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
		     <td   width="30%"  class="tab_th"  align="left">�ͻ�֤���ţ�</td>
		     <td width="60%"  class="tab_tr" align="left"><%=CLI_IDENTITY_CARD %></td>
		  </tr>
		  <tr>
		     <td   width="30%"  class="tab_th"  align="left">ǩԼ�˺ţ�</td>
		     <td width="60%"  class="tab_tr" align="left"><%=CLI_BANK_ACCOUNT %></td>
		  </tr>
		  <tr>
		     <td   width="30%"  class="tab_th"  align="left">ǩԼ������</td>
		     <td width="60%"  class="tab_tr" align="left"><%=CLI_BANK_ACCNAM%></td>
		  </tr>
		  <tr>
			     <td   width="30%"  class="tab_th"  align="left">ҵ�����ࣺ</td>
			     <td width="60%"  class="tab_tr" align="left"><%=FLAG %></td>
		  </tr>
		  <tr>
			     <td   width="30%"  class="tab_th"  align="left">�տ���ҵ���룺</td>
			     <td width="60%"  class="tab_tr" align="left"><%=CLI_UNIT_CODE %></td>
		  </tr>
		  <tr>
			     <td   width="30%"  class="tab_th"  align="left">�ɷѱ�ʶ: </td>
			     <td width="60%"  class="tab_tr" align="left"><input  type="text" id="jfbz" name="CLI_TRADE_IDENT" maxlength="15" value="<%=CLI_TRADE_IDENT %>"  /></td>
		  </tr>
		  <tr>
			     <td   width="30%"  class="tab_th"  align="left">��ϸ״̬��</td>
			     <td width="60%"  class="tab_tr" align="left">
			    	<select name="CLI_CODE_STATUS"  >
				        <option value="1">����</option>
				        <option value="2">��ͣ</option>
				        <option value="3">����</option>
			        </select>
			     </td>
		  </tr>
   
		<input type='hidden' name='CLI_UNIT_CODE'  value='<%=CLI_UNIT_CODE %>'/>
		<input type='hidden' name='CLI_TRADE_FLAG'  value='<%=CLI_TRADE_FLAG %>'/>
		<input type='hidden' name='AREACOD'  value='<%=AREACOD %>'/>
		<input type='hidden' name='BUSCLA'  value='<%=BUSCLA %>'/>
		<input type='hidden' name='CLI_CODE' value='<%=CLI_CODE %>'/>
		<input type='hidden' name='CLI_NAME' value='<%=CLI_NAME %>'/>
		<input type='hidden' name='CLI_BANK_ACCOUNT'  value='<%=CLI_BANK_ACCOUNT %>'/>
		<input type='hidden' name='CLI_BANK_ACCNAM'  value='<%=CLI_BANK_ACCNAM %>'/>
		<input type='hidden' name='CLI_TRADE_FLAG'  value='<%=CLI_TRADE_FLAG %>'/>
		<input type='hidden' name='CLI_IDENTITY_CARD'  value='<%=CLI_IDENTITY_CARD %>'/>
		<tr class="tab_result">
	   	 <td align="center" colspan="2">
			 <input type="submit" class="button_bg" name="SubmitNo"   value="�ύ">
	         <input type="button" class="button_bg" name="Submit2" onclick="javascript:history.back(1)" value="����">
	     </td>  	
		</tr>
		<%}else{ %>
				<tr class="tab_result">
			   	 <td align="center" colspan="2">
					<label><%=responseValues.get("RspMsg") %></label>
					<input type="button" class="button_bg" name="Submit2" onclick="javascript:history.back(1)" value="����">
			     </td>  	
				</tr>
					
			<%} %>	   	
	 </table>	
</form>
</div>
</body>
</html>
