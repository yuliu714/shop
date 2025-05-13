package org;

import java.sql.*;
import java.util.*;

public class DBBean
{

	static String driver="com.mysql.cj.jdbc.Driver";
	static String url="jdbc:mysql://localhost:3306/shop";
	static String user="root";
	static String password="000000";

	static Connection con;
	static PreparedStatement psGoodList;
	static PreparedStatement psGoodFromIdToPrice;
	static PreparedStatement psGoodFromIdToDetail;
	static PreparedStatement psCountRecords;
	static int span=5;
	
	static
	{
		try
		{
			Class.forName(driver);
con=DriverManager.getConnection(url,user,password);
			psGoodList=
			con.prepareStatement(
				"select sid,sname,sprice from good",
				ResultSet.TYPE_SCROLL_SENSITIVE,
				ResultSet.CONCUR_READ_ONLY);
			psGoodFromIdToPrice=con.prepareStatement("select sprice from good where sid=?");
			psGoodFromIdToDetail=con.prepareStatement("select sname,sprice from good where sid=?");
		    psCountRecords=con.prepareStatement(
		     "select count(sid) from good"	
		    );
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	public static String[][] getGoodList(int cp)
	{
	    String[][] result=null;
	    Vector v=new Vector();
	    try
	    {
	    	ResultSet rs=psGoodList.executeQuery();
	    	if(cp!=1)
	    	{
	    		rs.absolute((cp-1)*span);
	    	}
	    	
	    	int count=1;
	    	
	    	while(rs.next()&&count<=span)
	    	{
	    		count++;
	    		String[] tempsa=new String[3];
	    		tempsa[0]=rs.getString(1);
	    		tempsa[1]=rs.getString(2);
	    		tempsa[2]=rs.getString(3);
	    		v.add(tempsa);
	    	}
	        int size=v.size();
	        result=new String[size][];
	        for(int i=0;i<size;i++)
	        {
	        	result[i]=(String[])v.elementAt(i);
	        }
	    }
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		
		return result;
	}
	
	public static double getPrice(String sid)
	{
		double dd=0;
		try			
		{
			psGoodFromIdToPrice.setString(1,sid);
			ResultSet rs=psGoodFromIdToPrice.executeQuery();
			rs.next();
			dd=Double.parseDouble(rs.getString(1));
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return dd;
	}
	
	public static String[] getDetail(String sid)
	{
		String[] ss=null;
		try			
		{
			psGoodFromIdToDetail.setString(1,sid);
			ResultSet rs=psGoodFromIdToDetail.executeQuery();
			rs.next();
			ss=new String[2];
			ss[0]=rs.getString(1);
			ss[1]=rs.getString(2);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return ss;
	}
	
	public static int getTotalPage()
	{
		int tp=0;
		try
		{
			ResultSet rs=psCountRecords.executeQuery();
			rs.next();
			int count=rs.getInt(1);
			tp=count/span+((count%span==0)?0:1);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return tp;
	}
	
	public static void main(String args[]) throws SQLException {
		System.out.println(DBBean.getTotalPage());
		//System.out.println(con.isClosed());
	}
	
}