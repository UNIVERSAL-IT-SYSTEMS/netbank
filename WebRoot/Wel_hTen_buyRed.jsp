<%@ page language="java" contentType="text/html;charset=GBK"%>
<%@ page import="com.bocom.midserv.gz.*"%>
<%@ page import="com.gdbocom.util.PreAction" %>
<%@ page import="com.gdbocom.Transactions.WelLot" %>
<%@include file="/includeFiles/common.jsp" %>
<%
	int buyMode = Integer.parseInt(ReqParamUtil.reqParamTirm(request,"buyMode"));
	String action_next;
	
	if(buyMode==WelLot.HpTenBuy.ONE){
		//ѡһ��Ͷ
		action_next="Wel_hTen_numSeleSingle.jsp";
		//action_next="/ToHtml";
	}else if(buyMode==WelLot.HpTenBuy.ONE_RED){
		//ѡһ��Ͷ
		action_next="Wel_hTen_numSeleSingle.jsp";
		//action_next="/ToHtml?url=/WelLot/Wel_hTen_numSeleSingle.jsp";
	}else if(buyMode==WelLot.HpTenBuy.TWO){
		//��ѡ��
		action_next="Wel_hTen_numSeleSingle.jsp";
	}else if(buyMode==WelLot.HpTenBuy.TWO_LINE){
		//ѡ����ֱ
		action_next="Wel_hTen_numSeleMulti.jsp";
	}else if(buyMode==WelLot.HpTenBuy.TWO_GROUP){
		//ѡ������
		action_next="Wel_hTen_numSeleSingle.jsp";
	}else if(buyMode==WelLot.HpTenBuy.THREE){
		//��ѡ��
		action_next="Wel_hTen_numSeleSingle.jsp";
	}else if(buyMode==WelLot.HpTenBuy.THREE_LINE){
		//ѡ��ǰֱ
		action_next="Wel_hTen_numSeleMulti.jsp";
	}else if(buyMode==WelLot.HpTenBuy.THREE_GROUP){
		//ѡ��ǰ��
		action_next="Wel_hTen_numSeleSingle.jsp";
	}else if(buyMode==WelLot.HpTenBuy.FOUR){
		//��ѡ��
		action_next="Wel_hTen_numSeleSingle.jsp";
	}else if(buyMode==WelLot.HpTenBuy.FIVE){
		//��ѡ��
		action_next="Wel_hTen_numSeleSingle.jsp";
	}else{
		action_next="Wel_hTen_numSeleSingle.jsp";
	}
	
	RequestDispatcher rd = request.getRequestDispatcher(action_next);
	rd.forward(request, response);
%>
