package com.bocom.midserv.base;

/**
 * �˴���������������
 * �������ڣ�(2003-5-29 17:12:36)
 * @author��Administrator
 */
import java.sql.*;
import java.util.*;
import java.io.*;
import javax.naming.*;

public class MidObject extends EBObject {
    public Connection _con = null;
    public Statement st = null;
    public ResultSet rs = null;
    
    //* ���ݿ��������
    //private String db_host = "182.39.161.221";
    //private String db_port = "6006";
    //private String db_user = "miduser";
    //private String db_passwd = "miduser";

    //* ͨѶ��������
    //private String host_ip = "182.39.161.221";
    //private int host_port = 3555;
/**
 * MidObject ������ע�⡣
 */
public MidObject() {
	super();
}
/**
 * ������ݿ�����
 * �������ڣ�(2003-5-30 10:50:10)
 * @exception com.bocom.midserv.base.EBException �쳣˵����
 */
public void getDBConnection() throws EBException {

    //* single connection 
    //MidDbTools myMidDbTools = new MidDbTools();
    //if (_con == null)
    //_con = myMidDbTools.connect(db_host,db_port,db_user,db_passwd);

    //* datasource connection viar weblogic def
    try {
        Context ctx = new InitialContext();
        javax.sql.DataSource ds = (javax.sql.DataSource) ctx.lookup("MidServPoolDs");
        _con = ds.getConnection();
        if(_con != null)
                System.out.print("getDBConnection������ݿ�����:[" + _con.toString() + "]\n");
        else
                System.out.print("getDBConnection������ݿ�����ʧ�ܣ�");
    } catch (Exception e) {
    	System.out.print("getDBConnection������ݿ������쳣��");
        e.printStackTrace();
    }

}


public void releaseDBConnection()
        throws SQLException
    {
    	try
        {
            if(rs != null)
            {
                System.out.print("releaseDBConnection���ݿ�����rs�ͷųɹ�![" + rs.toString() + "]\n");
                rs.close();
            } else
            {
                System.out.print("releaseDBConnection���ݿ�����rs����Ϊ��!\n");
            }
        }
        catch(Exception e)
        {
            System.out.print("releaseDBConnection���ݿ�����st�ͷ�ʧ��!\n");
            e.printStackTrace();
        }
    	try
        {
            if(st != null)
            {
                System.out.print("releaseDBConnection���ݿ�����st�ͷųɹ�![" + st.toString() + "]\n");
                st.close();
            } else
            {
                System.out.print("releaseDBConnection���ݿ�����st����Ϊ��!\n");
            }
        }
        catch(Exception e)
        {
            System.out.print("releaseDBConnection���ݿ�����st�ͷ�ʧ��!\n");
            e.printStackTrace();
        }
        try
        {
            if(_con != null)
            {
                System.out.print("releaseDBConnection���ݿ�����_con�ͷųɹ�![" + _con.toString() + "]\n");
                _con.close();
            } else
            {
                System.out.print("releaseDBConnection���ݿ�����_con����Ϊ��!\n");
            }
        }
        catch(Exception e)
        {
            System.out.print("releaseDBConnection���ݿ�����_con�ͷ�ʧ��!\n");
            e.printStackTrace();
        }
    }



/**
 * �˴����뷽��������
 * �������ڣ�(2003-5-30 16:32:04)
 * @return String
 * @param send_buf java.lang.String
 * @param recv_buf java.lang.String
 */
public String invokeTcpConnect(
    String send_buf,
    String s_host_ip,
    int i_host_port) {
    String recv_buf = null;
    try {
        MidNetworkTools myMidNetworkTools = new MidNetworkTools();
        String str_len = String.valueOf(send_buf.length());
        while (str_len.length() < 4) {
            str_len = "0" + str_len;
        }
        myMidNetworkTools.set_buf_in(str_len + send_buf);
        recv_buf = myMidNetworkTools.tcpConnect(s_host_ip, i_host_port);
    } catch (IOException e) {
        e.printStackTrace();
    }
    return recv_buf;

}

}
