<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@ page import="com.bocom.midserv.gz.*"%>
<%@ page import="com.viatt.util.*"%>
<%@ page import="java.sql.*"%>


<%
	GzLog log = new GzLog("c:/gzLog");
	String dse_sessionId = MessManTool.changeChar(request.getParameter("dse_sessionId"));//��ȡdse_sessionId
	String biz_id = MessManTool.changeChar(request.getParameter("biz_id"));
	String CrdNo = MessManTool.changeChar(request.getParameter("cardNo"));
	//���ڲ�����̫���ʱ���ܹ��Ƚ����׷�����־�Ĺ�ϵ
	String logRMNO = String.valueOf(Math.random()).substring(3,9);
	if (biz_id.equals("") ) {
		log.Write("[" + logRMNO + "] Step 1: �����������ȷ��biz_idΪ��"); 
	}
//	List list = new ArrayList();
//���͵�һ����ѯ���׿�ʼ�����Ϳ��Ź�ȥ����ö�Ӧ���̻���ź��̻���������̻���ź��̻�����п��ܲ���Ψһ

  String cssFileName = request.getParameter("cssFileName");//��ȡ�ͻ���ǰʹ�õ�CSS��ʽ
	if(cssFileName ==null){
		cssFileName = "skin.css";
	}		
%>

<%
//Test���ݿ����ӿ�ʼ
		Connection dbConn = null;
		Statement st = null;
		ResultSet rs = null;
		Statement st2 = null;
		ResultSet rs2 = null;
		String sqlstr = "";
		String ZJTable = "";
		String checked = "";
		String finalstr = "";
		int i = 0;
    try {//�������ݿ�����
        dbConn = DriverManager.getConnection("jdbc:sybase:Tds:182.53.4.76:7501/khcx_db?CHARSET=cp936&amp;amp;LANGUAGE=en_US", "khcx", "654321");
    } catch (SQLException e) {
		log.Write("[" + logRMNO + "] Step 1 �õ��̻����: getConnection......" + e.getMessage()); 
		e.printStackTrace();
    }
    
	try{//�򿪶Ի�,����ResultSet
	    sqlstr = "select BUSINO, ZJSign from CrdNo_BUSINO where CrdNo like '" + CrdNo + "'";
	    log.Write(sqlstr);
	    st = dbConn.createStatement();
	    rs = st.executeQuery(sqlstr);
	} catch (SQLException e) {
		log.Write("[" + logRMNO + "] Step 1 �õ��̻����: createStatement......" + e.getMessage()); 
		e.printStackTrace();
	}


//Test���ݿ����ӽ���
%>


<html>
<head>
<title>test</title>
<script language="JavaScript" src="/personbank/HttpProxy?URL=/midserv/js/public.js&dse_sessionId=<%=dse_sessionId%>"></script>
<script language="JavaScript" src="/personbank/HttpProxy?URL=/midserv/js/common.js&dse_sessionId=<%=dse_sessionId%>"></script>
<script type="text/javascript">
	function tj1(){
		//���͵�ʱ��ֵ����Ϊ��
		tj();
	}
</script>
<link rel="stylesheet" type="text/css" href="/personbank/css/<%=cssFileName%>">
</head>

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<center>
<div class="indent">

<!-- ҳ����ʾ��ʼ -->
<table width="100%" align="center" cellpadding="1" cellspacing="1" class="tab">
	<tr align="left">    	   	
  	<td colspan="3" class="tab_title">�� ѡ �� �� �� �� �ڣ��ڶ�����</td>
  </tr>
<!-- ҳ����ʾ���� -->

<form action="/personbank/HttpProxy"  Method=post name="f1">
	<input type="hidden" name="dse_sessionId" value="<%=dse_sessionId%>">
	<input type="hidden" name="URL" value="/midserv/corpfee2.jsp">
	<input type="hidden" name="biz_id" value="<%=biz_id %>">
	<input type="hidden" name="step_id" value="2">

	<font size="50"></font>
	
	  <tr class="tab_tr" style="cursor:hand;" >
	    <td colspan="3" class="TableRow2">�󶨿��ţ�&nbsp; <%= CrdNo %></td>
	  </tr>
	  <tr class="tab_tr" style="cursor:hand;">
	    <td colspan="3" class="TableRow2">��ѡ���Ӧ���̻���ţ��������һ��</td>
	  </tr>
	  <tr class="tab_tr" style="cursor:hand;">
	    <td class="TableRow2" align='center' width='30px'>ѡ��</td>
	    <td class="TableRow2" align='center' width='125px'>�̻����</td>
	    <td class="TableRow2" align='center'>�̻�����</td>
	  </tr>
<!-- ��ѯ���ݿ�ѭ������̻���ź����ʼ -->
<%	
if(rs.next()){
	do {//ѭ������ֶ�
	try{
		if(rs.getString(2).equals("1")){
			ZJTable = "CORP_ZL";
		}else{
			ZJTable = "CORP_JL";
		}
		if(i==0){
			checked = "checked";
		}else{
			checked = "";
		}
		//��ѯ�ͻ�����

		try{//�򿪶Ի�,����ResultSet
		    sqlstr = "select CUSTNAME from " + ZJTable + " WHERE BUSINO LIKE '" + rs.getString(1).trim() + "'";
		    log.Write(sqlstr);
		    st2 = dbConn.createStatement();
		    rs2 = st2.executeQuery(sqlstr);
		} catch (SQLException e) {
			log.Write("[" + logRMNO + "] Step 2 �õ��̻�����: createStatement......" + e.getMessage()); 
			e.printStackTrace();
		}

		if(rs2.next()){
			do{
				out.println("<tr style='cursor:hand;'>");
				out.println("<td class='TableRow1' align='center'><input name='BUSINO_Sign' type='radio' value='" + rs.getString(1).trim() + "|" + rs.getString(2)+ "|" + rs2.getString(1).trim() + "' " + checked + "/></td>");
				out.println("<td class='TableRow1' align='center'>" + rs.getString(1).trim() + "</td>");
				out.println("<td class='TableRow1' align='center'>" + rs2.getString(1).trim() + "</td>");
				out.println("</tr>");
			}while(rs2.next());
		}else{
//			log.Write(finalstr);
			finalstr += "<tr style='cursor:hand;'>";
			finalstr += "<td class='TableRow1' align='center' colspan='3'>����û�й�����Ӧ���̻���ţ��뷵��</td>";
			finalstr += "</tr>";
			
//			log.Write(finalstr);
		}
		i++;
		rs2 = null;
		st2 = null;
	}catch(Exception e){
		log.Write(e.getMessage());
	}
	}while (rs.next());
	out.println(finalstr);

 %>
<!-- ��ѯ���ݿ�ѭ������̻���ź������� -->
	  <tr class="tab_tr" style='cursor:hand;'>
		<td align='center' colspan='3'>
			<input type='button' onclick='Javascript:window.history.back()' value='��һ��' class='button_bg'>
		  <input type="button" onclick="tj1();" value="��һ��" class="button_bg"></td>
	  </tr>

<%
}else{
	out.println("<tr style='cursor:hand;'>");
	out.println("<td align='center' colspan='3' class='TableRow1'>����û�й�����Ӧ���̻���ţ��뷵��</td>");
	out.println("</tr>");
	out.println("<tr style='cursor:hand;'>");
	out.println("<td align='center' colspan='3'><input type='button' onclick='Javascript:window.history.back()' value='����' class='button_bg'></td>");
	out.println("</tr>");
}
 %>

	</table>

</form>
<%
	try{//�ر����ݿ�����
		rs = null;
		st = null;
		dbConn.close();
	}catch(SQLException e){
		log.Write("[" + logRMNO + "] Step 1: close dbConn......" + e.getMessage());
	}
 %>
 </DIV></CENTER></body></html>