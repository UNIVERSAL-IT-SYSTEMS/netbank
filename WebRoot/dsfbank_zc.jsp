<!--��׼ҳ������������-->
<%@ page language="java" contentType="text/html;charset=GBK" %>
<%@ page import="com.viatt.util.*"%>
<%@ page import="java.util.*" %>
<%@ page import="com.gdbocom.util.communication.*" %>
<%@ page import="com.gdbocom.util.format.*" %>
<%@ include file="IPconinf.inc" %>
<%
	  String CLI_STATUS = "1";
	  /********************/
	  //��ֹ���˹��ܷ�ֹҳ���ظ��ύ  ��ÿ��ҳ�涼��Ҫ���ӡ�
	  request.setCharacterEncoding("GBK");
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
%>
<!-------------------------------------------------------------------
                          ��׼JavaScript������
--------------------------------------------------------------------->
<script language="JavaScript" src="/personbank/HttpProxy?URL=/midserv/js/public.js&dse_sessionId=<%=dse_sessionId%>"></script>
<script language="JavaScript" src="/personbank/HttpProxy?URL=/midserv/js/public_card.js&dse_sessionId=<%=dse_sessionId%>"></script>
 <script language="javascript" type="text/javascript">
  function condition_tcusid(){
  	
  }
  </script>
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
		<input type="hidden" name="URL" value="/midserv/dsfbank_zc1.jsp">
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
			          <td  colspan= "2" class="tab_title">����дע����Ϣ��</td>
			    </tr>		
		       		<tr>
		   			   		<td width="30%" align="left" class="tab_th">
		   			   		�ͻ�֤���ţ�
		   			   		</td>
		   			   		<td width="60%" align="left"  class="tab_tr">
								 <input type="text" name="CLI_IDENTITY_CARD"  value="" /><font color="red"> *</font>
							</td>
				   </tr>
				   <tr>
		   			   		<td width="30%" align="left" class="tab_th">
		   			   		�ͻ�������
		   			   		</td>
		   			   		<td width="60%" align="left"  class="tab_tr">
								<input type="text" name="CLI_NAME"  value="" /><font color="red"> *</font>
							</td>
				   </tr>
				<tr>
		   			   		<td width="30%" align="left" class="tab_th">
							�ͻ��Ա�
							</td>
							<td width="60%" align="left"  class="tab_tr">
								<select name="CLI_SEX">
								     <option value="1">��</option>
						  		     <option value="0">Ů</option>
						  		</select>
				  			</td>
  				</tr>
  				<tr>
		   			   		<td width="30%" align="left" class="tab_th">
							�ͻ����䣺
							</td>
							<td width="60%" align="left"  class="tab_tr">
								<input type="text" name="CLI_AGE" value="" /><font color="red"> *</font>
				  			</td>
  				</tr>
  				<tr>
		   			   		<td width="30%" align="left" class="tab_th">
							��ϵ�绰��
							</td>
							<td width="60%" align="left"  class="tab_tr">
								<input type="text" name="CLI_HOME_TELEPHONE"  value="" /><font color="red"> *</font>
				  			</td>
  				</tr>
  				<tr>
		   			   		<td width="30%" align="left" class="tab_th">
							E_mail��
							</td>
							<td width="60%" align="left"  class="tab_tr">
								<input type="text" name="CLI_EMAIL"  value="" />
				  			</td>
  				</tr>
  				<tr>
		   			   		<td width="30%" align="left" class="tab_th">
							��         ע��
							</td>
							<td width="60%" align="left"  class="tab_tr">
								<textarea rows="3" cols="20" name="CLI_MENO" class="text"></textarea>
				  			</td>
  				</tr>
			    <tr class="tab_result">
				   <td align="center" colspan="2">
				   <input type="hidden" name="CLI_STATUS" value="<%=CLI_STATUS %>" />
				   <input type="hidden" name="FUNFLG" value="0" />
					  <input type="submit" class="button_bg" name="Submit" value="��һ��">
			          <input type="button" class="button_bg" name="Submit2" onclick="javascript:history.back(1)" value="����">
			       </td>  	
				</tr>
		</table>
		<div class="guide">
		         <ul>��ʾ�� <li>*&nbsp;&nbsp;ǰ��*�Ǳ�����</li></ul>
		</div>
</form>
</div>
</body>
</html>