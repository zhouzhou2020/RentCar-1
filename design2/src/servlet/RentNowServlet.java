package servlet;

import java.io.IOException;
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
 * Servlet implementation class RentNowServlet
 */
public class RentNowServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RentNowServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Car c=new Car();
		Customer cu=new Customer();
		Rent r=new Rent();
		String cid=request.getParameter("carId");
		String name=request.getParameter("uname");
		String yajin=request.getParameter("yajin");
		String zujin=request.getParameter("zujin");
		String day=request.getParameter("howday");
		int mDay=Integer.parseInt(day);
		
		Date d=new Date();
		SimpleDateFormat sdf=new SimpleDateFormat("YYYY-MM-dd");
		String today=sdf.format(d);//今天
		String backDay=sdf.format(new Date(d.getTime() + mDay * 24 * 60 * 60 * 1000));//几天后的日期
		
		//修改车辆状态
		boolean b=c.rentCar(cid);
		if(b){
			System.out.println("状态变成已出租");
		}else{
			System.out.println("出租状态失败");
		}
		
		boolean s=r.rentCar(cid, name, yajin, today, backDay,day);
		if(s){
			System.out.println("添加租车信息成功");
		}else{
			System.out.println("添加租车信息失败");
		}
		request.getRequestDispatcher("success.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
