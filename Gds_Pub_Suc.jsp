<%@ page pageEncoding="UTF-8"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<% request.setCharacterEncoding("UTF-8");%>

<%@ page import="com.bocom.midserv.gz.*"%>
<%@ page import="com.viatt.bean.*"%>
<%@ page import="com.viatt.util.*"%>
<%@ page import="java.text.DecimalFormat"%>
<%@ page import="java.util.*"%>
<%@ page import="weblogic.utils.StringUtils" %>
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

    //释放session变量
    pageContext.removeAttribute("Gds_signResult", PageContext.SESSION_SCOPE);
    pageContext.removeAttribute("Gds_GdsBIds", PageContext.SESSION_SCOPE);
    pageContext.removeAttribute("Gds_TCusId",
            PageContext.SESSION_SCOPE);
    pageContext.removeAttribute("Gds_TCusNm",
            PageContext.SESSION_SCOPE);


    //设置需要显示的值和名称,
    String showText = "签约成功！";  

%>

<html>
    <head>
        <title>交通银行网上服务</title>
        <link rel="stylesheet" type="text/css" href="/personbank/css/<%=cssFileName%>">
    </head>


    <body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0"  oncontextmenu=self.event.returnValue=false onselectstart="return false">
    <div class="indent">
        <h1><%=showText%></h1><br/>
    </div>
    </body>
</html>