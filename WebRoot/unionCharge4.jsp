<%@ page language="java"  pageEncoding="gbk"%>
<%@ page import="com.bocom.midserv.gz.*"%>
<%@ page import="java.util.Date" %>
<%@ page import="com.viatt.bean.*"%>
<%@ page import="com.viatt.util.*" %>
<%@ page import="java.text.DecimalFormat"%>
<%
				
 	String loginType = request.getParameter("loginType");//���͵�½��� 0��ע���û�(�ֻ���) 1��֤���û� 2�������û�
	String cdno = request.getParameter("cardNo");
	GzLog log = new GzLog("c:/gzLog");
	log.Write("============== ��ͨ��ֵ�ĵ�4��jsp�ļ�========begin========================");
	String dse_sessionId = MessManTool.changeChar(request.getParameter("dse_sessionId"));//��ȡdse_sessionId
	String biz_id = MessManTool.changeChar(request.getParameter("biz_id")); 
	String TelNum = MessManTool.changeChar(request.getParameter("TelNum"));
	String TxnAmt = MessManTool.changeChar(request.getParameter("TxnAmt"));
	String password= MessManTool.changeChar(request.getParameter("bocomPwd"));//��������
	log.Write("#####��ͨ��ֵ���ĸ�ҳ��====TelNum|TxnAmt==="+TelNum+"|"+TxnAmt);
  String cssFileName = request.getParameter("cssFileName");//��ȡ�ͻ���ǰʹ�õ�CSS��ʽ
	if(cssFileName ==null){
		cssFileName = "skin.css";
	}			
		
	
  
Enumeration en = request.getParameterNames();
while(en.hasMoreElements()){
	String str = (String)en.nextElement();
	System.out.println(str + "----" + request.getParameter(str));
}
System.out.println("======================");
Enumeration en1 = request.getHeaderNames();
while(en1.hasMoreElements()){
	String str = (String)en1.nextElement();
	System.out.println(str + "----" + request.getHeader(str));
}

	

	log.Write("receivedPassword is "+password);

	String dynamicCodeMan="";
	String dynamicCodeSeqMan="";
	String dynamicCode="";
	String dynamicCodeSeq="";
	
	if(loginType.equals("0")){
		dynamicCode=MessManTool.changeChar(request.getParameter("dynamicCode"));
		dynamicCodeSeq=MessManTool.changeChar(request.getParameter("dynamicCodeSeq"));
		
		dynamicCodeMan=MessManTool.changeChar(request.getParameter("dynamicCodeMan"));
		dynamicCodeSeqMan=MessManTool.changeChar(request.getParameter("dynamicCodeSeqMan"));
		
		log.Write("��ʾ�Ķ�̬���룺"+dynamicCodeMan+" ϵͳ�Ķ�̬����: "+dynamicCode+" ��ʾ�Ķ�̬�������: "+dynamicCodeSeqMan+" ϵͳ�Ķ�̬������ţ�"+dynamicCodeSeq);
		
		if(!dynamicCodeMan.equals(dynamicCode)){
			System.out.println("��̬�������");
			log.Write("��̬�������");
			AppParam.setParam(dse_sessionId+"midErr1","��������");
			AppParam.setParam(dse_sessionId+"midErr2","��̬�������");
			
%>
			<script type="text/javascript">
					window.location="/personbank/HttpProxy?URL=/midserv/midservError.jsp&dse_sessionId=<%=dse_sessionId%>";
			</script>
<%
			return ;
		}
	}

	//��ʼƴװ�������صı���
	
	String content = "biz_id,33|biz_step_id,2|TelNum,"+TelNum+"|CrdNo,"+cdno+"|TxnAmt,"+TxnAmt+"|PinBlk,"+password; 
	MidServer midServer = new MidServer();	
	
	
	
	log.Write(">>>>>>>>>>>>��ͨ��ֵ��4��ҳ��>>>����ȥ�ı���:"+content);
	
		
	BwResult bwResult = midServer.sendMessage(content);
  
	
	
	if (bwResult == null ) {
			log.Write("���׽������");
			AppParam.setParam(dse_sessionId+"midErr1","��ֵ����ʧ��");
			AppParam.setParam(dse_sessionId+"midErr2","���׹���������������⣬�˴ν���ʧ�ܣ�");
}

	String tmp ="";
    tmp = bwResult.getContext();
 log.Write("<<<<<<<<<<<<��ͨ��ֵ��4��ҳ��><<<���صı���:"+tmp);
	String info=MessManTool.getValueByName(tmp,"MGID");
	
	log.Write("the RspCode is ="+info);

	if(info==null||info.equals("")||!info.equals("000000")){
			log.Write("���ײ��ɹ�");
			log.Write("���ײ��ɹ� ��ԭ���ǣ�"+tmp);
			AppParam.setParam(dse_sessionId+"midErr1","ʧ��");
			AppParam.setParam(dse_sessionId+"midErr2",tmp);
%>
<script type="text/javascript">
	window.location="/personbank/HttpProxy?URL=/midserv/midservError.jsp&dse_sessionId=<%=dse_sessionId%>";
</script>
<%
	return;
	}
     String TckNo = MessManTool.getValueByName(tmp,"TckNo");
	  DecimalFormat df = new DecimalFormat("###,###,##0.00"); 
    double dblTxnAmt = Double.parseDouble(TxnAmt);
    String displayTxnAmt = df.format(dblTxnAmt / 100.0D);
%>


<!-------------------------------------------------------------------
                          ��׼JavaScript������
--------------------------------------------------------------------->
<script language="JavaScript" src="/personbank/HttpProxy?URL=/midserv/js/public.js&dse_sessionId=<%=dse_sessionId%>"></script>
<script language="JavaScript" src="/personbank/HttpProxy?URL=/midserv/js/common.js&dse_sessionId=<%=dse_sessionId%>"></script>
<script language="JavaScript" src="/personbank/HttpProxy?URL=/midserv/js/date.js&dse_sessionId=<%=dse_sessionId%>"></script>
<!--------------------------------------------------------------------
   ��ǰҳ��JavaScript�������֣������ύ��֤��ҳ�涯��������Ŀ��ȴ���
---------------------------------------------------------------------->

<!--------------------------------------------------------------------
                          ҳ��HTML���ֲ���    
---------------------------------------------------------------------->

<html>
	<head>
	  <meta http-equiv="Content-Type" content="text/html; charset=GBK">
		<title>��ͨ�������Ϸ���</title>
		<link rel="stylesheet" type="text/css" href="/personbank/css/<%=cssFileName%>">
	</head>

	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
		<center>
			<DIV align=center>
				<table width="100%" align="center" cellpadding="1" cellspacing="1" class="tab">
					<tr align="left"> 
						<td class="tab_title" align="center" colspan="6">��ͨ��ֵ���׳ɹ�!</td>
					</tr>
					
				<FORM action="/personbank/HttpProxy" method=post name="f1">
					<input type="hidden" name="dse_sessionId"	value="<%=dse_sessionId%>">
					<input type="hidden" name="URL" value="/midserv/midSelect.jsp">
					<input type="hidden" name=biz_id value="<%=biz_id %>">
					<input type="hidden" name=step_id value="1">
					
						
						<tr class="tab_tr">
	           <td  align="right" height="22" class="InputTip">
								��ֵ���룺
							</td>
							<td  align="left" height="22" class="InputTip">
								<%=TelNum%>
							</td>
          </tr>
          <tr class="tab_tr">
							<td  align="right" height="22" class="InputTip">
								��ֵ��
							</td>
							<td  align="left" height="22" class="InputTip">
								<%=displayTxnAmt%> Ԫ
							</td>
					</tr>
						<tr class="tab_tr">
							<td  align="right" height="22" class="InputTip">
								������ˮ�ţ�
							</td>
							<td  align="left" height="22" class="InputTip">
								<%=TckNo%>
							</td>
						</tr>
						
						
					</table>
				</FORM>

			</DIV>
		</center>	  	
	</body>
</html>
