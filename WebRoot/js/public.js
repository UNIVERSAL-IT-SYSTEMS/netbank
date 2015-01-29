//----------------------------------------------------------
//	Liana 3.0 ϵͳJS���ú�����
//
//----------------------------------------------------------

//----------------------------------------------------------
//	�������Ƿ��Ǹ�����
//	����ֵ��
//	true��	�Ǹ�����
//	false��	���Ǹ�����
//----------------------------------------------------------
function isDecimal( s )
{
	var isDecimal = RegExp(/^[0-9]+(\.?)[0-9]+$/);
	return ( isDecimal.test(s) );
}


//----------------------------------------------------------
//	�ж�������ǲ������ֻ�����ĸ
//	���룺theStr Ϊ�ַ���
//	����ֵ��true����false������
//----------------------------------------------------------
function isIntChar( s )
{
 	var isIntChar = RegExp(/^[a-zA-Z0-9]+$/);
	return ( isIntChar.test(s) );
 }
 
 //----------------------------------------------------------
//	�ж�������ǲ������ֻ�����ĸ���������ַ�
//	���룺theStr Ϊ�ַ���
//	����ֵ��true����false������
//----------------------------------------------------------
function isIntChar2( s )
{
	var isIntChar2 = RegExp(/^[a-zA-Z0-9(\_)(\-)(\*)(\&)(\%)(\$)(\#)(\@)(\!)(\~)(\^)(\()(\))]+$/);
	return ( isIntChar2.test(s) );
 }
 
//----------------------------------------------------------
//	�����������½��б���
//	���룺������
//	����ֵ��
//	������������
//----------------------------------------------------------
function encode(s)
{
	if(s == null ) 
		return s;
	if(s.length == 0) 
		return s;
	
	var ret = "";
	for(i=0;i<s.length;i++)
	{
		var c = s.substr(i,1);
		var ts = escape(c);
		if(ts.substring(0,2) == "%u") 
		{
			ret = ret + ts.replace("%u","@@");
		} else {
			ret = ret + c;
		}
	}
	return ret;
}

//----------------------------------------------------------
//	�����˺źϷ���
//	���룺�˺ŵ��ַ���
//	����ֵ��
//	true���˺źϷ�
//	false���˺Ų��Ϸ�
//----------------------------------------------------------
function validateAccount(account,length) 
{
	if( isEmpty(account) )
	{
		alert("�˺Ų���Ϊ�գ�");
		return false;
	}
	
	if( !isInteger(account) )
	{
		alert("�˺ű���Ϊ���֣�");
		return false;
	}
	
	if( isShorter(account,length) )
	{
		alert("�˺ų���Ϊ"+length+"λ��");
		return false;
	}	
	
	return true;
}

//----------------------------------------------------------
//	�ٷ��ʸ�ʽ��
//	���룺0��100����ַ���
//	����ֵ��
//	��ʽ������ַ���
//----------------------------------------------------------
function getFmtRate(str) 
{
	var rate = parseInt(str);
	
	if ( rate > 100 || rate < 0 )
		return("-1");
	
	return (rate/100);
}

//----------------------------------------------------------
//	�������Ƿ�Ϊ��
//	����ֵ��
//	true��Ϊ��
//	false����Ϊ��
//----------------------------------------------------------
function isEmpty(e)
{
	if( trim(e) == "" )
		return true;
	else
		return false;
}

//----------------------------------------------------------
// 	ȥ���ַ���ǰ��Ŀո�
//	����ֵ��
//	ȥ���ո����ַ���
//----------------------------------------------------------
function trim(param) {
	if ((vRet = param) == '') { return vRet; }
	while (true) {
		if (vRet.indexOf (' ') == 0) {
			vRet = vRet.substring(1, parseInt(vRet.length));
		} else if ((parseInt(vRet.length) != 0) && (vRet.lastIndexOf (' ') == parseInt(vRet.length) - 1)) {
			vRet = vRet.substring(0, parseInt(vRet.length) - 1);
		} else {
			return vRet;
		}
	}
}

//----------------------------------------------------------
// 	��������ı������Ƿ������|����#���Ƿ��ַ�
//	����ֵ��
//	true��	�Ϸ�
//	false��	�Ƿ�
//----------------------------------------------------------
function isValidText(param) {
	if ((param.indexOf('|') >= 0) || (param.indexOf('#') >= 0) ) {
		alert("��|���͡�#��Ϊϵͳ�����ַ����벻Ҫ���룡");
		return false;
	}
	return true;
}

//----------------------------------------------------------
//	�������ĳ��ȱȸ����ĳ��ȶ�
//	����ֵ��
//	true��	��������<�����ĳ���
//	false��	��������>=�����ĳ���
//----------------------------------------------------------

function isShorter(str,reqlength)
{
	if( str.length<reqlength )
		return true;
	else
		return false;
}

//----------------------------------------------------------
//	�������Ƿ�������
//	����ֵ��
//	true��	������
//	false��	��������
//----------------------------------------------------------
function isInteger( s )
{ 
	var isInteger = RegExp(/^[0-9]+$/);
	return ( isInteger.test(s) );
}

//----------------------------------------------------------
//	������
//	����ֵ��
//	true��	�Ϸ�
//	false��	�Ƿ�
//----------------------------------------------------------
function isMoney(param) {
	if ((isNaN(param)) || (parseFloat(param) < 0) || (param.indexOf('.') == 0) || (param.lastIndexOf('.') == param.length - 1)) {
		return false;
	}
	//��֧�ֿ�ѧ����
	if(param.indexOf('e') > 0) {
		return false;
	}
	//С��������ֻ��������λ��Ч����	
	var docIndex = trim(param).lastIndexOf('.');
	if ((docIndex < parseInt(trim(param).length) - 3) && (docIndex >= 0)) {
		return false;
	}
	return true;
}

//----------------------------------------------------------
//	����۸�
//	����ֵ��
//	true��	�Ϸ�
//	false��	�Ƿ�
//----------------------------------------------------------
function isPrice(param) {
	if ((isNaN(param)) || (parseFloat(param) < 0) || (param.indexOf('.') == 0) || (param.lastIndexOf('.') == param.length - 1)) {
		return false;
	}
	//��֧�ֿ�ѧ����
	if(param.indexOf('e') > 0) {
		return false;
	}
	//С��������ֻ��������λ��Ч����	
	var docIndex = trim(param).lastIndexOf('.');
	if ((docIndex < parseInt(trim(param).length) - 5) && (docIndex >= 0)) {
		return false;
	}
	return true;
}

//----------------------------------------------------------
// 	���������Ƿ����YYYYMMDD�ĸ�ʽ
//	����ֵ��
//	true��	���ںϷ�
//	false��	���ڲ��Ϸ�
//----------------------------------------------------------
function isDate(param) {
	var pattern = /^\d+$/;
	if ( param.length != 8 ) {
		return false;
	}
	if(!pattern.test(param)) {
		return false;
	}
	sYear = param.substring( 0, 4 );
	sMonth = param.substring( 4, 6 );
	sDay = param.substring( 6, 8 );
	if ( ( eval( sMonth ) < 1 ) || ( eval( sMonth )  > 12 ) ) {
		return false;
	}
	var leapYear = ((( sYear % 4 == 0 ) && ( sYear % 100 != 0 )) || ( sYear % 400 == 0 )) ? true : false;
	var monthDay = new Array(12);
	monthDay[0] = 31;
	monthDay[1] = leapYear ? 29 : 28;
	monthDay[2] = 31;
	monthDay[3] = 30;
	monthDay[4] = 31;
	monthDay[5] = 30;
	monthDay[6] = 31;
	monthDay[7] = 31;
	monthDay[8] = 30;
	monthDay[9] = 31;
	monthDay[10] = 30;
	monthDay[11] = 31;
	if ( ( eval( sDay ) < 1 ) || ( eval( sDay )  > monthDay[eval(sMonth)-1] ) ) {
		return false;
	}
	return true;
}

//----------------------------------------------------------
// 	���email�Ϸ���
//	����ֵ��
//	true��	�Ϸ�
//	false��	���Ϸ�
//----------------------------------------------------------
function isEmail(aEmail) {
	var bValidate = RegExp(/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/).test(aEmail);
	
	if ( bValidate )
	{
		return true;
	}
	else
		return false;
}

//----------------------------------------------------------
//	ѡ��ĳ��������
//----------------------------------------------------------
function makeFocus(txtObject) {
	txtObject.focus();
	txtObject.select();
}

//----------------------------------------------------------
//	����ʽ��
//	����ֵ��
//	��ʽ������ַ���
//----------------------------------------------------------
function toFmtMoney(str) {
	var subAmt = trim(str);
	if((subAmt.indexOf(".") == -1)||(subAmt.length == 1)) {
		subAmt = subAmt + ".00";
	}
	if(subAmt.indexOf(".") == (subAmt.length - 2)) {
		subAmt = subAmt + "0";
	}
	if(subAmt.indexOf(".") < (subAmt.length - 3)){
		subAmt = subAmt.substr(0, subAmt.indexOf(".") + 3);
	}
	return (subAmt);
}

//----------------------------------------------------------
//	���Ƽ������룬ֻ����������
//----------------------------------------------------------
function inputNumber(){
	if(event.keyCode < 48||event.keyCode > 57){
		event.returnValue=false;
	}		
}

function disable_Button(name){
	name.disabled=1
}

function reload(name1){	
	name1.reset();
}


//----------------------------------------------------------
//����text���������볤��
//�÷���onblur="checkLength(this,Ҫ���Ƶĳ���);",
//----------------------------------------------------------
function checkLength(v,l){
 var s = v.value;
 var len = 0;
   for(i=0;i<s.length;i++){
     var c = s.substr(i,1);
     var ts = escape(c);
     if(ts.substring(0,2) == "%u") {
      len+=2;
     } else {
      len+=1;
     }
   }
   if(l>=len){
     return;
   }
   else{
	var aaa=Math.floor(l/2);
	alert("�����������ֵ���������"+l+"���ַ���"+aaa+"�����֡�");
    v.value = "";
    v.focus();
   }
}

//----------------------------------------------------------
//����textarea���������볤��
//�÷���onblur="checkAreaLength(this,Ҫ���Ƶĳ���);"
//----------------------------------------------------------
function checkAreaLength(v,l){
 var s= v.value;
 var temlen=0;
 var len = 0;
 for(i=0;i<s.length;i++){
     var c = s.substr(i,1);
     var ts = escape(c);

     if(ts.substring(0,2) == "%u"){
      len+=2;
      len+=temlen;
      temlen=0;
     }
     else if(ts.substring(0,3) == "%0D"){
      temlen+=1;
     }
     else if(ts.substring(0,3) == "%0A"){
         temlen+=1;
     }
     else if(ts.substring(0,3) == "%20"){
      temlen+=1;
     }
      else{
      len+=1;
      len+=temlen;
      temlen=0;
     }
   }
  if(len>l){
	var aaa=Math.floor(l/2);
	alert("�����������ֵ���������"+l+"���ַ���"+aaa+"�����֡�");  	
    v.value = "";
    v.focus();
    return false;
  }
  return true;
}

//----------------------------------------------------------
//	ͨ�ô�ӡ
//----------------------------------------------------------
function commonprint(t1,t2,w,h){
	var sarg=new Array();
	var sdata=document.all.item(t2);
	sarg[0]=t1;
	sarg[1]=sdata.outerHTML;
	window.showModalDialog("print.jsp",sarg,"dialogWidth:"+w+"px;dialogHeight:"+h+"px;center:yes;help:no;status:no;resizable:yes");
	return;
}

//----------------------------------------------------------
//	�Խ�����ת���������ת��Ϊ��ԪΪ��λ��С���������λ
//	����������1234��ת����������Ϊ1234.00
//	Creation date: (2003-09-12)	
//	@author: ecc-wangdong
//	@version: 1.0
//	@param��form, txtmoney, hidmoney
//	@param˵����
//              FORM�������������ƣ�����������
//	@condition���ñ������Ѹ���ֵ	
//----------------------------------------------------------
function convertToMoney(form,txtmoney,hidmoney){
    var tonumber;
    var re = /,/g;
    var txt_money = eval("document."+form+"."+txtmoney);
    var hid_money = eval("document."+form+"."+hidmoney);
    if (txt_money.value != ""){
    	var temp = trim(txt_money.value);
    	if (temp == ""){
    		alert("��������ȷ�Ľ��!");
    		txt_money.value="";
				hid_money.value="";
				txt_money.focus();
    		return;
    	}
    }
    tonumber = txt_money.value.replace(re,"");

    txt_money.value = "";
    hid_money.value = "";
   if (tonumber !="" && tonumber!=null){
   	rep = / /g;
		var amt = tonumber.replace(rep,"");
		
		for(var j = 0; j < amt.length; j++){
			if(isNaN(parseInt(amt.charAt(j),10)) && amt.charAt(j)!="," && amt.charAt(j)!=".") {
				alert("��������ȷ�Ľ��!");
				txt_money.value="";
				hid_money.value="";
				txt_money.focus();
				return;
			}
		}
		if(amt.indexOf(".")!=amt.lastIndexOf(".")){
			alert("��������ȷ�Ľ��!");
			txt_money.focus();
			return;
		}
	
		re = /,/g;
		var amt1 = amt.replace(re,"");

		var amt2=parseFloat(amt1);		
		if(amt2<=0){
			alert("����Ľ��С�ڻ������,����������!");
			txt_money.focus();
			return;
		}else{		//����0������;
			if(amt1.indexOf(".")!=-1){				
				var str = amt1.substr(amt1.indexOf(".")+1);				
				if(str.length>2){
					alert("����Ľ��С�����ֻ�ܱ�����λ,����������!");
					txt_money.focus();
					return;
				}else if(str.length==1){
					amt1=amt1 + "0";
				}else if(str.length<1){
					amt1=amt1 + "00";
				}
			}else{
				amt1=amt1 + ".00";
			}
			if(amt1.charAt(0)=='0' && amt1.indexOf(".")!=1){
			alert("��������ȷ�Ľ��!");
			txt_money.focus();
			return;
			}
			hid_money.value=amt1;
			var temp=amt1.substring(0,amt1.indexOf("."));
			if (temp.length > 10){
			    alert("����Ľ��̫������������!");
			    txt_money.focus();
			    return;
			}
			txt_money.value=comma(temp) + amt1.substring(amt1.indexOf("."));
			return;							
		}
    }
}

//----------------------------------------------------------
//	�Խ�����ת���������ת��Ϊ�Է�Ϊ��λ
//	Creation date: (2003-09-12)	
//	@author: ecc-wangdong
//	@version: 1.0
//	@param��form, txtmoney, hidmoney
//	@param˵����
//              FORM�������������ƣ�����������
//	@condition���ñ������Ѹ���ֵ	
//----------------------------------------------------------
function convertToMoney2(form,txtmoney,hidmoney){
    var tonumber;
    var re = /,/g;
    var txt_money = eval("document."+form+"."+txtmoney);
    var hid_money = eval("document."+form+"."+hidmoney);
    tonumber = txt_money.value.replace(re,"");

    txt_money.value = "";
    if (tonumber !="" && tonumber!=null){
   	rep = / /g;
		var amt = tonumber.replace(rep,"");
		
		for(var j = 0; j < amt.length; j++){
			if(isNaN(parseInt(amt.charAt(j),10)) && amt.charAt(j)!="," && amt.charAt(j)!=".") {
				alert("��������ȷ�Ľ��!");
				txt_money.value="";
				txt_money.focus();
				return;
			}
		}
		if(amt.indexOf(".")!=amt.lastIndexOf(".")){
			alert("��������ȷ�Ľ��!");
			txt_money.focus();
			return;
		}
	
		re = /,/g;
		var amt1 = amt.replace(re,"");

		var amt2=parseFloat(amt1);		
		if(amt2<0){
			alert("����Ľ��С����,����������!");
			txt_money.focus();
			return;
		}else{		//����0������;
			if(amt1.indexOf(".")!=-1){				
				var str = amt1.substr(amt1.indexOf(".")+1);				
				if(str.length>2){
					alert("����Ľ��С�����ֻ�ܱ�����λ,����������!");
					txt_money.focus();
					return;
				}else if(str.length==1){
					amt1=amt1 + "0";
				}else if(str.length<1){
					amt1=amt1 + "00";
				}
			}else{
				amt1=amt1 + ".00";
			}
			if(amt1.charAt(0)=='0' && amt1.indexOf(".")!=1){
			alert("��������ȷ�Ľ��!");
			txt_money.focus();
			return;
			}
			hid_money.value=amt1.substring(0,amt1.indexOf(".")) + amt1.substr(amt1.indexOf(".")+1);
			var temp=amt1.substring(0,amt1.indexOf("."));
			if (hid_money.value.length > 18){
			    alert("���̫��");
			    txt_money.focus();
			    return;
			}
			txt_money.value=comma(temp) + amt1.substring(amt1.indexOf("."));
			return;							
		}
    }
}

//---------------------------------------------------------------------------
//	������ʽ���Ӷ��ţ�ֻ��������������������һ���������á�
//	Creation date: (2003-09-12)	
//	@author: ecc-handong
//	@version: 1.0
//	@param��number
//	@param˵������ת����ֵ	
//---------------------------------------------------------------------------

function comma(number) {
	number = '' + number;
	if (number.length > 3) {
		var mod = number.length % 3;
		var output = (mod > 0 ? (number.substring(0,mod)) : '');
		for (i=0 ; i < Math.floor(number.length / 3); i++) {
			if ((mod == 0) && (i == 0))
				output += number.substring(mod+ 3 * i, mod + 3 * i + 3);
			else
				output += ',' + number.substring(mod + 3 * i, mod + 3 * i + 3);
		}
		return (output);
	}
	else return number;
}

//---------------------------------------------------------------------------
//	������ʽ���Ӷ��ţ��������Ϊ����ʹ�á�
//	Creation date: (2003-09-12)	
//	@author: ecc-wangdong,handong
//	@version: 1.0
//	@param��number
//	@param˵����
//              ��ת����ֵ	
//---------------------------------------------------------------------------
function displayComma(str) {
	str = '' + str;
	if ((str.indexOf("."))!= -1){
		str1 = str.substring(0,str.indexOf("."));
		str2 = str.substring(str.indexOf("."));
	}else{
		str1 = str;
	}
	if (str1.length > 3) {
		var mod = str1.length % 3;
		var output = (mod > 0 ? (str1.substring(0,mod)) : '');
		for (i=0 ; i < Math.floor(str1.length / 3); i++) {
			if ((mod == 0) && (i == 0))
				output += str1.substring(mod+ 3 * i, mod + 3 * i + 3);
			else
				output += ',' + str1.substring(mod + 3 * i, mod + 3 * i + 3);
		}
		if ((str.indexOf("."))!= -1){
			output = output + str2;
		}
		return (output);
	}
	else return str;
}


//----------------------------------------------------------
//	����Excel�ļ�������
//	���������
//	formName��Ҫ���ɵ��������ڵ�form����
//	tableName��Ҫ���ɵ��������ڵ�table����
//----------------------------------------------------------
function exportexcel(formName,tableName){
      	var oXL = new ActiveXObject("Excel.Application");
      	oXL.Visible = true;
      	var oWB = oXL.Workbooks.Add();
      	var oSheet = oWB.ActiveSheet;
      
      	var div1=document.all.item(formName);
      	var table1=div1.all.item(tableName);
      	var table=new Array();

	var retArr = getTableRowsCols(table1);
      	var rlen=retArr[0];
      	var clen=retArr[1];
	
      	var flagTable=new Array(rlen);
      	for(var i=0;i<rlen;i++){
      		flagTable[i]=new Array(clen);
      		for(var j=0;j<clen;j++){
      			flagTable[i][j]=0;
      		}
      	}

	var rowBegin=1, colBegin=1;		//�����ı�����ʼλ��
	
      	var c1=oSheet.Cells(rowBegin,colBegin);
      	var c2=oSheet.Cells(rlen+rowBegin-1,clen+colBegin-1);
      	oSheet.Range(c1,c2).VerticalAlignment = -4108;
      	oSheet.Range(c1,c2).HorizontalAlignment =  -4108;
      	
  	exportTable(oSheet, flagTable, table1, rowBegin, colBegin);    	
    	      	
       	oSheet.Range(oSheet.Cells(rowBegin,colBegin),oSheet.Cells(rlen+rowBegin-1,clen+colBegin-1)).EntireColumn.AutoFit();
      	oXL.UserControl = true;
      	oXL.Quit();
}

//���ص�ǰ��������������
//������objTable, ������
//���أ�retArr, retArr[0], ������retArr[1], ����
function getTableRowsCols(objTable)
{
	var rowCnt=0, colCnt=0;
	for (var i=0; i<objTable.rows.length; i++) {
		var row = objTable.rows[i];	//��ǰ��
		var rowRows=1, rowCols=0;	//��ǰ�еĳ�ʼ����������
		for (var j=0; j<row.cells.length; j++) {
			var cell = row.cells[j];	//��ǰ��Ԫ��
			if (cell.firstChild !=null && cell.firstChild.tagName == "TABLE") {
				var inRetArr = getTableRowsCols(cell.firstChild);
				rowCols +=inRetArr [1];
				rowRows = rowRows<inRetArr[0] ? inRetArr[0] : rowRows;
			} else {	//���Ǳ��
				rowCols += parseInt(cell.colSpan);
				rowRows = rowRows<parseInt(cell.rowSpan) ? parseInt(cell.rowSpan) : rowRows;
			}
		}
		colCnt = colCnt<rowCols ? rowCols : colCnt;
		rowCnt += rowRows;
	}
	var retArr = new Array();
	retArr[0] = rowCnt;
	retArr[1] = colCnt;
	
	return retArr;
}

//�������
function exportTable(oSheet, flagTable, objTable, rowBegin, colBegin){
	var flagRow=0, flagCol=0;		//���ٵ�ǰ�ı�ʾ���е����λ��
	for(var i=0; i<objTable.rows.length; i++) {
		var row = objTable.rows[i];	//��ǰ��
		flagCol = 0;
		var subTableRows = 1;		//��ǰ�����б�����¼������������
		for (var j=0; j<row.cells.length; j++) {
			while (flagTable[rowBegin-1+flagRow][colBegin-1+flagCol]==1) {
				flagCol++;
			}
			var cell=row.cells[j];	//��ǰ��Ԫ��
			if (cell.firstChild !=null && cell.firstChild.tagName == "TABLE") {
				var retArrRows = getTableRowsCols(cell.firstChild)[0];
				subTableRows = subTableRows<retArrRows ? retArrRows : subTableRows;
				exportTable(oSheet, flagTable, cell.firstChild, rowBegin+flagRow, colBegin+flagCol);
			} else {
				
				oSheet.Cells(rowBegin+flagRow, colBegin+flagCol).Font.Bold=1;
	               	 				
				var rs=parseInt(cell.rowSpan);
	               	 	var cs=parseInt(cell.colSpan);
	               	 	oSheet.Cells(rowBegin+flagRow, colBegin+flagCol).NumberFormatLocal="@";
	               	 	oSheet.Cells(rowBegin+flagRow, colBegin+flagCol).Value = cell.innerText;
	               	 	oSheet.Range(oSheet.Cells(rowBegin+flagRow, colBegin+flagCol),oSheet.Cells(rowBegin+flagRow+rs-1,colBegin+flagCol+cs-1)).MergeCells = 1;  
				
				//��д��ǰ��Ԫ���ڱ�־����еı�־
				for(var k=0; k<rs; k++) {
					for(var l=0; l<cs; l++) {
						flagTable[rowBegin-1+flagRow+k][colBegin-1+flagCol+l]=1;
					}
				}
			}
				
			flagCol =flagCol + cs - 1;	//���ٱ�־�����е��ƶ�����Ϊ��ǰ����Ѿ���ʶ��cs����־��Ԫ  			              		
		}
		flagRow += subTableRows;
	}	
}

//----------------------------------------------------------
//	ͼƬ���ƺ���
//----------------------------------------------------------
function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_findObj(n, d) { //v4.0
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && document.getElementById) x=document.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}

//-----------------------------
//	���ʱ�����Ƿ��ڹ涨���֮��
//	���룺
//	startDate/endDateΪYYYYMMDD�������ַ���
//	interval���������λΪ��
//	���أ�true ����Ҫ��
//	false ������Ҫ��
//-----------------------------
function dateInterval(startDate,endDate,interval) {
	var date1 = new Date(eval(startDate.substring(0,4)),eval(startDate.substring(4,6))-1,eval(startDate.substring(6,8)));
	var date2 = new Date(eval(endDate.substring(0,4)),eval(endDate.substring(4,6))-1,eval(endDate.substring(6,8)));
	if ( ( date2 - date1 ) / 86400000 > eval(interval) - 1 )
		return false;
	return true;
}

//-----------------------------
//	���ضԻ����е��ļ�·��
//-----------------------------
function getFilePath(filespec)
{
	oldSpec=filespec;
	index=filespec.indexOf("\\");
	while(index>=0)
    {
    	if(filespec.length>index)
		filespec=filespec.substring(index+1);
		index=filespec.indexOf("\\");
	}
	index=filespec.indexOf("/");
	while(index>=0)
    {
		if(filespec.length>index)
		filespec=filespec.substring(index+1);
		index=filespec.indexOf("/");
	}
	index=oldSpec.indexOf(filespec);
	return oldSpec.substring(0,index);
}

var debug = 0;
/**
*   ����xml����
*   url: url
*   method: Post or Get
*   retType: xml or html
**/
function sendXMLHttpRquest(url, method, retType)
{
	var objHTTP = new ActiveXObject("Microsoft.XMLHTTP");
	var resXML = new ActiveXObject("Microsoft.xmldom");

	objHTTP.Open(method, url, false);
	objHTTP.Send();
	var resText = objHTTP.responseText;
	objHTTP = null;
	if (debug > 0)
	{
		if (debug > 4)
			document.write(resText);
		else
			alert(resText);
	}
	if (retType == "html")
		return resText;

	resXML.loadXML(resText);
	if(resXML.xml==null || resXML.xml=="")
	{
		document.write(resText);
		document.write("<script>window.reload;</script>");
		return null;
	}

	return resXML;
}
/**
*   ��ȡxml��ָ�������������
*   xml:xml
*   name:String
*/
function getValueFromXML(xml, name)
{
	var value = null;
	try {
		if (xml.getElementsByTagName(name).length > 0)
			value = xml.getElementsByTagName(name).item(0).text;
	} catch(Exception)
	{
		value = null;
	}
	return value;
}

function isExRate(rate)
{

	if (rate == "")
		return false;
	for (var j = 0; j < rate.length; j++) {
		if (isNaN(parseInt(rate.charAt(j), 10)) && rate.charAt(j) != ".") {
			return false;
		}
	}
	if(rate.indexOf(".")!=rate.lastIndexOf(".") || rate.lastIndexOf(".")==rate.length-1){
		return false;
	}
	if(rate.substring(rate.indexOf(".")).length>5)
	{
		return false;
	}
	return true;
}