<%@ page language="java"%>
<%@ page import="java.sql.*"%>
<%@ page contentType="application/vnd.ms-excel;charset=gb2312"%>
<html>
<head>
	<title>�����������excel��ʽ��ʾhtmlҳ����table��ǩ������</title>
	<META content="application/vnd.ms-excel;charset=gb2312" http-equiv=Content-Type>
</head>
<%
		Connection dbConn = null;
		Statement st = null;
		ResultSet rs = null;
		String sqlstr = "";
	try{
		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	}catch(ClassNotFoundException e){}
    try {//�������ݿ�����
        dbConn = DriverManager.getConnection("jdbc:odbc:khcx_db_sybase","khcx","654321");
    } catch (SQLException e) {
//		log.Write("[" + logRMNO + "] Step 1: getConnection......" + e.getMessage()); 
		e.printStackTrace();
    }
    
	try{//�򿪶Ի�,����ResultSet
	    sqlstr = "select CUSTNAME, BUSINO, TERMID, TxnDat, TxnAmt, CorpShouldPay, TxnAmt-CorpShouldPay, TrdTyp, AthTlr";
	    sqlstr = sqlstr + " from CORP_TRADE_JL";
	    sqlstr = sqlstr + " where BUSINO like '%301440145110018%' and convert(char,TxnDat,112) = '20090513'";
	    sqlstr = sqlstr + " order by TERMID";
	    
	    st = dbConn.createStatement();
	    rs = st.executeQuery(sqlstr);
	} catch (SQLException e) {
//		log.Write("[" + logRMNO + "] Step 1: createStatement......" + e.getMessage()); 
		e.printStackTrace();
	}


 %>
<body>

	<h2>�����������excel��ʽ��ʾhtmlҳ����table��ǩ������</h2>
	<table border=1>
		<tr>
			<td>�̻�����</td>
			<td>�̻����</td>
			<td>�ն˱��</td>
			<td>����ʱ��</td>
			<td>���׽��</td>
			<td>�̻�Ӧ��</td>
			<td>������</td>
			<td>��������</td>
			<td>��ˮ��</td>
		</tr>
		<%
		String TERMID = "";
		int count_POS = 0;
		double totle_TxnAmt = 0.0;
		double totle_CorpShouldPay = 0.0;
		
			while(rs.next()){
				
				
				if(1==2 && TERMID!=rs.getString(3)){
					out.println("<tr>");
					out.println("<td>" + TERMID + "�ն˱�Ż���</td>");
					out.println("<td>������" + String.valueOf(count_POS) + " ���׽�" + String.valueOf(totle_TxnAmt) + " �̻�Ӧ����" + String.valueOf(totle_CorpShouldPay) + " �����" + String.valueOf(totle_TxnAmt-totle_CorpShouldPay) + "</td>");
					out.println("</tr>");
					System.out.println(rs.getString(3));
					TERMID = rs.getString(3);
					count_POS = 0;
					totle_TxnAmt = 0.0;
					totle_CorpShouldPay = 0.0;
				}
				out.println("<tr>");
				out.println("<td>" + rs.getString(1) + "</td>");
				out.println("<td>" + rs.getString(2) + "</td>");
				out.println("<td>" + rs.getString(3) + "</td>");
				out.println("<td>" + rs.getString(4) + "</td>");
				out.println("<td>" + rs.getString(5) + "</td>");
				out.println("<td>" + rs.getString(6) + "</td>");
				out.println("<td>" + rs.getString(7) + "</td>");
				out.println("<td>" + rs.getString(8) + "</td>");
				out.println("<td>" + rs.getString(9) + "</td>");
				out.println("</tr>");
				count_POS++;
//				totle_TxnAmt += rs.getDouble(5);
//				totle_CorpShouldPay += rs.getDouble(6);
				
			}
		 %>
		
	</table>

</body>
</html>

