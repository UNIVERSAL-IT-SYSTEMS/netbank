<!--��׼ҳ������������-->
<%@ page language="java" contentType="text/html;charset=GBK" %>
<%@ page import="com.viatt.util.*"%>
<%@ page import="java.util.*" %>
<%@ page import="com.gdbocom.util.communication.*" %>
<%@ page import="com.gdbocom.util.format.*" %>
<%@ include file="IPconinf.inc" %>
<%
	  //��ֹ���˹��ܷ�ֹҳ���ظ��ύ ��ÿ��ҳ�涼��Ҫ��ӡ�
 	  response.setHeader("Pragma", "no-cache"); 
	  response.setHeader("Cache-Control", "no-store"); 
	  response.setDateHeader("Expires", -1); 
	  
      //��ȡ��½����
      String loginType=request.getParameter("loginType");
   	  loginType="1";
   	  //��ȡ����ѡ��1������ 2���޸�
   	  String GNXX=request.getParameter("GNXX");
   	  
   	  if (Double.parseDouble(loginType)==2){
		response.sendRedirect("errorlogintype.jsp");
		return;
	  }
   	  //���ݷ��� ��ȡ������Ϣ  
   	  String buscla = request.getParameter("buscla");
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
<script language="JavaScript" src="js/public.js"></script>
<!--------------------------------------------------------------------
   ��ǰҳ��JavaScript�������֣������ύ��֤��ҳ�涯��������Ŀ��ȴ���

<!--------------------------------------------------------------------
                          ҳ��HTML���ֲ���    
---------------------------------------------------------------------->
<html>
<head>
<title>��ͨ�������Ϸ���</title>
<link rel="stylesheet" type="text/css" href="/personbank/css/<%=cssFileName%>">
</head>
	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
		<div class="indent">
		<form action="/personbank/HttpProxy" method=post onsubmit="return condition_tcusid();">
			   <input type="hidden" name="buscla" value="<%=buscla %>"/>
			   <input type="hidden" name="dse_sessionId" value="<%=dse_sessionId %>"/>
			   <input type="hidden" name="URL" value="/midserv/dsfbank_qy1.jsp">
	          <table cellpadding="1" cellspacing="1" class="tab" width="100%" class="tab" >
	        		<tr align="center" collspan="2"> 
	          			<td class="tab_title" >������ҪǩԼ��֤���ţ�</td>
	    			</tr>
	  				<tr>
					  	<td collspan="2" style="font-size: 10pt" align="center">
					  		 �ͻ�֤���ţ�<input type="text" name="CLI_IDENTITY_CARD"  value=""/>
					  	</td>
	  				</tr>
				    <tr class="tab_result">
					   <td align="center" colspan="2">
					    <input type="submit" class="button_bg" name="Submit" value="��ѯ">
				        <input type="button" class="button_bg" name="Submit2" onclick="javascript:history.back(1)" value="����">
				       </td>  	
					</tr>
			  </table>
          </form> 
        </div>
    </body>
</html>
