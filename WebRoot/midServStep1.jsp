<!-------------------------------------------------------------------
                          ��׼ҳ������������
--------------------------------------------------------------------->
<%@ page contentType="text/html;charset=GBK" %>
 
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.bocom.midserv.base.*" %>
<%@ page import="com.bocom.midserv.web.*" %>
<%@ page import="com.bocom.midserv.gz.*" %>
<%@ page import="com.bocom.eb.des.EBDES" %>
<% 
   int i_step_id	= Integer.parseInt(request.getParameter("step_id").trim());
   int i_biz_id		= Integer.parseInt(request.getParameter("biz_id").trim());
	 String cdno = request.getParameter("cardNo"); 
	 
   MidObjectView midObjectView =  new MidObjectView(); 
   if (midObjectView.getMidObjectView(i_biz_id) != true) 
   	System.exit(1);
   
   MidObjectStepView midObjectStepView =  new MidObjectStepView();
   //int maxstep=midObjectStepView.getMaxStepId(i_biz_id);
   
   String dse_sessionId = request.getParameter("dse_sessionId");//��ȡdse_sessionId
   String loginType = request.getParameter("loginType");
   GzLog log = new GzLog("c:/gzLog");
   log.Write("step1:	loginType=["+loginType+"] ҵ��i_biz_id=["+i_biz_id+"]");  
   
  String cssFileName = request.getParameter("cssFileName");//��ȡ�ͻ���ǰʹ�õ�CSS��ʽ
	if(cssFileName ==null){
		cssFileName = "skin.css";
	}		
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

<!--------------------------------------------------------------------
                          ҳ��HTML���ֲ���    
---------------------------------------------------------------------->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>��ͨ�������Ϸ���</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" type="text/css" href="/personbank/css/<%=cssFileName%>">

<SCRIPT language=javascript event=onkeydown for=document>   
if( event.keyCode == 13 )
{   
	return false ;
}   
</SCRIPT> 
<script language=JavaScript>
var clickBoolean = true;
var biz_id = <%=i_biz_id%>
function beforeSubmit()
{
	if( biz_id == 7 )
	{		
		if( document.form1.CTSQ.value.length != 11 )
		{
			alert( "�ֻ��ų��ȱ���Ϊ11" ) ;
			return false ;
		}
		if( document.form1.passWord.value.length != 6 )
 		{
			alert("�ƶ�����Ϊ6λ����");		
			return false;
 		}
	}
	if( biz_id == 8 )
	{
		if( document.form1.busiType.value == "03" && document.form1.CTSQ.value.length < 8 )
		{
			alert( "���볤�ȷǷ�" ) ;
			return false ;
		}
		
		if( document.form1.busiType.value != "03" && document.form1.CTSQ.value.length != 11 )
		{
			alert( "�ֻ��ų��ȱ���Ϊ11" ) ;
			return false ;
		}

		document.form1.passWord.value = "000" + document.form1.feeType.value + document.form1.busiType.value ;
		//alert( "pass:" + document.form1.passWord.value + " feeType:" + document.form1.feeType.value + " busiType:" + document.form1.busiType.value);
	}
	if( biz_id == 9 )
	{		
		if( document.form1.CarNo.value.length != 5 )
		{
			alert( "���ƺ��볤�ȱ���Ϊ5" ) ;
			return false ;
		}
	}	
	if( biz_id == 22 || biz_id == 23 || biz_id == 28)
	{		
		if( document.form1.CTSQ.value.length != 11 )
		{
			alert( "�ֻ��ų��ȱ���Ϊ11" ) ;
			return false ;
		}
	}	
  if(clickBoolean)
  {
    form1.submit();
    clickBoolean = false;
  }
  //alert("33");
}
</script>

</head>

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<center>
<div class="indent">
<table width="100%" align="center" cellpadding="1" cellspacing="1" class="tab">
  <tr align="left">    	   	
  	<td colspan="3" class="tab_title"><%=midObjectView.get_biz_memo().trim()%>���ڶ�����</td>
  </tr>

<FORM action="/personbank/HttpProxy" method=post name="form1">

<input type="hidden" name="Jflx" value="">
<input type="hidden" name="dse_sessionId" value="<%=dse_sessionId%>">
<%if( loginType.equals("0") ){%>
<input type="hidden" name="URL" value="/midserv/midServStep2.jsp">
<%}else{%>
<input type="hidden" name="URL" value="/midserv/midServStep3.jsp">
<%}%>
<input type="hidden" name="biz_id" value="<%=midObjectView.get_biz_id()%>">
<input type="hidden" name="biz_no" value="<%=midObjectView.get_biz_no().trim()%>">
<input type="hidden" name="step_id" value="<%=i_step_id+1%>">
<input type="hidden" name="stepCount" value="1">

<input type="hidden" name="CarType" value="A1">
<input type="hidden" name="DestAttr" value="0000">

<%if( i_biz_id != 7 ){%>
<input type="hidden" name="passWord">
<%}%>
<input type="hidden" name="feeType" value='1'>
<input type="hidden" name="busiType" value='01'>

<%ResultSet rs = midObjectStepView.getStepViewNotHidByBizIdAndStepId(i_biz_id,i_step_id);
	while (rs.next()) { %>
  <tr class="tab_tr">
     <td width="20%" align="center" height="22" class="InputTip"><%=rs.getString("input_lable").trim()%>��</td>
     <td width="30%" align="left" height="22" class="InputTip"><input type="<%=rs.getString("input_type").trim()%>" name="<%=rs.getString("input_name").trim()%>" size="<%=rs.getInt("input_size")%>" maxlength="<%=rs.getInt("input_size")%>" value="<%=rs.getString("input_value").trim()%>"></td>
  </tr> 
<%}
	if( i_biz_id == 7 )
	{
%>
		<tr class="tab_tr">
			<td width="20%" align="center" height="22" class="InputTip">�ƶ��������룺</td>
			<td width="20%" align="left" height="22" class="InputTip"><input type="password" name="passWord" size="11" maxlength="6"></td>
		</tr>	
<%
	}	
	if( i_biz_id == 8 )
	{
%>	
	  <tr class="tab_tr">
	  	<td width="30%" align="middle" height="22" class="InputTip">�������ͣ�</td>
	    <td width="70%" align="left" height="22" class="InputTip">
	      <input onClick="form1.feeType.value='1';" type="radio" name="radiobutton0" checked="true"> Ԥ �� ��<br>
	      <input onClick="form1.feeType.value='0';" type="radio" name="radiobutton0"> �� Ƿ ��<br>
	    </td>
		</tr>	     
		
	  <tr class="tab_tr">
	  	<td width="30%" align="middle" height="22" class="InputTip">ҵ�����ͣ�</td>
	    <td width="70%" align="left" height="22" class="InputTip">
	      <input onClick="form1.busiType.value='01';" type="radio" name="radiobutton1" checked="true" value="GSM">GSM(130/131)<br>
	      <input onClick="form1.busiType.value='03';" type="radio" name="radiobutton1" value="��;�̻�"> �� ; �� ����/��<br>
	    </td>
		</tr>
<%			
	}
	if( i_biz_id == 9 )
	{
%>    		
	  <tr class="tab_tr">
	  	<td width="30%" align="middle" height="22" class="InputTip">��&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;�ͣ�</td>
	    <td width="15%" align="left" height="22" class="InputTip">
	      <input onClick="form1.CarType.value='A1';" type="radio" name="radiobutton2" checked="true" value="A1">��������<br>
	      <input onClick="form1.CarType.value='A2';" type="radio" name="radiobutton2" value="A2">С������<br>
	      <input onClick="form1.CarType.value='A5';" type="radio" name="radiobutton2" value="A5">�ҳ�<br>
	    </td>
	    <td width="15%" align="left" height="22" class="InputTip">
	      <input onClick="form1.CarType.value='A6';" type="radio" name="radiobutton2" value="A6">������<br>
	      <input onClick="form1.CarType.value='A7';" type="radio" name="radiobutton2" value="A7">ũ�����䳵<br>
	      <input onClick="form1.CarType.value='C1';" type="radio" name="radiobutton2" value="C1">�⼮����<br>
	    </td>
		</tr>
		<tr class="tab_tr">
			<td width="20%" align="middle" height="22" class="InputTip">���ƺ��루������A����</td>
			<td width="20%" align="left" height="22" class="InputTip"><input type="text" name="CarNo" size="5" maxlength="5"></td>
		</tr>	
		<tr class="tab_tr">
			<td width="20%" align="middle" height="22" class="InputTip">��&nbsp;&nbsp;&nbsp;ܰ&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;ʾ��</td>
			<td width="20%" align="left" height="22" class="InputTip" colspan="2">�����ù���������������خ����������ɳ���ӻ������ǵĳ�����</td>
		</tr>

<%
	}
	if( i_biz_id == 20 )
	{
%>	
	  <tr class="tab_tr">
	  	<td width="30%" align="middle" height="22" class="InputTip">�������ͣ�</td>
	    <td width="70%" align="left" height="22" class="InputTip">
	      <input onClick="form1.feeType.value='1';" type="radio" name="radiobutton0" checked="true"> Ԥ �� ��<br>
	      <input onClick="form1.feeType.value='0';" type="radio" name="radiobutton0"> �� Ƿ ��<br>
	    </td>
		</tr>
<%}
	if( i_biz_id == 26 )
	{
%>
		<tr class="tab_tr">
			<td width="30%" align="center" height="22" class="InputTip">����ֵ�û����ԣ�</td>
			<td width="70%" align="left" height="22" class="InputTip">
	      <input onClick="form1.DestAttr.value='0000';" type="radio" name="radiobutton3" value="0000"> �̻�<br>
	      <input onClick="form1.DestAttr.value='0001';" type="radio" name="radiobutton3" value="0001"> С��ͨ<br>
	      <input onClick="form1.DestAttr.value='0002';" type="radio" name="radiobutton3" value="0002"> �ƶ�����<br>
	      <input onClick="form1.DestAttr.value='0003';" type="radio" name="radiobutton3" value="0003"> ADSL<br>
	      <input onClick="form1.DestAttr.value='0006';" type="radio" name="radiobutton3" value="0006"> �������˻�<br>
	    </td>
		</tr>	
<%			
	}
	if(	i_biz_id == 30 )	
	{
%>	
	  <tr class="tab_tr">
	  	<td width="100%" align="middle" height="22" class="InputTip" colspan=2>ҵ������</td>
	  </tr>
		<tr class="tab_tr">
		    <td width="100%" align="middle" height="22" class="InputTip">
		      <input onClick="form1.Jflx.value='01';" type="radio" name="radiobutton2" value="01">�����ף����Žɷ�<br>
		    </td>
	    </tr>
		<tr class="tab_tr">
		    <td width="100%" align="middle" height="22" class="InputTip">
		      <input onClick="form1.Jflx.value='02';" type="radio" name="radiobutton2" value="02">�����ף���ͨ�ɷ�<br>
		    </td>
		</tr>
		<tr class="tab_tr">
		    <td width="100%" align="middle" height="22" class="InputTip">
		      <input onClick="form1.Jflx.value='03';" type="radio" name="radiobutton2" value="03">�����ף��ƶ��ɷ�<br>
		    </td>
	    </tr>
		<tr class="tab_tr">
		    <td width="100%" align="middle" height="22" class="InputTip">
		      <input onClick="form1.Jflx.value='05';" type="radio" name="radiobutton2" value="05">�����ף�����˰��˰<br>
		    </td>
		</tr>
<%			
	}				
	rs.close();
	midObjectStepView.releaseDBConnection();
%>
<tr class="tab_result">
	<td align="center" colspan="3">
		<input type="button" class="button_bg" onclick="javascript:beforeSubmit();" value="�ύ" style={cursor:hand;}>
		<%if(i_biz_id !=30 )
		{%>
		<input type="reset" class="button_bg" name="Submit2" value="����">
		<%}%>
   <%if( i_biz_id == 1 ||i_biz_id == 2 || i_biz_id == 7 || i_biz_id == 8 || i_biz_id == 9 || i_biz_id ==22 || i_biz_id ==23 || i_biz_id ==26 || i_biz_id ==28 || i_biz_id ==30 )
	{%>
   <input type="button" class="button_bg" onclick="window.history.back();" value="�� ��">
   <%}%>
	</td>
</tr>
</table>

<br>
<p>��ע��<%=midObjectView.get_biz_detail().trim()%></p>
</FORM>

</DIV></CENTER></BODY></HTML>
