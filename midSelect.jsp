<!-------------------------------------------------------------------
                          标准页面服务对象引用
--------------------------------------------------------------------->
<%@ page language="java" contentType="text/html;charset=GBK"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.bocom.midserv.gz.*"%>
<%@ page import="com.bocom.midserv.web.*"%>
<%@ page import="com.viatt.util.*"%>
<%@ page import="com.viatt.bean.*"%>
<%@ page import="java.net.*"%>
<%@ page import="java.io.*"%>

<%
	MidObjectView midObjectView = new MidObjectView();
	String up_biz_id = request.getParameter("up_biz_id")!=null?request.getParameter("up_biz_id"):"";
	if(up_biz_id.equals("")){
		up_biz_id="0";
	}
	MidSelectUtil midSelectUtil=new MidSelectUtil();
	ResultSet rs = midSelectUtil.getMidViewList(up_biz_id);

	GzLog log = new GzLog("c:/gzLog");
	String dse_sessionId = request.getParameter("dse_sessionId");//获取dse_sessionId
	
	String cdno = request.getParameter("cardNo");
	//System.out.println("卡号："+cdno);
	String loginType = request.getParameter("loginType");
	String remoteIp = request.getParameter("remoteIp");

	String s_step_id = request.getParameter("step_id");

	//测试时将canPass置0，则只有设定的测试卡(canPass==1)可以使用。
	int canPass = 1;
	log.Write("\n=================== begin ==============================");
	log.Write("select:	IP=[" + remoteIp + "] CDNO=[" + cdno
			+ "] loginType=[" + loginType + "] step_id=[" + s_step_id
			+ "]");
			
	String cssFileName = request.getParameter("cssFileName");//获取客户当前使用的CSS样式
	if(cssFileName ==null){
		cssFileName = "skin.css";
	}	
	
	
	
	
	//#############################################################
	
	boolean hasAgree =false; //hasAgree =false means the customer did not agree this noticement. hasAgree=true means the customer agreed. 
	
	//测试ICS
	String testIp="182.53.15.200";
	int testPort=35850;
	
	//生产ICS
	String businessIp="182.53.1.6";
	int businessPort=35850;
	
	String ipAddress = testIp;
	int portNum = testPort;
	
	char errorFlag;
  
		
	int crdLength = cdno.length();
	//如果卡号的长度小于21位 则需要在右侧补空格，补成21bit长
	if(crdLength<21){
		for (int i=crdLength; i<21; i++){
		 	cdno=cdno+" ";
		}
	}
	

	
	// public header of the package is 8bits prelen for the length of package data, and the 171bits basic info
	String queryHead="00000192000048217000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
	// the package data length is 21bits card number
	String queryContent = queryHead+cdno;
	int length=queryContent.length();
	
	log.Write("crdno is: "+cdno);
	log.Write("the send out package information is :["+queryContent+"]"+"\n the send out package length is: "+length);



  // Socket communication to the ics
  try{	
				BufferedReader inputStream = null; /* receive */
				PrintWriter outputStream = null; /* send */
				
				/*
				 Of course, once we opened one socket communication, we should end it while the timming is good!
				*/
				Socket soc = new Socket(ipAddress, portNum);
				inputStream = new BufferedReader(new InputStreamReader(soc.getInputStream()));
				outputStream = new PrintWriter(new BufferedWriter(new OutputStreamWriter(soc.getOutputStream())), true);
				
				//send the pacakge into ICS
				outputStream.println(queryContent);
				
				//fetch the reponse from ics
				String feedback=inputStream.readLine();
				int backLength=feedback.length();
				errorFlag=feedback.charAt(11);
				
				//Do the log
				log.Write("the feedback package info is :"+feedback+"\n the errorFlag is: "+errorFlag);		
				
				
				/*
					Be attention that the the errorFlag could be “E” which means the ICS cannot handl the corresponding transaction
					properly. Only when the errorFlag returns as "N" the ICS transaction runs correct and bring the database query result
					with the response package info.
				*/
				 
				 
				if(feedback.charAt(backLength-1)=='T')
				{
				   // this means the cardno is existed in the database table, the related customer has signed the contract!
				   hasAgree=true;	
				
				}
			 else if(feedback.charAt(backLength-1)=='F'){
			 		hasAgree=false;
			 	}
				
				log.Write("Query Result is :"+feedback.charAt(backLength-1)+"\n hasAgree is: "+hasAgree);		
				
				/*
					shut down what we opened
				*/
				inputStream.close();
				outputStream.close();
				soc.close();
			} catch (Exception e) {
					e.printStackTrace();
			}
	
%>

<!-------------------------------------------------------------------
                          标准JavaScript库引用
--------------------------------------------------------------------->
<script language="JavaScript" src="/personbank/HttpProxy?URL=/midserv/js/public.js&dse_sessionId=<%=dse_sessionId%>"></script>

<!--------------------------------------------------------------------
   当前页面JavaScript函数部分，包括提交验证，页面动作，具体目标等代码
---------------------------------------------------------------------->

<!--------------------------------------------------------------------
                          页面HTML表现部分    
---------------------------------------------------------------------->
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=GBK">
		<title>交通银行网上服务</title>
		<link rel="stylesheet" type="text/css" href="/personbank/css/<%=cssFileName%>">
		
		<script type="text/javascript">
			function agree(){
				var card="<%=cdno%>";	
				document.forms["f2"].submit();
		  }		
		</script>
		
	</head>

	<body leftmargin="0" topmargin="0" oncontextmenu=self.event.returnValue=false onselectstart="return false">
		<center>
			<div class="indent">
				<%
					if (loginType.equals("2")) {
						rs.close();
						midObjectView.releaseDBConnection();
						midSelectUtil.releaseDBConnection();
				%>
				普通用户不能使用此业务。
				<%
				} else if (canPass == 1 && hasAgree==true) {
				%>
				<table width="100%" align="center" cellpadding="1" cellspacing="1" class="tab">
					<tr align="left"> 
							<td class="tab_title">请 选 择 代 理 业 务 种 类</td>
					</tr>
				
				<form name="f1" method="post" action="/personbank/HttpProxy">
					<input type="hidden" name="dse_sessionId"	value="<%=dse_sessionId%>">
					<input type="hidden" name="URL" value="/servlet/TransServlet">
					<input type="hidden" name=biz_id value="">
					<input type="hidden" name="up_biz_id" value="">
					<input type="hidden" name=step_id value="">
					<input type="hidden" name="biz_no" value="">
					
					<%
							while (rs.next()) {
								String branch = rs.getString("branch");
								MidSelectUtil midSelectUtil1=new MidSelectUtil();
								int tmp=midSelectUtil1.isShow(cdno,branch);
								if(tmp!=0){
									continue;
								}
								int biz_id = rs.getInt("biz_id");
								String biz_no = rs.getString("biz_no");
								String web_url = rs.getString("web_url").trim();
								String biz_memo = rs.getString("biz_memo");
						%>
						<tr class="tab_tr">
							<td width="100%" align="center" class="InputTip">	
								<A
									onClick="
     this.document.f1.URL.value='<%=web_url %>';
     this.document.f1.biz_id.value='<%=biz_id %>';
     this.document.f1.up_biz_id.value='<%=biz_id %>';
     this.document.f1.step_id.value='1';
     this.document.f1.biz_no.value='<%=biz_no %>';
     this.document.f1.submit();
     return false;"  HREF="">
     							<%=biz_memo.trim() %>
								</A>
							</td>
						</tr>
						<%
							}
							rs.close();
							midObjectView.releaseDBConnection();
							midSelectUtil.releaseDBConnection();
						%>
						<tr class="tab_result">
	    				<td align="center" colspan="2">
             		<input type="button" class="button_bg" value="返 回" onClick="history.go(-2);"/>
           		</td>  	
	    			</tr>
					</table>
					<br>
				</form>
				<%@ include file="bottom.jsp"%>

				
				
				
				
				<%
				}else if (canPass == 1 && hasAgree==false){
				%>	
				<form action="/personbank/HttpProxy" method="post" name="f2" id="f2">
					
					<input type="hidden" name="dse_sessionId"	value="<%=dse_sessionId%>">
					<input type="hidden" name="biz_id" value="">
					<input type="hidden" name="up_biz_id" value="">
					<input type="hidden" name="step_id" value="1">
					<input type="hidden" name="biz_no" value="">
					<input type="hidden" name="URL" value="/midserv/midSelect2.jsp">
		            <input type="hidden" name=cdno value="<%=cdno %>">
					<table id="table2" width="100%" align="center" cellpadding="1" cellspacing="1" class="tab">
						<tr align="center"> 
								<td class="tab_title">客 户 协 议 <br><br></td>
						</tr>
						<br>
                        <tr class="tab_result">
                            <td align="left">
                                                        您好！欢迎使用广东省分行缴费充值业务.<br><br>
							您在交通银行电子渠道（含个人网银、手机银行、自助通）进行充值、缴费业务时，将会实时把您充值所需的基本资料：含缴费银行卡号、充值金额、手机号码、订单号等，发送至业务所对应的合作商家<br>
							(目前合作商含广东移动、广东电信、银旅通有限公司、天翼电子商务有限公司、羊城通有限公司、广东省福彩中心、智益电子商务有限公司、广州市电力局等)。<br><br>
							因业务发展需要，我行将对上述合作商家进行调整（含新增和减少）不再另行通知，以上如有疑问可电询95559。<br>
						     </td>  	
	  		           </tr>
                       <tr class="tab_result">
                             <td align="center" colspan="2">
								 <input type="button"  class="button_bg" name="disagree" align="middle"  value="不同意" onclick="javascript:history.go(-2)"/> 
								 <input type="button"  class="button_bg" name="accepted" align="middle"  value="同意" onclick="agree()"/> 
								 <br>
								 <br>
						     </td>  	
	  		          </tr>
                   </table>
                </form>
							
				
				<%
						} else if(canPass!=1){
						rs.close();
						midObjectView.releaseDBConnection();
						midSelectUtil.releaseDBConnection();
				%>
				系统维护中...
				<%
				}
				%>
		</center>
	</body>
</html>
