<!--标准页面服务对象引用-->
<%@ page language="java" contentType="text/html;charset=GBK" %>
<%@ page import="com.viatt.util.*"%>
<%@ page import="java.util.*" %>
<%@ page import="com.gdbocom.util.communication.*" %>
<%@ page import="com.gdbocom.util.format.*" %>
<%@ include file="IPconinf.inc" %>
<%
	  //静止后退功能防止页面重复提交 【每个页面都需要添加】
 	  response.setHeader("Pragma", "no-cache"); 
	  response.setHeader("Cache-Control", "no-store"); 
	  response.setDateHeader("Expires", -1); 
	  
      //获取登陆类型
      String loginType=request.getParameter("loginType");
   	  loginType="1";
   	  
   	  if (Double.parseDouble(loginType)==2){
		response.sendRedirect("errorlogintype.jsp");
		return;
	  }
   	  //根据分类 获取地区信息  
   	  String BUSCLA = request.getParameter("buscla");
   	 // BUSCLA ="05";
	  pageContext.setAttribute("BUSCLA", BUSCLA, PageContext.SESSION_SCOPE);
	  Map responseValues = new HashMap();
	  responseValues.putAll(Transation.createMapSend(pageContext,"466670","@SGD_A",TransationFactory.SGD466670));
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
     if(areanum!=null){
          createXMLHttpRequest();
           var url="/personbank/HttpProxy?URL=/midserv/deal.jsp&dse_sessionId=<%=dse_sessionId%>&areanum="+areanum+"&JYFLG=1";
          //var url ="deal.jsp?areanum="+areanum;
          xmlHttp.open("GET",url,true);
          xmlHttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
          xmlHttp.onreadystatechange=showMember;
          xmlHttp.send(null);
          }
  }
  function showMember()
  { 
     if(xmlHttp.readyState==4)
     {
        if(xmlHttp.status==200)
        { 	
           var membersData=xmlHttp.responseText;
           var membersSelect;
           var qy ="<%=BUSCLA %>";
           //根据分类来划分是哪个from
           if(qy=="01"){
           
           		membersSelect=document.form1["qy"];
           }
           if(qy=="02"){
           
           		membersSelect=document.form2["qy"];
           }
           if(qy=="03"){
           
           		membersSelect=document.form3["qy"];
           }
           if(qy=="04"){
           
           		membersSelect=document.form4["qy"];
           }
           if(qy=="05"){
           
           		membersSelect=document.form5["qy"];
           }
           if(qy=="06"){
           		membersSelect=document.form6["qy"];
           }
           if(qy=="07"){
           
           		membersSelect=document.form7["qy"];
           }
           if(qy=="08"){
           
           		membersSelect=document.form8["qy"];
           }
           if(qy=="09"){
           
           		membersSelect=document.form9["qy"];
           }
           var strs = new Array();
           strs = membersData.split(",");
           for(var i=0;i<strs.length;i++)
           {
             membersSelect.options[i] = new Option(strs[i],strs[i]);
            }
        }
        
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
<!-- ============================================================ 分类分界线  01============================================================ -->
<%
if(BUSCLA.equals("01")){
%>
<form action="/personbank/HttpProxy" method=post name="form1" onsubmit="return condition_tcusid();">
		<input type="hidden" name="dse_sessionId" value="<%=dse_sessionId%>">
		<input type="hidden" name="URL" value="/midserv/dsfbank_sw1.jsp">
		<%
		//sendPass标志 是否发送验证码 1发送 （loginType=0注册用户时需要 ）
		if (Double.parseDouble(request.getParameter("loginType"))==0){	
		%>
				<input type="hidden" name="sendPass" value="1">
		<%	}
		if (Double.parseDouble(request.getParameter("loginType"))==1){%>
				<input type="hidden" name="sendPass" value="0">
		<%	}%>
	    <table cellpadding="1" cellspacing="1" class="tab" width="100%" class="tab" >
        		<tr align="left" collspan="2"> 
          			<td class="tab_title" >请选择地区及收费企业：</td>
    			</tr>
  				<tr>
				  	<td collspan="2" style="font-size: 10pt">
				  		<%
				  			if(responseValues.get("MsgTyp").equals("N")){
				  		 %>
				  		 区域:
					      <select name="areanum" onChange="select_change(this)">
					      <option value="null">----请选择----</option>
					   	  <%
							List loopBody = (List)responseValues.get("LoopBody");
					        String keyOrder[] = new String[]{"CODE"};
					    	//设置需要显示的值的类型
					    	Map keyType = new HashMap();
					    	keyType.put("BetLin", WelFormatter.getSingleton(WelFormatter.BETNUM));
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
							收费企业:<select id="qy" width="20">
										<option value="null">----请选择----</option>
									</select>
							业务种类:<select id="zl" width="20">
										<option value="null">----请选择----</option>
									</select>
							<br/>
							缴费标识:<input type="text" name="FUNFLG" style="-wap-input-format: 'Y'; -wap-input-required: 'true'" >
							<%}else{ %>
								<label><%=responseValues.get("RspMsg") %></label>
							<%} %>	   			   
				  	</td>
  				</tr>
			    <tr class="tab_result">
				   <td align="center" colspan="2">
					  <input type="submit" class="button_bg" name="Submit" value="提交">
			          <input type="button" class="button_bg" name="Submit2" onclick="javascript:history.back(1)" value="返回">
			       </td>  	
				</tr>
		</table>
		<div class="guide">
		         <ul>提示： <li>*&nbsp;&nbsp;请先选择区域</li></ul>
		</div>
</form>
<%
}
%>
<!-- ============================================================ 分类分界线  02============================================================ -->
<%
if(BUSCLA.equals("02")){
%>
<form action="/personbank/HttpProxy" method=post name="form2" onsubmit="return condition_tcusid();">
		<input type="hidden" name="dse_sessionId" value="<%=dse_sessionId%>">
		<input type="hidden" name="URL" value="/midserv/dsfbank_sw1.jsp">
		<%
		//sendPass标志 是否发送验证码 1发送 （loginType=0注册用户时需要 ）
		if (Double.parseDouble(request.getParameter("loginType"))==0){	
		%>
				<input type="hidden" name="sendPass" value="1">
		<%	}
		if (Double.parseDouble(request.getParameter("loginType"))==1){%>
				<input type="hidden" name="sendPass" value="0">
		<%	}%>
	    <table cellpadding="1" cellspacing="1" class="tab" width="100%" class="tab" >
        		<tr align="left" collspan="2"> 
          			<td class="tab_title" >请选择地区及收费企业：</td>
    			</tr>
  				<tr>
				  	<td collspan="2" style="font-size: 10pt">
				  		<%
				  			if(responseValues.get("MsgTyp").equals("N")){
				  		 %>
				  		 区域:
					      <select name="areanum" onChange="select_change(this)">
					      <option value="null">----请选择----</option>
					   	  <%
							List loopBody = (List)responseValues.get("LoopBody");
					        String keyOrder[] = new String[]{"CODE"};
					    	//设置需要显示的值的类型
					    	Map keyType = new HashMap();
					    	keyType.put("BetLin", WelFormatter.getSingleton(WelFormatter.BETNUM));
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
							收费企业:<select id="qy" width="20">
										<option value="null">----请选择----</option>
									</select>
							业务种类:<select id="zl" width="20">
										<option value="null">----请选择----</option>
									</select>
							<br/>
							缴费标识:<input type="text" name="FUNFLG" style="-wap-input-format: 'Y'; -wap-input-required: 'true'" >
							<%}else{ %>
								<label><%=responseValues.get("RspMsg") %></label>
							<%} %>	   			   
				  	</td>
  				</tr>
			    <tr class="tab_result">
				   <td align="center" colspan="2">
					  <input type="submit" class="button_bg" name="Submit" value="提交">
			          <input type="button" class="button_bg" name="Submit2" onclick="javascript:history.back(1)" value="返回">
			       </td>  	
				</tr>
		</table>
		<div class="guide">
		         <ul>提示： <li>*&nbsp;&nbsp;请先选择区域</li></ul>
		</div>
</form>
<%
}
%>
<!-- ============================================================ 分类分界线  03============================================================ -->
<%
if(BUSCLA.equals("03")){
%>
<form action="/personbank/HttpProxy" method=post name="form3" onsubmit="return condition_tcusid();">
		<input type="hidden" name="dse_sessionId" value="<%=dse_sessionId%>">
		<input type="hidden" name="URL" value="/midserv/dsfbank_sw1.jsp">
		<%
		//sendPass标志 是否发送验证码 1发送 （loginType=0注册用户时需要 ）
		if (Double.parseDouble(request.getParameter("loginType"))==0){	
		%>
				<input type="hidden" name="sendPass" value="1">
		<%	}
		if (Double.parseDouble(request.getParameter("loginType"))==1){%>
				<input type="hidden" name="sendPass" value="0">
		<%	}%>
	    <table cellpadding="1" cellspacing="1" class="tab" width="100%" class="tab" >
        		<tr align="left" collspan="2"> 
          			<td class="tab_title" >请选择地区及收费企业：</td>
    			</tr>
  				<tr>
				  	<td collspan="2" style="font-size: 10pt">
				  		<%
				  			if(responseValues.get("MsgTyp").equals("N")){
				  		 %>
				  		 区域:
					      <select name="areanum" onChange="select_change(this)">
					      <option value="null">----请选择----</option>
					   	  <%
							List loopBody = (List)responseValues.get("LoopBody");
					        String keyOrder[] = new String[]{"CODE"};
					    	//设置需要显示的值的类型
					    	Map keyType = new HashMap();
					    	keyType.put("BetLin", WelFormatter.getSingleton(WelFormatter.BETNUM));
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
							收费企业:<select id="qy" width="20">
										<option  value="null">----请选择----</option>
									</select>
							业务种类:<select id="zl" width="20">
										<option value="null">----请选择----</option>
									</select>
							<br/>
							缴费标识:<input type="text" name="FUNFLG" style="-wap-input-format: 'Y'; -wap-input-required: 'true'" >
							<%}else{ %>
								<label><%=responseValues.get("RspMsg") %></label>
							<%} %>	   			   
				  	</td>
  				</tr>
			    <tr class="tab_result">
				   <td align="center" colspan="2">
					  <input type="submit" class="button_bg" name="Submit" value="提交">
			          <input type="button" class="button_bg" name="Submit2" onclick="javascript:history.back(1)" value="返回">
			       </td>  	
				</tr>
		</table>
		<div class="guide">
		         <ul>提示： <li>*&nbsp;&nbsp;请先选择区域</li></ul>
		</div>
</form>
<%
}
%>
<!-- ============================================================ 分类分界线  04============================================================ -->
<%
if(BUSCLA.equals("04")){
%>
<form action="/personbank/HttpProxy" method=post name="form4" onsubmit="return condition_tcusid();">
		<input type="hidden" name="dse_sessionId" value="<%=dse_sessionId%>">
		<input type="hidden" name="URL" value="/midserv/dsfbank_sw1.jsp">
		<%
		//sendPass标志 是否发送验证码 1发送 （loginType=0注册用户时需要 ）
		if (Double.parseDouble(request.getParameter("loginType"))==0){	
		%>
				<input type="hidden" name="sendPass" value="1">
		<%	}
		if (Double.parseDouble(request.getParameter("loginType"))==1){%>
				<input type="hidden" name="sendPass" value="0">
		<%	}%>
	    <table cellpadding="1" cellspacing="1" class="tab" width="100%" class="tab" >
        		<tr align="left" collspan="2"> 
          			<td class="tab_title" >请选择地区及收费企业：</td>
    			</tr>
  				<tr>
				  	<td collspan="2" style="font-size: 10pt">
				  		<%
				  			if(responseValues.get("MsgTyp").equals("N")){
				  		 %>
				  		 区域:
					      <select name="areanum" onChange="select_change(this)">
					      <option value="null">----请选择----</option>
					   	  <%
							List loopBody = (List)responseValues.get("LoopBody");
					        String keyOrder[] = new String[]{"CODE"};
					    	//设置需要显示的值的类型
					    	Map keyType = new HashMap();
					    	keyType.put("BetLin", WelFormatter.getSingleton(WelFormatter.BETNUM));
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
							收费企业:<select id="qy" width="20">
										<option value="null">----请选择----</option>
									</select>
							业务种类:<select id="zl" width="20">
										<option value="null">----请选择----</option>
									</select>
							<br/>
							缴费标识:<input type="text" name="FUNFLG" style="-wap-input-format: 'Y'; -wap-input-required: 'true'" >
							<%}else{ %>
								<label><%=responseValues.get("RspMsg") %></label>
							<%} %>	   			   
				  	</td>
  				</tr>
			    <tr class="tab_result">
				   <td align="center" colspan="2">
					  <input type="submit" class="button_bg" name="Submit" value="提交">
			          <input type="button" class="button_bg" name="Submit2" onclick="javascript:history.back(1)" value="返回">
			       </td>  	
				</tr>
		</table>
		<div class="guide">
		         <ul>提示： <li>*&nbsp;&nbsp;请先选择区域</li></ul>
		</div>
</form>
<%
}
%>
<!-- ============================================================ 分类分界线  05============================================================ -->
<%
if(BUSCLA.equals("05")){
%>
<form action="/personbank/HttpProxy" method=post name="form5" onsubmit="return condition_tcusid();">
		<input type="hidden" name="dse_sessionId" value="<%=dse_sessionId%>">
		<input type="hidden" name="URL" value="/midserv/dsfbank_sw1.jsp">
		<%
		//sendPass标志 是否发送验证码 1发送 （loginType=0注册用户时需要 ）
		if (Double.parseDouble(request.getParameter("loginType"))==0){	
		%>
				<input type="hidden" name="sendPass" value="1">
		<%	}
		if (Double.parseDouble(request.getParameter("loginType"))==1){%>
				<input type="hidden" name="sendPass" value="0">
		<%	}%>
	    <table cellpadding="1" cellspacing="1" class="tab" width="100%" class="tab" >
        		<tr align="left" collspan="2"> 
          			<td class="tab_title" >请选择地区及收费企业：</td>
    			</tr>
  				<tr>
				  	<td collspan="2" style="font-size: 10pt">
				  		<%
				  			if(responseValues.get("MsgTyp").equals("N")){
				  		 %>
				  		 区域:
					      <select name="areanum" onChange="select_change(this)">
					      <option value="null">----请选择----</option>
					   	  <%
							List loopBody = (List)responseValues.get("LoopBody");
					        String keyOrder[] = new String[]{"CODE"};
					    	//设置需要显示的值的类型
					    	Map keyType = new HashMap();
					    	keyType.put("BetLin", WelFormatter.getSingleton(WelFormatter.BETNUM));
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
							收费企业:<select id="qy" width="20">
										<option value="null">----请选择----</option>
									</select>
							业务种类:<select id="zl" width="20">
										<option value="null">----请选择----</option>
									</select>
							<br/>
							缴费标识:<input type="text" name="FUNFLG" style="-wap-input-format: 'Y'; -wap-input-required: 'true'" >
							<%}else{ %>
								<label><%=responseValues.get("RspMsg") %></label>
							<%} %>	   			   
				  	</td>
  				</tr>
			    <tr class="tab_result">
				   <td align="center" colspan="2">
					  <input type="submit" class="button_bg" name="Submit" value="提交">
			          <input type="button" class="button_bg" name="Submit2" onclick="javascript:history.back(1)" value="返回">
			       </td>  	
				</tr>
		</table>
		<div class="guide">
		         <ul>提示： <li>*&nbsp;&nbsp;请先选择区域</li></ul>
		</div>
</form>
<%
}
%>
<!-- ============================================================ 分类分界线  06============================================================ -->
<%
if(BUSCLA.equals("06")){
%>
<form action="/personbank/HttpProxy" method=post name="form6" onsubmit="return condition_tcusid();">
		<input type="hidden" name="dse_sessionId" value="<%=dse_sessionId%>">
		<input type="hidden" name="URL" value="/midserv/dsfbank_sw1.jsp">
		<%
		//sendPass标志 是否发送验证码 1发送 （loginType=0注册用户时需要 ）
		if (Double.parseDouble(request.getParameter("loginType"))==0){	
		%>
				<input type="hidden" name="sendPass" value="1">
		<%	}
		if (Double.parseDouble(request.getParameter("loginType"))==1){%>
				<input type="hidden" name="sendPass" value="0">
		<%	}%>
	    <table cellpadding="1" cellspacing="1" class="tab" width="100%" class="tab" >
        		<tr align="left" collspan="2"> 
          			<td class="tab_title" >请选择地区及收费企业：</td>
    			</tr>
  				<tr>
				  	<td collspan="2" style="font-size: 10pt">
				  		<%
				  			if(responseValues.get("MsgTyp").equals("N")){
				  		 %>
				  		 区域:
					      <select name="areanum" onChange="select_change(this)">
					      <option value="null">----请选择----</option>
					   	  <%
							List loopBody = (List)responseValues.get("LoopBody");
					        String keyOrder[] = new String[]{"CODE"};
					    	//设置需要显示的值的类型
					    	Map keyType = new HashMap();
					    	keyType.put("BetLin", WelFormatter.getSingleton(WelFormatter.BETNUM));
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
							收费企业:<select id="qy" width="20">
										<option value="null">----请选择----</option>
									</select>
							业务种类:<select id="zl" width="20">
										<option value="null">----请选择----</option>
									</select>
							<br/>
							缴费标识:<input type="text" name="FUNFLG" style="-wap-input-format: 'Y'; -wap-input-required: 'true'" >
							<%}else{ %>
								<label><%=responseValues.get("RspMsg") %></label>
							<%} %>	   			   
				  	</td>
  				</tr>
			    <tr class="tab_result">
				   <td align="center" colspan="2">
					  <input type="submit" class="button_bg" name="Submit" value="提交">
			          <input type="button" class="button_bg" name="Submit2" onclick="javascript:history.back(1)" value="返回">
			       </td>  	
				</tr>
		</table>
		<div class="guide">
		         <ul>提示： <li>*&nbsp;&nbsp;请先选择区域</li></ul>
		</div>
</form>
<%
}
%>	
<!-- ============================================================ 分类分界线  07============================================================ -->
<%
if(BUSCLA.equals("07")){
%>
<form action="/personbank/HttpProxy" method=post name="form7" onsubmit="return condition_tcusid();">
		<input type="hidden" name="dse_sessionId" value="<%=dse_sessionId%>">
		<input type="hidden" name="URL" value="/midserv/dsfbank_sw1.jsp">
		<%
		//sendPass标志 是否发送验证码 1发送 （loginType=0注册用户时需要 ）
		if (Double.parseDouble(request.getParameter("loginType"))==0){	
		%>
				<input type="hidden" name="sendPass" value="1">
		<%	}
		if (Double.parseDouble(request.getParameter("loginType"))==1){%>
				<input type="hidden" name="sendPass" value="0">
		<%	}%>
	    <table cellpadding="1" cellspacing="1" class="tab" width="100%" class="tab" >
        		<tr align="left" collspan="2"> 
          			<td class="tab_title" >请选择地区及收费企业：</td>
    			</tr>
  				<tr>
				  	<td collspan="2" style="font-size: 10pt">
				  		<%
				  			if(responseValues.get("MsgTyp").equals("N")){
				  		 %>
				  		 区域:
					      <select name="areanum" onChange="select_change(this)">
					      <option value="null">----请选择----</option>
					   	  <%
							List loopBody = (List)responseValues.get("LoopBody");
					        String keyOrder[] = new String[]{"CODE"};
					    	//设置需要显示的值的类型
					    	Map keyType = new HashMap();
					    	keyType.put("BetLin", WelFormatter.getSingleton(WelFormatter.BETNUM));
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
							收费企业:<select id="qy" width="20">
										<option value="null">----请选择----</option>
									</select>
							业务种类:<select id="zl" width="20">
										<option value="null">----请选择----</option>
									</select>
							<br/>
							缴费标识:<input type="text" name="FUNFLG" style="-wap-input-format: 'Y'; -wap-input-required: 'true'" >
							<%}else{ %>
								<label><%=responseValues.get("RspMsg") %></label>
							<%} %>	   			   
				  	</td>
  				</tr>
			    <tr class="tab_result">
				   <td align="center" colspan="2">
					  <input type="submit" class="button_bg" name="Submit" value="提交">
			          <input type="button" class="button_bg" name="Submit2" onclick="javascript:history.back(1)" value="返回">
			       </td>  	
				</tr>
		</table>
		<div class="guide">
		         <ul>提示： <li>*&nbsp;&nbsp;请先选择区域</li></ul>
		</div>
</form>
<%
}
%>	
<!-- ============================================================ 分类分界线  08============================================================ -->
<%
if(BUSCLA.equals("08")){
%>
<form action="/personbank/HttpProxy" method=post name="form8" onsubmit="return condition_tcusid();">
		<input type="hidden" name="dse_sessionId" value="<%=dse_sessionId%>">
		<input type="hidden" name="URL" value="/midserv/dsfbank_sw1.jsp">
		<%
		//sendPass标志 是否发送验证码 1发送 （loginType=0注册用户时需要 ）
		if (Double.parseDouble(request.getParameter("loginType"))==0){	
		%>
				<input type="hidden" name="sendPass" value="1">
		<%	}
		if (Double.parseDouble(request.getParameter("loginType"))==1){%>
				<input type="hidden" name="sendPass" value="0">
		<%	}%>
	    <table cellpadding="1" cellspacing="1" class="tab" width="100%" class="tab" >
        		<tr align="left" collspan="2"> 
          			<td class="tab_title" >请选择地区及收费企业：</td>
    			</tr>
  				<tr>
				  	<td collspan="2" style="font-size: 10pt">
				  		<%
				  			if(responseValues.get("MsgTyp").equals("N")){
				  		 %>
				  		 区域:
					      <select name="areanum" onChange="select_change(this)">
					      <option value="null">----请选择----</option>
					   	  <%
							List loopBody = (List)responseValues.get("LoopBody");
					        String keyOrder[] = new String[]{"CODE"};
					    	//设置需要显示的值的类型
					    	Map keyType = new HashMap();
					    	keyType.put("BetLin", WelFormatter.getSingleton(WelFormatter.BETNUM));
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
							收费企业:<select id="qy" width="20">
										<option value="null">----请选择----</option>
									</select>
							业务种类:<select id="zl" width="20">
										<option value="null">----请选择----</option>
									</select>
							<br/>
							缴费标识:<input type="text" name="FUNFLG" style="-wap-input-format: 'Y'; -wap-input-required: 'true'" >
							<%}else{ %>
								<label><%=responseValues.get("RspMsg") %></label>
							<%} %>	   			   
				  	</td>
  				</tr>
			    <tr class="tab_result">
				   <td align="center" colspan="2">
					  <input type="submit" class="button_bg" name="Submit" value="提交">
			          <input type="button" class="button_bg" name="Submit2" onclick="javascript:history.back(1)" value="返回">
			       </td>  	
				</tr>
		</table>
		<div class="guide">
		         <ul>提示： <li>*&nbsp;&nbsp;请先选择区域</li></ul>
		</div>
</form>
<%
}
%>	
<!-- ============================================================ 分类分界线  09============================================================ -->
<%
if(BUSCLA.equals("09")){
%>
<form action="/personbank/HttpProxy" method=post name="form9" onsubmit="return condition_tcusid();">
		<input type="hidden" name="dse_sessionId" value="<%=dse_sessionId%>">
		<input type="hidden" name="URL" value="/midserv/dsfbank_sw1.jsp">
		<%
		//sendPass标志 是否发送验证码 1发送 （loginType=0注册用户时需要 ）
		if (Double.parseDouble(request.getParameter("loginType"))==0){	
		%>
				<input type="hidden" name="sendPass" value="1">
		<%	}
		if (Double.parseDouble(request.getParameter("loginType"))==1){%>
				<input type="hidden" name="sendPass" value="0">
		<%	}%>
	    <table cellpadding="1" cellspacing="1" class="tab" width="100%" class="tab" >
        		<tr align="left" collspan="2"> 
          			<td class="tab_title" >请选择地区及收费企业：</td>
    			</tr>
  				<tr>
				  	<td collspan="2" style="font-size: 10pt">
				  		<%
				  			if(responseValues.get("MsgTyp").equals("N")){
				  		 %>
				  		 区域:
					      <select name="areanum" onChange="select_change(this)">
					      <option value="null">----请选择----</option>
					   	  <%
							List loopBody = (List)responseValues.get("LoopBody");
					        String keyOrder[] = new String[]{"CODE"};
					    	//设置需要显示的值的类型
					    	Map keyType = new HashMap();
					    	keyType.put("BetLin", WelFormatter.getSingleton(WelFormatter.BETNUM));
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
							收费企业:<select id="qy" width="20">
										<option value="null">----请选择----</option>
									</select>
							业务种类:<select id="zl" width="20">
										<option value="null">----请选择----</option>
									</select>
							<br/>
							缴费标识:<input type="text" name="FUNFLG" style="-wap-input-format: 'Y'; -wap-input-required: 'true'" >
							<%}else{ %>
								<label><%=responseValues.get("RspMsg") %></label>
							<%} %>	   			   
				  	</td>
  				</tr>
			    <tr class="tab_result">
				   <td align="center" colspan="2">
					  <input type="submit" class="button_bg" name="Submit" value="提交">
			          <input type="button" class="button_bg" name="Submit2" onclick="javascript:history.back(1)" value="返回">
			       </td>  	
				</tr>
		</table>
		<div class="guide">
		         <ul>提示： <li>*&nbsp;&nbsp;请先选择区域</li></ul>
		</div>
</form>
<%
}
%>	
</div>
</body>
</html>
