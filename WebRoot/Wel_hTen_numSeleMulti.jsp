<%@page import="com.gdbocom.Transactions.WelLot"%>
<%@ page language="java" contentType="text/html;charset=GBK"%>
<%@page import="java.util.List"%>
<%@include file="/includeFiles/common.jsp" %>
<%
	String buyMode=ReqParamUtil.getParamAttr(request,"buyMode");
	HpTenBallCreater creater=new HpTenBallCreater(buyMode);
	List selNumList=creater.getSelNumList();
	HpTenBallCreater.HpTenParam param=creater.getParam();//��ȡ���ò���
	String buyModeName=param.name;
	int  buyModeInt=Integer.parseInt(buyMode);
	String selNum=String.valueOf(param.selNum);//��ѡ��ĺ������
	
	List txtList=new ArrayList();
	int group=2;
	//�����ѡ����ֱ����ʾ��������ѡ��ǰֱ��Ҫ��ʾ������
	if(WelLot.HpTenBuy.TWO_LINE==buyModeInt){
		group=2;
		txtList.add("ǰλ");
		txtList.add("��λ");
	}else{
		group=3;
		txtList.add("��һλ");
		txtList.add("�ڶ�λ");
		txtList.add("����λ");
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <title>��ͨ�������Ϸ���</title>
        <link rel="stylesheet" type="text/css" href="/personbank/css/<%=cssFileName%>"></link>
        <script type="text/javascript" src="/personbank/HttpProxy?URL=/midserv/js/jquery-1.11.1.min.js&dse_sessionId=<%=dse_sessionId%>"></script>
        <script type="text/javascript"  charset="UTF-8" src="/personbank/HttpProxy?URL=/midserv/js/formValidator.js&dse_sessionId=<%=dse_sessionId%>"></script>
        <script type="text/javascript"  charset="UTF-8" src="/personbank/HttpProxy?URL=/midserv/js/formValidatorRegex.js&dse_sessionId=<%=dse_sessionId%>"></script>
        <script type="text/javascript"  charset="UTF-8" src="/personbank/HttpProxy?URL=/midserv/js/commonJS.js&dse_sessionId=<%=dse_sessionId%>"></script>
        <script type="text/javascript">
	        jQuery.extend({    
	            uniqueArray:function(a) {    
	                var r=[];    
	                for (var i=0,l=a.length; i<l; ++i)jQuery.inArray(a[i],r)<0&&r.push(a[i]);    
	                return r;    
	           }    
	        });
	    	jQuery(document).ready(function(){
	    		var group=<%=group%>;
				jQuery.formValidator.initConfig({formid:"form1",onerror:function(msg){jQuery(":button").attr("disabled",false);alert(msg);}});
				jQuery("#times").formValidator().inputValidator({min:1,max:999,type:"number",onerror: "����д��ȷ��Ͷע����!"});
				jQuery("#form1").submit(function(){
					//��ȡ��ѡ�������������
					var gs=new Array();
					jQuery(":checkbox:checked").each(function(){
						var v=jQuery(this).attr("group");
						gs.push(v);
					});
					
					//���˵��ظ�������
					var uGs=jQuery.uniqueArray(gs);
					//����������Ȳ����ڹ鵵�������������û����ȷѡ��
					if(group!=uGs.length){
						alert("�밴��λ��ȷѡ����룡");
						return false;
					}
					
					//��ȡ��ѡ�еĺ��룬����������������
					var nums=new Array();
					jQuery(":checkbox:checked").each(function(){
						var v=jQuery(this).val();
						nums.push(v);
					});
					//���˵��ظ��ĺ���
					var uNums=jQuery.uniqueArray(nums);
					//��������������һ�������ظ�
					if(nums.length!=uNums.length){
						alert("ѡ��ĺ��벻���ظ���");
						return false;
					}
					
					var size=jQuery(":checkbox:checked").length;
					//�ж��Ƿ�ѡ���㹻����
					if(size<<%=selNum%>){
						alert("������ѡ��<%=selNum%>������!");
						return false;
					}
				});
	    	});
	    </script>
    </head>
    <body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0"  oncontextmenu="self.event.returnValue=false" onselectstart="return false">
    <div class="indent">
    <form action="/personbank/HttpProxy" method="post" name="form1" id="form1">>
        <input type="hidden" name="URL" value="/midserv/Wel_hTen_Confirm.jsp"/>
        <table width="90%" align="center" cellpadding="1" cellspacing="1"  class="tab">
		  <tr align="center" class="tab_title">
		    <td align="left" colspan="2">
		      	<%=buyModeName%>(����ѡ��<%=selNum%>��):
		    </td>
		  </tr>
		  <tr></tr>
		 <tr class="tab_tr"> 
		<%
			Iterator iter=txtList.iterator();
			int g=0;
			while(iter.hasNext()){
				g++;
				String txt=(String)iter.next();
		%>
		    <tr class="tab_tr"> 
		        <td align="right">
		             <%=txt%>:
		        </td>
		        <td>
				<table>
		<%
				out.println("<table>");
		        for(int i=0;i<selNumList.size(); i++){
		        	String obj=selNumList.get(i).toString();
		        	int val=Integer.parseInt(obj);
		        	
					if(i==0||val%5==1){
    					out.print("<tr>");
    				}
		%>
						<td> 
			        		<input type='checkbox' group="<%=g%>" name='<%=g%>selNum<%=String.valueOf(i)%>' value='<%=obj%>'><%=obj%></input>
						</td>
		<%
					if(val%5==0||i==(selNumList.size()-1)){
						out.print("</tr>");
					}
				}
				out.println("</td></table>");
			}
		%>
	        </td>
	     </tr>
	     <tr align="center" class="tab_tr">
		    <td align="right">
		      	����(������100):
		    </td>
		    <td align="left">
		    	<input type="text" name="BetMul" id="BetMul" value="1"/>
		    </td>
		 </tr>
	     <tr class="tab_result"> 
	        <td align="center" colspan="2">
	            <input type="submit" class="button_bg" value="ȷ��" style="cursor:hand;"/>
	            <input type="button" class="button_bg" name="Submit3" value="����" onclick="javascript:history.back()" />      
	        </td>
	     </tr>
	     <input type='hidden' name='group' value='<%=group%>'/>
	     </table>
	     <%=
			ReqParamUtil.reqParamAttrToHtmlStr(request)
		 %>
		</form>
	</div>
	</body>
</html>