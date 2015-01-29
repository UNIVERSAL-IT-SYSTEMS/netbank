<%@page import="com.gdbocom.util.HpTenBallCreater.HpTenParam"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@ page language="java" contentType="text/html;charset=GBK"%>
<%@ page import="com.bocom.midserv.gz.*"%>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<%@ page import="com.gdbocom.util.format.*" %>
<%@ page import="com.gdbocom.Transactions.WelLot" %>
<%@include file="/includeFiles/common.jsp" %>
<%
	//������ʾ��ֵ��˳��
	String[] keyOrder = {};

	//���÷�ѭ������Ҫ��ʾ��ֵ������,
	Map sequenceShowKey = new HashMap();

	//����ѭ������Ҫ��ʾ��ֵ������,
	Map loopShowKey = new HashMap();
	
	//��ȡ����˵��ý����
	Map responseVal=(Map)request.getAttribute("responseVal");
	
	//������Ҫ��ʾ��ֵ������
	Map keyType = new HashMap();

	int bus = Integer.parseInt(ReqParamUtil.reqParamTirm(request,"Bus"));
	String title = "";
	String remark = "";
	if(bus==WelLot.HP_TEN_QRY){//˫ɫ��Ͷע��ѯ
		title = "";
		keyOrder = new String[]{"DrawId","KenoId","BetLin", "BetAmt","PlayId","TLogNo"};
		
		loopShowKey.put("DrawId", "Ͷע�ں�");
		loopShowKey.put("KenoId", "С�ں�");
		loopShowKey.put("PlayId", "Ͷע����");
		loopShowKey.put("BetLin", "Ͷע����");
		loopShowKey.put("BetAmt", "Ͷע���");
		loopShowKey.put("TLogNo", "Ͷע��ˮ��");
		
		keyType.put("BetLin", WelFormatter.getSingleton(WelFormatter.BETNUM_HPTEN));
		keyType.put("BetAmt", WelFormatter.getSingleton(WelFormatter.CURRENCY));

	}else if(bus==WelLot.HP_TEN_WINQRY){//˫ɫ���н���ѯ
		title = "";
		keyOrder = new String[]{"DrawId","KenoId","BetLin", "PrzAmt","PlayId", "TLogNo"};
		
		loopShowKey.put("DrawId", "�н��ں�");
		loopShowKey.put("KenoId", "С�ں�");
		loopShowKey.put("PlayId", "Ͷע����");
		loopShowKey.put("BetLin", "�н�����");
		loopShowKey.put("PrzAmt", "�н����");
		loopShowKey.put("TLogNo", "Ͷע��ˮ��");
		
		keyType.put("BetLin", WelFormatter.getSingleton(WelFormatter.BETNUM_HPTEN));
		keyType.put("PrzAmt", WelFormatter.getSingleton(WelFormatter.CURRENCY));

	}else{
		title = "";
	}
%>

<html>
    <head>
        <title>��ͨ�������Ϸ���</title>
        <link rel="stylesheet" type="text/css" href="/personbank/css/<%=cssFileName%>"></link>
    </head>
    <body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0"  oncontextmenu="self.event.returnValue=false" onselectstart="return false">
    <div class="indent">
    <form action="/personbank/HttpProxy" method="post" name="form1">
        <!-- ���ж����ֶ� -->
        <input type="hidden" name="URL" value="/midserv/Wel_Bus_Sel.jsp"/>
        <input type="hidden" name="dse_sessionId" value="<%=dse_sessionId%>"/>
        <table width="90%" align="center" cellpadding="1" cellspacing="1"  class="tab">
		  <tr align="center" class="tab_title">
		    <td align="left" colspan="2">
		      Ͷע���:
		    </td>
		  </tr>
		  <tr></tr>
		 <tr class="tab_tr">
	        <td align="left">
	            <%
	String loopCntStr=responseVal.get("LoopCnt").toString();
	int loopCnt =Integer.parseInt(loopCntStr);
	if(0==loopCnt){
		out.println("<label>�޼�¼</label><br/>");
	}else{
		List loopBody = (List)responseVal.get("LoopBody");
		//���ѭ���ֶ�
		for(int recordIndex=0; recordIndex<loopBody.size(); recordIndex++){
			Map oneRecord = (Map)loopBody.get(recordIndex);
			for(int keyIndex=0; keyIndex<keyOrder.length; keyIndex++){
				//Ӣ��ֵ������"DrawId"
				String key = keyOrder[keyIndex];
				//��ʾ���������֣�����"Ͷע�ں�"
				String showName = (String)loopShowKey.get(key);
				//ʹ�õĸ�ʽ���������� WelFormatter.getSingleton(WelFormatter.BETNUM)
				FormatterInterface type = (FormatterInterface)keyType.get(key);
				//Ϊ��ʽ����ֵ
				String originValue = StringUtils.trimToEmpty((String)oneRecord.get(key));
				
				if("PlayId".equals(key)){
					HpTenParam param=new HpTenBallCreater(originValue).getParam();
					out.println("<label>"+showName+":"+param.name+"</label><br/>");
				}else if(null==originValue){
					out.println("<label>"+showName+":null</label><br/>");
				}else if(null==type){
					out.println("<label>"+showName+":"+originValue+"</label><br/>");
				}else{
					//��ʽ�����ֵ
					String formattedValue = type.getFormattedValue(originValue);
					out.println("<label>"+showName+":"+formattedValue+"</label><br/>");

				}

			}
			out.println("<label>***********************</label><br/>");

		}
	}
%>
	        </td>
	     </tr>
	     <tr class="tab_tr"> 
	        <td align="left">
	             ��ע:
	        </td>
	        <td align="left"> 
				<%=remark%>
	        </td>
	     </tr>
	     <tr class="tab_result"> 
	        <td align="center" colspan="2">
	            <input type="submit" class="button_bg" value="ȷ��" style="cursor:hand;"/>
	        </td>
	     </tr>
	     </table>
	    <%=
			ReqParamUtil.reqParamAttrToHtmlStr(request)
		 %>
		</form>
	</div>
	</body>
</html>