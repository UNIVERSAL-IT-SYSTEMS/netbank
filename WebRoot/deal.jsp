<%@ page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html;charset=GBK" %>
<%@ page import="java.util.*" %>
<%@ page import="com.gdbocom.util.communication.*" %>
<%@ page import="com.gdbocom.util.format.*" %>
<%

	//���� 
	String AREANUM = request.getParameter("areanum");
    //���� 
	String BUSCLA  = request.getParameter("buscla");
	//����ǩԼ�ɷ�1ǩԼ    2 �ɷ� 
	String JYFLG   = request.getParameter("JYFLG");
	String qy = request.getParameter("qy");
	
	//ajax ���ش�  
	StringBuffer str = new StringBuffer();
	pageContext.setAttribute("BUSCLA", BUSCLA, PageContext.SESSION_SCOPE);
	pageContext.setAttribute("AREANUM", AREANUM.substring(0, 2), PageContext.SESSION_SCOPE);
	pageContext.setAttribute("JYFLG", JYFLG, PageContext.SESSION_SCOPE);
	//��������  �ֻ������� 6  ������ 2  
	pageContext.setAttribute("TXNCNL", "2", PageContext.SESSION_SCOPE);
	Map responseValues = new HashMap();
	try{ 
		
			if(qy!=null){
				
				pageContext.setAttribute("ENTERID", qy.substring(0, 6), PageContext.SESSION_SCOPE);
				responseValues.putAll(
						Transation.createMapSend(pageContext,"466671","@SGD_A",TransationFactory.SGD466671)
					);	
			}else{
				responseValues.putAll(
						Transation.createMapSend(pageContext,"466605","@SGD_A",TransationFactory.SGD466605)
					);	
			}
		 
	}catch(Exception e){
		String RspCod = "LOT999";
		String RspMsg = "ͨѶ����"; 
		StringBuffer forwardString = new StringBuffer();
		forwardString.append("RspCod").append("=").append(RspCod);
		forwardString.append("&");
		forwardString.append("RspMsg").append("=").append(RspMsg);
      pageContext.forward(forwardString.toString());
	}
	 if(responseValues.get("MsgTyp").equals("N")){
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
        		 
        			String key = keyOrder[keyIndex];
        			//ʹ�õĸ�ʽ���������� WelFormatter.getSingleton(WelFormatter.BETNUM)
        			FormatterInterface type = (FormatterInterface)keyType.get(key);
        			//Ϊ��ʽ����ֵ
        			String originValue = (String)oneRecord.get(key);
        			str.append(",");
        			str.append(originValue.trim());
        		}
        }
	 }else{
		 	str.append(",");
        	str.append(responseValues.get("RspMsg").toString().trim());
        	
        }
        out.write(str.toString());
%>