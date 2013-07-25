<%@ page pageEncoding="UTF-8"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<% request.setCharacterEncoding("UTF-8");%>

<%@ page import="com.bocom.midserv.gz.*"%>
<%@ page import="com.viatt.bean.*"%>
<%@ page import="com.viatt.util.*"%>
<%@ page import="java.text.DecimalFormat"%>
<%@ page import="java.util.*"%>
<%@ page import="com.gdbocom.util.communication.custom.gds.*"%>
<%

    String cssFileName = request.getParameter("cssFileName");//获取客户当前使用的CSS样式

    //String biz_step_id="1";  

    GzLog log = new GzLog("c:/gzLog");
    String cardNo = request.getParameter("cardNo");
    String uri = request.getRequestURI();
    log.Write(cardNo+"进入["+uri+"]");

    String dse_sessionId = MessManTool.changeChar(request
            .getParameter("dse_sessionId"));//获取dse_sessionId

%>

<html>
    <head>
        <title>交通银行网上服务</title>
        <link rel="stylesheet" type="text/css" href="/personbank/css/<%=cssFileName%>">
    </head>


    <body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0"  oncontextmenu=self.event.returnValue=false onselectstart="return false">
    <div class="indent">
        <h1>已受理</h1><br />
<%
    //特色部分
    //获取已签约数据
    String signResult = (String)pageContext.getAttribute("Gds_signResult",
            PageContext.SESSION_SCOPE);
    //可以签约的交易列表
    Map business = GdsPubData.getSignBusiness();
    Iterator itBusiness = business.keySet().iterator();
    while (itBusiness.hasNext()) {
        String businessKey = (String) itBusiness.next();
        if (signResult.indexOf(String.valueOf(businessKey)) != -1) {
            out.println("<p>" + business.get(businessKey)
                    + "</p><br/>");
        }
    }
%>

    <h1>请选择签约业务的类型</h1><br />

    <a href='/personbank/HttpProxy?URL=/midserv/Gds_Ele_Note.jsp&dse_sessionId=<%=dse_sessionId%>'>电费划扣</a>

    <form action="/personbank/HttpProxy" method=post name="form1">
        <input type="hidden" name="URL" value="/midserv/Gds_GdsBIds"/>
        <input type="hidden" name="dse_sessionId" value="<%=dse_sessionId%>"/>
<%
    itBusiness = business.keySet().iterator();
    while (itBusiness.hasNext()) {
        String businessKey = (String) itBusiness.next();
        if (signResult.indexOf(String.valueOf(businessKey)) < 0) {
            out.println("<input type='checkbox' name='GdsBId"
                    +businessKey+"' value='"
                    +businessKey+"' >"
                    +business.get(businessKey)+"</input><br/>");
        }
    }

 %>


        <input type="submit"  class="button_bg"  value="确定" style={cursor:hand;}/>
        <input type="button" class="button_bg" name="Submit3" value="返回" onclick="javascript:history.back()" />      
    </form> 
    </div>
    </body>
</html>