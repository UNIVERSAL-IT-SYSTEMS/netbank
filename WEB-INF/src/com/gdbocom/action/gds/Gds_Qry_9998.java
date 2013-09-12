package com.gdbocom.action.gds;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.JspFactory;
import javax.servlet.jsp.PageContext;

import com.bocom.midserv.gz.GzLog;
import com.gdbocom.util.communication.IcsServer;
import com.gdbocom.util.communication.Transation;
import com.gdbocom.util.communication.TransationFactory;


public class Gds_Qry_9998 extends HttpServlet {

    
    /**
     * 
     */
    private static final long serialVersionUID = 1L;


    public Gds_Qry_9998() {
        super();
    }

    public void destroy() {
        super.destroy(); 
    }

    
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        this.doPost(request, response);

    }

    
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=GBK");
        request.setCharacterEncoding("GBK");

        GzLog gzLog = new GzLog("c:/gzLog");
        String uri = request.getRequestURI();
        String crdNo = request.getParameter("cardNo"); //银行账户
        //String sjNo = request.getHeader("MBK_MOBILE");  //注册手机号码
        gzLog.Write(crdNo+"进入["+uri+"]");

        //配置发送参数
        Map requestSt = new HashMap();
        //报文头字段
        requestSt.put("TTxnCd", "469998");
        requestSt.put("FeCod", "469998");

        //报文体字段
        requestSt.put("ActNo", crdNo);//银行账户

        Map responseMap = Transation
                .exchangeData(IcsServer.getServer("@GDS"),
                requestSt,
                TransationFactory.GDS469998);

        StringBuffer queryString = new StringBuffer();
        queryString.append("Gds_Add_9901.jsp?")
            .append("ActNm=")
            .append(((String)responseMap.get("TCusNm")).trim())
            .append("&")
            .append("BCusNo=")
            .append(((String)responseMap.get("TCusId")).trim())
            .append("&")
            .append("IdNo=")
            .append(((String)responseMap.get("IdNo")).trim());

        PageContext pageContext = JspFactory.getDefaultFactory()
                .getPageContext(this, request, response, null, true,
                        8192, true);

        pageContext.forward(queryString.toString());

    }

    
    public void init() throws ServletException {
        // Put your code here
    }

}
