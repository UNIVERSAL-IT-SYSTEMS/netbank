<%@ page language="java" contentType="text/html;charset=GBK"%>
<%@ page import="com.viatt.util.*"%>
<%@ page import="com.bocom.midserv.gz.*"%>
<%@ page import="java.math.BigInteger" %>
<%@ page import="com.gdbocom.util.format.*" %>
<%@ page import="com.gdbocom.action.wel.*" %>
<%@include file="/includeFiles/common.jsp" %>
<%
	//String cdno = request.getHeader("MBK_ACCOUNT");
	String cdno = ReqParamUtil.reqParamTirm(request,"cardNo");
	
	String loginType =ReqParamUtil.reqParamTirm(request,"loginType");//���͵�½��� 0��ע���û�(�ֻ���) 1��֤���û� 2�������û�
	//�������������Ҫ��ת��ҳ��
	String forwardPage = "Wel_Confirm.jsp";
	//���ó��������Ҫ��ת��ҳ��
	String errPage = "errPage.jsp";

	String BetMod="";
	String BetLin="";
	String forepart="";
	String rear="";
	int forepart_cnt=0;
	int rear_cnt=0;

	//����ǰ��
	for(int i=1;i<=33;i++){
		if(request.getParameter("forepart"+i)!=null){
			forepart+=request.getParameter("forepart"+i);
			forepart_cnt++;
		}
	}
	//��������
	for(int i=1;i<=16;i++){
		if(request.getParameter("rear"+i)!=null){
			rear+=request.getParameter("rear"+i);
			rear_cnt++;
		}
	}
	//ƴ��Ͷע�����ֶ�
	BetLin = this.formatnumber(forepart_cnt)+forepart+this.formatnumber(rear_cnt)+rear;
	String ShowNum = WelFormatter.getSingleton(WelFormatter.BETNUM)
			.getFormattedValue(BetLin);
	//pageContext.setAttribute("BetLin", BetLin, PageContext.SESSION_SCOPE);
	request.setAttribute("BetLin", BetLin);
	
	if(forepart_cnt>=6&&forepart_cnt<=16&&rear_cnt>=1){//�Ϸ��ĺ������

		if(forepart_cnt==6&&rear_cnt==1){//��ʽ
			BetMod="1";
		}else{//��ʽ
			BetMod="12";
		}
		//pageContext.setAttribute("BetMod", BetMod, PageContext.SESSION_SCOPE);
		request.setAttribute("BetMod", BetMod);
	}else{//�Ƿ��ĺ������
		String RspCod = "Wel999";
		String RspMsg = "�Ƿ�������"; 
		DebugUtils.log(request,"MGID����ȷ");

		StringBuffer forwardString = new StringBuffer();
		forwardString.append(errPage).append("?");
		forwardString.append("RspCod").append("=").append(RspCod);
		forwardString.append("&");
		forwardString.append("RspMsg").append("=").append(RspMsg);
        pageContext.forward(forwardString.toString());
	}

	//��ʽ
	int betMode = BetMoney.betMode_Multiple;//����ʽ
	int multiple = Integer.parseInt((String)ReqParamUtil.reqParamTirm(request,"BetMul"));//Ͷע����
	double price = 2;//��עͶע���
	int section = 0;//��ʽͶעע��,��ʽ������
	int betRedNum = 6;//��ע����������
	int redTailNum = forepart_cnt;//ѡ�����������
	int betBlueNum = 1;//��ע����������
	int blueNum = rear_cnt;//ѡ������������
	int redBaseNum = 0;//ʵ��Ͷע���򵨺����������ʽ������
	double BetAmt = new BetMoney().CalculateBMoney(betMode, multiple,
		    		price, section, betRedNum,
		    		betBlueNum, redBaseNum, redTailNum, blueNum);
	/*
	pageContext.setAttribute("BetAmt",
			String.valueOf((int)BetAmt*100),
			PageContext.SESSION_SCOPE);
	pageContext.setAttribute("BetNum", String.valueOf(forepart_cnt+rear_cnt), PageContext.SESSION_SCOPE);
	pageContext.setAttribute("ShowNum", ShowNum, PageContext.SESSION_SCOPE);
	*/
	request.setAttribute("BetAmt", String.valueOf((int)BetAmt*100));
	request.setAttribute("BetNum", String.valueOf(forepart_cnt+rear_cnt));
	request.setAttribute("ShowNum", ShowNum);
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
        <input type="hidden" name="URL" value="/midserv/Wel_Confirm.jsp"/>
        <input type="hidden" name="dse_sessionId" value="<%=dse_sessionId%>"/>
        <input type="hidden" name="sendPass" value="<%=loginType.endsWith("0")?"1":"0" %>">
        <table width="90%" align="center" cellpadding="1" cellspacing="1"  class="tab">
		  <tr align="center" class="tab_title">
		    <td align="left" colspan="2">
		       ȷ��Ͷע��Ϣ:
		    </td>
		  </tr>
		  <tr></tr>
		 <tr class="tab_tr"> 
	        <td align="right">
	             ���п���:
	        </td>
	        <td align="left"> 
	        	<label><%=cdno%></label>
	        </td>
	     </tr>
	     <tr class="tab_tr"> 
	        <td align="right">
	             Ͷע����:
	        </td>
	        <td align="left"> 
	        	<label><%=ShowNum%></label>
	        </td>
	     </tr>
	     <tr class="tab_tr"> 
	        <td align="right">
	             ���׽��:
	        </td>
	        <td align="left"> 
	        	<label><%=BetAmt%>Ԫ</label>
	        </td>
	     </tr>
	     <tr class="tab_result"> 
	        <td align="center" colspan="2">
	            <input type="submit" class="button_bg" value="ȷ��" style="cursor:hand;"/>
	            <input type="button" class="button_bg" name="Submit3" value="����" onclick="javascript:history.back()" />
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
<%!
	public String formatnumber(int inputstr){
		String outputstr;
		if(inputstr<=9){
			outputstr="0"+String.valueOf(inputstr);
		}else{
			outputstr = String.valueOf(inputstr);
		}
		return outputstr;
	}

%>