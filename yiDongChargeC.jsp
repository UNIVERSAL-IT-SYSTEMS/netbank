<%@ page language="java"  pageEncoding="gbk"%>
<%@ page import="com.bocom.midserv.gz.*"%>
<%@ page import="java.util.Date" %>
<%@ page import="com.viatt.bean.*"%>
<%@ page import="com.viatt.util.*" %>
<%
	String dse_sessionId = MessManTool.changeChar(request.getParameter("dse_sessionId"));//��ȡdse_sessionId	
	GzLog log = new GzLog("c:/gzLog");
	log.Write("###########��Լ ���ղ������ ���Խ���########yiDongChargeC.jsp######begins");
	String biz_id = MessManTool.changeChar(request.getParameter("biz_id"));
	String step_id = MessManTool.changeChar(request.getParameter("step_id"));
	String cdno = MessManTool.changeChar(request.getParameter("cardNo"));
	
	String loginType = request.getParameter("loginType");//���͵�½��� 0��ע���û�(�ֻ���) 1��֤���û� 2�������û�
	String dynamicCodeMan="";
	String dynamicCodeSeqMan="";
	String dynamicCode="";
	String dynamicCodeSeq="";
	
	if(loginType.equals("0")){
		dynamicCode=MessManTool.changeChar(request.getParameter("dynamicCode"));
		dynamicCodeSeq=MessManTool.changeChar(request.getParameter("dynamicCodeSeq"));
		
		dynamicCodeMan=MessManTool.changeChar(request.getParameter("dynamicCodeMan"));
		dynamicCodeSeqMan=MessManTool.changeChar(request.getParameter("dynamicCodeSeqMan"));
		
		log.Write("��ʾ�Ķ�̬���룺"+dynamicCodeMan+" ϵͳ�Ķ�̬����: "+dynamicCode+" ��ʾ�Ķ�̬�������: "+dynamicCodeSeqMan+" ϵͳ�Ķ�̬������ţ�"+dynamicCodeSeq);
		
		if(!dynamicCodeMan.equals(dynamicCode)){
			System.out.println("��̬�������");
			log.Write("��̬�������");
			AppParam.setParam(dse_sessionId+"midErr1","��������");
			AppParam.setParam(dse_sessionId+"midErr2","��̬�������");
			
%>
			<script type="text/javascript">
					window.location="/personbank/HttpProxy?URL=/midserv/midservError.jsp&dse_sessionId=<%=dse_sessionId%>";
			</script>
<%
			return ;
		}
	}
	
	
	//��ȡǩԼ�Ĳ���
	String IdTyp = MessManTool.changeChar(request.getParameter("IdTyp"));//֤������
	String IdNo = MessManTool.changeChar(request.getParameter("IdNo"));//֤������
	String ActNam = MessManTool.changeChar(request.getParameter("ActNam"));//֤������
	String mainNo = MessManTool.changeChar(request.getParameter("mainNo"));//ǩԼ������
	
	
	//����ǩԼ����û�� ���͹�����
	
	

    String cssFileName = request.getParameter("cssFileName");//��ȡ�ͻ���ǰʹ�õ�CSS��ʽ
	if(cssFileName ==null){
		cssFileName = "skin.css";
	}					
	
	String bocomPwd = MessManTool.changeChar(request.getParameter("bocomPwd"));//��������
	if(bocomPwd.equals("")){
		System.out.println("��������Ϊ��");
			AppParam.setParam(dse_sessionId+"midErr1","��������");
			AppParam.setParam(dse_sessionId+"midErr2","��������Ϊ��");


%>
<script type="text/javascript">
	window.location="/personbank/HttpProxy?URL=/midserv/midservError.jsp&dse_sessionId=<%=dse_sessionId%>";
</script>
<%
		return;
	}
	

	
	
	
	//��ʼƴװ�������صı��ģ�ǩԼ����
	
	String content = "biz_id,32|biz_step_id,2|TXNSRC,WE441|BisTyp,1"+"|ActTyp,4"+
			"|ActNo,"+cdno+"|ActNam,"+ActNam+"|VchNO,"+"|IdTyp,"+IdTyp+"|IdNo,"+IdNo+"|CusNam,"+ActNam+
			"|MstTel,"+mainNo+"|PINDat,"+bocomPwd;
	
	log.Write(">>>>>>>>>>>>�ƶ���Լ>>>����ȥ�ı���:"+content);
	MidServer midServer = new MidServer();
	BwResult bwResult = midServer.sendMessage(content);
	log.Write("<<<<<<<<<<<<�ƶ���Լ<<<���صı��Ķ���bwResult:"+bwResult);
	
	if (bwResult == null ) {
			log.Write("���׽������");
			AppParam.setParam(dse_sessionId+"midErr1","��Լ����ʧ��");
			AppParam.setParam(dse_sessionId+"midErr2","���׹���������������⣬�˴ν���ʧ�ܣ�");
%>
<script type="text/javascript">
	window.location="/personbank/HttpProxy?URL=/midserv/midservError.jsp&dse_sessionId=<%=dse_sessionId%>";
</script>
<%
	return;
	}
	String tmp ="";
    tmp = bwResult.getContext();
	log.Write("bwResult.getContext= "+tmp);
	
	String info=MessManTool.getValueByName(tmp,"MGID");
	
	
	if(info==null||info.equals("")||!info.equals("000000")){
		
			log.Write("���ײ��ɹ�");
			log.Write("���ײ��ɹ� ��ԭ���ǣ�"+tmp);
			AppParam.setParam(dse_sessionId+"midErr1","��Լʧ��");
			AppParam.setParam(dse_sessionId+"midErr2",tmp);
%>
<script type="text/javascript">
	window.location="/personbank/HttpProxy?URL=/midserv/midservError.jsp&dse_sessionId=<%=dse_sessionId%>";
</script>
<%
	return;
	}
%>


<!-------------------------------------------------------------------
                          ��׼JavaScript������
--------------------------------------------------------------------->
<script language="JavaScript" src="/personbank/HttpProxy?URL=/midserv/js/public.js&dse_sessionId=<%=dse_sessionId%>"></script>
<script language="JavaScript" src="/personbank/HttpProxy?URL=/midserv/js/common.js&dse_sessionId=<%=dse_sessionId%>"></script>
<script language="JavaScript" src="/personbank/HttpProxy?URL=/midserv/js/date.js&dse_sessionId=<%=dse_sessionId%>"></script>
<!--------------------------------------------------------------------
   ��ǰҳ��JavaScript�������֣������ύ��֤��ҳ�涯��������Ŀ��ȴ���
---------------------------------------------------------------------->

<!--------------------------------------------------------------------
                          ҳ��HTML���ֲ���    
---------------------------------------------------------------------->

<html>
	<head>
	  <meta http-equiv="Content-Type" content="text/html; charset=GBK">
		<title>��ͨ�������Ϸ���</title>
		<link rel="stylesheet" type="text/css" href="/personbank/css/<%=cssFileName%>">
	</head>

	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
		<center>
			<DIV align=center>
				<table width="100%" align="center" cellpadding="1" cellspacing="1" class="tab">
					<tr align="left"> 
						<td class="tab_title">��Լ���ײ����ɹ���������Ϣ���£�</td>
					</tr>
					
				<FORM action="/personbank/HttpProxy" method=post name="f1">
					<input type="hidden" name="dse_sessionId"	value="<%=dse_sessionId%>">
					<input type="hidden" name="URL" value="/midserv/yiDongCharge1.jsp">
					<input type="hidden" name=biz_id value="<%=biz_id%>">
					<input type="hidden" name=step_id value="1">
					
						<tr class="tab_tr">
							<td width="50%" align="right" height="22" class="InputTip">
								�û�������
							</td>
							<td width="50%" align="left" height="22" class="InputTip">
								<input type="text" name="ActNam" value="<%=ActNam%>" readonly="readonly">
							</td>
						</tr>
						<tr class="tab_tr">
							<td width="50%" align="right" height="22" class="InputTip">
								֤������:
							</td>
							<td width="50%" align="left" height="22" class="InputTip">
								<input type="hidden" name="IdTyp" value="<%=IdTyp%>"  readonly="readonly">
								<%=IdTyp%>
							</td>
						</tr>
						<tr class="tab_tr">
							<td width="50%" align="right" height="22" class="InputTip">
								֤�����룺
							</td>
							<td width="50%" align="left" height="22" class="InputTip">
								<input type="text" name="IdNo" value="<%=IdNo%>"  readonly="readonly">
							</td>
						</tr>
						<tr class="tab_tr">
							<td width="50%" align="right" height="22" class="InputTip">
								ǩԼ�����룺
							</td>
							<td width="50%" align="left" height="22" class="InputTip">
								<input type="text" name="mainNo" value="<%=mainNo%>"  readonly="readonly">
							</td>
						</tr>
						
					</table>
				</FORM>

			</DIV>
		</center>
		
  	<div class="guide">
  		<ul>��ܰ��ʾ��
  			  <li>*&nbsp;&nbsp;�𾴵Ŀͻ�����ǩԼ���ֻ��Ž��յ�10086ҵ�������ţ�����48Сʱ�ڻظ���Y�����ǡ����а������ظ���ظ��������ݣ���ҵ�񽫰����ɹ���</li>
  			  <li>*&nbsp;&nbsp;�������ʿ���ѯ�й��ƶ���������10086���пͷ�95559��</li>
  		</ul>
  	</div>	
    					  	
	</body>
</html>
