<%@ page language="java" contentType="text/html;charset=GBK"%>
<%@ page import="java.net.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.viatt.util.*"%>
<%@ page import="com.bocom.midserv.gz.*"%>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="com.gdbocom.util.PreAction" %>
<%@include file="/includeFiles/common.jsp" %>
<%
	//��ע
	String remark = "";
	
	//�ֻ���̬�����ֶ�
	String sendPass = request.getParameter("sendPass");
    String dynamicCode = request.getParameter("dynamicCode");
    String dynamicCodeSeq = request.getParameter("dynamicCodeSeq");
    DebugUtils.log(request,"sendPass=["+sendPass+"] ��̬����=["+dynamicCode+"] ��̬�������=["+dynamicCodeSeq+"]" );
    
    String loginType =ReqParamUtil.reqParamTirm(request,"loginType");//���͵�½��� 0��ע���û�(�ֻ���) 1��֤���û� 2�������û�
%>
<html>
    <head>
        <title>��ͨ�������Ϸ���</title>
        <!-- ������ʽ����������ɫ������ȸ�ʽ -->
        <link rel="stylesheet" type="text/css" href="/personbank/css/<%=cssFileName%>">
        <!-- ������ʽ��������䡢�����Ӹ�ʽ -->
        <link rel="stylesheet" type="text/css"
            href="/personbank/HttpProxy?URL=/midserv/css/css.css&dse_sessionId=<%=dse_sessionId%>">
		<script type="text/javascript" src="/personbank/HttpProxy?URL=/midserv/js/jquery-1.11.1.min.js&dse_sessionId=<%=dse_sessionId%>"></script>

        <!--�������ж˹��ð�ȫ���������Ҫ����HttpProxy-->
		<script language="JavaScript" src="/personbank/js/public.js"></script>
		<script language="JavaScript" src="/personbank/js/writeActivxObject.js"></script> <%--�������ж˹���JS������Ҫ����HttpProxy--%>
		<script language="JavaScript">
			jQuery(document).ready(function(){
				jQuery("#btn_commit").click(function(){
					jQuery(":button").attr("disabled",true);
					beforeSubmit();
				});
			});
		
		   var clickBoolean=true;
			function beforeSubmit(){
	            if(clickBoolean){
	                if(document.safeInput1.allType()!="10000"
                        || document.safeInput1.isValid()){
	                    alert("������Ϸ�������");
	                    return;
	                }
	                <%if(loginType.equals("0")){ %>
	                if(document.form1.DynamicCode.value
	                        !='<%=request.getParameter("dynamicCode")%>'){
	                    alert('��̬���벻��');
	                    return false;
	                }
	                <%} %>
	                document.safeInput1.commit("safeCommit1");
	                document.safeCommit1.submit("form1"); 
	                clickBoolean=false;
	            }
			}
		</script>
    </head>


    <body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0"  oncontextmenu=self.event.returnValue=false onselectstart="return false">
    <SCRIPT language=JavaScript> writeCommitActivxObject('')</SCRIPT>
    <div class="indent">
    <form action="/personbank/HttpProxy" method="post" name="form1">
       <input type="hidden" name="URL" value="/midserv/Wel_Pub_Comm.jsp"/>
       <input type="hidden" name="password"/>
       <%-- 
       <input type="hidden" name="dse_sessionId" value="<%=dse_sessionId%>"/>
       --%>
    <table width="90%" align="center" cellpadding="1" cellspacing="1"  class="tab">
	  <tr align="center" class="tab_title">
	    <td align="left" colspan="2">
	       �����뽻������:
	    </td>
	  </tr>
	  <tr></tr>
    	<tr class="tab_tr"> 
	        <td align="right">
	            �����뽻�����룺
	        </td>
	        <td align="left">
	        <SCRIPT language=JavaScript> writePwdActivxObjectLenClass('safeInput1','safeInput1','','password',20,6,'20','153')</SCRIPT>
	        </td>
	      </tr>
	      <%if(loginType.equals("0")){ %>
	      <tr class="tab_tr"> 
	        <td align="right">
	            �������ֻ���̬���룺
	        </td>
	        <td align="left">
	            <input type="text" name="DynamicCode">��ţ���<%=dynamicCodeSeq %>��
	        </td>
	      </tr>
	      <%} %>
	      <tr class="tab_result"> 
	        <td align="right">
	            <input id='btn_commit' type="button" class="button_bg" onclick="javascript:beforeSubmit();" value="�ύ" style="cursor:hand;"/>
	        </td>
	        <td align="left">
	            <input type="button" class="button_bg" name="Submit3" value="����" onclick="javascript:history.back()" />      
	        </td>
	    </tr>
     <tr class="tab_tr"> 
        <td align="right">
            <label><%=remark%></label>
        </td>
     </tr>
     </table>
     <%=
			ReqParamUtil.reqParamAttrToHtmlStr(request)
	 %>
	</form>
	</div>
	</body>
</html>
<%!
	public String getFormattedValue(String value, String type){
		if("BigDecimal".equals(type)){
			return new DecimalFormat("#,###.00").format(Double.parseDouble(value)/100.0);
		}else{
			return value;
		}
	}
%>