 
<!-------------------------------------------------------------------
                          ��׼JavaScript������
--------------------------------------------------------------------->
<script language="JavaScript" src="./js/check.js"></script>

<!-------------------------------------------------------------------
                          ��׼ҳ������������
--------------------------------------------------------------------->

<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.bocom.midserv.base.*" %>
<%@ page import="com.bocom.midserv.web.*" %>


<%//��ò���
    String step_id=request.getParameter("step_id").trim();
    if (step_id==null||step_id.equals("")){
       step_id=(String)session.getAttribute("step_id");
    }else{
       session.setAttribute("step_id",new String(step_id));
    }
    int step_id_s=Integer.parseInt(step_id);
    String biz_memo=new String(request.getParameter("biz_memo").trim().getBytes("ISO8859_1"),"gb2312");
    if (biz_memo==null||biz_memo.equals("")){
       biz_memo=(String)session.getAttribute("biz_memo");
    }else{
       session.setAttribute("biz_memo",new String(biz_memo));
    }
    String biz_id=request.getParameter("biz_id").trim();
    if (biz_id==null||biz_id.equals("")){
       biz_id=(String)session.getAttribute("biz_id");
    }else{
       session.setAttribute("biz_id",new String(biz_id));
    }
    int i_biz_id=Integer.parseInt(biz_id);
    MidObjectStepView midObjectStepView =  new MidObjectStepView();
    int i_max_step_id = midObjectStepView.getMaxStepId(i_biz_id);
    ResultSet rs= midObjectStepView.getStepView(i_biz_id,step_id_s);

%>


<!--------------------------------------------------------------------
   ��ǰҳ��JavaScript�������֣������ύ��֤��ҳ�涯��������Ŀ��ȴ���
---------------------------------------------------------------------->


<!--------------------------------------------------------------------
                          ҳ��HTML���ֲ���    
---------------------------------------------------------------------->
<html>

<head>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<title>��������ҵ��</title>
<link rel="stylesheet" href="./css/personbank.css">
<style type="text/css">
	.t{behavior:url(./images/dtable.htc)}
</style>
</head>

<body leftmargin="0" topmargin="0"  background="./images/background.gif" >
<p align="center"> 
<form name='form1' method="POST" action='' onsubmit="return condition()">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
  	<td align="center"><img src="./images/xianb.gif" width="100" height="20"></td>
  	<td rowspan="3" align="right" valign="top">&nbsp;</td>
  </tr>
  <tr>    	
  	<td background="images/pageTitle.gif"  class="pageTitle" align="center"> �� �� �� �� ҵ ��</td>           
  </tr>       
  <tr>    	      
  	<td background="images/pageTitle.gif"  class="pageTitle" align="center"> <%=biz_memo%> �� <%=step_id%> �� </td>           
  </tr>       
  <tr>       
  	<td align="center"><img src="./images/xianb.gif" width="100" height="20"></td>       
  </tr>       
</table>       
       
<table align=center width="733">       
<tr>       
<td width="37"></td>       
<td width="71" class="InputTip">����</td>      
<td width="70" class="InputTip">˵��</td>      
<td width="70" class="InputTip">����ʶ</td>     
<td width="75" class="InputTip">������</td>     
<td width="65" class="InputTip">������</td>     
<td width="53" class="InputTip">�ַ�����</td>    
<td width="59" class="InputTip">��ⳤ��</td>   
<td width="81"></td>   
</tr>   
<tr>    
      <td width="43" height="26"  bgcolor="#FFFFFF">   
        <div align="center">   
          <INPUT TYPE="button" onclick="javascript:document.all.table1.addnew();" value="����">   
        </div>   
           
      </td>   
      <td width="546" height="26" colspan="8">    
        <%
      if(i_max_step_id>=1){
      int i_Maxserino=midObjectStepView.getMaxserino(i_biz_id,step_id_s);
      ResultSet rs2= midObjectStepView.getStepView(i_biz_id,step_id_s);
      while(rs2.next()){
      %>  
        <table id="table<%=i_Maxserino%>" width="116%" border="1" cellspacing="0" cellpadding="0" bordercolorlight='#6699cc' bordercolordark='#ECF5FF' class="t">   
          <tr>    
            <td height="26" width="93%">   
              <input type="text" name="name_ch" size=10 value="<%=rs2.getString("input_lable").trim()%>">   
               
              <input type="text" name="explain" size=10 value="<%=rs2.getString("input_memo").trim()%>">      
                
                 
              <input type="text" name="name_en" size=10 value="<%=rs2.getString("input_name").trim()%>">      
                 
                  
              <select size="1" name="type_s">      
          	<option value="<%=rs2.getString("input_type").trim()%>"><%=rs2.getString("input_type").trim()%></option>
          	<option value="text">text</option>
          	<option value="hidden">hidden</option>
          	<option value="password">password</option>
              </select>
            
            
              <input type="text" name="length_s" size=10     
              OnKeypress="if(event.keyCode<47||event.keyCode>57)    
              event.returnValue=false; "  value="<%=rs2.getInt("input_size")%>">
              <select size="1" name="word_type">      
          	<option value="<%=rs2.getInt("word_type")%>">
          	<%
          	if(rs2.getInt("word_type")==1){
          	%>
          	    �����
          	<%
          	}
          	if(rs2.getInt("word_type")==2){
          	%>
          	    ������
          	<%
          	}
          	if(rs2.getInt("word_type")==3){
          	%>
          	    �����
          	<%
          	}
          	%>
          	</option>
          	<option value="1">�����</option>
          	<option value="2">������</option>
          	<option value="3">�����</option>
              </select><select size="1" name="check_sign">
          	<option value="<%=rs2.getInt("check_sign")%>">
          	<%
          	if(rs2.getInt("check_sign")==1){
          	%>
          	���
          	<%
          	}
          	else{
          	%>
          	�����
          	<%
          	}
          	%>
          	</option>
          	<option value="1">���</option>
          	<option value="0">�����</option>
              </select>
            
            
            </td>   
            <td width="7%" onclick="javascript:document.all.table<%=i_Maxserino%>.del()">ɾ�� </td>  
          </tr>   
        </table>
      <%
      i_Maxserino--;
      }
          
      }
      else{
      %>  
        <table id="table1" width="116%" border="1" cellspacing="0" cellpadding="0" bordercolorlight='#6699cc' bordercolordark='#ECF5FF' class="t">   
          <tr>    
            <td height="26" width="93%">   
              <input type="text" name="name_ch" size=10>   
               
              <input type="text" name="explain" size=10>      
                
                 
              <input type="text" name="name_en" size=10>      
                 
                  
              <select size="1" name="type_s">      
          	<option value="text">text</option>
          	<option value="hidden">hidden</option>
          	<option value="password">password</option>
              </select>
            
            
              <input type="text" name="length_s" size=10     
              OnKeypress="if(event.keyCode<47||event.keyCode>57)    
              event.returnValue=false;    
              "><select size="1" name="word_type">      
          	<option value="1">�����</option>
          	<option value="2">������</option>
          	<option value="3">�����</option>
              </select><select size="1" name="check_sign">
          	<option value="1">���</option>
          	<option value="0">�����</option>
              </select>
            
            
            </td>   
            <td width="7%">ɾ�� </td>   
          </tr>   
        </table>
      <%
      }
      %>
      </td>   
         
    </tr>   
</table>   
   
   
   
  <p align="center">��</p>
  <p align="center">��</p>
  <input type="hidden" name="biz_id" value="<%=biz_id%>">
  <input type="hidden" name="biz_memo" value="<%=biz_memo%>">
  <input type="hidden" name="step_id" value="<%=step_id_s%>">
  <p align="center"><input type="button" value="��һ��" name="B1" onclick="back1()"> <input type="button" value="��һ��" name="B1" onclick="next()"> <input type="reset" value=" �� д " name="B2"> <input type="button" value=" Ԥ �� " name="see" onclick="preview()"> <input type="button" value="ɾ���˲�" name="del" onclick="delstep()"> <input type="button" value=" �� �� " name="B3" onclick="go()"></p>   
</form>   
   
</body>   
   
</html>   
