<%@page import="org.apache.commons.lang.StringUtils"%>
<%@ page language="java" contentType="text/html;charset=GBK"%>
<%@ page import="java.net.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.viatt.util.*"%>
<%@ page import="com.bocom.midserv.gz.*"%>
<%@ page import="com.gdbocom.util.communication.*" %>
<%@ page import="com.gdbocom.Transactions.WelLot" %>
<%@include file="/includeFiles/common.jsp" %>
<%
//���潻������ֵ
	String password =ReqParamUtil.reqParamTirm(request,"password");
	String CrdNo = ReqParamUtil.reqParamTirm(request,"CrdNo");
	if(StringUtils.isEmpty(CrdNo)){
		CrdNo=ReqParamUtil.reqParamTirm(request,"cardNo");
	}
	request.setAttribute("CrdNo", CrdNo);
	
	String custName =ReqParamUtil.reqParamTirm(request,"custName");
	request.setAttribute("CusNam",custName);

	//��ȡbus�ֶ�,�жϽ�������
	String busStr=ReqParamUtil.reqParamTirm(request,"Bus");
	//String busStr = (String)pageContext.getAttribute("Bus", PageContext.SESSION_SCOPE);
	int bus =Integer.parseInt(busStr);

	//�������������Ҫ��ת��ҳ��
	String forwardPage = null;
	//���ó��������Ҫ��ת��ҳ��
	String errPage = "errPage.jsp";
	//������Ҫ���������������л�ȡ������ֵ������,
	String saveKey = null;
	//������һҳ���ֵ
	
	request.setAttribute("password",password);
	//�Ƿ���Ҫ��֤��������
	int isCheckMessagePw = 0;//0:�����飬��0����


	//����ҵ���־������ͨѶ
	int txnCod;
	String txnName = null;
	String serverName = "";
	//�����ֶδ������
	Map callMap=new HashMap();
	callMap.put("GameId",WelLot.GameId.DOUBLE_BALL);//��ʶֻ��ѯ˫ɫ���¼
	
	if(bus==WelLot.ADDREG){//�û�ע��
		txnCod=TransationFactory.WEL485404;
		serverName = "@WEL_A";
		isCheckMessagePw = 1;
		forwardPage = "Wel_Result.jsp";
	}else if(bus==WelLot.UPDREG){//ע����
		txnCod=TransationFactory.WEL485405;
		serverName = "@WEL_A";
		isCheckMessagePw = 1;
		forwardPage = "Wel_Result.jsp";
	}else if(bus==WelLot.DOUBLE_SEL){//˫ɫ����ѡ
		txnCod=TransationFactory.WEL485412;
		serverName = "@WEL_B";
		isCheckMessagePw = 1;
		forwardPage = "Wel_Result.jsp";
	}else if(bus==WelLot.DOUBLE_BETSQRY){//˫ɫ��Ͷע��ѯ
		txnCod=TransationFactory.WEL485413;
		serverName = "@WEL_B";
		isCheckMessagePw = 0;
		forwardPage = "Wel_More_Result.jsp";
	}else if(bus==WelLot.DOUBLE_WINQRY||bus==WelLot.DOUBLE_FIX_WINQRY){//˫ɫ���н���ѯ(��Ͷ/ʵʱ)
		txnCod=TransationFactory.WEL485414;
		serverName = "@WEL_B";
		isCheckMessagePw = 0;
		forwardPage = "Wel_More_Result.jsp";
	}else if(bus==WelLot.DOUBLE_FIX_BUY){//˫ɫ��Ͷ¼��
		txnCod=TransationFactory.WEL485407;
		serverName = "@WEL_A";
		isCheckMessagePw = 1;
		forwardPage = "Wel_Result.jsp";
	}else if(bus==WelLot.DOUBLE_FIX_QRY){//˫ɫ��Ͷ��ѯ������
		txnCod=TransationFactory.WEL485409;
		serverName = "@WEL_A";
		isCheckMessagePw = 0;
		forwardPage = "Wel_Fix_QryD.jsp";
	}else if(bus==WelLot.DOUBLE_FIX_CANCEL){//˫ɫ��Ͷ��ѯ������
		txnCod=TransationFactory.WEL485410;
		serverName = "@WEL_A";
		isCheckMessagePw = 1;
		forwardPage = "Wel_Result.jsp";
	}else{
		throw new IllegalArgumentException("û�ж����BUS����");
	}
	
	txnName = WelLot.getTxnCod(bus);
	
	//��ȡ�����ֶ�
	callMap.put("TTxnCd", txnName);
	callMap.put("FeCod", txnName );
    //��ȡattribute��parameter��ȫ������
    Map paMap=ReqParamUtil.getParamAttr(request);
    callMap.putAll(paMap);
    
    DebugUtils.printMap(request, callMap);
	
	if(0!=isCheckMessagePw){
		//BEGIN �����֤
		//
		/*String verify = request.getHeader("MBK_VERIFY_RESULT");
		if(verify!=null&&!verify.equals("P")){
			String RspCod = "MID999";
			String RspMsg = "�ֻ�����������֤��ͨ��"; 
			gzLog.Write("["+uri+"]MGID����ȷ");

			StringBuffer forwardString = new StringBuffer();
			forwardString.append(errPage).append("?");
			forwardString.append("RspCod").append("=").append(RspCod);
			forwardString.append("&");
			forwardString.append("RspMsg").append("=").append(RspMsg);
	        pageContext.forward(forwardString.toString());
		}*/
	    //END �����֤
	}

	txnName = WelLot.getTxnCod(bus);
	Map responseValues = new HashMap();
	try{
		responseValues.putAll(
				Transation.exchangeData(IcsServer.getServer(serverName),
                callMap,
                txnCod)
				);

	}catch(Exception e){
		String RspCod = "LOT999";
		String RspMsg = "ͨѶ����"; 
		DebugUtils.log(request,"MGID����ȷ");
		
		StringBuffer forwardString = new StringBuffer();
		forwardString.append(errPage).append("?");
		forwardString.append("RspCod").append("=").append(RspCod);
		forwardString.append("&");
		forwardString.append("RspMsg").append("=").append(RspMsg);
        pageContext.forward(forwardString.toString());
	}

	request.setAttribute("responseVal", responseValues);
	if ("N".equals(responseValues.get("MsgTyp"))) {// ICS����Normal
		DebugUtils.log(request,"forward��"+forwardPage);
	    pageContext.forward(forwardPage);

    } else if ("E".equals(responseValues.get("MsgTyp"))) {// ICS����Error
		String RspMsg =responseValues.get("RspMsg").toString(); 
		DebugUtils.log(request,"MGID����ȷ  RspMsg:"+RspMsg);
        pageContext.forward(errPage);
    }
%>