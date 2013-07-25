package com.gdbocom.action.gds;

import java.io.IOException;
import java.net.UnknownHostException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.JspFactory;
import javax.servlet.jsp.PageContext;

import weblogic.utils.StringUtils;

import com.bocom.midserv.gz.GzLog;
import com.gdbocom.util.communication.IcsServer;
import com.gdbocom.util.communication.Transation;
import com.gdbocom.util.communication.TransationFactory;
import com.gdbocom.util.communication.custom.gds.GdsPubData;


public class Gds_Qry_9901 extends HttpServlet {

    private static final long serialVersionUID = 1L;


    private GzLog gzLog = new GzLog("c:/gzLog_sj");

    public Gds_Qry_9901() {
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
        
        PageContext pageContext = JspFactory.getDefaultFactory()
                .getPageContext(this, request, response, null, true,
                        8192, true);

        String uri = request.getRequestURI();
        String crdNo = request.getHeader("cardNo"); //�����˻�
        //String sjNo = request.getHeader("MBK_MOBILE");  //ע���ֻ�����
        gzLog.Write(crdNo+"����["+uri+"]");

        //����ǩԼ�Ľ����б�
        StringBuffer signResult = new StringBuffer();
        Map business = GdsPubData.getSignBusiness();
        Iterator itBusiness = business.keySet().iterator();
        while (itBusiness.hasNext()) {

            String businessKey = (String) itBusiness.next();
            String businessName = (String) business.get(businessKey);
            //ֻ��ʾ�й�ѡ������
            if(isSpecicalBusinessSigned(crdNo, businessKey)){
                gzLog.Write(crdNo+"��ǩԼ"+businessName);
                signResult.append(businessKey);
            }
        }
        gzLog.Write(crdNo+"ǩԼ�����"+signResult.toString());

        pageContext.setAttribute("Gds_signResult",
                StringUtils.valueOf(signResult.toString()).trim(),
                PageContext.SESSION_SCOPE);
        String forwardPage = "Gds_Pub_Menu.jsp";
        pageContext.forward(forwardPage);

    }

    /**
     * @param request
     * @throws UnknownHostException
     * @throws IOException
     */
    private boolean isSpecicalBusinessSigned(String crdNo,
            String businessType)
            throws UnknownHostException, IOException {
        //���÷��Ͳ���
        Map requestSt = new HashMap();
        // ����ͷ�ֶ�
        requestSt.put("TTxnCd", "469901");
        requestSt.put("FeCod", "469901");

        // ������GdsPub�ֶ�
        requestSt.put("Func", GdsPubData.functionQuery);
        requestSt.put("GdsBId", businessType);
        requestSt.put("ActNo", crdNo);

        // �����ֶΣ���

        Map responseSt = Transation
                .exchangeData(IcsServer.getServer("@GDS"),
                requestSt, TransationFactory.GDS469901);
        return !"0 ".equals((String)responseSt.get("RecNum"));
    }

    
    public void init() throws ServletException {
        // Put your code here
    }

}
