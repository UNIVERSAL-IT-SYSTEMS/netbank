/* ����JS�ļ�
 * author:�ž���
 * date:2010-7-7
 *
 */
 
//��ѯ��ǰ��ѡ�еļ�¼���������ǵ�����//":checked[name='selectedRow']"
function getTheSelectedRowID(jqStr) {
	var i = 0;
	var idArray = new Array();
	jQuery(jqStr).each(function () {
		var value = jQuery(this).val();
		idArray[i] = value;
		i++;
	});
	return idArray;
}

//��ȡ��ǰ��ѡ�еļ�¼����չ���� ����Ϊ����չ��������
function getSelRowByExtName(jqStr,extName){
	var i = 0;
	var valArray = new Array();
	jQuery(jqStr).each(function () {
		var value = jQuery(this).attr(extName);
		valArray[i] = value;
		i++;
	});
	return valArray;
}

//��õ�ǰ��ѡ�еļ�¼������
function getSelRowLength(jqStr){
	return getTheSelectedRowID(jqStr).length;
}

//��õ�ǰ��ѡ�еļ�¼ID���ַ��������ʱ��ʹ��|����ƴ��
function getSelRowIDStr(jqStr) {
	var idArray=getTheSelectedRowID(jqStr);
	return processTheIDArray(idArray);
}

//��õ�ǰ��ѡ�еļ�¼ID�����飬����ת��ΪJSON����
function getSelRowIDJSONArray(jqStr){
	try{
		var idArray=getTheSelectedRowID(jqStr);
		//ת��ΪJSON
		var paramJSON=JSON.stringify(idArray);
		return paramJSON;
	}catch(e){
		alert(e.message);
	}
}

//��ѡ�е�ID����ƴ��
function processTheIDArray(idArray) {
	var result = "";
	jQuery.each(idArray, function (i, n) {
		result += "|" + n;
	});
	result = result.replace("|", "");
	return result;
}