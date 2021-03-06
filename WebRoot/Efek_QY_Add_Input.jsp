<%@ page language="java" contentType="text/xml; charset=UTF-8"%>
<%@page pageEncoding="utf-8"%>
<%request.setCharacterEncoding("utf-8");%>
<%@ page import="com.viatt.util.*"%>
<%@ page import="com.bocom.midserv.gz.*"%>
<%@ page import="com.viatt.bean.*"%>
<%@ page import="java.util.*" %>
<%
    String uri = request.getRequestURI();
    /* 获取总行全局参数 */
    //获取客户当前使用的CSS样式
    String cssFileName = request.getParameter("cssFileName");
    //获取dse_sessionId
    String dse_sessionId = request.getParameter("dse_sessionId");
    //获取卡号
    String CrdNo = request.getParameter("cardNo");
    //获取卡号
    String custName = request.getParameter("custName");

    //创建日志实例
    GzLog log = new GzLog("c:/gzLog");
    log.Write(CrdNo+"进入["+uri+"]");

	//准备显示字段
	Map showE = new HashMap();

	//准备更新字段
	Map updateE = new HashMap();
	updateE.put("JFH", "缴费号");
	updateE.put("JSHMC", "结算户名称");
	updateE.put("YDDZ", "结算户用电地址");
	updateE.put("XQYZH", "新签约帐户");
	updateE.put("XQYZHMC", "新签约账户名称");
	updateE.put("ZJLX", "证件类型");
	updateE.put("ZJHM", "证件号码");
	updateE.put("LXDH", "联系电话");
	updateE.put("SJHM", "手机号码");
	updateE.put("EMAIL", "电子邮件");


%>
<html>
    <head>
        <title>交通银行网上服务</title>
        <!-- 总行样式表，定义总体色调与表格等格式 -->
        <link rel="stylesheet" type="text/css" href="/personbank/css/<%=cssFileName%>">
        <!-- 分行样式表，定义段落、超链接格式 -->
        <link rel="stylesheet" type="text/css"
            href="/personbank/HttpProxy?URL=/midserv/css/css.css&dse_sessionId=<%=dse_sessionId%>">
    </head>


    <body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0"  oncontextmenu=self.event.returnValue=false onselectstart="return false">
    <div class="indent">
        <form action="/personbank/HttpProxy" method=post name="form1">
            <input type="hidden" name="URL" value="/midserv/Efek_QY_Confirm.jsp"/>
            <input type="hidden" name="dse_sessionId" value="<%=dse_sessionId%>"/>

            <table width="90%" align="center" cellpadding="1" cellspacing="1" class="tab">
<%
	Map form = request.getParameterMap();

	Iterator itKeys = form.keySet().iterator();
	while(itKeys.hasNext()){
		String key = (String)itKeys.next();
		String[] values = ( (String[]) form.get(key) );
		if(showE.containsKey(key)){
			out.println("<tr class=\"tab_tr\">"
				+"<td align=\"right\">"
				+showE.get(key)
				+"</td>"
				+"<td align=\"left\">"
				+values[0]
				+"</td>"
				+"</tr>");
		}else if(updateE.containsKey(key)){
			out.println("<tr class=\"tab_tr\">"
				+"<td align=\"right\">"
				+showE.get(key)
				+"</td>"
				+"<td align=\"left\">"
				+"<input type='text' name='"+key+"' value='"+values[0]+"'/>"
				+"</td>"
				+"</tr>");
		}else if(1==values.length){
			out.println("<input type='hidden' name='"+key+"' value=\""+values[0]+"\"/><br/>");
		}
		
	}


%>
                <tr class="tab_result">
                    <td align="center"  colspan="2">
			            <input type="submit"  class="button_bg"  value="确定" style={cursor:hand;}/>
			            <input type="button" class="button_bg" name="Submit3" value="返回" onclick="javascript:history.back()" />      
                     </td>      
               </tr>
           </table>
        </form> 
    </div>
    </body>
</html>
