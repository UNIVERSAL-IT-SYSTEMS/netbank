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
   	  //��ȡ�ͻ�֤����
   	  String CLI_IDENTITY_CARD = request.getParameter("CLI_IDENTITY_CARD");
	  pageContext.setAttribute("CLI_IDENTITY_CARD", CLI_IDENTITY_CARD, PageContext.SESSION_SCOPE);
	  Map responseValues = new HashMap();
	  responseValues.putAll(Transation.createMapSend(pageContext,"466603","@SGD_A",TransationFactory.SGD466603));
	  Map responseValue = null;
	  if(responseValues.get("MsgTyp").equals("N")){
		  
	     String CLI_CODE = responseValues.get("CLI_CODE2").toString();
	     String CLI_NAME = responseValues.get("CLI_NAME2").toString();
	     pageContext.setAttribute("CLI_CODE", CLI_CODE, PageContext.SESSION_SCOPE);
	     responseValue = new HashMap();
	     responseValue.putAll(Transation.createMapSend(pageContext,"466604","@SGD_A",TransationFactory.SGD466604));
	  }
   	  //��ȡdse_sessionId
   	  String dse_sessionId = request.getParameter("dse_sessionId");
   	  //��ȡ�ͻ���ǰʹ�õ�CSS��ʽ
   	  String cssFileName =request.getParameter("cssFileName");
	  if(cssFileName ==null){
		  cssFileName = "skin.css";
	   }
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
function condition(){
	var checked= false;
	var redios = document.getElementsByName("mingxi");
	for(var i =0;i<redios.length;i++){
		if(redios[i].checked){
			
			checked= true;
			return true;
		}
	}
	if(!checked){
		
		alert("��ѡ��Ҫ�޸ĵ���Ŀ");
		return false;
	}
}
 
</script>
<link rel="stylesheet" type="text/css" href="/personbank/css/<%=cssFileName%>">
</head>
	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
    <div class="indent">
    <form action="/personbank/HttpProxy" method=post name="form1" onsubmit="return condition();">
		<input type="hidden" name="dse_sessionId" value="<%=dse_sessionId%>">
		<input type="hidden" name="URL" value="/midserv/dsfbank_qy2.jsp">
		
		<%
		//sendPass��־ �Ƿ�����֤�� 1���� ��loginType=0ע���û�ʱ��Ҫ ��
		if (Double.parseDouble(request.getParameter("loginType"))==0){	
		%>
				<input type="hidden" name="sendPass" value="1">
		<%	}
		if (Double.parseDouble(request.getParameter("loginType"))==1){%>
				<input type="hidden" name="sendPass" value="0">
		<%	}%>
		
	    <table cellpadding="1" cellspacing="1" class="tab" width="100%" >
	    		<tr align="left"> 
					<td colspan="5" class="tab_title">���ո�����ǩԼ </td>
				</tr>		
        		<tr> 
        		    <td   width="20%"  class="tab_tr"  align="center"></td>
          			<td   width="20%"  class="tab_tr"  align="center">�շ���ҵ����</td>
          			<td   width="20%"  class="tab_tr"  align="center">ҵ������</td>
          			<td   width="20%"  class="tab_tr"  align="center">�ɷѱ�ʶ</td>
          			<td   width="20%"  class="tab_tr"  align="center">��ϸ״̬</td>
    			</tr>
    			<%
    			if(responseValues.get("MsgTyp").equals("N")){
				 if(responseValue.get("MsgTyp").equals("N")){
					    
					 	String list1="";
						List loopBody = (List) responseValue.get("LoopBody");
						String keyOrder[] = new String[] { "CLI_UNIT_CODE",
								"CLI_TRADE_FLAG", "CLI_TRADE_IDENT","CLI_CODE_STATUS" };
						//������Ҫ��ʾ��ֵ������
						Map keyType = new HashMap();
						//����ѭ������Ҫ��ʾ��ֵ������,
						Map loopShowKey = new HashMap();
						keyType.put("BetLin",
								WelFormatter.getSingleton(WelFormatter.BETNUM));
						for (int recordIndex = 0; recordIndex < loopBody.size(); recordIndex++) {
							Map oneRecord = (Map) loopBody.get(recordIndex);
				%>
  				<tr>
  				<td   width="20%"  class="tab_tr"  align="center"><input type="radio" name="mingxi" value="<%=recordIndex %>"/></td>
				  	<%
				  	for (int keyIndex = 0; keyIndex < keyOrder.length; keyIndex++) {

						String key = keyOrder[keyIndex];
						FormatterInterface type = (FormatterInterface) keyType.get(key);
						//Ϊ��ʽ����ֵ
						String originValue = (String) oneRecord.get(key);
						list1 = list1+originValue;
						if(key.equals("CLI_TRADE_FLAG")){
						   if(originValue.equals("24")){
						      originValue = "�ʻ�ΰ�����";
						   }else if(originValue.equals("26")){
						      originValue = "��ҵ";
						   }else if(originValue.equals("51")){
						      originValue = "��ͨ";
						   }else if(originValue.equals("61")){
						      originValue = "����/��ͨ";
						   }else if(originValue.equals("63")){
						      originValue = "ȼ��";
						   }else if(originValue.equals("65")){
						      originValue = "ˮ��";
						   }else if(originValue.equals("66")){
						      originValue = "����";
						   }else if(originValue.equals("67")){
						      originValue = "����";
						   }else if(originValue.equals("68")){
						      originValue = "��";
						   }else if(originValue.equals("70")){
						      originValue = "����";
						   }else if(originValue.equals("81")){
						      originValue = "˰��";
						   }else if(originValue.equals("85")){
						      originValue = "�籣";
						   }else if(originValue.equals("90")){
						      originValue = "���ϱ���";
						   }
						}
						
						if(key.equals("CLI_CODE_STATUS")){
						   if(originValue.trim().equals("1")){
						      originValue = "����";
						   }else if(originValue.trim().equals("2")){
						      originValue = "��ͣ";
						   }else if(originValue.trim().equals("3")){
						      originValue = "����";
						   }
						}
					%>
				  	<td   width="20%"  class="tab_tr"  align="center">
				  	   <%=originValue.trim() %>
					</td>
  				<%
					      	}
					  }
				%>
					</tr>
			    <tr class="tab_result">
				   <td align="center" colspan="4">
				   	  <input type="hidden" name="CLI_IDENTITY_CARD" value="<%=CLI_IDENTITY_CARD %>"/>
				   	  <input type="hidden" name="list" value="<%=list1 %>"/>
					  <input type="button" class="button_bg" name="addqy" onclick="location.href='/personbank/HttpProxy?URL=/midserv/SGbank_qySelect.jsp&dse_sessionId=<%=dse_sessionId%>&CLI_IDENTITY_CARD=<%=CLI_IDENTITY_CARD %>'" value="����">
					  <input type="submit" class="button_bg" name="Submit" value="�޸�" >
			          <input type="button" class="button_bg" name="Submit2" onclick="javascript:history.back(1)" value="����">
			       </td>  	
				</tr>
				<%}else{ %>
							<tr>	
								<td colspan="4"  class="tab_tr"  align="center">
									<label><%=responseValue.get("RspMsg") %></label></td>
							</tr>
							<tr class="tab_result">
							   <td align="center" colspan="4">
							      <input type="button" class="button_bg" name="addqy" onclick="location.href='/personbank/HttpProxy?URL=/midserv/SGbank_qySelect.jsp&dse_sessionId=<%=dse_sessionId%>&CLI_IDENTITY_CARD=<%=CLI_IDENTITY_CARD %>'" value="����">
						          <input type="button" class="button_bg" name="Submit2" onclick="javascript:history.back(1)" value="����">
						       </td>  	
							</tr>
			<%}
			}else{ %>
			  <tr>	
								<td colspan="4"  class="tab_tr"  align="center">
									<label><%=responseValues.get("RspMsg") %></label></td>
							</tr>
							<tr class="tab_result">
							   <td align="center" colspan="4">
						          <input type="button" class="button_bg" name="Submit2" onclick="javascript:history.back(1)" value="����">
						       </td>  	
							</tr>
			<%} %>	   		
		</table>
</form>
</div>
</body>
</html>
