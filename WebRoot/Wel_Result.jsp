<%@page import="org.apache.commons.lang.StringUtils"%>
<%@ page language="java" contentType="text/html;charset=GBK"%>
<%@ page import="java.net.*" %>
<%@ page import="com.bocom.midserv.gz.*"%>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<%@ page import="com.gdbocom.Transactions.WelLot" %>
<%@ page import="com.gdbocom.util.format.*" %>
<%@include file="/includeFiles/common.jsp" %>
<%
	//������ʾ��ֵ��˳��
	String[] keyOrder = {};

	//���÷�ѭ������Ҫ��ʾ��ֵ������,
	Map sequenceShowKey = new HashMap();

	//����ѭ������Ҫ��ʾ��ֵ������,
	Map showKey = new HashMap();

	//������Ҫ��ʾ��ֵ������
	Map keyType = new HashMap();
	//��ȡbus�ֶ�,�жϽ�������
	String busStr=ReqParamUtil.reqParamTirm(request,"Bus");
	//String busStr = (String)pageContext.getAttribute("Bus", PageContext.SESSION_SCOPE);
	//��ȡ����˵��ý����
	Map responseVal=(Map)request.getAttribute("responseVal");
	
	int bus =Integer.parseInt(busStr);
	String title = "";
	String remark = "";
	if(bus==WelLot.ADDREG){
		title = "�����û�ע��ɹ�";
	}else if(bus==WelLot.UPDREG){
		title = "�����û�ע����Ϣ���ĳɹ�";
	}else if(bus==WelLot.DOUBLE_SEL){//˫ɫ����ѡ
		title = "˫ɫ��ʵʱͶע����ɹ�";
		keyOrder = new String[]{"BetLin", "BetAmt", "TLogNo"};
		showKey.put("DrawId", "Ͷע�ں�");
		showKey.put("BetLin", "Ͷע����");
		showKey.put("BetAmt", "Ͷע���");
		showKey.put("TLogNo", "Ͷע��ˮ��");
		showKey.put("TckNo", "�����ˮ��");
		keyType.put("BetLin", WelFormatter.getSingleton(WelFormatter.BETNUM));
		keyType.put("BetAmt", WelFormatter.getSingleton(WelFormatter.CURRENCY));
	}else if(bus==WelLot.DOUBLE_BETSQRY){//˫ɫ��Ͷע��ѯ
		title = "�����û�ע����Ϣ���ĳɹ�";
	}else if(bus==WelLot.DOUBLE_WINQRY){//˫ɫ���н���ѯ
		title = "�����û�ע����Ϣ���ĳɹ�";
	}else if(bus==WelLot.DOUBLE_FIX_BUY){//˫ɫ��Ͷ����
		title = "˫ɫ��Ͷ����ɹ�";

		keyOrder = new String[]{"BetLin", "BetPer"};

		/*showKey.put("TLogNo", "������ˮ��");*/
		showKey.put("BetLin", "Ͷע����");
		showKey.put("BetPer", "�ײ�����");
		
		keyType.put("BetLin", WelFormatter.getSingleton(WelFormatter.BETNUM));
		keyType.put("BetPer", WelFormatter.getSingleton(WelFormatter.PACKAGE));

	}else if(bus==WelLot.DOUBLE_FIX_CANCEL){//˫ɫ���н���ѯ
		title = "˫ɫ��Ͷȡ���ɹ�";

	}else{
		throw new IllegalArgumentException("�����busֵ");
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
	    			jQuery("#form1").submit();
	    		});
	    	});
        </script>
    </head>
    <body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0"  oncontextmenu="self.event.returnValue=false" onselectstart="return false">
    <div class="indent">
    	<table width="90%" align="center" cellpadding="1" cellspacing="1"  class="tab">
		  <tr align="center" class="tab_title">
		    <td align="left" colspan="2">
		     	<%=title%>
		    </td>
		  </tr>
		  <tr></tr>
		 <tr class="tab_tr">
		  <td colspan="50">
			<%
				for(int keyIndex=0; keyIndex<keyOrder.length; keyIndex++){
					//Ӣ��ֵ������"DrawId"
					String key = keyOrder[keyIndex];
					//��ʾ���������֣�����"Ͷע�ں�"
					String showName = (String)showKey.get(key);
					//ʹ�õĸ�ʽ���������� WelFormatter.getSingleton(WelFormatter.BETNUM)
					FormatterInterface type = (FormatterInterface)keyType.get(key);
					//Ϊ��ʽ����ֵ
					String originValue = (String)responseVal.get(key);
					if(StringUtils.isEmpty(originValue)){
						originValue=ReqParamUtil.getParamAttr(request,key);
					}
					if(null==originValue){
						out.println("<label>"+showName+":null</label><br/>");
					}else if(null==type){
						out.println("<label>"+showName+":"+originValue+"</label><br/>");
					}else{
						//��ʽ�����ֵ
						String formattedValue = type.getFormattedValue(StringUtils.trim(originValue));
						out.println("<label>"+showName+":"+formattedValue+"</label><br/>");
					}
				}
			%>
			</td>
	     </tr>
	     <tr class="tab_tr"> 
	        <td align="center" colspan="50">
	            <%=remark%>
	        </td>
	     </tr>
	     <tr class="tab_result"> 
	        <td align="center" colspan="2">
	            <input type="button" class="button_bg" value="����" id="btn_back" style="cursor:hand;"/>
	        </td>
	     </tr>
	    </table>
	    <form action="/personbank/HttpProxy" method="post" id="form1">
        	<input type="hidden" name="URL" value="/midserv/Wel_Bus_Sel.jsp"/>
        	<input type="hidden" name="dse_sessionId" value="<%=dse_sessionId%>"/>
	    </form>
   	</div>
   	</div>
    </body>
</html>
<%!
	public String getFormattedValue(String value, String type){
		if("BigDecimal".equals(type)){
			return new DecimalFormat("#,###.00").format(Double.parseDouble(value)/100.0);
		}else{
			return value;
		}

	}
	
%>