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
  String cssFileName = request.getParameter("cssFileName");
	if(cssFileName ==null){
		cssFileName = "skin.css";
	}		
  String cdno = request.getParameter("cardNo");
	String tradeName = "�㶫ʡ��ͨ��ֵ";
	GzLog log = new GzLog("c:/gzLog");
	log.Write("=============="+tradeName+"========begin========================");
	String dse_sessionId = MessManTool.changeChar(request.getParameter("dse_sessionId"));//��ȡdse_sessionId
	String biz_id = MessManTool.changeChar(request.getParameter("biz_id")); //����������Ǵ�����õ��ģ���������������
	if (biz_id.equals("") ) {
		System.out.println("�����������ȷ");
	}
	log.Write("=============="+tradeName+"========step1:�����Ų�ѯҵ��i_biz_id=["+biz_id+"]"+"����CDNO=["+cdno+"]================");  
	//�������ԣ�����Ŀ��ź�biz_id������ȷ������յ���

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
		
			var doubleClick = false;
			var dateCheck = false;
			function beforeSubmit(){
				//alert(document.form1.TCusId.value);
				//alert(document.form1.LChkTm.value);
				//�����������ڵ�һ���жϺ���ʾ��
				if (PhoneCheck(document.form1.TelNum.value)){
					dateCheck = true;
				}else{
					alert("�ֻ������벻�Ϸ�!");
					dateCheck = false;
				}
				return dateCheck;
			}
	
			function tiJiao(){
				//�����ظ��ύ
				if(beforeSubmit()&&!doubleClick){
					doubleClick = true;
						document.getElementById("form1").submit();
				}
			}	
	</script>			
</head>
	

				


<body leftmargin="0" topmargin="0" oncontextmenu=self.event.returnValue=false onselectstart="return false">
<center>
	<div  class="indent">
		<table width="100%" align="center" cellpadding="1" cellspacing="1" class="tab">
			
									<tr align="left"> 
										<td class="tab_title" colspan="2">��������ͨ��ֵ����</td>
									</tr>
		<form action="/personbank/HttpProxy" method=post name="form1" id="form1">
			<input type="hidden" name="URL" value="/midserv/unionCharge2.jsp">
			<input type="hidden" name="dse_sessionId" value="<%=dse_sessionId%>">
			<input type="hidden" name=biz_id value="<%=biz_id%>">
			<input type="hidden" name=cdno value="<%=cdno%>">
			<input type="hidden" name=step_id value="1">
			
				<tr class="tab_tr">
					<td width="50%" align="right" height="22" class="InputTip">��ֵ����:</td>
					<td width="50%" align="left" height="22" class="InputTip">
						<input type="text" name="TelNum" size="20" value="" maxlength="21">
					</td>
				</tr>
      
    <tr class="tab_result">
       <td align="center" colspan="2">
		  	<input type="button" onclick="tiJiao();" value="ȷ��" >
			<input type="reset" class="IN" name="Submit2" value="����">
			<input type="button" class="IN" name="Submit3" value="����" onclick="javascript:history.back()" > 	
     </td> 
    </tr> 
	</table>
		</form>
	</div>
</center>
	</body>
</html>