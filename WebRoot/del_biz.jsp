
<!-------------------------------------------------------------------
                          ��׼ҳ������������
--------------------------------------------------------------------->
<%@ page contentType="text/html;charset=gb2312" %>


<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.bocom.midserv.base.*" %>
<%@ page import="com.bocom.midserv.web.*" %>
<%@ page import="java.lang.*"%>

<%//��ò�����ɾ������
    String biz_id=request.getParameter("biz_id").trim();
    int i_biz_id=Integer.parseInt(biz_id);

    String sql="delete from TRANS_DEF where biz_id="+i_biz_id+"";
    MidObjectView midObjectView =  new MidObjectView();
    midObjectView.insertData(sql);
    String sql2="delete from TRANS_VIEW_DEF where biz_id="+i_biz_id+"";
    midObjectView.insertData(sql2);
    
%>
   <script language="javascript">
	alert("ɾ���ɹ���");
   </script>

<!--------------------------------------------------------------------
                          ҳ��HTML���ֲ���    
---------------------------------------------------------------------->
<html>
<body onload="load2()">
<script language=javascript>
function load2(){
opener.setTimeout("submit1()",1500)
self.setTimeout("exit()",1500)
}
function exit(){
window.close()
}
</script>
</body>
</html>