<!-------------------------------------------------------------------
                          ��׼ҳ������������
-------------------------------------------------------------------->
<%@ page language="java" contentType="text/html;charset=GBK" %>

<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.bocom.midserv.base.*" %>
<%@ page import="com.bocom.midserv.web.*" %>
<%@ page import="com.bocom.midserv.gz.*" %>
<%@ page import="com.bocom.eb.des.EBDES" %>

<% 
   int		i_step_id	= Integer.parseInt(request.getParameter("step_id").trim());
   int		i_biz_id	= Integer.parseInt(request.getParameter("biz_id").trim());
   String	s_biz_no	= request.getParameter("biz_no").trim();
   String	cardNo			= request.getParameter("cardNo").trim();

   GzLog log = new GzLog("c:/gzLog");
   log.Write("step2:	i_step_id=["+i_step_id+"] i_biz_id=["+i_biz_id+"] s_biz_no=["+s_biz_no+"]");

   MidObjectView midObjectView =  new MidObjectView();
   if (midObjectView.getMidObjectView(i_biz_id) != true) 
   	System.exit(1);
   MidObjectCtl midObjectCtl = new MidObjectCtl();
   //midObjectCtl.preInvokeNotXML(i_biz_id,i_step_id);
   
   midObjectCtl.preInvokeNotXML(request,i_biz_id,i_step_id-1);

   //�����������÷������صĵ�ַ���ַ��ͣ��ͼ����˿ڣ����ͣ�
   //midObjectCtl.invokeConnectNotXML("182.53.1.32",3555);
   midObjectCtl.invokeConnectNotXML("182.53.15.211",3555);

   midObjectCtl.postInvokeNotXML();
   
   MidObjectStepView midObjectStepView =  new MidObjectStepView();
  
   int i_max_step_id = midObjectStepView.getMaxStepId(i_biz_id);

   i_max_step_id = i_max_step_id + 2;
  
   String dse_sessionId = request.getParameter("dse_sessionId");//��ȡdse_sessionId

   String passWord = request.getParameter("passWord");
   
   String remoteIp = request.getParameter("remoteIp");
   
   String loginType = request.getParameter("loginType");//���͵�½��� 0��ע���û�(�ֻ���) 1��֤���û� 2�������û�
   
   int ltFeeType = 9 ;
   String ltBusiType = "00" ;
   String ltArefldandBusId = "" ;
   
   if ( i_biz_id == 8 || i_biz_id == 20 )
   {
		ltFeeType = Integer.parseInt( request.getParameter("feeType").trim() ) ; //��ͨ�������� 1-Ԥ���� 0-��Ƿ��   
   	ltBusiType = request.getParameter("busiType");//��ͨҵ������
   	ltArefldandBusId = midObjectCtl.get_pswd_value() ;
   	log.Write( "feeType=["+ltFeeType+"] busiType=["+ltBusiType+"] ltArefldandBusId=[" + ltArefldandBusId + "]" );
   }
   
   log.Write("step2: 	 cardNo=[" + cardNo + "] loginType=["+loginType+"]");  

	//if( loginType.equals("1") )	//֤���û�
  //{
   	//ǩ�����Ӳ���0 BEGIN
   	//String logonUserDn = request.getParameter("logonUserDn");//��ȡ��½֤��DN
   	//ǩ�����Ӳ���0 END   
   
   	//String isVerifySign = request.getParameter("isVerifySign");
   
   	//log.Write( "��ȡ��½֤��DN:[" + logonUserDn + "]" );
   	//log.Write( "isVerifySign = [" + isVerifySign + "]" );
  //}
   
	//if( loginType.equals("0") )	//ע���û�(�ֻ���)
  //{
		String sendPass = request.getParameter("sendPass");
		String dynamicCode = request.getParameter("dynamicCode");
		
		log.Write( "sendPass=["+sendPass+"] ��̬����=["+dynamicCode+"]" ); 
	//}
	
	int stepCount = Integer.parseInt( request.getParameter("stepCount").trim() ) ;
		
	int MarchFlag = 0 ;
	//if ( ( loginType.equals("0") && sendPass==null ) || ( loginType.equals("1") && isVerifySign==null ) )
	//if ( sendPass==null )
	if ( stepCount == 1 )
		MarchFlag = 1 ;
log.Write( "stepCount=["+stepCount+"] MarchFlag=["+MarchFlag+"]" );		
%>

<!-------------------------------------------------------------------
                          ��׼JavaScript������
--------------------------------------------------------------------->
<script language="JavaScript" src="/personbank/HttpProxy?URL=/midserv/js/public.js&dse_sessionId=<%=dse_sessionId%>"></script>
<script language="JavaScript" src="/personbank/HttpProxy?URL=/midserv/js/public_card.js&dse_sessionId=<%=dse_sessionId%>"></script>

<!--------------------------------------------------------------------
   ��ǰҳ��JavaScript�������֣������ύ��֤��ҳ�涯��������Ŀ��ȴ���
---------------------------------------------------------------------->
<%
//�������

out.print(midObjectView.writeCondition(i_biz_id,i_step_id));
//i_step_id=i_step_id+1;

%>
<SCRIPT LANGUAGE=javascript>
function go(){
	location.replace="/personbank/HttpProxy?URL=/midserv/midSelect.jsp&dse_sessionId=<%=dse_sessionId%>";
}
</script>

<!--------------------------------------------------------------------
                          ҳ��HTML���ֲ���    
---------------------------------------------------------------------->

<html>
<head>
<title>��ͨ�������Ϸ���</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" type="text/css" href="/personbank/HttpProxy?URL=/midserv/css/csspt.css&dse_sessionId=<%=dse_sessionId%>"-->   
<link rel="stylesheet" href="/personbank/HttpProxy?URL=/midserv/css/personbank.css&dse_sessionId=<%=dse_sessionId%>">
<script language="JavaScript" src="/personbank/js/public.js"></script>
<script language=JavaScript src="/personbank/js/writeActivxObject.js"></script>
<script language=JavaScript> writeCommitActivxObject('/personbank/')</script>
<script language="JavaScript" type="text/JavaScript">
<%--ǩ�����Ӳ���1 BEGIN--%>
<script language=JavaScript src="/personbank/js/public.js"></script><%--�������ж˹���JS������Ҫ����HttpProxy--%>
<script language=JavaScript> writeSignActivxObject('/personbank/')</script>
<%--ǩ�����Ӳ���1 END--%>

<SCRIPT language=javascript event=onkeydown for=document>   
if( event.keyCode == 13 )
{   
	//alert("13") ;
	return false ;
}   
</SCRIPT> 

<script language=JavaScript>
var clickBoolean = true;
var biz_id = <%=i_biz_id%>
function beforeSubmit0()
{
  if(clickBoolean)
  {
		if( biz_id == 7 )
		{
			document.form1.passWord.value = '<%=midObjectCtl.get_pswd_value()%>' ;
			//alert( "passWord:" + document.form1.passWord.value );
			//return false;
		}
		if( biz_id == 8 )
		{
			document.form1.passWord.value = "000" + document.form1.feeType.value + document.form1.busiType.value ;
			//alert( "pass:" + document.form1.passWord.value + " feeType:" + document.form1.feeType.value + " busiType:" + document.form1.busiType.value );
			//return false ;
		}  	
    form1.submit();
    clickBoolean = false;
  }
}
function beforeSubmit1()
{
	if(document.safeInput1.isValid())
 	{
		alert("���벻�Ϸ���������Ϸ�������");		
		return false;
 	}
 	if(document.form1.DynamicCode.value!='<%=request.getParameter("dynamicCode")%>')
 	{
   		alert('��̬���벻��');//<%=request.getParameter("dynamicCode")%>');
 	  	return false;
  	}

  if(clickBoolean)
  {
		if( biz_id == 8 )
		{
			document.form1.CTSQ.value = document.form1.CTSQ.value + '<%=ltFeeType%>' + '<%=ltBusiType%>' + '<%=request.getParameter("ltString")%>' ;
			//alert( "CTSQ:" + document.form1.CTSQ.value + " feeType:" + '<%=ltFeeType%>' + " busiType:" + '<%=ltBusiType%>' + " ltstr:" + '<%=request.getParameter("ltString")%>' );
			//return false ;
		}
		if( biz_id == 7 )
		{
			document.form1.CTSQ.value = document.form1.CTSQ.value + '<%=midObjectCtl.get_pswd_value()%>' ;
			//alert( "passWord:" + document.form1.CTSQ.value );
			//return false;
		}
    document.safeInput1.commit("safeCommit1");
    document.safeCommit1.submit("form1");        
    clickBoolean = false;
  }
	//form1.submit();
}
</script>

<style type="text/css"></style>

</head>
<body leftmargin="0" topmargin="0"  oncontextmenu=self.event.returnValue=false onselectstart="return false"><!--onkeydown='if(event.keyCode==13) return (event.srcElement.type=="textarea")'-->
<center>
<DIV align=center>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>    	
    <td background="/personbank/HttpProxy?URL=/midserv/images/pageTitle.gif&dse_sessionId=<%=dse_sessionId%>" class="pageTitle"><%=midObjectView.get_biz_memo().trim()%>����������</td>
    <td rowspan="2" align="right" valign="top">&nbsp;</td>
  </tr>
  <tr>
    <td><img src="/personbank/HttpProxy?URL=/midserv/images/xianb.gif&dse_sessionId=<%=dse_sessionId%>" width="100" height="20"></td>
  </tr>
</table>

<FORM action="/personbank/HttpProxy" method=post name="form1">
  <input type="hidden" name="dse_sessionId" value="<%=dse_sessionId%>">
  <input type="hidden" name="URL" value="/midserv/midServStep2.jsp">
  <input type="hidden" name="biz_id" value="<%=midObjectView.get_biz_id()%>">
  <input type="hidden" name="biz_no" value="<%=midObjectView.get_biz_no().trim()%>">
  <input type="hidden" name="CDNO" value="<%=cardNo%>">
  <input type="hidden" name="passWord">
  <input type="hidden" name="feeType" value="<%=ltFeeType%>">
	<input type="hidden" name="busiType" value="<%=ltBusiType%>">
	<input type="hidden" name="stepCount" value="<%=stepCount+1%>">
<%if( MarchFlag == 1 ){%>
  <input type="hidden" name="step_id" value="<%=i_step_id%>">
 	<input type="hidden" name="sendPass" value="1">
 	<input type="hidden" name="ltString" value="<%=ltArefldandBusId%>">
<%}else{%>
	<input type="hidden" name="step_id" value="<%=i_step_id+1%>">
<%}
	log.Write("step2:	step=[" + i_step_id + "]");
	  
  if(midObjectCtl.get_hidden_input_buff()!=null){
%>
    <%=midObjectCtl.get_hidden_input_buff()%>     
<%}%>
	<table border="0" cellspacing="2" cellpadding="0" align="center" width="50%">
    <tr><td class="InputTip"><%=midObjectCtl.get_display_buff()%></td></tr>
  </table>
<%if ( midObjectCtl.get_mgid_value().equals("000000") ) {
%>
	<table border="0" cellspacing="2" cellpadding="0" align="center" width="50%" >
<%
		log.Write("step2:	i_biz_id=[" +  i_biz_id + "]" );
		log.Write("step2:	i_step_id=[" +  i_step_id + "]" );
		ResultSet rs = midObjectStepView.getStepViewNotHidByBizIdAndStepId(i_biz_id,i_step_id);
    while( rs.next() ) 
		{
			log.Write("step2:	input_name=[" +  rs.getString("input_name").trim() + "]" );
			if ( midObjectCtl.checkHidden(rs.getString("input_name").trim()) != true ) 
			{
				if( ( i_biz_id==2 || ( i_biz_id==8 && ltFeeType==1 ) || ( i_biz_id==20 && ltFeeType==1 ) || i_biz_id==23 )  
				&& rs.getString("input_name").trim().equals("AMT1") )//С��ͨ����ͨҵ���ֵ���ѡ��
				{
					if ( request.getParameter("AMT1") == null )
        	{
%>
		<input type="hidden" name="AMT1" value='000000000005000'>
	  <tr>
	  	<td width="30%" align="middle" height="22" class="InputTip">��ֵ���</td>
	    <td width="70%" align="left" height="22" class="InputTip">
	    	<input onClick="form1.AMT1.value='000000000005000';" type="radio" name="radiobutton" checked="true">50 Ԫ<br>
	    	<input onClick="form1.AMT1.value='000000000010000';" type="radio" name="radiobutton">100 Ԫ<br>
	    	<input onClick="form1.AMT1.value='000000000015000';" type="radio" name="radiobutton">150 Ԫ<br>
	    	<input onClick="form1.AMT1.value='000000000020000';" type="radio" name="radiobutton">200 Ԫ<br>
	    </td>
<%
					}
					else
					{
%>					
		<tr>
			<td width="30%" align="middle" height="22" class="InputTip">��ֵ���</td>
			<td width="70%" align="left" height="22" class="InputTip"><%=Integer.parseInt(request.getParameter("AMT1"))/100%>Ԫ</td>
		</tr>
		<input type="hidden" name="AMT1" value="<%=request.getParameter("AMT1")%>">
<%					
					}
				}        			
				else 
				{
					if ( ( ( i_biz_id==8 && ltFeeType==0 ) || i_biz_id==7 || ( i_biz_id==20 && ltFeeType==0 ) ) 
					&& rs.getString("input_name").trim().equals("AMT1") ) 
					{
						log.Write("step2:	AMT1=[" +  midObjectCtl.get_amt1_value() + "]" );
%>	    				
		<input type="hidden" name="AMT1" size="<%=rs.getInt("input_size")%>"  value="<%=midObjectCtl.get_amt1_value()%>">
<%				
					}
					else
					{
%>
	  <tr>
	  	<td width="20%" align="center" height="22" class="InputTip"><%=rs.getString("input_lable").trim()%>��</td>
	  	<td width="30%" align="left" height="22" class="InputTip">
				<input type="<%=rs.getString("input_type").trim()%>" name="<%=rs.getString("input_name").trim()%>" size="<%=rs.getInt("input_size")%>"  value="<%=rs.getString("input_value").trim()%>">
			</td>
		</tr> 			
<%				
					}
				}
			} 
      else
			{ 
				if ( rs.getString("input_name").trim().equals("CDNO") || rs.getString("input_name").trim().equals("PSWD") ) 
				{
				}
				else
				{
%>
		<input type="hidden" name="<%=rs.getString("input_name").trim()%>" size="<%=rs.getInt("input_size")%>">  
<%	
				}
			}
		}
		log.Write("step2:	i_step_id=[" +  i_step_id + "]" );
    rs.close();
    midObjectStepView.releaseDBConnection();
    
   	//if ( MarchFlag != 1 )
   	if ( stepCount == 2 )
		{
%>     
		<tr>     
			<td height="27" align="center" class="InputTip">��������</td>
			<!-- -->  <td class="InputTip"><SCRIPT language=JavaScript> writePwdActivxObjectLenClass('safeInput1','safeInput1','','passWord',6,6,'20','120')</SCRIPT></td>
			 
		</tr>        
		<tr>
			<td height="27" align="center" class="InputTip">��̬����</td>
			<td class="InputTip"><input type="text" name="DynamicCode" size="6"></td>
		</tr>
<%	
		}
%>
	</table>
<%
		if( MarchFlag != 1 )
		{
			System.out.println("Not To March stepCount = " + stepCount );
    	i_step_id = i_step_id + 1 ;
    }    
    if ( i_step_id  == i_max_step_id ) 
    { 
%>
	<br>
	<a href="/personbank/HttpProxy?URL=/midserv/midSelect.jsp&dse_sessionId=<%=dse_sessionId%>" target=_self> <font color="#003366">���ش���ɷ���ҳ</font> </a>
	<br>
<%
    }
    else 
    { 
			if ( i_step_id == 2 )
    	{ 
%>
	<br>
	<input type="button" onclick="javascript:beforeSubmit0();" value="ȷ�Ͻɷ�" style={cursor:hand;}>
	<input type="reset" class="IN" name="Submit2" value="����" onclick="javascript:history.back()" >
	<br>
<%
			}
			else
			{
%>			
	<br>
	<input type="button" onclick="javascript:beforeSubmit1();" value="�ύ" style={cursor:hand;}>
	<input type="reset" class="IN" name="Submit2" value="����">
	<input type="button" class="IN" name="Submit3" value="����" onclick="javascript:history.back()" >
	<br>			
<%
			}
    }
  } 
  if( i_biz_id == 30 )
  {
%>
  <input type="button" class="IN" name="Submit4" value="����" onclick="javascript:history.back()" >
  <% } %>
</FORM>

</DIV></CENTER></BODY></HTML>
