<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
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


	String biz_step_id="1";  //��ʱ��ôд


    String cdno = request.getParameter("cardNo");

	GzLog log = new GzLog("c:/gzLog");
	log.Write("==============������ �����ɷѵĵ�һ������========begin========================");
	String dse_sessionId = MessManTool.changeChar(request.getParameter("dse_sessionId"));//��ȡdse_sessionId
	String biz_id = MessManTool.changeChar(request.getParameter("biz_id")); //����������Ǵ�����õ��ģ���������������
	if (biz_id.equals("") ) {
		System.out.println("�����������ȷ");
	}
	log.Write("#########�����ɷ�==========step1:	�����Ų�ѯҵ��i_biz_id=["+biz_id+"]"+"����CDNO=["+cdno+"]================##############");  
	//�������ԣ�����Ŀ��ź�biz_id������ȷ������յ���
%>
	

<script language="JavaScript"
	src="/personbank/HttpProxy?URL=/midserv/js/public.js&dse_sessionId=<%=dse_sessionId%>"></script>
<script language="JavaScript"
	src="/personbank/HttpProxy?URL=/midserv/js/common.js&dse_sessionId=<%=dse_sessionId%>"></script>
<script language="JavaScript"
	src="/personbank/HttpProxy?URL=/midserv/js/date.js&dse_sessionId=<%=dse_sessionId%>"></script>

<!--------------------------------------------------------------------
   ��ǰҳ��JavaScript�������֣������ύ��֤��ҳ�涯��������Ŀ��ȴ���
---------------------------------------------------------------------->

<!--------------------------------------------------------------------
                          ҳ��HTML���ֲ���    
---------------------------------------------------------------------->

<html>

	<head>
		<title>��ͨ�������Ϸ���</title>
		<link rel="stylesheet"
			href="/personbank/HttpProxy?URL=/midserv/css/personbank.css&dse_sessionId=<%=dse_sessionId%>">
		<link rel="stylesheet"
			href="/personbank/HttpProxy?URL=/midserv/css/midserv.css&dse_sessionId=<%=dse_sessionId%>">
		<link href="/personbank/css/csspt.css" rel="stylesheet"
			type="text/css">
		<link href="/personbank/css/content.css" rel="stylesheet"
			type="text/css">
		
		<script language="JavaScript" type="text/JavaScript">
		
			var clickBoolean;
			clickBoolean = false;		
			function beforeSubmit(){
				alert(document.form1.TCusId.value);
				alert(document.form1.LChkTm.value);
				//�����������ڵ�һ���жϺ���ʾ��
				if (document.form1.LChkTm.value.length!=6 && document.form1.LChkTm.value.length!=1){
					alert("������ѯ�ض����µĵ�ѣ���������λ���룬ǰ4λΪ��ݣ���2λΪ�·ݡ� ������ѯ�����·ݵļ�¼����������1λ���ּ��ɡ�");
					return false;
				}
				//����������6λ���֣����չ涨����Ҫ���������λ9
				else if(document.form1.LChkTm.value.length==6){
					document.form1.LChkTm.value =  document.form1.LChkTm.value+"99";
					alert(document.form1.LChkTm.value);
					return true
				}
				//����������1λ���֣�˵����Ҫ��ѯ�����·ݵ��˵�����ֵ��ֵ�ɡ�99999999��
				else if(document.form1.LChkTm.value.length==1){
					document.form1.LChkTm.value="99999999";
					alert("��ѯ�����·ݵĻ�"+document.form1.LChkTm.value);
					return true
				}	
				return false;
			}
	
			function tiJiao(){
				clickBoolean = beforeSubmit();
				if(clickBoolean)
				  {
					clickBoolean = false;
					tj();
				    //window.location="/personbank/HttpProxy?dse_sessionId=<%=dse_sessionId %>&URL=/midserv/dianLiJiaoFei2.jsp&biz_id=<%=biz_id%>";
				    
				  }
				
			}	
		</script>			
	</head>
	
	<body leftmargin="0" topmargin="0">
	<DIV align=center>
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td
					background="/personbank/HttpProxy?URL=/midserv/images/pageTitle.gif&dse_sessionId=<%=dse_sessionId%>"
					class="pageTitle">
					&nbsp;&nbsp;��Ѳ�ѯ
				</td>
			</tr>
			<tr>
				<td>
					<img src="/personbank/HttpProxy?URL=/midserv/images/xianb.gif&dse_sessionId=<%=dse_sessionId%>"
						 width="100" height="20">
				</td>
			</tr>
		</table>
	

		<FORM action="/personbank/HttpProxy" method=post name="form1">
			<input type="hidden" name="URL" value="/midserv/dianLiJiaoFei2.jsp">
			<input type="hidden" name="dse_sessionId" value="<%=dse_sessionId%>">
			<input type="hidden" name=biz_id value="<%=biz_id%>">
			<input type="hidden" name=step_id value="1">	
			<input type="hidden" name="CDNO" value="<%=cdno%>">	
			
			
			<table border="0" cellspacing="2" cellpadding="0" align="center" width="78%">
				<tr>
					<td width="50%" align="right" height="22" class="InputTip">�ͻ����:</td>
					<td width="50%" align="left" height="22" class="InputTip">
						<input type="text" name="TCusId" size="20" value="" maxlength="21">
					</td>
				</tr>
				<tr>
					<td width="50%" align="right" height="22" class="InputTip">	����º�:</td>
					<td width="50%" align="left" height="22" class="InputTip">
						<input type="text" name="LChkTm" size = "20" value ="" maxlength="8">
					</td>
				</tr>	
			</table>
			<br>

		  	<input type="button" onclick="tiJiao();" value="��ѯ" style={cursor:hand;}>
			<input type="reset" class="IN" name="Submit2" value="����">
			<input type="button" class="IN" name="Submit3" value="����" onclick="javascript:history.back()" > 	
		<br>
		<br>
		</FORM>	
	</div>
	</body>	
</html>	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	