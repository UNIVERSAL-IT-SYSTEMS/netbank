<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@ page import="com.bocom.midserv.gz.*"%>
<%@ page import="com.viatt.bean.*"%>
<%@ page import="com.viatt.util.*"%>
<%
	String sightName = MessManTool.changeChar(request.getParameter("sightName"));
	String sightCode=MessManTool.changeChar(request.getParameter("sightCode"));
	GzLog log = new GzLog("c:/gzLog");
	String dse_sessionId = MessManTool.changeChar(request.getParameter("dse_sessionId"));//��ȡdse_sessionId
	String step_id = MessManTool.changeChar(request.getParameter("step_id"));
	String actionType = MessManTool.changeChar(request.getParameter("actionType"));
	String biz_id = MessManTool.changeChar(request.getParameter("biz_id"));
	if (biz_id.equals("")||sightCode.equals("")) {
		System.out.println("�����������ȷ");
	}
	List list = new ArrayList();
	//String tmp = "1448|bocom_mid|biz_id,21|biz_no,00021|biz_step_id,4|display_zone,|jingquxingxi,"
	//		+ "2691519        ����̨��Ʊ��ƽ�գ�                                000000000580000000000003800020080428200912310201����ס����̨�۾���ͥ��һ��һ��һ�Ŵ�һ��С���ļ�ͥ˫�˷���2���������澳��ɽ������ǧ��徰�������ʯ������Ʊ��2�ţ���С������1.4���뽻��Ʊ��50Ԫ��3����     "
	//		+ "2691520        ����̨��Ʊ����ĩ��                                000000000680000000000004200020080428200912310201����ס����̨�۾���ͥ��һ��һ��һ�Ŵ�һ��С���ļ�ͥ˫�˷���2���������澳��ɽ������ǧ��徰�������ʯ������Ʊ��2�ţ���С������1.4���뽻��Ʊ��50Ԫ��3����     "
	//		+ "2691521        ��Ȥ¥��Ʊ��ƽ�գ�                                000000000480000000000003300020080428200912310201����ס��Ȥ¥�۾���ͥ��һ��һ��˫������2���������澳��ɽ������ǧ��徰�������ʯ������Ʊ��2�ţ���С������1.4���뽻��Ʊ��50Ԫ��3����������Ӫ����ʽ���2λ      "
	//		+ "2691522        ��Ȥ¥��Ʊ����ĩ��                                000000000580000000000003800020080428200912310201����ס��Ȥ¥�۾���ͥ��һ��һ��˫������2���������澳��ɽ������ǧ��徰�������ʯ������Ʊ��2�ţ���С������1.4���뽻��Ʊ��50Ԫ��3����������Ӫ����ʽ���2λ      "
	//		+ "2691820        ������Ʊ                                          00000000009000000000000063002008121920091231030��ѡ��������Ʊ1��������ɽ�ζ��澰����ԭ��65����2����عŴ壨ԭ��20�������Ҷ���ԭ��10����ǧ��壨ԭ��30�������ʯ��ԭ��15������ʯ����ԭ��20���Ⱦ�����ѡ����      "
	//		+ "|MGID,000000|";
	String content = "biz_id," + biz_id + "|i_biz_step_id,4|Provider_Code," + sightCode + "|";
	MidServer midServer = new MidServer();
	BwResult bwResult = midServer.sendMessage(content);
	if (bwResult == null || bwResult.getCode() == null|| !bwResult.getCode().equals("000")) {
		
	}
	String tmp = bwResult.getContext();
	MessManTool messManTool = new MessManTool();
	list = messManTool.yinLvTongGetResult2(tmp);
	session.setAttribute("resultList2", list);
	int total = list.size();
	String currPage1 = request.getParameter("page") != null ? request
			.getParameter("page") : "1";
	int currPage = Integer.parseInt(currPage1);
	PageTools pageTools = new PageTools();
	pageTools.setPageSize(12);
	pageTools.setCurrPage(currPage);
	pageTools.setTotal(total);
	pageTools.setUrl("/personbank/HttpProxy?dse_sessionId="
			+ dse_sessionId + "&URL=/midserv/yinLvTong3.jsp&biz_id="
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
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=GBK">
		<title>��ͨ�������Ϸ���</title>
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
				tj();
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
          	<td colspan="5" class="tab_title">�� ѡ �� �� Ӧ �� �� Ʊ</td>
        	</tr>
					
				<form name="f1" method="post" action="/personbank/HttpProxy">
					<input type="hidden" name="dse_sessionId"	value="<%=dse_sessionId%>">
					<input type="hidden" name="URL" value="/midserv/yinLvTong4.jsp">
					<input type="hidden" name=biz_id value="<%=biz_id %>">
					<input type="hidden" name=step_id value="4">
					<input type="hidden" name=sightName value="<%=sightName%>">
					<input type="hidden" name=sightCode value="<%=sightCode%>">
					<input type="hidden" name=mpms value="">
					<input type="hidden" name=dzyhj value="">
					<input type="hidden" name=mpj value="">
					<input type="hidden" name=kcrq value="">
					<input type="hidden" name=jsrq value="">
					<input type="hidden" name=yxrq value="">
					<input type="hidden" name=bz value="">
					<tr class="tab_tr" onclick="selectrow(this);" style="cursor:hand;">
							<td align="center" width="8%" class="TableRow2">
								ѡ��
							</td>
							<td align="left" width="31%" class="TableRow2">
								��������
							</td>
							<td align="left" width="31%" class="TableRow2">
								��Ʊ����
							</td>
							<td align="left" width="15%" class="TableRow2">
								��Ʊ�۸�
							</td>
							<td align="left" width="15%" class="TableRow2">
								�����Żݼ�
							</td>
						</tr>
						<%
							for (int i = 0; i < total; i++) {
								if ((i >= (currPage - 1) * pageSize)
								&& (i < currPage * pageSize)) {
									HashMap map = (HashMap) list.get(i);
									String price1 = MoneyUtils.FormatMoney(Double.parseDouble(((String) map.get("param4")).trim()) / 100, "#,##0.00Ԫ");
									String price2 = MoneyUtils.FormatMoney(Double.parseDouble(((String) map.get("param5")).trim()) / 100, "#,##0.00Ԫ");
									String price4 = MoneyUtils.FormatMoney(Double.parseDouble(((String) map.get("param4")).trim()) / 100, "###0.00");
									String price3 = MoneyUtils.FormatMoney(Double.parseDouble(((String) map.get("param5")).trim()) / 100, "###0.00");
						%>
						<tr class="tab_tr" onclick="selectrow(this);" style="cursor:hand;"
							onmouseover="showdiv('bz<%=i%>');"
							onmouseout="hiddendiv('bz<%=i%>');">
							<td align="center" width="8%"
								class="<%=(i + 1) % 2 == 1 ? "TableRow1"
									: "TableRow2"%>">
								<input type="radio"
									value="<%=((String) map.get("param2")).trim() %>"
									mpms="<%=((String) map.get("param3")).trim() %>"
									dzyhj="<%=price3 %>" 
									mpj="<%=price4 %>"
									kcrq="<%=map.get("param6") %>"
									jsrq="<%=map.get("param7") %>" 
									yxrq="<%=map.get("param8") %>"
									bz="<%=map.get("param9") %>" 
									name="ticketCode">
							</td>
							<td align="left" width="31%"
								class="<%=(i + 1) % 2 == 1 ? "TableRow1"
									: "TableRow2"%>">
								<%=sightName%>
							</td>
							<td align="left" width="31%"
								class="<%=(i + 1) % 2 == 1 ? "TableRow1"
									: "TableRow2"%>">
								<%=((String) map.get("param3")).trim()%>
							</td>
							<td align="left" width="15%"
								class="<%=(i + 1) % 2 == 1 ? "TableRow1"
									: "TableRow2"%>">
								<%=price1%>
							</td>
							<td align="left" width="15%"
								class="<%=(i + 1) % 2 == 1 ? "TableRow1"
									: "TableRow2"%>">
								<%=price2%>
							</td>
						</tr>
						<tr class="tab_tr" >
							<td colspan="5">
								<div style="display: none;" id="bz<%=i%>">
									<%=map.get("param9")%>
								</div>
							</td>
						</tr>
					<%
							}
						}
					%>
						<tr class="tab_tr" >
							<td align="left" height="22" class="InputTip" colspan="5">
								<%=pagegetRoll%>
							</td>
						</tr>
					
					<tr class="tab_result">
						<td align="center" colspan="5">
							<input type="button" onclick="tj1();" value="��һ��" class="button_bg">
							<input type="button" onclick="window.history.back();" value="�� ��"
								class="button_bg">
							
						</td>
					</tr>
					</table>
				</FORM>
				
			</DIV>
		</center>
	</body>
</html>
