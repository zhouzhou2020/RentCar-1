package filter;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

public class MyRequest extends HttpServletRequestWrapper {
	
	HttpServletRequest request=null;
	
	public MyRequest(HttpServletRequest request) {
		super(request);
		this.request=request;
		// TODO Auto-generated constructor stub
	}
	public String getParameter(String name){
		String value=super.getParameter(name);
		if(value!=null){
			String method=request.getMethod();
			if(method.equals("GET")){
				try {
					value=new String(value.getBytes("iso-8859-1"),"utf8");
				} catch (UnsupportedEncodingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		return value;
	}
}
