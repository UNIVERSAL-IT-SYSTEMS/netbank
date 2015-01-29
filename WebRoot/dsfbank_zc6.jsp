<!--标准页面服务对象引用-->
<%@ page language="java" contentType="text/html;charset=GBK" %>
<%@ page import="com.viatt.util.*"%>
<%@ page import="java.util.*" %>
<%@ page import="com.gdbocom.util.communication.*" %>
<%@ page import="com.gdbocom.util.format.*" %>
<%@ include file="IPconinf.inc" %>
<%
	  
	  //静止后退功能防止页面重复提交  【每个页面都需要添加】
	  request.setCharacterEncoding("GBK");
 	  response.setHeader("Pragma", "no-cache"); 
	  response.setHeader("Cache-Control", "no-store"); 
	  response.setDateHeader("Expires", -1); 
      //获取登陆类型
      String FUNFLG= request.getParameter("FUNFLG");
      String loginType= request.getParameter("loginType");
   	  loginType="1";
   	  //获取dse_sessionId
   	  String dse_sessionId = request.getParameter("dse_sessionId");
   	  //获取客户当前使用的CSS样式
   	  String cssFileName =request.getParameter("cssFileName");
	  if(cssFileName ==null){
		  cssFileName = "skin.css";
	   }
%>
<!-------------------------------------------------------------------
                          标准JavaScript库引用
--------------------------------------------------------------------->
<script language="JavaScript" src="/personbank/HttpProxy?URL=/midserv/js/public.js&dse_sessionId=<%=dse_sessionId%>"></script>
<script language="JavaScript" src="/personbank/HttpProxy?URL=/midserv/js/public_card.js&dse_sessionId=<%=dse_sessionId%>"></script>
 <script language="javascript" type="text/javascript">
  function condition_tcusid(){
  	
  }
  </script>
<!--------------------------------------------------------------------
   当前页面JavaScript函数部分，包括提交验证，页面动作，具体目标等代码

<!--------------------------------------------------------------------
                          页面HTML表现部分    
---------------------------------------------------------------------->
<html>
<head>
<title>交通银行网上服务</title>
<script language="JavaScript" src="js/public.js"></script>

<link rel="stylesheet" type="text/css" href="/personbank/css/<%=cssFileName%>">
</head>
	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
		<div class="indent">
<form action="/personbank/HttpProxy" method=post name="form1" onsubmit="return condition_tcusid();">
		<input type="hidden" name="dse_sessionId" value="<%=dse_sessionId%>">
		<input type="hidden" name="URL" value="/midserv/dsfbank_zc.jsp">
		<%
		//sendPass标志 是否发送验证码 1发送 （loginType=0注册用户时需要 ）
		if (Double.parseDouble(request.getParameter("loginType"))==0){	
		%>
				<input type="hidden" name="sendPass" value="1">
		<%	}
		if (Double.parseDouble(request.getParameter("loginType"))==1){%>
				<input type="hidden" name="sendPass" value="0">
		<%	}%>
		
	    <table cellpadding="1" cellspacing="1" class="tab" width="100%" >
	     		<tr align="center"> 
			          <td  colspan= "2" class="tab_title">电子渠道“韶关代收付”客户签约协议</td>
			    </tr>
			    <tr align="center"> 
			          <td  colspan= "2" class="tab_sub_title">缴费业务委托约定</td>
			    </tr>		
		       		<tr>
		   			   		<td width="30%" align="left" class="tab_tr">
		   			   		<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;本人（以下称“委托人”）委托交通银行股份有限公司韶关分行（以下简称“银行”），依照收费单位通过韶关市银行电子结算中心提供的应付款信息，扣划付款账户内的款项支付给收费单位。</p>
		   			   		<p>1．委托人必须是指定银行的账户持有人，指定账户持有人可以支付委托人本人和他人的已选项目的相关费用。</p>
		   			   		<p>2．委托人在各渠道办理的业务委托非实时生效，请在扣款前确认签约是否已生效，否则因未及时扣款造成的欠费由委托人自负。各委托项目的自动代缴费业务功能自首次扣款成功之日起开通。因委托人在有关收费单位办理信息变更，造成无法扣款缴费，损失由委托人承担。</p>
		   			   		<p>3．因付款账户余额不足或因付款账户挂失、冻结、结清销户造成无法扣款缴费而造成的损失，由委托人承担。</p>
		   			   		<p>4．委托人不再继续履行委托项目，应及时至我行办理撤销委托手续，否则银行将继续依据本委托书之具体内容办理代缴费手续，由此而造成的损失由委托人自负。</p>
		   			   		<p>5．委托人需终止委托或因银行账户发生挂失、冻结和结清销户的，须及时办理撤销委托手续，具体的撤销委托手续，依据银行的业务规定办理。</p>
		   			   		<p>6.委托人如发生委托账号变更的，需重新办理委托划扣业务，否则因此造成的损失，由委托人承担。</p>
		   			   		<p>7．委托人授权银行按照指定收费单位发送的数据从委托账户中扣划相应款项，银行无需对收费单位发送的数据进行审核，对因此造成的扣划错误及延迟支付不承担任何责任。委托人对代缴的款项金额有疑问时，须向收费单位查询。委托人与银行之间委托关系仅为代理转账，收费单位与委托人之间的各项服务关系及由此引发的纠纷与银行无关。</p>
		   			   		<p>8．鉴于代理缴费业务开展的前提为收费单位与韶关市银行电子结算中心、商业银行存在合作关系，因此一旦有关合作关系终止，相关的代缴费服务自动终止，银行不承担任何责任。</p>
		   			   		<p>9．同一付款账户在同一天内有多笔委托扣款缴费的，银行根据收费单位提供的应付款信息进行批量处理，扣款顺序由银行系统决定，委托人因付款账户内余额不足以支付全部扣款缴费造成的损失，由委托人承担。
		   			   		</p>
		   			   		<p>10．签订本委托时，本委托业务暂不对委托人收费。银行变更收费标准前将进行公示，若委托人不在指定时间内撤销委托，视为同意向银行支付费用以延续本委托业务。
		   			   		</p>
		   			   		<p>11.委托人通过交通银行电子渠道（含个人网银、手机银行、自助通等）进行签约交易时，银行系统将会根据韶关统一代收付平台业务实现需要，将相关信息发送至韶关统一代收付平台，包括：缴费银行卡号、持卡人姓名、缴费金额、手机号码、身份证号、缴费标识等。
		   			   		</p>
		   			   		<p>12. 因不可抗力和系统故障等意外事件的原因导致扣款不成功所造成的损失，银行不承担责任。
		   			   		</p>
		   			   		<p>13.上述规定解释权归交通银行广东省分行。
		   			   		</p>
		   			   		
		   			   		</td>
		   			   		
				   </tr>
	
				 
			    <tr class="tab_result">
				   <td align="center" colspan="2">
				      
					  <input type="submit" class="button_bg" name="Submit" value="同意">
			          <input type="button" class="button_bg" name="Submit2" onclick="javascript:history.back(1)" value="不同意">
			       </td>  	
				</tr>
		</table>
		<div class="guide">
		         <ul>提示： <li>*&nbsp;&nbsp;前加*是必填项</li></ul>
		</div>
</form>
</div>
</body>
</html>
