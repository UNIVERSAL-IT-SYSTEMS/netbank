function add_select(Obj,length,one_true_two_false)
{
	if(one_true_two_false)
	for (var i=0;i<length;i++)
	{
		Obj.options[i]=new Option("",0);
		Obj.options[i].value=i+1;
		Obj.options[i].text=i+1;
	}
	else
	for(var i=0;i<length;i++)
	{
		Obj.options[i]=new Option("",0);
		var temp;
		if(i<9)
		{
			temp=i+1;
			temp="0"+temp;
			Obj.options[i].value=temp;
			Obj.options[i].text=temp;
		}
		else{
			Obj.options[i].value=i+1;
			Obj.options[i].text=i+1;
		}
	}
}

function check_Year_Month_Day(Obj_Year,Obj_Month,Obj_Day,one_true_two_false)
{
	Year=Obj_Year.value;
	Month=Obj_Month.value;
	Day=Obj_Day.value;	
	
	var temp=Day;
	
	if((Year%4==0 && Year%100!=0) || Year%400==0)
	{
		if(Month==2)
		{
			var length=Obj_Day.length;
			for(var i=0;i<length;i++)
				Obj_Day.options[0]=null;
			add_select(Obj_Day,29,one_true_two_false);
			if(temp<30)
				Obj_Day.value=temp;
			else
				Obj_Day.value=15;			
		}
		else{
			if(Month==1 || Month==3 || Month==5 || Month==7 || Month==8 || Month==10 || Month==12)
			{
				var length=Obj_Day.length;
				for(var i=0;i<length;i++)
					Obj_Day.options[0]=null;
				add_select(Obj_Day,31,one_true_two_false);
				Obj_Day.value=temp;
			}
			else{
				var length=Obj_Day.length;
				for(var i=0;i<length;i++)
					Obj_Day.options[0]=null;
				add_select(Obj_Day,30,one_true_two_false);
				if(temp<31)
					Obj_Day.value=temp;
				else
					Obj_Day.value=15;
			}
		}
	}
	else{
		if(Month==4 || Month==6 || Month==9 || Month==11)
		{
			var length=Obj_Day.length;
			for(var i=0;i<length;i++)
				Obj_Day.options[0]=null;
			add_select(Obj_Day,30,one_true_two_false);
			if(temp<31)
				Obj_Day.value=temp;
			else
				Obj_Day.value=15;
		}
		else if(Month!=2){
			var length=Obj_Day.length;
			for(var i=0;i<length;i++)
				Obj_Day.options[0]=null;
			add_select(Obj_Day,31,one_true_two_false);
			if(temp<32)
				Obj_Day.value=temp;
			else
				Obj_Day.value=15;
		}
		else{
			var length=Obj_Day.length;
			for(var i=0;i<length;i++)
				Obj_Day.options[0]=null;
			add_select(Obj_Day,28,one_true_two_false);
			if(temp<29)
				Obj_Day.value=temp;
			else
				Obj_Day.value=15;
		}
	}	
}

//除去左右空格
function javaTrim(string)
{
	var length1, i, j;
	var string1 = "";
	
	length1 = string.length;
	for (i = 0 ; i < length1 ; i++) 
	{ 
		//除去左边空格
		if(string.charAt(i) != " ")  
		{
			//除去左边空格后
			for (j = i ; j < length1 ; j++) string1 = string1 + string.charAt(j);
			break;	
		}//除去左边空格后
	}	//除去左边空格
	
	length1 = string1.length;
	string = string1;
	string1 = "";
	for (i = length1 - 1 ; i >= 0 ; i--)
	{  
		//除去右边空格
		if(string.charAt(i) != " ")
		{
			//除去右边空格后
			for (j = 0 ; j <= i ; j++) string1 = string1 + string.charAt(j);
			break;			
		}
	}	
	string = string1;	
	return(string);
}

//判断查询起始日期是否大于截止日期
function validateStartDateAndEndDate(startYear,startMonth,startDay,endYear,endMonth,endDay)
{
	if(startYear > endYear)
	{
		alert("起始年份不能大于截止年份");
		return false;
	}
	else if(startYear == endYear)
	{
		if(startMonth > endMonth)
		{
			alert("起始月份不能大于截止月份");
			return false;
		}
		else if(startMonth == endMonth)
		{
			if(startDay <= endDay)
			{
				return true;
			}
			else
			{
				alert("起始日期不能大于截止日期");
				return false;
			}
		}
		else
		{
			return true;	
		}
	}
	else 
	{
		return true;
	}
}

//判断数值,必须为纯数字
function checkNumber(string) 
{ 
	var length1 , i , j;
	var string1="";
   
  
    string1 = javaTrim(string)
	length1 = string1.length;
	if (length1 == 0) 
	{
		return(false); 
	}
	
	for (i = 0 ; i < length1 ; i++) 
	{  //判断每位数字
		if(isNaN(parseInt(string.charAt(i),10)))  
		{
				alert( "错误！请输入数值型数据！");					
				return(false); 
		} 
	}

	return (true);
}

//选中某个数据域
function MakeFocus(txtObject)
{
	txtObject.focus();
	txtObject.select();
}

//判断数值,是否为浮点数
function checkFloat(string) { 
	var length1 , i , j;
	var string1="";
   
  
    string1 = javaTrim(string)
	length1 = string1.length;
	if (length1 == 0) 
	{
		alert( "错误！空串！");
		return(false); 
	}
       if (string.charAt(0)=="0" )
	      {if (length1 == 1){
	        alert("金额不能为0，请重新填写！");
	        return(false);
	      }
	      else{
	      if (!(string.charAt(1)==".")){
	        alert("金额首位不能为0，请重新填写！");
	        return(false);}
		}
	      }
	j=0;
	for (i = 0 ; i < length1 ; i++) 
	{  
		//判断每位数字
		if(isNaN(parseInt(string.charAt(i),10)))  
		{
			if(string.charAt(i) != ".") 
			{
				alert( "错误！请输入数值型数据！");					
				return(false); 
			} 
			else  
			{
				j++;
				if(length1 - i > 3 )
				{
					alert("小数点后只能有两位！");
					return(false);
				}
			}
 		}		
	}
	if(j > 1) {
		alert( "错误！小数点只能有一个!");			
		return(false);
	}

	return (true);
}

