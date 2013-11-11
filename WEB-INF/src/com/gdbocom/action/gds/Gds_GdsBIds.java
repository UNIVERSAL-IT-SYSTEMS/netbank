package com.gdbocom.action.gds;

import java.io.IOException;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.JspFactory;
import javax.servlet.jsp.PageContext;

import com.bocom.midserv.gz.GzLog;
import com.gdbocom.util.communication.custom.gds.GdsPubData;


public class Gds_GdsBIds extends HttpServlet {

    
    /**
     * 
     */
    private static final long serialVersionUID = 1L;


    public Gds_GdsBIds() {
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

        PageContext pageContext = JspFactory.getDefaultFactory()
                .getPageContext(this, request, response, null, true,
                        8192, true);


        GzLog gzLog = new GzLog("c:/gzLog");
        String uri = request.getRequestURI();
        String crdNo = request.getParameter("cardNo"); //�����˻�
        //String sjNo = request.getHeader("MBK_MOBILE");  //ע���ֻ�����
        gzLog.Write(crdNo+"����["+uri+"]");


        /*����checkbox���ͨ����ѭGdsBid440**������GdsBids����ʽΪ��
         * 44101,44102... ����ͨ���������ַ�ʽ�����ж��Ƿ�ѡ�˶�Ӧ�
         *1��gdsBIdsBuffer.indexOf(businessKey)!=-1
         *2��ͨ��split(",")������ȡҵ�����������б���
         */
        StringBuffer gdsBIdsBuffer = new StringBuffer();
        Map business = GdsPubData.getSignBusiness();
        Iterator itBusiness = business.keySet().iterator();
        while (itBusiness.hasNext()) {

            String businessId = (String) itBusiness.next();
            String businessKey = "GdsBId" + businessId;

            if(null!=request.getParameter(businessKey)){
                gdsBIdsBuffer.append(businessId).append(",");
            }

        }

        //���û�й�ѡǩԼ�����ѡ��˵�
        if("".equals(gdsBIdsBuffer.toString())){
            pageContext.forward("Gds_Pub_Menu.jsp");
        }else{
//            pageContext.setAttribute("Gds_GdsBIds",
//                    gdsBIdsBuffer.toString(),
//                    PageContext.SESSION_SCOPE);
            String forwardPage = "Gds_Spe_Data.jsp?Gds_GdsBIds="
                    + gdsBIdsBuffer.toString();
            pageContext.forward(forwardPage);
        }
    }

    
    public void init() throws ServletException {
        // Put your code here
    }

}
