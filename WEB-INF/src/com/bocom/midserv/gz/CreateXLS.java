package com.bocom.midserv.gz;
import java.io.*;
import jxl.*;
import jxl.write.*;

public class CreateXLS {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		try{//���ļ� 
			WritableWorkbook book = Workbook.createWorkbook(new File("����.xls"));
			//������Ϊ����һҳ���Ĺ���������0��ʾ���ǵ�һҳ
	 		WritableSheet sheet=book.createSheet("��һҳ",0); 
			//��Label����Ĺ�������ָ����Ԫ��λ���ǵ�һ�е�һ��(0,0) 
			//�Լ���Ԫ������Ϊtest 
			Label label=new Label(0,0,"test"); 
			//������õĵ�Ԫ����ӵ��������� 
			sheet.addCell(label); 
			/*����һ���������ֵĵ�Ԫ�� 
				����ʹ��Number��������·�����������﷨���� 
				��Ԫ��λ���ǵڶ��У���һ�У�ֵΪ789.123*/ 
				jxl.write.Number number = new jxl.write.Number(1,0,999999999789.123);
				Label labe2 =new Label(2,2,"999999999999999999999999");
				sheet.addCell(labe2);
				sheet.addCell(number); 
			//д�����ݲ��ر��ļ� 
			book.write(); 
			book.close(); 
			//out.println("ok");
		}catch(Exception e) 
		{ 
			System.out.println(e); 
		} 


	}

}
