<%@ page language="java" contentType="text/html;charset=GBK" %>

<%@ page import="com.bocom.midserv.gz.*"%>
<%@ page import="com.viatt.bean.*"%>
<%@ page import="com.viatt.util.*"%>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.lang.*" %>
<%@ page import="com.bocom.midserv.base.*" %>
<%@ page import="com.bocom.midserv.web.*" %>
<%@ page import="com.bocom.midserv.gz.*" %>
<%@ page import="com.bocom.eb.des.EBDES" %>

<%

	String cssFileName = request.getParameter("cssFileName");//��ȡ�ͻ���ǰʹ�õ�CSS��ʽ
  String loginType = request.getParameter("loginType");//���͵�½��� 0��ע���û�(�ֻ���) 1��֤���û� 2�������û�
	String biz_step_id="1";  

    String TelNum = request.getParameter("TelNum");
    String cdno = request.getParameter("cdno");

	GzLog log = new GzLog("c:/gzLog");
	log.Write("==============������ ��ͨ��ֵ�ĵ�2��jsp�ļ�========begin========================");
	String dse_sessionId = MessManTool.changeChar(request.getParameter("dse_sessionId"));//��ȡdse_sessionId
	String biz_id = MessManTool.changeChar(request.getParameter("biz_id")); 
	
	log.Write("==============��ͨ��ֵ======step2:	���ܲ�ѯ���벢׼�����ؽ����i_biz_id=["+biz_id+"]"+"����CDNO=["+cdno+"]===========");  
	
	
	log.Write("2222222222��ͨ��ֵ===step2:	���ܲ�ѯ���벢׼�����ؽ�����ֻ���=["+TelNum+"]===========22222222");
%>
  <script language="JavaScript"
            src="/personbank/HttpProxy?URL=/midserv/js/public.js&dse_sessionId=<%=dse_sessionId%>"></script>
        <script language="JavaScript"
            src="/personbank/HttpProxy?URL=/midserv/js/common.js&dse_sessionId=<%=dse_sessionId%>"></script>
        <script language="JavaScript"
            src="/personbank/HttpProxy?URL=/midserv/js/date.js&dse_sessionId=<%=dse_sessionId%>"></script>	

<html>
	<head>
		<title>��ͨ�������Ϸ���</title>
		<link rel="stylesheet" type="text/css" href="/personbank/css/<%=cssFileName%>">

    <script type="text/JavaScript">		
			
			
			//�ύ����
			function tiJiao(){
	     
				var txns=document.getElementsByName("TxnAmt");
				for(var i=0; i<txns.length; i++){
					if(txns[i].checked){
						alert(txns[i].value);
					}
				}
        return;
				if (txn=0){
				alert("��ֵ���Ϊ�գ��벹��!");
        return;
				}
				else{
					document.getElementById("form1").submit();
				}				
			}		
		</script>

	</head>


<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0"  oncontextmenu=self.event.returnValue=false onselectstart="return false">
	<center>
   <div class="indent">
     

   <table width="100%" align="center" cellpadding="1" cellspacing="1" class="tab">
      
       <tr class="tab_tr">
						<td class="tab_title">�������ֵ���</td>
		  </tr>
      <form action="/personbank/HttpProxy" method=post name="form1">	    
    	<input type="hidden" name="URL" value="/midserv/unionCharge3.jsp"/>
			<input type="hidden" name="dse_sessionId" value="<%=dse_sessionId%>"/>
			<input type="hidden" name=biz_id value="<%=biz_id%>">
     <input type="hidden" name="TelNum" value="<%=TelNum%>"/>
     <input type="hidden" name="sendPass" value="<%=loginType.endsWith("0")?"1":"0" %>">
    <tr class="tab_tr">
			 <td width="70%" align="center" height="22" class="InputTip">
			    <input type="radio" name="TxnAmt" value="2000" checked>20Ԫ</input>
          <input type="radio" name="TxnAmt" value="3000">30Ԫ</input>
          <input type="radio" name="TxnAmt" value="5000">50Ԫ</input>
			    <input type="radio" name="TxnAmt" value="10000">100Ԫ</input>
			    <input type="radio" name="TxnAmt" value="20000">200Ԫ</input>
			    <input type="radio" name="TxnAmt" value="30000">300Ԫ</input>
          <input type="radio" name="TxnAmt" value="50000">500Ԫ</input>
          
      </td>
	   </tr>
				<tr class="tab_result">
					<td align="center">
						<input type="submit"  class="button_bg"  value="��һ��" />
						<input type="button" class="button_bg" name="Submit3" value="����" onclick="javascript:history.back()" /> 	 
					</td>
				</tr>
			</table>  
	    </form>	
		</div>
  </center>
	</body>
</html>