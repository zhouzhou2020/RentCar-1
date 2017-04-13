package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Buy;
import bean.Car;
import bean.Customer;
import util.DateUtil;

/**
 * Servlet implementation class BuyNowServlet
 */
public class BuyNowServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BuyNowServlet() {
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
		Buy b=new Buy();
		DateUtil du=new DateUtil();
		System.out.println("time"+du.getTime());
		String carId=request.getParameter("carId");
		String uName=request.getParameter("uname");
		String shoujia=request.getParameter("price");
		
		boolean h=c.sellCar(carId);
		if(h){
			System.out.println("汽车状态修改成功");
		}else{
			System.out.println("汽车状态修改失败");
		}	
			System.out.println("购买");
			
			boolean z=b.addBuy(carId, uName, shoujia,du.getTime());
			if(z){
				System.out.println("购买记录添加成功2");
			}else{
				System.out.println("购买记录添加失败2");
			}
		
	
		request.getRequestDispatcher("successed.jsp").forward(request, response);
	
	}

}
