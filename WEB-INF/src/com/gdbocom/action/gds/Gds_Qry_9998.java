package com.gdbocom.action.gds;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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

        response.setContentType("text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");

        GzLog gzLog = new GzLog("c:/gzLog_sj");
        String uri = request.getRequestURI();
        String crdNo = request.getHeader("cardNo"); //�����˻�
        //String sjNo = request.getHeader("MBK_MOBILE");  //ע���ֻ�����
        gzLog.Write(crdNo+"����["+uri+"]");


        //���÷��Ͳ���
        Map requestSt = new HashMap();
        //����ͷ�ֶ�
        requestSt.put("TTxnCd", "469998");
        requestSt.put("FeCod", "469998");

        //�������ֶ�
        requestSt.put("ActNo", request.getHeader("MBK_ACCOUNT"));//�����˻�

        Map responseMap = Transation
                .exchangeData(IcsServer.getServer("@GDS"),
                requestSt,
                TransationFactory.GDS469998);

        StringBuffer queryString = new StringBuffer();
        queryString.append("Gds_Add_9901?")
            .append("ActNm=")
            .append(((String)responseMap.get("TCusNm")).trim())
            .append("&")
            .append("BCusNo=")
            .append(((String)responseMap.get("TCusId")).trim())
            .append("&")
            .append("IdNo=")
            .append(((String)responseMap.get("IdNo")).trim());

        request.getRequestDispatcher(queryString.toString())
            .forward(request, response);

    }

    
    public void init() throws ServletException {
        // Put your code here
    }

}
