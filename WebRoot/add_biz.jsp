
<!-------------------------------------------------------------------
                          ��׼ҳ������������
--------------------------------------------------------------------->
<%@ page contentType="text/html;charset=gb2312" %>


<!--------------------------------------------------------------------
   ��ǰҳ��JavaScript�������֣������ύ��֤��ҳ�涯��������Ŀ��ȴ���
---------------------------------------------------------------------->
<SCRIPT language="JavaScript">
function condition()
{
	<%-- ¼�����ֵ --%>
	if (this.document.form1.biz_memo.value==""||this.document.form1.biz_memo.value==null)
	{
		alert("�����뽻�����ƣ�");
		return false;
  	}
  	if (this.document.form1.biz_detail.value==""||this.document.form1.biz_detail.value==null)
	{
		alert("�������Ҫ����˵����");
		return false;
  	}
  	
 	return true;
}



</script>

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
</head>

<body leftmargin="0" topmargin="0"  background="./images/background.gif">
<p align="center"> 
<form method="POST"  name=form1 action="add_bizmid.jsp" onsubmit="return condition()">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
  	<td align="center"><img src="./images/xianb.gif" width="100" height="20"></td>
  	<td rowspan="3" align="right" valign="top">&nbsp;</td>
  </tr>
  <tr>    	
  	<td background="images/pageTitle.gif" class="pageTitle" align="center"> �� �� �� �� ҵ �� </td>    
  </tr>
  <tr>
  	<td align="center"><img src="./images/xianb.gif" width="100" height="20"></td>
  </tr>
</table>
<table border="0" width="76%">
    <tr>
      <td width="30%" class="InputTip">
        <p align="right">�������ƣ�</td>
      <td width="70%" class="InputTip"><input type="text" name="biz_memo" size="20"></td>
    </tr>
    <tr>
      <td width="30%" class="InputTip">
        <p align="right">��Ҫ����˵����</td>
      <td width="70%" class="InputTip"><input type="text" name="biz_detail" size="50"></td>
    </tr>
  </table>
  <p align="center">��</p>
  <p align="center">��</p>
  <p align="center"><input type="button" value=" �� �� " name="B1" onclick="javascript:history.back()"> <input type="submit" value="��һ��" name="B1"> <input type="reset" value="ȫ����д" name="B2"></p>
</form>

</body>

</html>
