<%@ page language="java" contentType="text/html;charset=GBK" %>
<%@ page import="com.viatt.util.*"%>
<%@ page import="java.util.*" %>
<%@ page import="com.gdbocom.util.communication.*" %>
<%@ page import="com.viatt.util.GzLog" %>
<%@ page import="com.gdbocom.util.format.*" %>
 
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
	String biz_id = MessManTool.changeChar(request.getParameter("biz_id")); //����������Ǵ�����õ��ģ���������������
	//if (biz_id.equals("") ) {
		
	//}
	log.Write("=============="+tradeName+"========step1:�����Ų�ѯҵ��i_biz_id=["+biz_id+"]"+"����CDNO=["+cdno+"]================");  
	//�������ԣ�����Ŀ��ź�biz_id������ȷ������յ���
	request.setAttribute("BUSCLA", "05");
	String areanum =  request.getParameter("areanum");
 	pageContext.setAttribute("BUSCLA", "05", PageContext.SESSION_SCOPE);

	Map responseValues = new HashMap();
	try{
		 responseValues.putAll(
				Transation.createMapSend(pageContext,"466670","@SGD_A",TransationFactory.SGD466670)
			);
	}catch(Exception e){
		String RspCod = "LOT999";
		String RspMsg = "ͨѶ����"; 
		//gzLog.Write("["+uri+"]MGID����ȷ");
		StringBuffer forwardString = new StringBuffer();
		forwardString.append("RspCod").append("=").append(RspCod);
		forwardString.append("&");
		forwardString.append("RspMsg").append("=").append(RspMsg);
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
             <select name="areanum">
			   	  <%
					List loopBody = (List)responseValues.get("LoopBody");
			        String keyOrder[] = new String[]{"CODE"};
			    	//������Ҫ��ʾ��ֵ������
			    	Map keyType = new HashMap();
			    	//����ѭ������Ҫ��ʾ��ֵ������,
			    	Map loopShowKey = new HashMap();
			    	loopShowKey.put("CODE", "����");
			    	keyType.put("BetLin", WelFormatter.getSingleton(WelFormatter.BETNUM));
			        for(int recordIndex=0; recordIndex<loopBody.size(); recordIndex++){
			        		Map oneRecord = (Map)loopBody.get(recordIndex);
			        		for(int keyIndex=0; keyIndex<1; keyIndex++){
			        			//Ӣ��ֵ������"DrawId"
			        			String key = keyOrder[keyIndex];
			        			//��ʾ���������֣�����"Ͷע�ں�"
			        			//String showName = (String)loopShowKey.get(key);
			        			//ʹ�õĸ�ʽ���������� WelFormatter.getSingleton(WelFormatter.BETNUM)
			        			FormatterInterface type = (FormatterInterface)keyType.get(key);
			        			//Ϊ��ʽ����ֵ
			        			String originValue = (String)oneRecord.get(key);
			        			%>
			        			    <option value="<%=originValue.trim() %>"><%=originValue.substring(2).trim() %></option>
			        			<%
			        		}
			        }
					%>
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
   			<input type="button" class="button_bg" name="Submitpage"  value="�ύ" onclick="javascript:condition_tcusid()"></input>
            <input type="reset" class="button_bg" name="Submitpage" value="����"></input>
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