package servlet;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Car;
import bean.Customer;
import bean.Rent;

/**
 * Servlet implementation class BackProcessServlet
 */
public class BackProcessServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BackProcessServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Car c=new Car();
		Rent r=new Rent();
		String cid=request.getParameter("cid");
		String name=request.getParameter("uname");
		String yajin=request.getParameter("yajin");
		double yj=Double.parseDouble(yajin);
		System.out.println("yajin"+yj);
		String rtime=request.getParameter("rtime");
		
		//交钱的总额
		double count=0;
		
		//获取日租金
		String z=r.getMoney(cid);
		System.out.println("z"+z);
		double zj=Double.parseDouble(z);
		
		
		//将汽车改成已归还
		boolean a=c.backCar(cid);
		if(a){
			System.out.println("汽车已归还");
		}else{
			System.out.println("汽车归还失败");
		}
		//用了几天
		Date d=new Date();
		SimpleDateFormat sdf=new SimpleDateFormat("YYYY-MM-dd");
		String str=sdf.format(d);
		Date date=null;//今天
		try {
			date = new SimpleDateFormat("yyyy-MM-dd").parse(str);
		} catch (ParseException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		Date be=null;//租车的那天
		try {
			 be = new SimpleDateFormat("yyyy-MM-dd").parse(rtime);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Calendar calendar=Calendar.getInstance();
		calendar.setTime(date);
		double timeend=calendar.getTimeInMillis();
		
		calendar.setTime(be);
		double timethis=calendar.getTimeInMillis();
		double theday=(timeend-timethis)/(1000*60*60*24);//总共的天数
		System.out.println("总共天数"+theday);
		
		
		//本该计划租车的天数
		String day=r.getDay(name);
		System.out.println("day"+day);
		double l=Double.parseDouble(day);
		System.out.println("计划租车天数"+l);
		
		//计算时间是否超出了，并计算总额
		if(theday<=l){
			System.out.println("在预定时间内还车");
			count=theday*zj-yj;
			if(count<0){
				count=yj+count;
			}
		}else{
			System.out.println("超出预定时间还车");
			count=l*zj+(theday-l)*200-yj;
		}
		
		System.out.println("count"+count);
		//付款
			System.out.println("交钱");
			String ze=String.valueOf(count);
			System.out.println("ze"+ze);
			boolean up=r.upRent(cid, name, str, ze);
			if(up){
				System.out.println("租车记录修改成功2");
			}else{
				System.out.println("租车记录修改失败2");
			}
		
		
		request.getRequestDispatcher("successed.jsp").forward(request, response);
		
	}

}
