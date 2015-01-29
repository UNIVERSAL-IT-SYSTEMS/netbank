<%@page import="org.apache.commons.lang.StringUtils"%>
<%@ page language="java" contentType="text/html;charset=GBK"%>
<%@ page import="com.bocom.midserv.gz.*"%>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<%@ page import="com.gdbocom.util.format.*" %>
<%@ page import="com.gdbocom.Transactions.WelLot" %>
<%@include file="/includeFiles/common.jsp" %>
<%
	String CrdNo = ReqParamUtil.reqParamTirm(request,"cardNo");

	//��ȡ����˵��ý����
	Map resVal=(Map)request.getAttribute("responseVal");
	
	//������ʾ��ֵ��˳��
	String[] keyOrder = null;

	//���÷�ѭ������Ҫ��ʾ��ֵ������,
	Map sequenceShowKey = new HashMap();

	//����ѭ������Ҫ��ʾ��ֵ������,
	Map loopShowKey = new HashMap();

	//������Ҫ��ʾ��ֵ������
	Map keyType = new HashMap();

	int bus = Integer.parseInt(ReqParamUtil.reqParamTirm(request,"Bus"));
	String title = "";
	String remark = "";
	if(bus==WelLot.DOUBLE_FIX_QRY){//˫ɫ��Ͷע��ѯ
		title = "";
		//sequenceShowKey.put("CrdNo", "ǩԼ�ֻ���");
		keyOrder = new String[]{"PlanNo", "BetPer", "BetLin", "BetAmt", "DoPer", "LevPer"};
		
		loopShowKey.put("BetPer", "�ײ�����");
		loopShowKey.put("BetLin", "Ͷע����");
		loopShowKey.put("BetAmt", "Ͷע���");
		loopShowKey.put("DoPer", "��Ͷע����");
		loopShowKey.put("LevPer", "ʣ��Ͷע����");
		
		keyType.put("BetLin", WelFormatter.getSingleton(WelFormatter.BETNUM));
		keyType.put("BetAmt", WelFormatter.getSingleton(WelFormatter.CURRENCY));

	}else{
		title = "";
	}
%>
<html>
    <head>
        <title>��ͨ�������Ϸ���</title>
        <link rel="stylesheet" type="text/css" href="/personbank/css/<%=cssFileName%>"></link>
        <script type="text/javascript" src="/personbank/HttpProxy?URL=/midserv/js/jquery-1.11.1.min.js&dse_sessionId=<%=dse_sessionId%>"></script>
        <script type="text/javascript"  charset="UTF-8" src="/personbank/HttpProxy?URL=/midserv/js/formValidator.js&dse_sessionId=<%=dse_sessionId%>"></script>
        <script type="text/javascript"  charset="UTF-8" src="/personbank/HttpProxy?URL=/midserv/js/formValidatorRegex.js&dse_sessionId=<%=dse_sessionId%>"></script>
        <script type="text/javascript">
	    	jQuery(document).ready(function(){
	    		jQuery("#btn_back").click(function(){
	    			jQuery("#backForm").submit();
	    		});
	    	});
        </script>
    </head>
    <body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0"  oncontextmenu="self.event.returnValue=false" onselectstart="return false">
    <div class="indent">
    <form action="/personbank/HttpProxy" method="post" name="form1">
        <!-- ���ж����ֶ� -->
        <input type="hidden" name="URL" value="/midserv/Wel_Fix_DCnf.jsp"/>
        <table width="90%" align="center" cellpadding="1" cellspacing="1"  class="tab">
		  <tr align="center" class="tab_title">
		   <td align="left" colspan="2">
		      <%=title%>
		    </td>
		  </tr>
		  <tr></tr>
		 <tr class="tab_tr"> 
	        <td align="right">
	                 ǩԼ���ţ�
	        </td>
	        <td align="left"> 
				<%=CrdNo%>
	        </td>
	     </tr>
	     <tr class="tab_tr"> 
	        <td align="" colspan="5">
		<%
			String loopCntStr=resVal.get("LoopCnt").toString();
			int loopCnt = Integer.parseInt(loopCntStr);
			if(0==loopCnt){
				out.println("<label>�޼�¼</label><br/>");
			}else{
				//���ѭ���ֶ�
				List loopBody = (List)resVal.get("LoopBody");
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
						String originValue = (String)oneRecord.get(key);
			
						if(null==originValue){
							out.println("<label>"+showName+":null</label><br/>");
						}else if("PlanNo".equals(key)){
							out.println("<input type='radio' name='"+key+"' value='"+originValue+"' />");
						}else if(null==type){
							out.println("<label>"+showName+":"+originValue+"</label><br/>");
						}else{
							//��ʽ�����ֵ
							String formattedValue = type.getFormattedValue(StringUtils.trimToEmpty(originValue));
							
							out.println("<label>"+showName+":"+formattedValue+"</label><br/>");
		
						}
			
					}
					out.println("<label>***********************</label><br/>");
			
				}
			}
		%>
		</td>
		</tr>
		  <tr class="tab_result"> 
	        <td align="center" colspan="2">
	            <input type="submit" class="button_bg" value="����" style="cursor:hand;"/>
	            <input type="button" class="button_bg" value="����" id="btn_back" style="cursor:hand;"/>
	        </td>
	     </tr>
	     <tr class="tab_result"> 
	        <td align="center" colspan="2">
	            <label><%=remark%></label>
	        </td>
	     </tr>
	     </table>
	    <%=
			ReqParamUtil.reqParamAttrToHtmlStr(request)
		 %>
	</form>
	<form action="/personbank/HttpProxy" method="post" id="backForm">
       	<input type="hidden" name="URL" value="/midserv/Wel_Fix_Sel.jsp"/>
       	<input type="hidden" name="dse_sessionId" value="<%=dse_sessionId%>"/>
    </form>
	</div>
	</body>
</html>
