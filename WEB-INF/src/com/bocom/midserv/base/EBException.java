package com.bocom.midserv.base;

/**
 * EBException �࣬�����ڲ��쳣
 * @author: chengjj
 */
public class EBException extends Exception {

    /**
    �쳣������Ϣ����
    */
    private String errMsg = null;

    /**
    �쳣������
    */
    private String errCode = null;
/**
 * EBBusinessException ���캯��
 * @param aCode java.lang.String ������
 * @param aMessage java.lang.String ������Ϣ
 */
public EBException(String aCode, String aMessage) {

    super(aMessage);

    errCode = aCode;
    errMsg = aMessage;

}
/**
 * �����쳣������
 * �������ڣ�(2002-1-18 10:37:56)
 * @return java.lang.String
 */
public String getErrorCode() {
    return errCode;
}
/**
 * �����쳣������Ϣ
 * �������ڣ�(2002-1-18 10:37:56)
 * @return java.lang.String
 */
public String getErrorMessage() {
	return errMsg;
}
/**
 * ���ô�����
 * �������ڣ�(2002-1-18 10:37:56)
 * @return java.lang.String
 */
public void setErrorCode(String sCode) {
    errCode = sCode;
}
/**
 * �����쳣������Ϣ
 * �������ڣ�(2002-1-18 10:37:56)
 * @return java.lang.String
 */
public void setErrorMessage(String sMsg) {
    errMsg = sMsg;
}
/**
 * ���쳣ת�����ִ�
 * �������ڣ�(2001-11-21 15:49:57)
 * @return java.lang.String
 */
public String toString() {
    return errCode + ":" + errMsg;
}
}
