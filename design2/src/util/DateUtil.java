package util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtil {
	public String getTime(){
		Date d=new Date();
		SimpleDateFormat sdf=new SimpleDateFormat("YYYY-MM-dd HH:mm:ss");
		String now=sdf.format(d);
		return now;
	}
}
