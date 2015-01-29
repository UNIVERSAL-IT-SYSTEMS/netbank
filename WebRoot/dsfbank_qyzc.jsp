<!--标准页面服务对象引用-->
<%@ page language="java" contentType="text/html;charset=GBK" %>
<%@ page import="com.viatt.util.*"%>
<%@ page import="java.util.*" %>
<%@ page import="com.gdbocom.util.communication.*" %>
<%@ page import="com.gdbocom.util.format.*" %>
<%@ include file="IPconinf.inc" %>
<%
	  //静止后退功能防止页面重复提交  【每个页面都需要添加】
 	  response.setHeader("Pragma", "no-cache"); 
	  response.setHeader("Cache-Control", "no-store"); 
	  response.setDateHeader("Expires", -1); 
	  
      //获取登陆类型
      String loginType=request.getParameter("loginType");
   	  loginType="1";
   	  //获取dse_sessionId
   	  String dse_sessionId = request.getParameter("dse_sessionId");
   	  //获取客户当前使用的CSS样式
   	  String cssFileName =request.getParameter("cssFileName");
	  if(cssFileName ==null){
		
		  cssFileName = "skin.css";
	   }
   	  
   	  //根据分类 获取地区信息  
   	  String BUSCLA =request.getParameter("buscla");
   	  //客户号 
   	  String CLI_IDENTITY_CARD =request.getParameter("CLI_IDENTITY_CARD");
   	 // BUSCLA ="05";
	  pageContext.setAttribute("BUSCLA", BUSCLA, PageContext.SESSION_SCOPE);
	  Map responseValues = new HashMap();
	  responseValues.putAll(Transation.createMapSend(pageContext,"466670","@SGD_A",TransationFactory.SGD466670));

%>
<!-------------------------------------------------------------------
                          标准JavaScript库引用
--------------------------------------------------------------------->
<script language="JavaScript" src="/personbank/HttpProxy?URL=/midserv/js/public.js&dse_sessionId=<%=dse_sessionId%>"></script>
<script language="JavaScript" src="/personbank/HttpProxy?URL=/midserv/js/public_card.js&dse_sessionId=<%=dse_sessionId%>"></script>
 <script language="javascript" type="text/javascript">
  var xmlHttp;
  function createXMLHttpRequest()
  {
     if(window.ActiveXObject)
     {
        xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
     }
     else if(window.XMLHttpRequest)
     {
        xmlHttp=new XMLHttpRequest();
     }
  }
  function select_change(area)
  {
     var areanum=area.value;
     var buscla = "<%=BUSCLA %>";
     if(areanum!="null"&&areanum!=""&&areanum!=null){
          createXMLHttpRequest();
           var url="/personbank/HttpProxy?URL=/midserv/deal.jsp&dse_sessionId=<%=dse_sessionId%>&areanum="+areanum+"&buscla="+buscla+"&JYFLG=1";
          //var url ="deal.jsp?areanum="+areanum;
          xmlHttp.open("GET",url,true);
          xmlHttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
          xmlHttp.onreadystatechange=showMember;
          xmlHttp.send(null);
          }
  }
   function select_change_qy(qy)
  {
	 var qye = qy.value;
     var  areanum=document.form1["areanum"].value;
     var buscla = "<%=BUSCLA %>";
     if(areanum!="null"&&qye!="null"&&areanum!=""&&qye!=""&&areanum!=null&&qye!=null){
          createXMLHttpRequest();
           var url="/personbank/HttpProxy?URL=/midserv/deal.jsp&dse_sessionId=<%=dse_sessionId%>&areanum="+areanum+"&buscla="+buscla+"&qy="+qye+"&JYFLG=1";
          //var url ="deal.jsp?areanum="+areanum;
          xmlHttp.open("GET",url,true);
          xmlHttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
          xmlHttp.onreadystatechange=showMember_qy;
          xmlHttp.send(null);
          }
  }
   
   function showMember_qy()
   { 
	     if(xmlHttp.readyState==4)
	     {
	        if(xmlHttp.status==200)
	        { 	
	           var membersData=xmlHttp.responseText;
	           
	           var  membersSelect=document.form1["zl"];
	           membersSelect.options.length=0;
	           var strs = new Array();
	           strs = membersData.split(",");
	           for(var i=1;i<strs.length;i++)
	           {
	             membersSelect.options[i-1] = new Option(strs[i],strs[i]);
	            }
	        }
	        
	     }
   }
  function showMember()
  { 
     if(xmlHttp.readyState==4)
     {
        if(xmlHttp.status==200)
        { 	
           var membersData=xmlHttp.responseText;
           
           var membersSelect=document.form1["qy"];
           membersSelect.options.length=0;
           var strs = new Array();
           strs = membersData.split(",");
           for(var i=1;i<strs.length;i++)
           {
             membersSelect.options[i-1] = new Option(strs[i],strs[i]);
            }
        }
        
     }
  }
  
  function condition_tcusid(){
  	 
           		if(document.form1["areanum"].value=="null"||document.form1["areanum"].value==""){
           		
           			alert("请选择地区");
           			return false;
           		}
           		if(document.form1["qy"].value=="null"||document.form1["qy"].value==""){
           		
           			alert("请选择收费企业");
           			return false;	
           		}
           		if(document.form1["CLI_TRADE_IDENT"].value=="null"||document.form1["CLI_TRADE_IDENT"].value==""){
           		
           			alert("请输入缴费标识");
           			return false;
           		}
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
		<input type="hidden" name="URL" value="/midserv/dsfbank_qyzc1.jsp">
		<input type="hidden" name="BUSCLA" value="<%=BUSCLA %>">
		<input type="hidden" name="CLI_IDENTITY_CARD" value="<%=CLI_IDENTITY_CARD %>">
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
	     		<tr align="left"> 
			          <td  colspan= "2" class="tab_title">请选择地区及收费企业：</td>
			    </tr>
		
   				<%
		  			if(responseValues.get("MsgTyp").equals("N")){
		  		 %>
		  		 	    <tr>
		   			   		<td width=8888888"30%" align="left" class="tab_th">
		   			   		客户证件号：
		   			   		</td>
		   			   		<td width="60%" align="left"  class="tab_tr">
								<%=CLI_IDENTITY_CARD %>
							</td>
						</tr>
  						<tr>
				  			<td width="30%" align="left" class="tab_th"> 区域:</td>
						  	<td width="60%" align="left"  class="tab_tr">
						  		
							      <select name="areanum" onChange="select_change(this)">
								      <option value="null">----请选择----</option>
								   	  <%
										List loopBody = (List)responseValues.get("LoopBody");
								        String keyOrder[] = new String[]{"CODE"};
								    	//设置需要显示的值的类型
								    	Map keyType = new HashMap();
								        for(int recordIndex=0; recordIndex<loopBody.size(); recordIndex++){
								        		Map oneRecord = (Map)loopBody.get(recordIndex);
								        		for(int keyIndex=0; keyIndex<1; keyIndex++){
								        			String key = keyOrder[keyIndex];
								        			//使用的格式化对象，类似 WelFormatter.getSingleton(WelFormatter.BETNUM)
								        			FormatterInterface type = (FormatterInterface)keyType.get(key);
								        			//为格式化的值
								        			String originValue = (String)oneRecord.get(key);
								        			%>
								        			    <option value="<%=originValue.trim() %>"><%=originValue.substring(2).trim() %></option>
								        			<%
								        		}
								        }
										%>
				   			      </select>
				   		 </td>
		   	   		</tr>
		       		<tr>
		   			   		<td width="30%" align="left" class="tab_th">
		   			   		收费企业:
		   			   		</td>
		   			   		<td width="60%" align="left"  class="tab_tr">
									<select id="qy" name ="qy" onChange="select_change_qy(this)" onblur="select_change_qy(this)"> 
											<option value="null">----请选择----</option>
										</select>
							</td>
				   </tr>
				   <tr>
		   			   		<td width="30%" align="left" class="tab_th">
		   			   		业务种类:
		   			   		</td>
		   			   		<td width="60%" align="left"  class="tab_tr">
								<select id="zl" name ="zl">
										<option value="null">----请选择----</option>
									</select>
							</td>
				   </tr>
				<tr>
		   			   		<td width="30%" align="left" class="tab_th">
								缴费标识:
							</td>
							<td width="60%" align="left"  class="tab_tr">
								<input type="text" name="CLI_TRADE_IDENT" value="" >
								 			   
				  			</td>
  				</tr>
			    <tr class="tab_result">
				   <td align="center" colspan="2">
					  <input type="submit" class="button_bg" name="Submit" value="下一步">
			          <input type="button" class="button_bg" name="Submit2" onclick="javascript:history.back(1)" value="返回">
			       </td>  	
				</tr>
				<%}else{ %>
				<tr>
					<td colspan="4" align="center"><label><%=responseValues.get("RspMsg") %></label></td>
				</tr>
				 <tr class="tab_result">
				   <td align="center" colspan="2">
			          <input type="button" class="button_bg" name="Submit2" onclick="javascript:history.back(1)" value="返回">
			       </td>  	
				</tr>
				<%} %>	  
		</table>
		<div class="guide">
		         <ul>提示： <li>*&nbsp;&nbsp;请先选择区域</li></ul>
		</div>
</form>
</div>
</body>
</html>
