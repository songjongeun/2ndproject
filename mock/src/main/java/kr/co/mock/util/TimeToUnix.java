package kr.co.mock.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class TimeToUnix {

		
	public Long tsToSec8601(String timestamp){
		
		// ex)String time ="2016-01-01T00:00:00.000-0000";
		  if(timestamp == null) return null;
		  try {
		    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSZ");
		    Date dt = sdf.parse(timestamp);
		    long epoch = dt.getTime();
		    return (long)(epoch);
		  } catch(ParseException e) {
		     return null;
		  }
		  
	}


}
