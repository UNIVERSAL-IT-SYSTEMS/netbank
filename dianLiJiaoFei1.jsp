<%@ page language="java" contentType="text/html;charset=GBK"%>
<%@ page import="com.bocom.midserv.gz.*"%>
<%@ page import="com.viatt.util.*" %>
<%
	GzLog log = new GzLog("c:/gzLog");
	log.Write("==============�����ɷѣ�=====1ST PAGE======begin====================");
	String dse_sessionId = MessManTool.changeChar(request.getParameter("dse_sessionId"));//
	String biz_id=MessManTool.changeChar(request.getParameter("biz_id"));
	String step_id = MessManTool.changeChar(request.getParameter("step_id"));
	String cdno = request.getParameter("cardNo");
	log.Write("==========step1:	�����ɷѣ�dianLiJiaoFei1.jsp _biz_id=["+biz_id+"]"+"####CDNO=["+cdno+"]================##############");  
	
  String cssFileName = request.getParameter("cssFileName");//
	if(cssFileName ==null){
		cssFileName = "skin.css";
	}		
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
		
		
		<script type="text/javascript">
			function tj1(){

						
					var tmp2=document.getElementById("chkDate").value;
					
					if(tmp2.length==1||tmp2.length==6){
					
						document.getElementById("f1").submit(); 
					
					}
					
					else {
						alert("��ѯ���ڸ�ʽ����������������룡");
						return;
					}
					
									
			}
		</script>
		
	</head>
	

	
	
	<body>
		
				<div class="indent">
				<table width="100%" align="center" cellpadding="1" cellspacing="1" class="tab">
				
						<FORM action="/personbank/HttpProxy" method=post name="f1" id="f1">
							<input type="hidden" name="dse_sessionId"	value="<%=dse_sessionId%>">
							<input type="hidden" name="URL"	value="/midserv/dianLiJiaoFei2.jsp">
							<input type="hidden" name=biz_id value="<%=biz_id%>">
							<input type="hidden" name=step_id value="3">
							
							
							
									<tr align="left"> 
										<td class="tab_title">�������ѵ���ѯ��Ϣ</td>
									</tr>
									<tr class="tab_tr">
										<td width="50%" align="center" height="22" class="InputTip">
											�ɷѿ���:
										</td>
										<td width="50%" align="center" height="22" class="InputTip">
											<input type="text" name="cdno" value="<%=cdno%>" readonly="readonly">
										</td>
									</tr>
									
									<tr class="tab_tr">
										<td width="50%" align="center" height="22" class="InputTip">
											�ͻ����:
										</td>
										<td width="50%" align="center" height="22" class="InputTip">
											<input type="text" name="accountNo"  maxlength="21" value="">
										</td>
									</tr>
									<tr class="tab_tr">
										<td width="50%" align="center" height="22" class="InputTip">
											��ѯ����:
										</td>
										<td width="50%" align="center" height="22" class="InputTip">
											<input type="text" name="chkDate"  maxlength="6"  value="">
										</td>
									</tr>
									
									
									<tr class="tab_result">
										<td align="center" colspan="2">
											<input type="button" onclick="tj1();" value="��һ��" class="button_bg">
											<input type="button" onclick="window.history.back();" value="�� ��"	class="button_bg">
										</td>
									</tr>
							</table>
							
						</FORM>
						
					<label>��ѯ�������뷽ʽ��<br/>
											1: ��ѯ�ض����µĵ�ѣ�������6λ���룬ǰ4λΪ��ݣ���2λΪ�·ݣ��磺201202
					</label>
					<br/>
					<label>
											2: ������ѯ���е���˵�����������1λ���ּ��ɡ�
					</label>
									
				</div>
		
	</body>
</html>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	