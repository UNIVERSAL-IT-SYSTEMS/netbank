<%@ page language="java" contentType="text/html;charset=GBK"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Map"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@ page import="java.net.*" %>
<%@ page import="com.bocom.midserv.gz.*"%>
<%@include file="/includeFiles/common.jsp" %>
<%
	//�������������Ҫ��ת��ҳ��
	String forwardPage = "Wel_Confirm.jsp";
	//���ó��������Ҫ��ת��ҳ��
	String errPage = "errPage.jsp";

	//��鷵���Ƿ��쳣
	/*ReqParamUtil.reqParamTirm(request,"Bus");
	String SigTyp = (String)pageContext.getAttribute("SigTyp", PageContext.SESSION_SCOPE);
	String MobTel = (String)pageContext.getAttribute("MobTel", PageContext.SESSION_SCOPE);
	String MobTel_Con = (String)pageContext.getAttribute("MobTel_Con", PageContext.SESSION_SCOPE);
	*/
	String SigTyp = ReqParamUtil.reqParamTirm(request,"SigTyp");
	String MobTel = ReqParamUtil.reqParamTirm(request,"MobTel");
	String MobTel_Con = ReqParamUtil.reqParamTirm(request,"MobTel_Con");
	String CrdNo=ReqParamUtil.reqParamTirm(request,"cardNo");
	
	if(SigTyp=="0"||MobTel.equals(MobTel_Con)){//���������ȷ
/*
		pageContext.setAttribute("CusNam", " ", PageContext.SESSION_SCOPE);
		pageContext.setAttribute("CrdNo", CrdNo, PageContext.SESSION_SCOPE);
		pageContext.setAttribute("ActNo", CrdNo, PageContext.SESSION_SCOPE);
		pageContext.setAttribute("NodNo", " ", PageContext.SESSION_SCOPE);
//		pageContext.setAttribute("IdTyp", " ");
//		pageContext.setAttribute("IdNo", " ");
		pageContext.setAttribute("FixTel", " ", PageContext.SESSION_SCOPE);
		pageContext.setAttribute("Email", " ", PageContext.SESSION_SCOPE);
*/
		request.setAttribute("CusNam","");
		request.setAttribute("CrdNo",CrdNo);		
		request.setAttribute("ActNo",CrdNo);	
		request.setAttribute("NodNo","");		
		request.setAttribute("FixTel","");
		request.setAttribute("Email","");
		request.setAttribute("MobTel",MobTel);
		
	    pageContext.forward(forwardPage);

	}else{//������ز���ȷ
		String RspCod = "LOT999";
		String RspMsg = "�������벻һ��";
		DebugUtils.log("MGID����ȷ");

		StringBuffer forwardString = new StringBuffer();
		forwardString.append(errPage).append("?");
		forwardString.append("RspCod").append("=").append(RspCod);
		forwardString.append("&");
		forwardString.append("RspMsg").append("=").append(RspMsg);
        pageContext.forward(forwardString.toString());
	}
%>