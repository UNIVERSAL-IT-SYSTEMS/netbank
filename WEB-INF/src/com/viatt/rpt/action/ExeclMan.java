package com.viatt.rpt.action;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFPrintSetup;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

import com.viatt.rpt.comm.DBISOtoGB;
import com.viatt.rpt.comm.ExcelRow;
import com.viatt.rpt.comm.ExcelUtil;
import com.viatt.rpt.comm.MyRequest;
import com.viatt.rpt.comm.MyUtil;
import com.viatt.rpt.dao.RptListDao;
import com.viatt.rpt.dao.YwjbDao;
import com.viatt.rpt.model.DkListModel;
import com.viatt.rpt.model.RmbckListModel;
import com.viatt.rpt.model.WbcdkListModel;
import com.viatt.rpt.model.YwjbListModel;

public class ExeclMan {

	public void rmbckExcel(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		HSSFWorkbook workbook = new HSSFWorkbook();
		HSSFSheet aSheet = null;
		String strDate = MyRequest.GetString(request, "rptDate");
		int iRptType = MyRequest.GetInt(request, "rptdim", 1);
		try {
			aSheet = workbook.createSheet();
			HSSFPrintSetup printSetup = aSheet.getPrintSetup();
			printSetup.setPaperSize((short) 8);
			printSetup.setLandscape(true);
			printSetup.setFooterMargin(0.0);
			printSetup.setHeaderMargin(0.0);
			aSheet.setMargin(HSSFSheet.LeftMargin, 0.1);
			aSheet.setMargin(HSSFSheet.RightMargin, 0.1);
			aSheet.setMargin(HSSFSheet.TopMargin, 0.5);
			aSheet.setMargin(HSSFSheet.BottomMargin, 0.3);

			ExcelUtil excelUtil = new ExcelUtil();
			excelUtil.setTotalWidth(51000);
			if (iRptType == 1) {
				aSheet.setColumnWidth(0, excelUtil.getColumnWidth(5));
				aSheet.setColumnWidth(1, excelUtil.getColumnWidth(6));
				aSheet.setColumnWidth(2, excelUtil.getColumnWidth(4.5));
				aSheet.setColumnWidth(3, excelUtil.getColumnWidth(4));
				aSheet.setColumnWidth(4, excelUtil.getColumnWidth(4.5));
				aSheet.setColumnWidth(5, excelUtil.getColumnWidth(4.5));
				aSheet.setColumnWidth(6, excelUtil.getColumnWidth(5));
				aSheet.setColumnWidth(7, excelUtil.getColumnWidth(4.5));
				aSheet.setColumnWidth(8, excelUtil.getColumnWidth(4));
				aSheet.setColumnWidth(9, excelUtil.getColumnWidth(4.5));
				aSheet.setColumnWidth(10, excelUtil.getColumnWidth(4.5));
				aSheet.setColumnWidth(11, excelUtil.getColumnWidth(5));
				aSheet.setColumnWidth(12, excelUtil.getColumnWidth(4.5));
				aSheet.setColumnWidth(13, excelUtil.getColumnWidth(4));
				aSheet.setColumnWidth(14, excelUtil.getColumnWidth(4.5));
				aSheet.setColumnWidth(15, excelUtil.getColumnWidth(4.5));
				aSheet.setColumnWidth(16, excelUtil.getColumnWidth(5));
				aSheet.setColumnWidth(17, excelUtil.getColumnWidth(4.5));
				aSheet.setColumnWidth(18, excelUtil.getColumnWidth(4));
				aSheet.setColumnWidth(19, excelUtil.getColumnWidth(4.5));
				aSheet.setColumnWidth(20, excelUtil.getColumnWidth(4.5));
				aSheet.setColumnWidth(21, excelUtil.getColumnWidth(5));
			}

			HSSFFont contentfont = workbook.createFont();
			contentfont.setFontHeightInPoints((short) 7);
			
			HSSFCellStyle aStyle = workbook.createCellStyle();
			HSSFFont titlefont = workbook.createFont();
			titlefont.setFontHeightInPoints((short) 12);
			titlefont.setFontName("����");
			titlefont.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
			aStyle.setFont(titlefont);
			aStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);
			aStyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
			aStyle.setBorderBottom((short) 1);
			aStyle.setBorderTop((short) 1);
			aStyle.setBorderLeft((short) 1);
			aStyle.setBorderRight((short) 1);

			HSSFRow aRow0 = aSheet.createRow(0);
			aRow0.setHeight((short) 400);
			ExcelRow excelRow0 = new ExcelRow(aRow0);
			excelRow0.setCellStyle(aStyle);
			excelRow0.setSheet(aSheet);

			excelRow0.addCell("��ͨ���й㶫ʡ���У�ȫϽ)����Ҵ��ҵ���ձ���", 22);

			HSSFCellStyle titleStyle = workbook.createCellStyle();
			titleStyle.setFont(contentfont);
			titleStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);
			titleStyle.setBorderBottom((short) 1);
			titleStyle.setBorderTop((short) 1);
			titleStyle.setBorderLeft((short) 1);
			titleStyle.setBorderRight((short) 1);

			HSSFRow aRow1 = aSheet.createRow(1);
			ExcelRow excelRow1 = new ExcelRow(aRow1);
			excelRow1.setCellStyle(titleStyle);
			excelRow1.setSheet(aSheet);

			excelRow1.addCell(" ", 2);
			if(iRptType==1){
				excelRow1.addCell("������ ��", 5);
			}
			if(iRptType==1||iRptType==2){
				excelRow1.addCell("�Թ����", 5);
			}
			if(iRptType==1||iRptType==3){
				excelRow1.addCell("������", 5);
			}
			if(iRptType==1||iRptType==4){
				excelRow1.addCell("ͬҵ���", 5);
			}

			HSSFRow aRow2 = aSheet.createRow(2);
			ExcelRow excelRow2 = new ExcelRow(aRow2);
			excelRow2.setCellStyle(titleStyle);
			excelRow2.setSheet(aSheet);

			excelRow2.addCell(" ", 2);
			if(iRptType==1){
				excelRow2.addCell("������� ");
				excelRow2.addCell("������");
				excelRow2.addCell("�����");
				excelRow2.addCell("���¶ȼƻ�");
				excelRow2.addCell("��ȼƻ������");
			}
			if(iRptType==1||iRptType==2){
				excelRow2.addCell("������� ");
				excelRow2.addCell("������");
				excelRow2.addCell("�����");
				excelRow2.addCell("���¶ȼƻ�");
				excelRow2.addCell("��ȼƻ������");
			}
			if(iRptType==1||iRptType==3){
				excelRow2.addCell("������� ");
				excelRow2.addCell("������");
				excelRow2.addCell("�����");
				excelRow2.addCell("���¶ȼƻ�");
				excelRow2.addCell("��ȼƻ������");
			}
			if(iRptType==1||iRptType==4){
				excelRow2.addCell("������� ");
				excelRow2.addCell("������");
				excelRow2.addCell("�����");
				excelRow2.addCell("���¶ȼƻ�");
				excelRow2.addCell("��ȼƻ������");
			}

			List list = new ArrayList();
			RptListDao dao = new RptListDao();
			if (strDate.equals("")) {
				strDate = dao.getMaxDateFromBBCK();
				if (!strDate.trim().equals("")) {
					strDate = DBISOtoGB.ChangeDate2(strDate);
				}
			}
			list = dao.findCK(strDate.replaceAll("-", ""));

			HSSFCellStyle contentStyle = workbook.createCellStyle();
			contentStyle.setFont(contentfont);
			contentStyle.setAlignment(HSSFCellStyle.ALIGN_LEFT);
			contentStyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
			contentStyle.setBorderBottom((short) 1);
			contentStyle.setBorderTop((short) 1);
			contentStyle.setBorderLeft((short) 1);
			contentStyle.setBorderRight((short) 1);
			for (int i = 0; list != null && i < list.size(); i++) {
				RmbckListModel model = (RmbckListModel) list.get(i);
				HSSFRow tmpRow = aSheet.createRow(i + 3);
				ExcelRow tmpexcelRow = new ExcelRow(tmpRow);
				tmpexcelRow.setSheet(aSheet);
				tmpexcelRow.setCellStyle(contentStyle);
				if (i == 0 || i == 1) {
					tmpexcelRow.addCell(model.getOrg_name(), 2);
				}
				if (i == 2) {
					tmpexcelRow.addCell("ʡ����Ӫҵ��", 1, 5);
				}
				if (i > 2 && i < 7) {
					tmpexcelRow.addCell(" ");
				}
				if (i == 7) {
					tmpexcelRow.addCell("Խ��֧��", 1, 4);
				}
				if (i > 7 && i < 11) {
					tmpexcelRow.addCell(" ");
				}
				if (i == 11) {
					tmpexcelRow.addCell("С��֧��", 1, 6);
				}
				if (i > 11 && i < 17) {
					tmpexcelRow.addCell(" ");
				}
				if (i == 17) {
					tmpexcelRow.addCell("�л�֧��", 1, 9);
				}
				if (i > 17 && i < 26) {
					tmpexcelRow.addCell(" ");
				}
				if (i == 26) {
					tmpexcelRow.addCell("����֧��", 1, 6);
				}
				if (i > 26 && i < 32) {
					tmpexcelRow.addCell(" ");
				}
				if (i == 32) {
					tmpexcelRow.addCell("����֧��", 1, 6);
				}
				if (i > 32 && i < 38) {
					tmpexcelRow.addCell(" ");
				}
				if (i == 38) {
					tmpexcelRow.addCell("����֧��", 1, 6);
				}
				if (i > 38 && i < 44) {
					tmpexcelRow.addCell(" ");
				}
				if (i == 44) {
					tmpexcelRow.addCell("���ݴ��֧��", 1, 6);
				}
				if (i > 44 && i < 50) {
					tmpexcelRow.addCell(" ");
				}
				if (i == 50) {
					tmpexcelRow.addCell("����֧��", 1, 7);
				}
				if (i > 50 && i < 57) {
					tmpexcelRow.addCell(" ");
				}
				if (i == 57) {
					tmpexcelRow.addCell("���֧��", 1, 6);
				}
				if (i > 57 && i < 63) {
					tmpexcelRow.addCell(" ");
				}
				if (i == 63) {
					tmpexcelRow.addCell("��ӱ�֧��", 1, 6);
				}
				if (i > 63 && i < 69) {
					tmpexcelRow.addCell(" ");
				}
				if (i == 69) {
					tmpexcelRow.addCell("����֧��", 1, 8);
				}
				if (i > 69 && i < 77) {
					tmpexcelRow.addCell(" ");
				}
				if (i == 77) {
					tmpexcelRow.addCell("����֧��", 1, 5);
				}
				if (i > 77 && i < 82) {
					tmpexcelRow.addCell(" ");
				}
				if (i == 82) {
					tmpexcelRow.addCell("������֧��", 1, 6);
				}
				if (i > 82 && i < 88) {
					tmpexcelRow.addCell(" ");
				}
				if (i == 88) {
					tmpexcelRow.addCell("����֧��", 1, 4);
				}
				if (i > 88 && i < 92) {
					tmpexcelRow.addCell(" ");
				}
				if (i == 92) {
					tmpexcelRow.addCell("��خ֧��", 1, 6);
				}
				if (i > 92 && i < 98) {
					tmpexcelRow.addCell(" ");
				}
				if (i == 98) {
					tmpexcelRow.addCell("ҫ��֧��");
				}
				if (i == 99) {
					tmpexcelRow.addCell("ʡϽ��", 1, 8);
				}
				if (i > 99 && i < 107) {
					tmpexcelRow.addCell(" ");
				}
				if (i>1) {
					tmpexcelRow.addCell(model.getOrg_name());
				}
				if (iRptType == 1) {
					tmpexcelRow.addCell(DBISOtoGB.Conver(model.getSum_ckye()));
					tmpexcelRow.addCell(DBISOtoGB.Conver(model.getSum_predate()));
					tmpexcelRow.addCell(DBISOtoGB.Conver(model.getSum_preyear()));
					tmpexcelRow.addCell(DBISOtoGB.Conver(model.getSum_mp()));
					tmpexcelRow.addCell(DBISOtoGB.Conver2(model.getSum_yfl()));
				}
				if(iRptType==1||iRptType==2){
					tmpexcelRow.addCell(DBISOtoGB.Conver(model.getDg_ckye()));
					tmpexcelRow.addCell(DBISOtoGB.Conver(model.getDg_predate()));
					tmpexcelRow.addCell(DBISOtoGB.Conver(model.getDg_preyear()));
					tmpexcelRow.addCell(DBISOtoGB.Conver(model.getDg_mp()));
					tmpexcelRow.addCell(DBISOtoGB.Conver2(model.getDg_yfl()));
				}
				if(iRptType==1||iRptType==3){
					tmpexcelRow.addCell(DBISOtoGB.Conver(model.getCx_ckye()));
					tmpexcelRow.addCell(DBISOtoGB.Conver(model.getCx_predate()));
					tmpexcelRow.addCell(DBISOtoGB.Conver(model.getCx_preyear()));
					tmpexcelRow.addCell(DBISOtoGB.Conver(model.getCx_mp()));
					tmpexcelRow.addCell(DBISOtoGB.Conver2(model.getCx_yfl()));
				}
				if(iRptType==1||iRptType==4){
					tmpexcelRow.addCell(DBISOtoGB.Conver(model.getTy_ckye()));
					tmpexcelRow.addCell(DBISOtoGB.Conver(model.getTy_predate()));
					tmpexcelRow.addCell(DBISOtoGB.Conver(model.getTy_preyear()));
					tmpexcelRow.addCell(DBISOtoGB.Conver(model.getTy_mp()));
					tmpexcelRow.addCell(DBISOtoGB.Conver2(model.getTy_yfl()));
				}
			}

			response.setContentType("application/vnd.ms-excel");
			response.setContentType("application/vnd.ms-excel;charset=GBK");
			SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMdd");
			Date date2 = new Date();
			String date1 = formatter.format(date2);
			response.setHeader("Content-Disposition",
					"attachment;filename= rmbck" + date1 + "excel.xls");
			ServletOutputStream sos = response.getOutputStream();
			workbook.write(sos);
			sos.flush();
			sos.close();

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	public void wbcdkExcel(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		HSSFWorkbook workbook = new HSSFWorkbook();
		HSSFSheet aSheet = null;
		String strDate = MyRequest.GetString(request, "rptDate");
		int iRptType = MyRequest.GetInt(request, "rptdim", 1);
		try {
			aSheet = workbook.createSheet();
			HSSFPrintSetup printSetup = aSheet.getPrintSetup();
			printSetup.setPaperSize((short) 8);
			printSetup.setLandscape(true);
			printSetup.setFooterMargin(0.0);
			printSetup.setHeaderMargin(0.0);
			aSheet.setMargin(HSSFSheet.LeftMargin, 0.1);
			aSheet.setMargin(HSSFSheet.RightMargin, 0.1);
			aSheet.setMargin(HSSFSheet.TopMargin, 0.5);
			aSheet.setMargin(HSSFSheet.BottomMargin, 0.3);

			ExcelUtil excelUtil = new ExcelUtil();
			excelUtil.setTotalWidth(51000);
			if (iRptType == 1) {
				aSheet.setColumnWidth(0, excelUtil.getColumnWidth(5));
				aSheet.setColumnWidth(1, excelUtil.getColumnWidth(6));
				aSheet.setColumnWidth(2, excelUtil.getColumnWidth(4));
				aSheet.setColumnWidth(3, excelUtil.getColumnWidth(4));
				aSheet.setColumnWidth(4, excelUtil.getColumnWidth(4));
				aSheet.setColumnWidth(5, excelUtil.getColumnWidth(4));
				aSheet.setColumnWidth(6, excelUtil.getColumnWidth(5));
				aSheet.setColumnWidth(7, excelUtil.getColumnWidth(4));
				aSheet.setColumnWidth(8, excelUtil.getColumnWidth(4));
				aSheet.setColumnWidth(9, excelUtil.getColumnWidth(4));
				aSheet.setColumnWidth(10, excelUtil.getColumnWidth(4.5));
				aSheet.setColumnWidth(11, excelUtil.getColumnWidth(5));
				aSheet.setColumnWidth(12, excelUtil.getColumnWidth(4.5));
				aSheet.setColumnWidth(13, excelUtil.getColumnWidth(4));
				aSheet.setColumnWidth(14, excelUtil.getColumnWidth(4.5));
				aSheet.setColumnWidth(15, excelUtil.getColumnWidth(4.5));
				aSheet.setColumnWidth(16, excelUtil.getColumnWidth(5));
				aSheet.setColumnWidth(17, excelUtil.getColumnWidth(4.5));
				aSheet.setColumnWidth(18, excelUtil.getColumnWidth(4));
				aSheet.setColumnWidth(19, excelUtil.getColumnWidth(4.5));
				aSheet.setColumnWidth(20, excelUtil.getColumnWidth(4.5));
				aSheet.setColumnWidth(21, excelUtil.getColumnWidth(4.5));
				aSheet.setColumnWidth(22, excelUtil.getColumnWidth(4.5));
			}
			

			HSSFFont contentfont = workbook.createFont();
			contentfont.setFontHeightInPoints((short) 7);
			
			HSSFCellStyle aStyle = workbook.createCellStyle();
			HSSFFont titlefont = workbook.createFont();
			titlefont.setFontHeightInPoints((short) 12);
			titlefont.setFontName("����");
			titlefont.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
			aStyle.setFont(titlefont);
			aStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);
			aStyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
			aStyle.setBorderBottom((short) 1);
			aStyle.setBorderTop((short) 1);
			aStyle.setBorderLeft((short) 1);
			aStyle.setBorderRight((short) 1);

			HSSFRow aRow0 = aSheet.createRow(0);
			aRow0.setHeight((short) 400);
			ExcelRow excelRow0 = new ExcelRow(aRow0);
			excelRow0.setCellStyle(aStyle);
			excelRow0.setSheet(aSheet);

			excelRow0.addCell("��ͨ���й㶫ʡ���У�ȫϽ)��Ҵ����ҵ���ձ���", 23);

			HSSFCellStyle titleStyle = workbook.createCellStyle();
			titleStyle.setFont(contentfont);
			titleStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);
			titleStyle.setBorderBottom((short) 1);
			titleStyle.setBorderTop((short) 1);
			titleStyle.setBorderLeft((short) 1);
			titleStyle.setBorderRight((short) 1);

			HSSFRow aRow1 = aSheet.createRow(1);
			ExcelRow excelRow1 = new ExcelRow(aRow1);
			excelRow1.setCellStyle(titleStyle);
			excelRow1.setSheet(aSheet);

			excelRow1.addCell(" ", 2);
			if(iRptType==1){
				excelRow1.addCell("������ ��", 5);
			}
			if(iRptType==1||iRptType==2){
				excelRow1.addCell("�Թ����", 5);
			}
			if(iRptType==1||iRptType==3){
				excelRow1.addCell("������", 5);
			}
			if(iRptType==1||iRptType==4){
				excelRow1.addCell("�������", 3);
			}
			if(iRptType==1||iRptType==5){
				excelRow1.addCell("ͬҵ���", 3);
			}

			HSSFRow aRow2 = aSheet.createRow(2);
			ExcelRow excelRow2 = new ExcelRow(aRow2);
			excelRow2.setCellStyle(titleStyle);
			excelRow2.setSheet(aSheet);

			excelRow2.addCell(" ", 2);
			if(iRptType==1){
				excelRow2.addCell("������� ");
				excelRow2.addCell("������");
				excelRow2.addCell("�����");
				excelRow2.addCell("���¶ȼƻ�");
				excelRow2.addCell("��ȼƻ������");
			}
			if(iRptType==1||iRptType==2){
				excelRow2.addCell("������� ");
				excelRow2.addCell("������");
				excelRow2.addCell("�����");
				excelRow2.addCell("���¶ȼƻ�");
				excelRow2.addCell("��ȼƻ������");
			}
			if(iRptType==1||iRptType==3){
				excelRow2.addCell("������� ");
				excelRow2.addCell("������");
				excelRow2.addCell("�����");
				excelRow2.addCell("���¶ȼƻ�");
				excelRow2.addCell("��ȼƻ������");
			}
			if(iRptType==1||iRptType==4){
				excelRow2.addCell("������� ");
				excelRow2.addCell("������");
				excelRow2.addCell("�����");
			}
			if(iRptType==1||iRptType==5){
				excelRow2.addCell("������� ");
				excelRow2.addCell("������");
				excelRow2.addCell("�����");
			}

			List list = new ArrayList();
			RptListDao dao = new RptListDao();
			if(strDate.equals(""))
			{
				strDate=dao.getMaxDateFromWb();
				if(!strDate.trim().equals(""))
				{
					strDate =DBISOtoGB.ChangeDate2(strDate);
				}
			}
			list =  dao.findWbcundai(strDate.replaceAll("-",""),iRptType);

			HSSFCellStyle contentStyle = workbook.createCellStyle();
			contentStyle.setFont(contentfont);
			contentStyle.setAlignment(HSSFCellStyle.ALIGN_LEFT);
			contentStyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
			contentStyle.setBorderBottom((short) 1);
			contentStyle.setBorderTop((short) 1);
			contentStyle.setBorderLeft((short) 1);
			contentStyle.setBorderRight((short) 1);
			
			
			for (int i = 0; list != null && i < list.size(); i++) {
				WbcdkListModel model = (WbcdkListModel)list.get(i);
				HSSFRow tmpRow = aSheet.createRow(i + 3);
				ExcelRow tmpexcelRow = new ExcelRow(tmpRow);
				tmpexcelRow.setSheet(aSheet);
				tmpexcelRow.setCellStyle(contentStyle);
				if (i == 0 || i == 1) {
					tmpexcelRow.addCell(model.getOrg_name(), 2);
				}
				if (i == 2) {
					tmpexcelRow.addCell("ʡ����Ӫҵ��", 1, 5);
				}
				if (i > 2 && i < 7) {
					tmpexcelRow.addCell(" ");
				}
				if (i == 7) {
					tmpexcelRow.addCell("Խ��֧��", 1, 4);
				}
				if (i > 7 && i < 11) {
					tmpexcelRow.addCell(" ");
				}
				if (i == 11) {
					tmpexcelRow.addCell("С��֧��", 1, 6);
				}
				if (i > 11 && i < 17) {
					tmpexcelRow.addCell(" ");
				}
				if (i == 17) {
					tmpexcelRow.addCell("�л�֧��", 1, 9);
				}
				if (i > 17 && i < 26) {
					tmpexcelRow.addCell(" ");
				}
				if (i == 26) {
					tmpexcelRow.addCell("����֧��", 1, 6);
				}
				if (i > 26 && i < 32) {
					tmpexcelRow.addCell(" ");
				}
				if (i == 32) {
					tmpexcelRow.addCell("����֧��", 1, 6);
				}
				if (i > 32 && i < 38) {
					tmpexcelRow.addCell(" ");
				}
				if (i == 38) {
					tmpexcelRow.addCell("����֧��", 1, 6);
				}
				if (i > 38 && i < 44) {
					tmpexcelRow.addCell(" ");
				}
				if (i == 44) {
					tmpexcelRow.addCell("���ݴ��֧��", 1, 6);
				}
				if (i > 44 && i < 50) {
					tmpexcelRow.addCell(" ");
				}
				if (i == 50) {
					tmpexcelRow.addCell("����֧��", 1, 7);
				}
				if (i > 50 && i < 57) {
					tmpexcelRow.addCell(" ");
				}
				if (i == 57) {
					tmpexcelRow.addCell("���֧��", 1, 6);
				}
				if (i > 57 && i < 63) {
					tmpexcelRow.addCell(" ");
				}
				if (i == 63) {
					tmpexcelRow.addCell("��ӱ�֧��", 1, 6);
				}
				if (i > 63 && i < 69) {
					tmpexcelRow.addCell(" ");
				}
				if (i == 69) {
					tmpexcelRow.addCell("����֧��", 1, 8);
				}
				if (i > 69 && i < 77) {
					tmpexcelRow.addCell(" ");
				}
				if (i == 77) {
					tmpexcelRow.addCell("����֧��", 1, 5);
				}
				if (i > 77 && i < 82) {
					tmpexcelRow.addCell(" ");
				}
				if (i == 82) {
					tmpexcelRow.addCell("������֧��", 1, 6);
				}
				if (i > 82 && i < 88) {
					tmpexcelRow.addCell(" ");
				}
				if (i == 88) {
					tmpexcelRow.addCell("����֧��", 1, 4);
				}
				if (i > 88 && i < 92) {
					tmpexcelRow.addCell(" ");
				}
				if (i == 92) {
					tmpexcelRow.addCell("��خ֧��", 1, 6);
				}
				if (i > 92 && i < 98) {
					tmpexcelRow.addCell(" ");
				}
				if (i == 98) {
					tmpexcelRow.addCell("ҫ��֧��");
				}
				if (i == 99) {
					tmpexcelRow.addCell("ʡϽ��", 1, 8);
				}
				if (i > 99 && i < 107) {
					tmpexcelRow.addCell(" ");
				}
				if (i>1) {
					tmpexcelRow.addCell(model.getOrg_name());
				}
				if (iRptType == 1) {
					tmpexcelRow.addCell(DBISOtoGB.Conver(model.getCurr_ckye()));
					tmpexcelRow.addCell(DBISOtoGB.Conver(model.getPre_ckye()));
					tmpexcelRow.addCell(DBISOtoGB.Conver(model.getNc_ckye()));
					tmpexcelRow.addCell(DBISOtoGB.Conver(model.getYu_mp()));
					tmpexcelRow.addCell(DBISOtoGB.Conver2(model.getYp_qk()));
				}
				if(iRptType==1||iRptType==2){
					tmpexcelRow.addCell(DBISOtoGB.Conver(model.getDg_ckye()));
					tmpexcelRow.addCell(DBISOtoGB.Conver(model.getPre_dg()));
					tmpexcelRow.addCell(DBISOtoGB.Conver(model.getNc_dg()));
					tmpexcelRow.addCell(DBISOtoGB.Conver(model.getYu_dg()));
					tmpexcelRow.addCell(DBISOtoGB.Conver2(model.getYp_dg()));
				}
				if(iRptType==1||iRptType==3){
					tmpexcelRow.addCell(DBISOtoGB.Conver(model.getGr_ckye()));
					tmpexcelRow.addCell(DBISOtoGB.Conver(model.getPre_gr()));
					tmpexcelRow.addCell(DBISOtoGB.Conver(model.getNc_gr()));
					tmpexcelRow.addCell(DBISOtoGB.Conver(model.getYu_gr()));
					tmpexcelRow.addCell(DBISOtoGB.Conver2(model.getYp_gr()));
				}
				if(iRptType==1||iRptType==4){
					tmpexcelRow.addCell(DBISOtoGB.Conver(model.getCurr_dkye()));
					tmpexcelRow.addCell(DBISOtoGB.Conver(model.getPre_dkye()));
					tmpexcelRow.addCell(DBISOtoGB.Conver(model.getNc_dkye()));
				}
				if(iRptType==1||iRptType==4){
					tmpexcelRow.addCell(DBISOtoGB.Conver(model.getCurr_tyck()));
					tmpexcelRow.addCell(DBISOtoGB.Conver(model.getPre_tyck()));
					tmpexcelRow.addCell(DBISOtoGB.Conver(model.getNc_tyck()));
				}
			}

			response.setContentType("application/vnd.ms-excel");
			response.setContentType("application/vnd.ms-excel;charset=GBK");
			SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMdd");
			Date date2 = new Date();
			String date1 = formatter.format(date2);
			response.setHeader("Content-Disposition",
					"attachment;filename= wbcdk" + date1 + "excel.xls");
			ServletOutputStream sos = response.getOutputStream();
			workbook.write(sos);
			sos.flush();
			sos.close();

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void dkListExcel(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		HSSFWorkbook workbook = new HSSFWorkbook();
		HSSFSheet aSheet = null;
		String strDate = MyRequest.GetString(request, "rptDate");
		int iRptType = MyRequest.GetInt(request, "rptdim", 1);
		try {
			aSheet = workbook.createSheet();
			HSSFPrintSetup printSetup = aSheet.getPrintSetup();
			printSetup.setPaperSize(HSSFPrintSetup.A4_PAPERSIZE);
			printSetup.setLandscape(true);
			printSetup.setFooterMargin(0.0);
			printSetup.setHeaderMargin(0.0);
			aSheet.setMargin(HSSFSheet.LeftMargin, 0.1);
			aSheet.setMargin(HSSFSheet.RightMargin, 0.1);
			aSheet.setMargin(HSSFSheet.TopMargin, 0.5);
			aSheet.setMargin(HSSFSheet.BottomMargin, 0.3);

			ExcelUtil excelUtil = new ExcelUtil();
			if (iRptType == 1) {
				aSheet.setColumnWidth(0, excelUtil.getColumnWidth(8));
				aSheet.setColumnWidth(1, excelUtil.getColumnWidth(9));
				aSheet.setColumnWidth(2, excelUtil.getColumnWidth(7));
				aSheet.setColumnWidth(3, excelUtil.getColumnWidth(6));
				aSheet.setColumnWidth(4, excelUtil.getColumnWidth(7));
				aSheet.setColumnWidth(5, excelUtil.getColumnWidth(7));
				aSheet.setColumnWidth(6, excelUtil.getColumnWidth(6));
				aSheet.setColumnWidth(7, excelUtil.getColumnWidth(7));
				aSheet.setColumnWidth(8, excelUtil.getColumnWidth(7));
				aSheet.setColumnWidth(9, excelUtil.getColumnWidth(6));
				aSheet.setColumnWidth(10, excelUtil.getColumnWidth(7));
				aSheet.setColumnWidth(11, excelUtil.getColumnWidth(7));
				aSheet.setColumnWidth(12, excelUtil.getColumnWidth(6));
				aSheet.setColumnWidth(13, excelUtil.getColumnWidth(7));
				aSheet.setColumnWidth(14, excelUtil.getColumnWidth(7));
			}
			

			HSSFFont contentfont = workbook.createFont();
			contentfont.setFontHeightInPoints((short) 8);
			
			HSSFCellStyle aStyle = workbook.createCellStyle();
			HSSFFont titlefont = workbook.createFont();
			titlefont.setFontHeightInPoints((short) 12);
			titlefont.setFontName("����");
			titlefont.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
			aStyle.setFont(titlefont);
			aStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);
			aStyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
			aStyle.setBorderBottom((short) 1);
			aStyle.setBorderTop((short) 1);
			aStyle.setBorderLeft((short) 1);
			aStyle.setBorderRight((short) 1);

			HSSFRow aRow0 = aSheet.createRow(0);
			aRow0.setHeight((short) 400);
			ExcelRow excelRow0 = new ExcelRow(aRow0);
			excelRow0.setCellStyle(aStyle);
			excelRow0.setSheet(aSheet);

			excelRow0.addCell("��ͨ���й㶫ʡ���У�ȫϽ)����Ҵ���ҵ���ձ���", 14);

			HSSFCellStyle titleStyle = workbook.createCellStyle();
			titleStyle.setFont(contentfont);
			titleStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);
			titleStyle.setBorderBottom((short) 1);
			titleStyle.setBorderTop((short) 1);
			titleStyle.setBorderLeft((short) 1);
			titleStyle.setBorderRight((short) 1);

			HSSFRow aRow1 = aSheet.createRow(1);
			ExcelRow excelRow1 = new ExcelRow(aRow1);
			excelRow1.setCellStyle(titleStyle);
			excelRow1.setSheet(aSheet);

			excelRow1.addCell(" ", 2);
			if(iRptType==1){
				excelRow1.addCell("������� ��", 3);
			}
			if(iRptType==1||iRptType==2){
				excelRow1.addCell("�Թ�����", 3);
			}
			if(iRptType==1||iRptType==3){
				excelRow1.addCell("���˴���", 3);
			}
			if(iRptType==1||iRptType==4){
				excelRow1.addCell("Ʊ������", 3);
			}

			HSSFRow aRow2 = aSheet.createRow(2);
			ExcelRow excelRow2 = new ExcelRow(aRow2);
			excelRow2.setCellStyle(titleStyle);
			excelRow2.setSheet(aSheet);

			excelRow2.addCell(" ", 2);
			if(iRptType==1){
				excelRow2.addCell("������� ");
				excelRow2.addCell("������");
				excelRow2.addCell("�����");
			}
			if(iRptType==1||iRptType==2){
				excelRow2.addCell("������� ");
				excelRow2.addCell("������");
				excelRow2.addCell("�����");
			}
			if(iRptType==1||iRptType==3){
				excelRow2.addCell("������� ");
				excelRow2.addCell("������");
				excelRow2.addCell("�����");
			}
			if(iRptType==1||iRptType==4){
				excelRow2.addCell("������� ");
				excelRow2.addCell("������");
				excelRow2.addCell("�����");
			}

			List list = new ArrayList();
			RptListDao dao = new RptListDao();
			if(strDate.equals(""))
			{
				strDate=dao.getMaxDateFromBBDK();
				if(!strDate.trim().equals(""))
				{
					strDate =DBISOtoGB.ChangeDate2(strDate);
				}
			}
			list =  dao.findDK(strDate.replaceAll("-",""));

			HSSFCellStyle contentStyle = workbook.createCellStyle();
			contentStyle.setFont(contentfont);
			contentStyle.setAlignment(HSSFCellStyle.ALIGN_LEFT);
			contentStyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
			contentStyle.setBorderBottom((short) 1);
			contentStyle.setBorderTop((short) 1);
			contentStyle.setBorderLeft((short) 1);
			contentStyle.setBorderRight((short) 1);
			for (int i = 0; list != null && i < list.size(); i++) {
				DkListModel model = (DkListModel)list.get(i);
				HSSFRow tmpRow = aSheet.createRow(i + 3);
				ExcelRow tmpexcelRow = new ExcelRow(tmpRow);
				tmpexcelRow.setSheet(aSheet);
				tmpexcelRow.setCellStyle(contentStyle);
				if (i == 0 || i == 1) {
					tmpexcelRow.addCell(model.getOrg_name(), 2);
				}
				if (i == 2) {
					tmpexcelRow.addCell("ʡ����Ӫҵ��", 1, 5);
				}
				if (i > 2 && i < 7) {
					tmpexcelRow.addCell(" ");
				}
				if (i == 7) {
					tmpexcelRow.addCell("Խ��֧��", 1, 4);
				}
				if (i > 7 && i < 11) {
					tmpexcelRow.addCell(" ");
				}
				if (i == 11) {
					tmpexcelRow.addCell("С��֧��", 1, 6);
				}
				if (i > 11 && i < 17) {
					tmpexcelRow.addCell(" ");
				}
				if (i == 17) {
					tmpexcelRow.addCell("�л�֧��", 1, 9);
				}
				if (i > 17 && i < 26) {
					tmpexcelRow.addCell(" ");
				}
				if (i == 26) {
					tmpexcelRow.addCell("����֧��", 1, 6);
				}
				if (i > 26 && i < 32) {
					tmpexcelRow.addCell(" ");
				}
				if (i == 32) {
					tmpexcelRow.addCell("����֧��", 1, 6);
				}
				if (i > 32 && i < 38) {
					tmpexcelRow.addCell(" ");
				}
				if (i == 38) {
					tmpexcelRow.addCell("����֧��", 1, 6);
				}
				if (i > 38 && i < 44) {
					tmpexcelRow.addCell(" ");
				}
				if (i == 44) {
					tmpexcelRow.addCell("���ݴ��֧��", 1, 6);
				}
				if (i > 44 && i < 50) {
					tmpexcelRow.addCell(" ");
				}
				if (i == 50) {
					tmpexcelRow.addCell("����֧��", 1, 7);
				}
				if (i > 50 && i < 57) {
					tmpexcelRow.addCell(" ");
				}
				if (i == 57) {
					tmpexcelRow.addCell("���֧��", 1, 6);
				}
				if (i > 57 && i < 63) {
					tmpexcelRow.addCell(" ");
				}
				if (i == 63) {
					tmpexcelRow.addCell("��ӱ�֧��", 1, 6);
				}
				if (i > 63 && i < 69) {
					tmpexcelRow.addCell(" ");
				}
				if (i == 69) {
					tmpexcelRow.addCell("����֧��", 1, 8);
				}
				if (i > 69 && i < 77) {
					tmpexcelRow.addCell(" ");
				}
				if (i == 77) {
					tmpexcelRow.addCell("����֧��", 1, 5);
				}
				if (i > 77 && i < 82) {
					tmpexcelRow.addCell(" ");
				}
				if (i == 82) {
					tmpexcelRow.addCell("������֧��", 1, 6);
				}
				if (i > 82 && i < 88) {
					tmpexcelRow.addCell(" ");
				}
				if (i == 88) {
					tmpexcelRow.addCell("����֧��", 1, 4);
				}
				if (i > 88 && i < 92) {
					tmpexcelRow.addCell(" ");
				}
				if (i == 92) {
					tmpexcelRow.addCell("��خ֧��", 1, 6);
				}
				if (i > 92 && i < 98) {
					tmpexcelRow.addCell(" ");
				}
				if (i == 98) {
					tmpexcelRow.addCell("ҫ��֧��");
				}
				if (i == 99) {
					tmpexcelRow.addCell("ʡϽ��", 1, 8);
				}
				if (i > 99 && i < 107) {
					tmpexcelRow.addCell(" ");
				}
				if (i>1) {
					tmpexcelRow.addCell(model.getOrg_name());
				}
				if (iRptType == 1) {
					tmpexcelRow.addCell(DBISOtoGB.Conver(model.getDkhj_curr()));
					tmpexcelRow.addCell(DBISOtoGB.Conver(model.getDkhj_pre()));
					tmpexcelRow.addCell(DBISOtoGB.Conver(model.getDkhj_nc()));
				}
				if(iRptType==1||iRptType==2){
					tmpexcelRow.addCell(DBISOtoGB.Conver(model.getDg_dkye()));
					tmpexcelRow.addCell(DBISOtoGB.Conver(model.getDg_pre()));
					tmpexcelRow.addCell(DBISOtoGB.Conver(model.getDg_nc()));
				}
				if(iRptType==1||iRptType==3){
					tmpexcelRow.addCell(DBISOtoGB.Conver(model.getGd_dkye()));
					tmpexcelRow.addCell(DBISOtoGB.Conver(model.getGd_pre()));
					tmpexcelRow.addCell(DBISOtoGB.Conver(model.getGd_nc()));
				}
				if(iRptType==1||iRptType==4){
					tmpexcelRow.addCell(DBISOtoGB.Conver(model.getTx_dkye()));
					tmpexcelRow.addCell(DBISOtoGB.Conver(model.getTx_pre()));
					tmpexcelRow.addCell(DBISOtoGB.Conver(model.getTx_nc()));
				}
			}

			response.setContentType("application/vnd.ms-excel");
			response.setContentType("application/vnd.ms-excel;charset=GBK");
			SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMdd");
			Date date2 = new Date();
			String date1 = formatter.format(date2);
			response.setHeader("Content-Disposition",
					"attachment;filename= dkList" + date1 + "excel.xls");
			ServletOutputStream sos = response.getOutputStream();
			workbook.write(sos);
			sos.flush();
			sos.close();

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
