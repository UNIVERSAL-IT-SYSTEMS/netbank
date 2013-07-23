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

//��ȥ���ҿո�
function javaTrim(string)
{
	var length1, i, j;
	var string1 = "";
	
	length1 = string.length;
	for (i = 0 ; i < length1 ; i++) 
	{ 
		//��ȥ��߿ո�
		if(string.charAt(i) != " ")  
		{
			//��ȥ��߿ո��
			for (j = i ; j < length1 ; j++) string1 = string1 + string.charAt(j);
			break;	
		}//��ȥ��߿ո��
	}	//��ȥ��߿ո�
	
	length1 = string1.length;
	string = string1;
	string1 = "";
	for (i = length1 - 1 ; i >= 0 ; i--)
	{  
		//��ȥ�ұ߿ո�
		if(string.charAt(i) != " ")
		{
			//��ȥ�ұ߿ո��
			for (j = 0 ; j <= i ; j++) string1 = string1 + string.charAt(j);
			break;			
		}
	}	
	string = string1;	
	return(string);
}

//�жϲ�ѯ��ʼ�����Ƿ���ڽ�ֹ����
function validateStartDateAndEndDate(startYear,startMonth,startDay,endYear,endMonth,endDay)
{
	if(startYear > endYear)
	{
		alert("��ʼ��ݲ��ܴ��ڽ�ֹ���");
		return false;
	}
	else if(startYear == endYear)
	{
		if(startMonth > endMonth)
		{
			alert("��ʼ�·ݲ��ܴ��ڽ�ֹ�·�");
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
				alert("��ʼ���ڲ��ܴ��ڽ�ֹ����");
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

//�ж���ֵ,����Ϊ������
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
	{  //�ж�ÿλ����
		if(isNaN(parseInt(string.charAt(i),10)))  
		{
				alert( "������������ֵ�����ݣ�");					
				return(false); 
		} 
	}

	return (true);
}

//ѡ��ĳ��������
function MakeFocus(txtObject)
{
	txtObject.focus();
	txtObject.select();
}

//�ж���ֵ,�Ƿ�Ϊ������
function checkFloat(string) { 
	var length1 , i , j;
	var string1="";
   
  
    string1 = javaTrim(string)
	length1 = string1.length;
	if (length1 == 0) 
	{
		alert( "���󣡿մ���");
		return(false); 
	}
       if (string.charAt(0)=="0" )
	      {if (length1 == 1){
	        alert("����Ϊ0����������д��");
	        return(false);
	      }
	      else{
	      if (!(string.charAt(1)==".")){
	        alert("�����λ����Ϊ0����������д��");
	        return(false);}
		}
	      }
	j=0;
	for (i = 0 ; i < length1 ; i++) 
	{  
		//�ж�ÿλ����
		if(isNaN(parseInt(string.charAt(i),10)))  
		{
			if(string.charAt(i) != ".") 
			{
				alert( "������������ֵ�����ݣ�");					
				return(false); 
			} 
			else  
			{
				j++;
				if(length1 - i > 3 )
				{
					alert("С�����ֻ������λ��");
					return(false);
				}
			}
 		}		
	}
	if(j > 1) {
		alert( "����С����ֻ����һ��!");			
		return(false);
	}

	return (true);
}

