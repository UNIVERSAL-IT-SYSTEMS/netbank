<%@ page language="java" pageEncoding="gbk"%>
<%@ page import="com.bocom.midserv.gz.*"%>
<%@ page import="com.viatt.bean.*"%>
<%@ page import="com.viatt.util.*"%>

<%
	GzLog log = new GzLog("c:/gzLog");
	String dse_sessionId = MessManTool.changeChar(request.getParameter("dse_sessionId"));//��ȡdse_sessionId	
	String loginType = request.getParameter("loginType");//���͵�½��� 0��ע���û�(�ֻ���) 1��֤���û� 2�������û�
	String biz_id = MessManTool.changeChar(request.getParameter("biz_id"));
	if (biz_id.equals("")) {
		System.out.println("�����������ȷ");
	}
	String tmp = "";
	String cdno = MessManTool.changeChar(request.getParameter("cardNo"));
	String content = "biz_id," + biz_id + "|i_biz_step_id,4|CDNO," + cdno + "|";
			
  String cssFileName = request.getParameter("cssFileName");//��ȡ�ͻ���ǰʹ�õ�CSS��ʽ
	if(cssFileName ==null){
		cssFileName = "skin.css";
	}		
				
	MidServer midServer = new MidServer();
	BwResult bwResult = midServer.sendMessage(content);
	if (bwResult == null || bwResult.getCode() == null
			|| !bwResult.getCode().equals("000")) {
			System.out.println("��ѯ��Ϣʧ��");
			AppParam.setParam(dse_sessionId+"midErr1","ʧ��");
			AppParam.setParam(dse_sessionId+"midErr2",bwResult.getContext());

%>
<script type="text/javascript">
	window.location="/personbank/HttpProxy?URL=/midserv/midservError.jsp&dse_sessionId=<%=dse_sessionId%>";
</script>
<%
	return;	
	}
	tmp = bwResult.getContext();
	MessManTool messManTool = new MessManTool();
	messManTool.getValueByName(tmp,"IDNo");
		
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
							var tmp1=document.getElementById("mobile_no").value;
							var tmp3=document.getElementById("card1").value;
							if(!tmp1.isMobile()){
								alert("�ֻ������ʽ���ԣ�");
								return;
							}
							if(tmp3.length < 8){
								alert("���ͨ���ų���������8λ��");
								return;
							}
							clickBoolean=false;
							tj();
						}else{
							alert("�������Ϊ��!");
							return;
						}
						var tmp = confirm("1������������������ȫ��ʵ������ȷ��������������д��������ɵ���ʧ�ɱ������ге���\n2������������׼��񣬱���ͬ���������������ͨ���޹�˾�����б�����\n3�������Ѿ�����˽Ⲣͬ�����ظ��Զ���ֵǩԼ�����������������������Υ���涨����ɵ���ʧ�ͺ��������Ը��е�һ�з������Ρ�\n4������ͬ�Ⲣ��Ȩ��ͨ���д��Զ���ֵǩԼ������ָ���������ʻ��ϻ������ͨ�Զ���ֵ��");
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
						<td class="tab_title">��������ӦǩԼ��Ϣ</td>
					</tr>
					
				<FORM action="/personbank/HttpProxy" method=post name="f1">
					<input type="hidden" name="dse_sessionId"	value="<%=dse_sessionId%>">
					<input type="hidden" name="URL"	value="/midserv/kongZhongChongZhi4.jsp">
					<input type="hidden" name=biz_id value="<%=biz_id%>">
					<input type="hidden" name=step_id value="3">
					<input type="hidden" name=acc_type value="0">
					<input type="hidden" name=IDTyp value="<%=messManTool.getValueByName(tmp,"IDTyp") %>">
					<input type="hidden" name="sendPass" value="<%=loginType.endsWith("0")?"1":"0" %>">
					
						<tr class="tab_tr">
							<td width="50%" align="right" height="22" class="InputTip">
								�û�������
							</td>
							<td width="50%" align="left" height="22" class="InputTip">
								<input type="text" name="cust_name" value="<%=messManTool.getValueByName(tmp,"ActNam")%>" readonly="readonly">
							</td>
						</tr>
						<tr class="tab_tr">
							<td width="50%" align="right" height="22" class="InputTip">
								�û����֤��
							</td>
							<td width="50%" align="left" height="22" class="InputTip">
								<input type="text" name="paper_no" value="<%=messManTool.getValueByName(tmp,"IDNo")%>"  readonly="readonly">
							</td>
						</tr>
						<tr class="tab_tr">
							<td width="50%" align="right" height="22" class="InputTip">
								�Ա�
							</td>
							<td width="50%" align="left" height="22" class="InputTip">
								<select name="sex_code">
									<option value="0">
										��
									</option>
									<option value="1">
										Ů
									</option>
								</select>
							</td>
						</tr>
						<tr class="tab_tr">
							<td width="50%" align="right" height="22" class="InputTip">
								�ֻ����룺
							</td>
							<td width="50%" align="left" height="22" class="InputTip">
								<input type="text" name="mobile_no" value="" onkeypress="onlyMunNoPointer();" maxlength="11"><span class="span1"></span>
							</td>
						</tr>
						<tr class="tab_tr">
							<td width="50%" align="right" height="22" class="InputTip">
								���ͨ���ţ�
							</td>
							<td width="50%" align="left" height="22" class="InputTip">
								<input type="text" name="card1" onkeypress="onlyMunNoPointer();" maxlength="10" value=""><span class="span1"></span>
							</td>
						</tr>
						<tr class="tab_tr">
							<td width="50%" align="right" height="22" class="InputTip">
								��ܰ��ʾ��
							</td>
							<td width="50%" align="left" height="22" class="InputTip">
								���������ͨ��Ƭ�����޷���ȡ,��ͨ������������ֵ����ֵ��Ĵ�ӡƾ����ȡ���ͨ����
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
					 <div class="guide">
         		<ul>��ʾ��
         	  	<li>*&nbsp;&nbsp;1��ÿ�������˻������԰��������ͨ����ÿ�����ͨ��ֻ�ܶ�Ӧһ�������ʺš�</li>
         	  	<li>*&nbsp;&nbsp;2���û������ύ��ǩԼ���׵�һ���ڣ������ͨ�Զ���ֵ�ն˶԰󶨵�ÿһ�����ͨ���ֱ���м������󷽿�ʹ���Զ���ֵ����ֻҪ�ͻ�ǩԼ���ǿͻ����������Լ�������쳣��������Զ���Լ��</li>
         	  	<li>*&nbsp;&nbsp;3����ֵƵ�ȡ���ֵ��Ȳ����Զ���ֵϵͳ�趨��ͳһֵ���û�������Ҫ�������ͨ�Զ���ֵ�ն��Ͻ��и��Ի�ѡ��,Ĭ������Ϊ��ֵƵ��Ϊÿ��һ��,���Ϊ50Ԫ��</li>
         			<li>*&nbsp;&nbsp;4�������ͨ�Զ���ֵ����Э�顷�������ͨ�Զ���ֵ�����³̡��������ͨ�Զ���ֵ����ҵ�����Ϊ��ǩԼ���׵���Ч��ɲ��֣��������˰�������ҵ��ʱ���������ͨ���޹�˾�����������Ѿ�����˽Ⲣͬ�ⰴ�������ļ���ʹ���������Ȩ��������</li>
         			<li>*&nbsp;&nbsp;5���Զ���ֵ�����б���ģ��Թ������ͨ���޹�˾���¹���Ϊ׼��</li>
         		</ul>
    			</div>		
	</body>
</html>
