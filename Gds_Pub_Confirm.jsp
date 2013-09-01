<%@ page pageEncoding="GBK"%>
<%@ page language="java" contentType="text/html; charset=GBK" %>
<% request.setCharacterEncoding("GBK");%>

<%@ page import="com.bocom.midserv.gz.*"%>
<%@ page import="com.viatt.bean.*"%>
<%@ page import="com.viatt.util.*"%>
<%@ page import="java.text.DecimalFormat"%>
<%@ page import="java.util.*"%>
<%@ page import="weblogic.utils.StringUtils" %>
<%@ page import="com.gdbocom.util.communication.custom.gds.*"%>
<%

	String uri = request.getRequestURI();
	/* 获取总行全局参数 */
	//获取客户当前使用的CSS样式
	String cssFileName = request.getParameter("cssFileName");
	//获取dse_sessionId
	String dse_sessionId = request.getParameter("dse_sessionId");
	//获取卡号
	String cardNo = request.getParameter("cardNo");
	//获取卡号
	String custName = request.getParameter("custName");
	
	//创建日志实例
	com.bocom.midserv.gz.GzLog log = new com.bocom.midserv.gz.GzLog("c:/gzLog");
	log.Write(cardNo+"进入["+uri+"]");

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


    <body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0"  oncontextmenu=self.event.returnValue=false onselectstart="return false" >
    <div class="indent">
    <form action="/personbank/HttpProxy" method=post name="form1">
        <!-- 总行定义字段 -->
        <input type="hidden" name="URL" value="/midserv/Gds_Qry_9998.jsp"/>
        <input type="hidden" name="dse_sessionId" value="<%=dse_sessionId%>"/>

<%
    //获取已签约数据
    String signResult = request.getParameter("Gds_signResult");
    String Gds_GdsBIds = request.getParameter("Gds_GdsBIds");

%>
        <!-- 特色业务字段 -->
        <input type="hidden" name="Gds_signResult" value="<%=signResult%>"/>
        <input type="hidden" name="Gds_GdsBIds" value="<%=Gds_GdsBIds%>"/>

<%
	String gds_GdsBIds = request.getParameter("Gds_GdsBIds");
	String[] gdsBids = gds_GdsBIds.split(",");
	Map business = GdsPubData.getSignBusiness();
	for(int i=0; i<gdsBids.length; i++){
	    if( null!=gdsBids[i] && (!"".equals(gdsBids[i])) ){
	        String businessId = gdsBids[i];
	        String businessName = (String) business.get(businessId);
	
	        String tCusId = request.getParameter("TCusId"+businessId);
	        String tCusNm = request.getParameter("TCusNm"+businessId);
%>
         <input type="hidden" name="TCusId<%=businessId %>" value="<%=tCusId%>"/>
         <input type="hidden" name="TCusNm<%=businessId %>" value="<%=tCusNm%>"/>
<%
	    }
	}

%>
		<table width="90%" align="center" cellpadding="1" cellspacing="1" class="tab">
		  <tr align="center" class="tab_title"> 
		    <td colspan="2">
		    请确认充值信息:
		    </td>
		  </tr>
	      <tr class="tab_tr"> 
	        <td align="right" width="50%">
            签约卡号:
	        </td>
	        <td align="left" width="50%">
	        <%=cardNo %>
	        </td>
	      </tr>
<%
    for(int i=0; i<gdsBids.length; i++){
        if( null!=gdsBids[i] && (!"".equals(gdsBids[i])) ){
            String businessId = gdsBids[i];
            String businessName = (String) business.get(businessId);
    
            String tCusId = request.getParameter("TCusId"+businessId);
            String tCusNm = request.getParameter("TCusNm"+businessId);
%>
          <tr align="center" class="tab_sub_title"> 
            <td colspan="2">
            <%=businessName %>划扣:
            </td>
          </tr>
          <tr class="tab_tr"> 
            <td align="right" width="50%">
            <%=businessName %>缴费号:
            </td>
            <td align="left" width="50%">
            <%=tCusId %>
            </td>
          </tr>
          <tr class="tab_tr"> 
            <td align="right" width="50%">
            <%=businessName %>缴费名:
            </td>
            <td align="left" width="50%">
            <%=tCusNm %>
            </td>
          </tr>
<%
        }
    }
%>
      <tr class="tab_tr"> 
        <td align="right">
            请输入交易密码：
        </td>
        <td align="left">
            <input type="password" name="Submit3" />
        </td>
      </tr>
      <tr class="tab_tr"> 
        <td align="right">
            <input type="submit"  class="button_bg"  value="确定" style={cursor:hand;}/>
        </td>
        <td align="left">
            <input type="button" class="button_bg" name="Submit3" value="返回" onclick="javascript:history.back()" />      
        </td>
      </tr>
	</table>


    </form> 
    </div>
    </body>
</html>