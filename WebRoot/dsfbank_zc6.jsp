<!--��׼ҳ������������-->
<%@ page language="java" contentType="text/html;charset=GBK" %>
<%@ page import="com.viatt.util.*"%>
<%@ page import="java.util.*" %>
<%@ page import="com.gdbocom.util.communication.*" %>
<%@ page import="com.gdbocom.util.format.*" %>
<%@ include file="IPconinf.inc" %>
<%
	  
	  //��ֹ���˹��ܷ�ֹҳ���ظ��ύ  ��ÿ��ҳ�涼��Ҫ��ӡ�
	  request.setCharacterEncoding("GBK");
 	  response.setHeader("Pragma", "no-cache"); 
	  response.setHeader("Cache-Control", "no-store"); 
	  response.setDateHeader("Expires", -1); 
      //��ȡ��½����
      String FUNFLG= request.getParameter("FUNFLG");
      String loginType= request.getParameter("loginType");
   	  loginType="1";
   	  //��ȡdse_sessionId
   	  String dse_sessionId = request.getParameter("dse_sessionId");
   	  //��ȡ�ͻ���ǰʹ�õ�CSS��ʽ
   	  String cssFileName =request.getParameter("cssFileName");
	  if(cssFileName ==null){
		  cssFileName = "skin.css";
	   }
%>
<!-------------------------------------------------------------------
                          ��׼JavaScript������
--------------------------------------------------------------------->
<script language="JavaScript" src="/personbank/HttpProxy?URL=/midserv/js/public.js&dse_sessionId=<%=dse_sessionId%>"></script>
<script language="JavaScript" src="/personbank/HttpProxy?URL=/midserv/js/public_card.js&dse_sessionId=<%=dse_sessionId%>"></script>
 <script language="javascript" type="text/javascript">
  function condition_tcusid(){
  	
  }
  </script>
<!--------------------------------------------------------------------
   ��ǰҳ��JavaScript�������֣������ύ��֤��ҳ�涯��������Ŀ��ȴ���

<!--------------------------------------------------------------------
                          ҳ��HTML���ֲ���    
---------------------------------------------------------------------->
<html>
<head>
<title>��ͨ�������Ϸ���</title>
<script language="JavaScript" src="js/public.js"></script>

<link rel="stylesheet" type="text/css" href="/personbank/css/<%=cssFileName%>">
</head>
	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
		<div class="indent">
<form action="/personbank/HttpProxy" method=post name="form1" onsubmit="return condition_tcusid();">
		<input type="hidden" name="dse_sessionId" value="<%=dse_sessionId%>">
		<input type="hidden" name="URL" value="/midserv/dsfbank_zc.jsp">
		<%
		//sendPass��־ �Ƿ�����֤�� 1���� ��loginType=0ע���û�ʱ��Ҫ ��
		if (Double.parseDouble(request.getParameter("loginType"))==0){	
		%>
				<input type="hidden" name="sendPass" value="1">
		<%	}
		if (Double.parseDouble(request.getParameter("loginType"))==1){%>
				<input type="hidden" name="sendPass" value="0">
		<%	}%>
		
	    <table cellpadding="1" cellspacing="1" class="tab" width="100%" >
	     		<tr align="center"> 
			          <td  colspan= "2" class="tab_title">�����������عش��ո����ͻ�ǩԼЭ��</td>
			    </tr>
			    <tr align="center"> 
			          <td  colspan= "2" class="tab_sub_title">�ɷ�ҵ��ί��Լ��</td>
			    </tr>		
		       		<tr>
		   			   		<td width="30%" align="left" class="tab_tr">
		   			   		<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;���ˣ����³ơ�ί���ˡ���ί�н�ͨ���йɷ����޹�˾�عط��У����¼�ơ����С����������շѵ�λͨ���ع������е��ӽ��������ṩ��Ӧ������Ϣ���ۻ������˻��ڵĿ���֧�����շѵ�λ��</p>
		   			   		<p>1��ί���˱�����ָ�����е��˻������ˣ�ָ���˻������˿���֧��ί���˱��˺����˵���ѡ��Ŀ����ط��á�</p>
		   			   		<p>2��ί�����ڸ����������ҵ��ί�з�ʵʱ��Ч�����ڿۿ�ǰȷ��ǩԼ�Ƿ�����Ч��������δ��ʱ�ۿ���ɵ�Ƿ����ί�����Ը�����ί����Ŀ���Զ����ɷ�ҵ�������״οۿ�ɹ�֮����ͨ����ί�������й��շѵ�λ������Ϣ���������޷��ۿ�ɷѣ���ʧ��ί���˳е���</p>
		   			   		<p>3���򸶿��˻�������򸶿��˻���ʧ�����ᡢ������������޷��ۿ�ɷѶ���ɵ���ʧ����ί���˳е���</p>
		   			   		<p>4��ί���˲��ټ�������ί����Ŀ��Ӧ��ʱ�����а�����ί���������������н��������ݱ�ί����֮�������ݰ�����ɷ��������ɴ˶���ɵ���ʧ��ί�����Ը���</p>
		   			   		<p>5��ί��������ֹί�л��������˻�������ʧ������ͽ��������ģ��뼰ʱ������ί������������ĳ���ί���������������е�ҵ��涨����</p>
		   			   		<p>6.ί�����緢��ί���˺ű���ģ������°���ί�л���ҵ�񣬷��������ɵ���ʧ����ί���˳е���</p>
		   			   		<p>7��ί������Ȩ���а���ָ���շѵ�λ���͵����ݴ�ί���˻��пۻ���Ӧ�������������շѵ�λ���͵����ݽ�����ˣ��������ɵĿۻ������ӳ�֧�����е��κ����Ρ�ί���˶Դ��ɵĿ�����������ʱ�������շѵ�λ��ѯ��ί����������֮��ί�й�ϵ��Ϊ����ת�ˣ��շѵ�λ��ί����֮��ĸ�������ϵ���ɴ������ľ����������޹ء�</p>
		   			   		<p>8�����ڴ���ɷ�ҵ��չ��ǰ��Ϊ�շѵ�λ���ع������е��ӽ������ġ���ҵ���д��ں�����ϵ�����һ���йغ�����ϵ��ֹ����صĴ��ɷѷ����Զ���ֹ�����в��е��κ����Ρ�</p>
		   			   		<p>9��ͬһ�����˻���ͬһ�����ж��ί�пۿ�ɷѵģ����и����շѵ�λ�ṩ��Ӧ������Ϣ�������������ۿ�˳��������ϵͳ������ί�����򸶿��˻���������֧��ȫ���ۿ�ɷ���ɵ���ʧ����ί���˳е���
		   			   		</p>
		   			   		<p>10��ǩ����ί��ʱ����ί��ҵ���ݲ���ί�����շѡ����б���շѱ�׼ǰ�����й�ʾ����ί���˲���ָ��ʱ���ڳ���ί�У���Ϊͬ��������֧��������������ί��ҵ��
		   			   		</p>
		   			   		<p>11.ί����ͨ����ͨ���е����������������������ֻ����С�����ͨ�ȣ�����ǩԼ����ʱ������ϵͳ��������ع�ͳһ���ո�ƽ̨ҵ��ʵ����Ҫ���������Ϣ�������ع�ͳһ���ո�ƽ̨���������ɷ����п��š��ֿ����������ɷѽ��ֻ����롢���֤�š��ɷѱ�ʶ�ȡ�
		   			   		</p>
		   			   		<p>12. �򲻿ɿ�����ϵͳ���ϵ������¼���ԭ���¿ۿ�ɹ�����ɵ���ʧ�����в��е����Ρ�
		   			   		</p>
		   			   		<p>13.�����涨����Ȩ�齻ͨ���й㶫ʡ���С�
		   			   		</p>
		   			   		
		   			   		</td>
		   			   		
				   </tr>
	
				 
			    <tr class="tab_result">
				   <td align="center" colspan="2">
				      
					  <input type="submit" class="button_bg" name="Submit" value="ͬ��">
			          <input type="button" class="button_bg" name="Submit2" onclick="javascript:history.back(1)" value="��ͬ��">
			       </td>  	
				</tr>
		</table>
		<div class="guide">
		         <ul>��ʾ�� <li>*&nbsp;&nbsp;ǰ��*�Ǳ�����</li></ul>
		</div>
</form>
</div>
</body>
</html>
