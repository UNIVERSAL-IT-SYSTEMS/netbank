<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@ page import="com.bocom.midserv.gz.*"%>
<%@ page import="com.viatt.bean.*"%>
<%@ page import="com.viatt.util.*"%>
<%
	String sightName = MessManTool.changeChar(request.getParameter("sightName"));
	String sightCode=MessManTool.changeChar(request.getParameter("sightCode"));
	GzLog log = new GzLog("c:/gzLog");
	String cdno = MessManTool.changeChar(request.getParameter("cardNo"));
	String dse_sessionId = MessManTool.changeChar(request.getParameter("dse_sessionId"));//��ȡdse_sessionId
	String step_id = MessManTool.changeChar(request.getParameter("step_id"));
	String actionType = MessManTool.changeChar(request.getParameter("actionType"));
	String biz_id = MessManTool.changeChar(request.getParameter("biz_id"));
	if (biz_id.equals("")||sightCode.equals("")) {
		System.out.println("�����������ȷ");
	}
	List list = new ArrayList();
	String content = "bocom_mid|biz_id,21|biz_step_id,6|CDNO,"+cdno+"|";
	MidServer midServer = new MidServer();
	BwResult bwResult = midServer.sendMessage(content); 
	if (bwResult == null || bwResult.getCode() == null|| !bwResult.getCode().equals("000")) {
		
	}
	String tmp = bwResult.getContext();
	//System.out.println(tmp);
	MessManTool messManTool = new MessManTool();
	list = messManTool.yinLvTongGetResult3(tmp);
	int total = list.size();
	String currPage1 = request.getParameter("page") != null ? request
			.getParameter("page") : "1";
	int currPage = Integer.parseInt(currPage1);
	PageTools pageTools = new PageTools();
	pageTools.setPageSize(20);
	pageTools.setCurrPage(currPage);
	pageTools.setTotal(total);
	pageTools.setUrl("/personbank/HttpProxy?dse_sessionId="
			+ dse_sessionId + "&URL=/midserv/yinLvTong7.jsp&biz_id="
			+ biz_id);
	int pageSize = pageTools.getPageSize();
	String pagegetRoll = pageTools.pagegetRoll();

	String cssFileName = request.getParameter("cssFileName");//��ȡ�ͻ���ǰʹ�õ�CSS��ʽ
	if(cssFileName ==null){
		cssFileName = "skin.css";
	}
	
%>
<!-------------------------------------------------------------------
                          ��׼JavaScript������
--------------------------------------------------------------------->
<script language="JavaScript"
	src="/personbank/HttpProxy?URL=/midserv/js/public.js&dse_sessionId=<%=dse_sessionId%>"></script>
<script language="JavaScript"
	src="/personbank/HttpProxy?URL=/midserv/js/common.js&dse_sessionId=<%=dse_sessionId%>"></script>

<!--------------------------------------------------------------------
   ��ǰҳ��JavaScript�������֣������ύ��֤��ҳ�涯��������Ŀ��ȴ���
---------------------------------------------------------------------->

<!--------------------------------------------------------------------
                          ҳ��HTML���ֲ���    
---------------------------------------------------------------------->

<html>
	<meta http-equiv="Content-Type" content="text/html; charset=GBK">
	<title>��ͨ�������Ϸ���</title>
	<head>	
		<link rel="stylesheet" type="text/css" href="/personbank/css/<%=cssFileName%>">
	</head>

	<script type="text/javascript">
		function tj1(){
			var input=document.forms[0].getElementsByTagName("input");
			var bn=false;
			for(var i=0;i<input.length;i++){
				var type=input[i].getAttribute("type");
				var mpms=input[i].getAttribute("mpms");
				var dzyhj=input[i].getAttribute("dzyhj");
				var kcrq=input[i].getAttribute("kcrq");
				var jsrq=input[i].getAttribute("jsrq");
				var yxrq=input[i].getAttribute("yxrq");
				var bz=input[i].getAttribute("bz");
				var mpj=input[i].getAttribute("mpj");
				if(type=='radio'){
					bn=input[i].checked;
					if(bn){
						document.getElementById("mpms").value=mpms;
						document.getElementById("dzyhj").value=dzyhj;
						document.getElementById("kcrq").value=kcrq;
						document.getElementById("jsrq").value=jsrq;
						document.getElementById("yxrq").value=yxrq;
						document.getElementById("bz").value=bz;
						document.getElementById("mpj").value=mpj;
						break;
					}
				}
			}
			if(bn){
				document.forms[0].submit();
			}else{
				alert("��ѡ����!");
			}
		}
		function showdiv(param){
			document.getElementById(param).style.display = "block";
		}
		function hiddendiv(param){
			document.getElementById(param).style.display = "none";
		}
	</script>


	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
		<center>
			<div class="indent">
				<table width="100%" align="center" cellpadding="1" cellspacing="1" class="tab">
					<tr align="left"> 
          	<td colspan="2" class="tab_title">�� �� �� ʷ</td>
        	</tr>

				<FORM action="/personbank/HttpProxy" method=post name="f1">
					<input type="hidden" name="dse_sessionId"	value="<%=dse_sessionId%>">
					<input type="hidden" name="URL" value="/midserv/midSelect.jsp">
					
						<tr class="tab_tr" onclick="selectrow(this);" style="cursor:hand;">
							<td align="left" height="22" class="TableRow2">
								��������
							</td>
							<td align="left" height="22"  class="TableRow2">
								��������
							</td>
							<td align="left" height="22"  class="TableRow2">
								��Ʊ����
							</td>
							<td align="left" height="22"  class="TableRow2">
								�������
							</td>
							<td align="left" height="22"  class="TableRow2">
								�ֻ�����
							</td>
							<td align="left" height="22"  class="TableRow2">
								Ԥ������
							</td>
							<td align="left" height="22"  class="TableRow2">
								�����շѽ��
							</td>
							<td align="left" height="22"  class="TableRow2">
								��Ʊ�۸�
							</td>
							<td align="left" height="22"  class="TableRow2">
								��Ʊ����
							</td>
							<td align="left" height="22"  class="TableRow2">
								��������
							</td>
							<td align="left" height="22"  class="TableRow2">
								�����ˮ
							</td>
							<td align="left" height="22"  class="TableRow2">
								ʹ������
							</td>
						</tr>
						<%
							//System.out.println("=1=2="+total);
							for (int i = 0; i < total; i++) {
								if ((i >= (currPage - 1) * pageSize) && (i < currPage * pageSize)) {
									HashMap map = (HashMap) list.get(i);
						%>
						<tr class="tab_tr">
							<td align="left" height="22"  class="<%=(i + 1) % 2 == 1 ? "TableRow1" : "TableRow2"%>">
								<%
									String lx=(String)map.get("param2");
									String lxname="";
									if(lx!=null&&lx.trim().equals("090004")){
										lxname="������Ʊ";
									}else if(lx!=null&&lx.trim().equals("010004")){
										lxname="���μ���";
									}
								%>
								<%=lxname %>
							</td>
							<td align="left" height="22"  class="<%=(i + 1) % 2 == 1 ? "TableRow1" : "TableRow2"%>">
								<%=map.get("param3")%>
							</td>
							<td align="left" height="22"  class="<%=(i + 1) % 2 == 1 ? "TableRow1" : "TableRow2"%>">
								<%=map.get("param4")%>
							</td>
							<td align="left" height="22"  class="<%=(i + 1) % 2 == 1 ? "TableRow1" : "TableRow2"%>">
								<%=map.get("param5")%>
							</td>
							<td align="left" height="22"  class="<%=(i + 1) % 2 == 1 ? "TableRow1" : "TableRow2"%>">
								<%=map.get("param6")%>
							</td>
							<td align="left" height="22"  class="<%=(i + 1) % 2 == 1 ? "TableRow1" : "TableRow2"%>">
								<%=map.get("param8")%>
							</td>
							<td align="left" height="22"  class="<%=(i + 1) % 2 == 1 ? "TableRow1" : "TableRow2"%>">
								<%
									String param9=(String)map.get("param9");
									
									if(param9==null){
										param9="0.0";
									}else if(param9.trim().equals("")){
										param9="0.0";
									}
									double tmp3=Double.parseDouble(param9);
									if(lx!=null&&lx.trim().equals("090004")){
									}else if(lx!=null&&lx.trim().equals("010004")){
										tmp3=tmp3/100;
									}
									
								%>
								
								<%=tmp3 %>
							</td>
							<td align="left" height="22"  class="<%=(i + 1) % 2 == 1 ? "TableRow1" : "TableRow2"%>">
								<%
									String param10=(String)map.get("param10");
									if(param10==null){
										param10="0.0";
									}else if(param10.trim().equals("")){
										param10="0.0";
									}
									double tmp5=Double.parseDouble(param10);
								%>
								
								<%=tmp5 %>
							</td>
							<td align="left" height="22"  class="<%=(i + 1) % 2 == 1 ? "TableRow1" : "TableRow2"%>">
								
								<%=map.get("param11")%>
							</td>
							<td align="left" height="22"  class="<%=(i + 1) % 2 == 1 ? "TableRow1" : "TableRow2"%>">
							
								<%=map.get("param15")%>
							</td>
							<td align="left" height="22"  class="<%=(i + 1) % 2 == 1 ? "TableRow1" : "TableRow2"%>">
							
								<%=map.get("param14")%>
							</td>
							<td align="left" height="22"  class="<%=(i + 1) % 2 == 1 ? "TableRow1" : "TableRow2"%>">
							
								<%=map.get("param16")%>
							</td>
						</tr>
					<%
							}
						}
					%>
						<tr class="tab_tr">
							<td align="left" height="22" class="InputTip" colspan="12">
								<%=pagegetRoll%>
							</td>
						</tr>
						
						<tr class="tab_result">
						<td align="center" colspan="12">
							<input type="button" onclick="tj();" value="�� ��"	class="button_bg">
						</td>
					</tr>
						
					</table>
				</FORM>
			</DIV>
		</center>
	</body>
</html>
