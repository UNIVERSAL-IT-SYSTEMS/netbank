<%@ page language="java" pageEncoding="gbk"%>
<%@ page import="com.bocom.midserv.gz.*"%>
<%@ page import="com.viatt.bean.*"%>
<%@ page import="com.viatt.util.*"%>

<%
	GzLog log = new GzLog("c:/gzLog");
	log.Write("###########��Լ��ʱ��������ѯ������ʾ�ͻ������Ҫ��########yiDongChargeA.jsp######begins");
	String dse_sessionId = MessManTool.changeChar(request.getParameter("dse_sessionId"));//��ȡdse_sessionId	
	String loginType = request.getParameter("loginType");//���͵�½��� 0��ע���û�(�ֻ���) 1��֤���û� 2�������û�
	String biz_id = MessManTool.changeChar(request.getParameter("biz_id"));
	if (biz_id.equals("")) {
		System.out.println("�����������ȷ");
	}
	
	
	String optType = "deReg";//reg--ǩԼ deReg--��Լ
	String cdno = MessManTool.changeChar(request.getParameter("cardNo"));
	String content = "biz_id,32|biz_step_id,3|TXNSRC,WE441|ActNo,"+cdno;
	log.Write(">>>>��Լ��ѯ����yiDongChargeA.jsp>>>>>>>>>>������content����Ϊ��" +content);
			
    String cssFileName = request.getParameter("cssFileName");//��ȡ�ͻ���ǰʹ�õ�CSS��ʽ
	if(cssFileName ==null){
		cssFileName = "skin.css";
	}		
	
	log.Write("======The cssFileName is :"+cssFileName);
	
				
	MidServer midServer = new MidServer();
	BwResult bwResult = midServer.sendMessage(content);
	
	
	
	if (bwResult == null || bwResult.getCode() == null|| !bwResult.getCode().equals("000")) {
		//����Ϊ�ջ����������ʱ��
			log.Write("��ѯ��Ϣʧ��");			
			AppParam.setParam(dse_sessionId+"midErr1","ʧ��");
			AppParam.setParam(dse_sessionId+"midErr2","��ѯʧ��");
%>
			<script type="text/javascript">
				window.location="/personbank/HttpProxy?URL=/midserv/midservError.jsp&dse_sessionId=<%=dse_sessionId%>";
			</script>
<%
				return;	
	}
	
	log.Write("<<<<<<<<<<<<<��Լ��ѯ���ر���_bwResult:"+bwResult);

	log.Write("##########_Hello_####");
	String message="default";
	log.Write("##########_the Message is _######"+message);
	
	message = bwResult.getContext();
	log.Write("##########_bwResult.getContext==="+message);	
	

	MessManTool messManTool = new MessManTool();

	

	
	//��ȡ��ѯ����ȥ�õ���ֵ
	String IdTyp = messManTool.getValueByName(message, "IdTyp");
	String IdNo  = messManTool.getValueByName(message, "IdNo");
	String ActNam= messManTool.getValueByName(message, "ActNam");
	String ActSts= messManTool.getValueByName(message, "ActSts");
	
	String IdTypeName="";
	
	
	int idtype = Integer.parseInt(IdTyp.trim());
		
	switch(idtype)
	{
		case 15: IdTypeName="�������֤"; break; 
		case 23: IdTypeName="���ڲ�"; break;
		case 19: IdTypeName="�۰�ͨ��֤"; break;
		case 16: IdTypeName="��ʱ���֤"; break;
		case 25: IdTypeName="����˾���֤"; break;
		case 18: IdTypeName="�侯���֤"; break;
		case 17: IdTypeName="�������֤"; break;
		case 21: IdTypeName="����"; break;
		default : IdTypeName="�������֤��";
		
	}
	
		
%>

<!-------------------------------------------------------------------
                          ��׼JavaScript������
--------------------------------------------------------------------->
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
		<meta http-equiv="Content-Type" content="text/html; charset=GBK">
		<title>��ͨ�������Ϸ���</title>
		<link rel="stylesheet" type="text/css" href="/personbank/css/<%=cssFileName%>">
		<script type="text/javascript">
			var clickBoolean=true;
			function tj1(){
				if(clickBoolean){
						var input=document.forms[0].getElementsByTagName("input");
						var bn=true;
						for(var i=0;i<input.length;i++){
							var type=input[i].getAttribute("type");
							if(type=='text'||type=='bocomPwd'){
								if(input[i].value==''||input[i].value==null){
											bn=false;
											break;
								}
							} 
						}
						if(bn){
							var tmp1=document.getElementById("mainNo").value;
							if(tmp1.length!=11){
								alert("�ֻ�λ��������������������");
								return;
							}
							clickBoolean=false;
							tj();
						}else{
							alert("�������Ϊ��!");
							return;
						}
						var tmp = confirm("�Ƿ�ȷ��Ҫ�������н�Լ������");
						if(tmp)
						{
							
						}
						else{
							window.location="/personbank/HttpProxy?dse_sessionId=<%=dse_sessionId %>&URL=/midserv/midSelect.jsp";
						}
					}
			}
		</script>
	</head>

	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
		<center>
			<div class="indent">
				<table width="100%" align="center" cellpadding="1" cellspacing="1" class="tab">
					<tr align="left"> 
						<td class="tab_title">��������Ӧ��Լ��Ϣ</td>
					</tr>
					
				<FORM action="/personbank/HttpProxy" method=post name="f1">
					<input type="hidden" name="dse_sessionId"	value="<%=dse_sessionId%>">
					<input type="hidden" name="URL"	value="/midserv/yiDongChargeB.jsp">
					<input type="hidden" name=biz_id value="<%=biz_id%>">
					<input type="hidden" name=step_id value="3">
					<input type="hidden" name=acc_type value="0">
					<input type="hidden" name="sendPass" value="<%=loginType.endsWith("0")?"1":"0" %>">
					<input type="hidden" name="optType"	value="<%=optType%>">
					<input type="hidden" name="IdTyp"	value="<%=IdTyp%>">
					
						<tr class="tab_tr">
							<td width="50%" align="right" height="22" class="InputTip">
								�û�������
							</td>
							<td width="50%" align="left" height="22" class="InputTip">
								<input type="text" name="ActNam" value="<%=ActNam%>" readonly="readonly">
							</td>
						</tr>
						<tr class="tab_tr">
							<td width="50%" align="right" height="22" class="InputTip">
								֤�����ͣ�
							</td>
							<td width="50%" align="left" height="22" class="InputTip">
								<input type="text" name="IdTypeName" value="<%=IdTypeName%>" readonly="readonly">
							</td>
						</tr>
						<tr class="tab_tr">
							<td width="50%" align="right" height="22" class="InputTip">
								֤�����룺
							</td>
							<td width="50%" align="left" height="22" class="InputTip">
								<input type="text" name="IdNo" value="<%=IdNo%>"  readonly="readonly">
							</td>
						</tr>
						<tr class="tab_tr">
							<td width="50%" align="right" height="22" class="InputTip">
								ǩԼ�����룺
							</td>
							<td width="50%" align="left" height="22" class="InputTip">
								<input type="text" name="mainNo" value="" onkeypress="onlyMunNoPointer();" maxlength="11"><span class="span1"></span>
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
				
			</DIV>
		</center>
					 
	</body>
</html>
