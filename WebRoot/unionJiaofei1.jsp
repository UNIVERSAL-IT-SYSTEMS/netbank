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
 String loginType = request.getParameter("loginType");//���͵�½���
	if(cssFileName ==null){
		cssFileName = "skin.css";
	}		
  String cdno = request.getParameter("cardNo");
	String tradeName = "�㶫ʡ��ͨ�˵��ɷ�";
	GzLog log = new GzLog("c:/gzLog");
	log.Write("=============="+tradeName+"========begin========================");
	String dse_sessionId = MessManTool.changeChar(request.getParameter("dse_sessionId"));//��ȡdse_sessionId
	String biz_id = MessManTool.changeChar(request.getParameter("biz_id"));
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
		
			function tj1(){

						
					var tmp2=document.getElementById("chkDate").value;
					
					if(tmp2.length==6){
					
						document.getElementById("form1").submit(); 
					
					}
					
					else {
						alert("�˵����¸�ʽ����������������룡");
						return;
					}
					
									
			}
	</script>			
</head>
	

				


<body leftmargin="0" topmargin="0" oncontextmenu=self.event.returnValue=false onselectstart="return false">
<center>
	<div  class="indent">
		<table width="100%" align="center" cellpadding="1" cellspacing="1" class="tab">
			
									<tr align="left"> 
										<td class="tab_title" colspan="2">�������ѯ��ͨ�˵���Ϣ</td>
									</tr>
		<form action="/personbank/HttpProxy" method=post name="form1" id="form1">
			<input type="hidden" name="URL" value="/midserv/unionJiaofei2.jsp">
			<input type="hidden" name="dse_sessionId" value="<%=dse_sessionId%>">
			<input type="hidden" name=biz_id value="<%=biz_id%>">
			<input type="hidden" name=cdno value="<%=cdno%>">
			<input type="hidden" name=step_id value="1">
      <input type="hidden" name="sendPass" value="<%=loginType.endsWith("0")?"1":"0" %>"> 
			  <tr class="tab_tr">
						<td width="50%" align="right" height="22" class="InputTip">
											�ɷѿ���:
						</td>
						<td width="50%" align="left" height="22" class="InputTip">
								<%=cdno%>
							</td>
					</tr>
				<tr class="tab_tr">
					<td width="50%" align="right" height="22" class="InputTip">ҵ������:</td>
	         <td width="50%" align="left" height="22" class="InputTip">
                  <select name="YwLei">
										<option value="G">GSM</option>
										<option value="C">CDMA</option>
                    <option value="P">193��;</option>
										<option value="H">165խ��</option>
									</select>
         </td>
				</tr>
      <tr class="tab_tr">
					<td width="50%" align="right" height="22" class="InputTip">�绰����:</td>
					<td width="50%" align="left" height="22" class="InputTip">
						<input type="text" name="TelNum" size="20" value="" maxlength="21">
					</td>
				</tr>
      <tr class="tab_tr">
					<td width="50%" align="right" height="22" class="InputTip">�˵�����:</td>
					<td width="50%" align="left" height="22" class="InputTip">
						<input type="text" name="chkDate" size="20" value="" maxlength="21">
					</td>
				</tr>
      	
     <tr class="tab_result">
       <td align="center" colspan="2">
		  	<input type="button" onclick="tj1();" value="ȷ��" >
			<input type="button" class="IN" name="Submit3" value="����" onclick="javascript:history.back()" > 	
     </td> 
    </tr> 
    
	</table>
   <br/>
 
<label>
    �˵��������뷽ʽ����ѯ�ض����µ��˵���������6λ���룬ǰ4λΪ��ݣ���2λΪ�·ݣ��磺201202.
</label>
		</form>
	</div>
</center>
	</body>
</html>