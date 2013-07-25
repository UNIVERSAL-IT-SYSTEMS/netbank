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
    <form action="/personbank/HttpProxy" method=post name="form1">
        <input type="hidden" name="URL" value="/midserv/Gds_PreCorfirm"/>
        <input type="hidden" name="dse_sessionId" value="<%=dse_sessionId%>"/>
<%
    String gds_GdsBIds = (String)pageContext
            .getAttribute("Gds_GdsBIds", PageContext.SESSION_SCOPE);
    String[] gdsBids = gds_GdsBIds.split(",");
    Map business = GdsPubData.getSignBusiness();
    for(int i=0; i<gdsBids.length; i++){
        if( null!=gdsBids[i] && (!"".equals(gdsBids[i])) ){
            String businessId = gdsBids[i];
            String businessName = (String) business.get(businessId);

            out.println("<h1>"+businessName+"：</h1><br/>");
            out.println("<h2>请输入"+businessName+"缴费号:</h2><br/>");
            out.println("<input type='text' name='TCusId"+businessId
                    +"' /><br/>");
            out.println("<h2>请输入"+businessName+"缴费户名:</h2><br/>");
            out.println("<input type='text' name='TCusNm"+businessId
                    +"' /><br/>");
            out.println("<br/>");
        }
    }


%>
        <input type="submit"  class="button_bg"  value="确定" style={cursor:hand;}/>
        <input type="button" class="button_bg" name="Submit3" value="返回" onclick="javascript:history.back()" />      
    </form> 
    </div>
    </body>
</html>