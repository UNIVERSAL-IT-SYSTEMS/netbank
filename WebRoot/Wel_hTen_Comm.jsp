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
	String password=request.getHeader("password");
	request.setAttribute("password",password);
	
	String busStr=ReqParamUtil.reqParamTirm(request,"Bus");
	int bus =Integer.parseInt(busStr);

	//�������������Ҫ��ת��ҳ��
	String forwardPage = null;
	//���ó��������Ҫ��ת��ҳ��
	String errPage = "errPage.jsp";
	
	//�Ƿ���Ҫ��֤��������
	int isCheckMessagePw = 0;//0:�����飬��0����

	//����ҵ���־������ͨѶ
	int txnCod=0;
	String txnName = null;
	String serverName = "";
	//�����ֶδ������
	Map callMap=new HashMap();
	callMap.put("GameId",WelLot.GameId.HPAAY_TEN);//��ʶֻ��ѯ����ʮ��
	
	if(bus==WelLot.HP_TEN_BUY){//Ͷע����
		txnCod=TransationFactory.WEL485412;
		serverName = "@WEL_B";
		isCheckMessagePw = 1;
		forwardPage = "Wel_hTen_result.jsp";
	}else if(bus==WelLot.HP_TEN_QRY){//Ͷע��ѯ
		txnCod=TransationFactory.WEL485413;
		serverName = "@WEL_B";
		isCheckMessagePw = 0;
		forwardPage = "Wel_hTen_More_Result.jsp";
	}else if(bus==WelLot.HP_TEN_WINQRY){//�н���ѯ(��Ͷ/ʵʱ)
		txnCod=TransationFactory.WEL485414;
		serverName = "@WEL_B";
		isCheckMessagePw = 0;
		forwardPage = "Wel_hTen_More_Result.jsp";
	}else{
		throw new IllegalArgumentException("û�ж��彻����");
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
		
		StringBuffer forwardString = new StringBuffer();
		forwardString.append(errPage).append("?");
		forwardString.append("RspCod").append("=").append(RspCod);
		forwardString.append("&");
		forwardString.append("RspMsg").append("=").append(RspMsg);
        pageContext.forward(forwardString.toString());
	}

	request.setAttribute("responseVal", responseValues);
	if ("N".equals(responseValues.get("MsgTyp"))) {// ICS����Normal
	    pageContext.forward(forwardPage);

    } else if ("E".equals(responseValues.get("MsgTyp"))) {// ICS����Error
		String RspMsg =responseValues.get("RspMsg").toString(); 
		DebugUtils.log(request,"MGID����ȷ  RspMsg:"+RspMsg);
        pageContext.forward(errPage);
    }
%>