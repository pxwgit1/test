package common;
import java.util.Date;
import java.text.SimpleDateFormat;
public class StringFomat {
	//getUtf8
	public static String getUtf8(String s){
		String s1=null;
		try {
			s1 = new String(s.getBytes("iso-8859-1"), "utf-8");
		} catch (Exception e) {
			// TODO: handle exception
		}
		return s1;
	}
	//getDatefromString
	public static java.sql.Date getDatefromString(String s)
	{
		java.sql.Date d1=null;
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			java.util.Date d = sdf.parse(s);
			d1 = new java.sql.Date(d.getTime());
		} catch(Exception e) {
			// TODO: handle finally clause
		}
		return d1;
	}
	//
	public static java.sql.Date getDatefromString1(String s)
	{
		java.sql.Date d1=null;
		try {
			SimpleDateFormat  sdf = new SimpleDateFormat ("yyyy-MM-dd  hh:mm:ss E a ");
			java.util.Date d = sdf.parse(s);
			d1 = new java.sql.Date(d.getTime());
		} catch(Exception e) {
			// TODO: handle finally clause
		}
		return d1;
	}
	//getStringfromDate,java.sql.Date是java.util.Date的子类
	public static String getStringfromDate(Date d)
	{
		String s1=null;
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			s1=sdf.format(d);
		} catch(Exception e) {
			// TODO: handle finally clause
		}
		return s1;
	}
	//replaceNull
}
