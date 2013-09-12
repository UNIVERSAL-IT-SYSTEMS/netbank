package com.gdbocom.action.gds;

import java.io.IOException;
import java.net.UnknownHostException;
import java.text.SimpleDateFormat;
import java.util.Date;
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
import com.gdbocom.util.communication.custom.gds.GdsPubData;


public class Gds_Add_9901 extends HttpServlet {

    
    /**
     * 
     */
    private static final long serialVersionUID = 1L;

    private GzLog gzLog = new GzLog("c:/gzLog");

    public Gds_Add_9901() {
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
        
        String uri = request.getRequestURI();
        String crdNo = request.getParameter("cardNo"); //银行账户
        //String sjNo = request.getHeader("MBK_MOBILE");  //注册手机号码
        gzLog.Write(crdNo+"进入["+uri+"]");


        PageContext pageContext = JspFactory.getDefaultFactory()
                .getPageContext(this, request, response, null, true,
                        8192, true);

        String gds_GdsBIds = request.getParameter("Gds_GdsBIds");
        String[] gdsBids = gds_GdsBIds.split(",");
        Map business = GdsPubData.getSignBusiness();
        for(int i=0; i<gdsBids.length; i++){
            if( null!=gdsBids[i] && (!"".equals(gdsBids[i])) ){
                String businessId = gdsBids[i];
                String businessName = (String) business.get(businessId);

                gzLog.Write("发送"+businessName+"签约交易");
                signBusiness(request, businessId);

            }
        }


        pageContext.forward("Gds_Pub_Suc.jsp");

    }

    /**
     * @param request
     * @throws UnknownHostException
     * @throws IOException
     */
    private void signBusiness(
            HttpServletRequest request,
            String businessType)
            throws UnknownHostException, IOException {

        if(GdsPubData.businessOfMobile.equals(businessType)){
            sigeMobileBusiness(request, businessType);
        }else{
            sigeNormalBusiness(request, businessType);
        }
    }

    /**
     * @param request
     * @param businessType
     * @throws UnknownHostException
     * @throws IOException
     */
    private void sigeMobileBusiness(HttpServletRequest request, String businessType)
            throws UnknownHostException, IOException {
        //配置发送参数
        Map requestSt = new HashMap();
        // 报文头字段
        requestSt.put("TTxnCd", "469901");
        requestSt.put("FeCod", "469901");

        // 报文体GdsPub字段
        requestSt.put("Func", GdsPubData.functionAdd);
        requestSt.put("GdsBId", businessType);
        requestSt.put("ActNo", (String)request.getParameter("cardNo"));
        requestSt.put("ActNm", (String)request.getParameter("ActNm"));
        requestSt.put("BCusNo", (String)request.getParameter("BCusNo"));
        requestSt.put("BCusId", "");
        requestSt.put("IdNo", (String)request.getParameter("IdNo"));
        requestSt.put("MobTyp", "");
        requestSt.put("MobTel", "");
        requestSt.put("EMail", "");
        requestSt.put("Addr", "");
        requestSt.put("Pin", (String)request.getParameter("password"));


        // 特殊字段
        requestSt.put("BnkNo", GdsPubData.bankNo);
        requestSt.put("OrgCod", GdsPubData.getBCusId().get(businessType));
        requestSt.put("TBusTp", GdsPubData.getTBusTp().get(businessType));
        requestSt.put("TAgtTp", (String)request.getParameter("TAgtTp"+businessType));
        requestSt.put("MCusId", (String)request.getParameter("MCusId"+businessType));
        requestSt.put("TCusId", (String)request.getParameter("TCusId"+businessType));
        StringBuffer gdsAId = new StringBuffer().append("01")
                .append("5810")
                .append(GdsPubData.getBCusId().get(businessType))
                .append(GdsPubData.getTBusTp().get(businessType))
                .append("301")
                .append((String)request.getParameter("cardNo"));
        requestSt.put("GdsAId", gdsAId.toString());

        SimpleDateFormat sf = new SimpleDateFormat("yyyyMMdd");
        requestSt.put("EffDat", sf.format(new Date()));

        Transation.exchangeData(IcsServer.getServer("@GDS"),
                requestSt, TransationFactory.GDS469901);
    }

    /**
     * @param request
     * @param businessType
     * @throws UnknownHostException
     * @throws IOException
     */
    private void sigeNormalBusiness(HttpServletRequest request, String businessType)
            throws UnknownHostException, IOException {
        //配置发送参数
        Map requestSt = new HashMap();
        // 报文头字段
        requestSt.put("TTxnCd", "469901");
        requestSt.put("FeCod", "469901");

        // 报文体GdsPub字段
        requestSt.put("Func", GdsPubData.functionAdd);
        requestSt.put("GdsBId", businessType);
        requestSt.put("ActNo", (String)request.getParameter("cardNo"));
        requestSt.put("ActNm", (String)request.getParameter("ActNm"));
        requestSt.put("BCusNo", (String)request.getParameter("BCusNo"));
        requestSt.put("BCusId", "");
        requestSt.put("IdNo", (String)request.getParameter("IdNo"));
        requestSt.put("MobTyp", "");
        requestSt.put("MobTel", "");
        requestSt.put("EMail", "");
        requestSt.put("Addr", "");
        requestSt.put("Pin", (String)request.getParameter("password"));


        // 特殊字段
        requestSt.put("BnkNo", GdsPubData.bankNo);
        requestSt.put("OrgCod", GdsPubData.getBCusId().get(businessType));
        requestSt.put("TBusTp", GdsPubData.getTBusTp().get(businessType));
        requestSt.put("TCusId", (String)request.getParameter("TCusId"+businessType));
        requestSt.put("TCusNm", (String)request.getParameter("TCusNm"+businessType));
        StringBuffer gdsAId = new StringBuffer().append("01")
                .append("5810")
                .append(GdsPubData.getBCusId().get(businessType))
                .append(GdsPubData.getTBusTp().get(businessType))
                .append("301")
                .append((String)request.getParameter("cardNo"));
        requestSt.put("GdsAId", gdsAId.toString());

        SimpleDateFormat sf = new SimpleDateFormat("yyyyMMdd");
        requestSt.put("EffDat", sf.format(new Date()));

        Transation.exchangeData(IcsServer.getServer("@GDS"),
                requestSt, TransationFactory.GDS469901);
    }

    
    public void init() throws ServletException {
        // Put your code here
    }

}
