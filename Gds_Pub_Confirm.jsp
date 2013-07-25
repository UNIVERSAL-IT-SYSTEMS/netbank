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

    //设置需要显示的值和名称
    boolean isNull = false;
    //设置需要显示的值、名称和来源，
    //    格式：CrdNo,签约卡号,[reqHead|request|session]
    //String showKey = request.getParameter("showKey");

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
        <input type="hidden" name="URL" value="/midserv/Gds_Qry_9998"/>
        <input type="hidden" name="dse_sessionId" value="<%=dse_sessionId%>"/>

        <h1>请确认充值信息:</h1><br/>
<%

    /*
     *设置需要显示的来源、关键字、子关键字（一般Map类型才有）、类型、中文名称
     *    格式：[reqHead|request|session],
     *         <关键字>,
     *         <子关键字>,
     *         [String,Map],
     *         签约卡号
     */
    StringBuffer showKeyBuffer = new StringBuffer();
    showKeyBuffer.append("reqHead,CrdNo,,String,签约卡号").append("|");


    //设置需要显示的缴费号和缴费名
    String gds_GdsBIds = (String)pageContext
            .getAttribute("Gds_GdsBIds", PageContext.SESSION_SCOPE);


    String[] gdsBids = gds_GdsBIds.split(",");
    Map business = GdsPubData.getSignBusiness();
    for(int i=0; i<gdsBids.length; i++){
        if( null!=gdsBids[i] && (!"".equals(gdsBids[i])) ){
            String businessId = gdsBids[i];
            String businessName = (String) business.get(businessId);

            //添加showKey
            showKeyBuffer.append("session").append(",")
                .append("Gds_TCusId").append(",")
                .append(businessId).append(",")
                .append("Map").append(",")
                .append(businessName).append("缴费号")
                .append("|");

            showKeyBuffer.append("session").append(",")
                .append("Gds_TCusNm").append(",")
                .append(businessId).append(",")
                .append("Map").append(",")
                .append(businessName).append("缴费号")
                .append("|");
        }
    }

    //显示确认值
    String[] showKeys = showKeyBuffer.toString().split("\\|");
    for(int pairsIndex=0;pairsIndex<showKeys.length;pairsIndex++){
        String[] params = showKeys[pairsIndex].split(",");
        String source = params[0];//来源
        String key = params[1];//关键字
        String subkey = params[2];//子关键字（一般Map类型才有）
        String type = params[3];//类型
        String name = params[4];//中文名称
        String value = "";

        if(source.equals("reqHead")){
            value = StringUtils.valueOf(request.getHeader(key)).trim();

        }else if(source.equals("request")){
            value = StringUtils.valueOf(request.getParameter(key)).trim();

        }else if(source.equals("session")){
            if("String".equals(type)){
                value = StringUtils.valueOf(pageContext
                        .getAttribute(key, PageContext.SESSION_SCOPE)).trim();
            }else if("Map".equals(type)){
                value = (String)((Map)pageContext
                        .getAttribute(key, PageContext.SESSION_SCOPE))
                        .get(subkey);
            }else{
                throw new IllegalArgumentException();
            }
        }else if(isNull){
            value = "null";
        }
        out.println("<p>"+name+":"+value+"</p><br/>");
    }

%>

        <label>请输入交易密码：</label>
        <br/>
        <!-- input type='password' name='password' style="-wap-input-required: 'true'" minleng='6' maxleng='6' encrypt/>
        <input type='hidden' name='MBK_BOCOMACC_PASSWORD'  value='password'></input -->


        <input type="submit"  class="button_bg"  value="确定" style={cursor:hand;}/>
        <input type="button" class="button_bg" name="Submit3" value="返回" onclick="javascript:history.back()" />      
    </form> 
    </div>
    </body>
</html>