<%@ page language="java" contentType="text/html;charset=GBK"%>
<%@ page import="java.net.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.viatt.util.*"%>
<%@ page import="com.bocom.midserv.gz.*"%>
<%@ page import="com.gdbocom.util.communication.*" %>
<%@ page import="com.gdbocom.Transactions.WelLot" %>
<%@include file="/includeFiles/common.jsp" %>
<%
	GzLog gzLog = new GzLog();
	String uri = request.getRequestURI();
	String CrdNo = request.getHeader("MBK_ACCOUNT");  //�����˻�
	String sjNo = request.getHeader("MBK_MOBILE");  //�ֻ�����
	gzLog.Write("����["+uri+"]");
	//gzLog.Write(request.getQueryString().toString());
	
	//��ȡbus�ֶ�,�жϽ�������
	int bus = Integer.parseInt((String)pageContext.getAttribute("Bus"), PageContext.SESSION_SCOPE);

	//�������������Ҫ��ת��ҳ��
	String forwardPage = "Wel_More_Result.jsp";
	//���ó��������Ҫ��ת��ҳ��
	String errPage = "../../errPage.jsp";
	//������Ҫ���������������л�ȡ������ֵ������,
	String saveKey = "";

	//����ҵ���־������ͨѶ
	int txnCod;
	String txnName = null;
	String serverName = "";
	if(bus==WelLot.DOUBLE_BETSQRY){//˫ɫ��Ͷע��ѯ
		saveKey="MobTel";
		txnCod=TransationFactory.WEL485413;
		serverName = "@WEL_B";
	}else if(bus==WelLot.DOUBLE_WINQRY){//˫ɫ���н���ѯ
		saveKey="MobTel";
		txnCod=TransationFactory.WEL485414;
		serverName = "@WEL_B";
	}else{
		txnCod=0;
	}

	txnName = WelLot.getTxnCod(txnCod);
	Map responseValues = new HashMap();
	try{
		responseValues.putAll(
				Transation.createMapSend(pageContext,
						txnName,
						serverName,
						txnCod
					)
				);

	}catch(Exception e){
		String RspCod = "LOT999";
		String RspMsg = "ͨѶ����"; 
		gzLog.Write("["+uri+"]MGID����ȷ");

		StringBuffer forwardString = new StringBuffer();
		forwardString.append(errPage).append("?");
		forwardString.append("RspCod").append("=").append(RspCod);
		forwardString.append("&");
		forwardString.append("RspMsg").append("=").append(RspMsg);
        pageContext.forward(forwardString.toString());
	}

	if ("N".equals(responseValues.get("MsgTyp"))) {// ICS����Normal
		gzLog.Write("["+uri+"]forward��"+forwardPage);

		//�����ر���ֶ�
		String[] saveKeys = saveKey.split("\\,");
		for(int i=0; i<saveKeys.length; i++){
			pageContext.setAttribute(
					saveKeys[i],
					responseValues.get(saveKeys[i]),
					PageContext.SESSION_SCOPE
					);

		}
	    pageContext.forward(forwardPage);

    } else if ("E".equals(responseValues.get("MsgTyp"))) {// ICS����Error
		String RspCod = (String)responseValues.get("RspCod");
		String RspMsg = URLEncoder.encode((String)responseValues.get("RspMsg"), "UTF-8"); 
		gzLog.Write("["+uri+"]MGID����ȷ");

		StringBuffer forwardString = new StringBuffer();
		forwardString.append(errPage).append("?");
		forwardString.append("RspCod").append("=").append(RspCod);
		forwardString.append("&");
		forwardString.append("RspMsg").append("=").append(RspMsg);
        pageContext.forward(forwardString.toString());
    }
%>