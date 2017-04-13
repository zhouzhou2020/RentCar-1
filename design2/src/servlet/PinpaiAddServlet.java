package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Car;

/**
 * Servlet implementation class PinpaiAddServlet
 */
public class PinpaiAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PinpaiAddServlet() {
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
		String pname=request.getParameter("pname");
		
		boolean b=c.addPinpai(pname);
		if(b){
			System.out.println("品牌添加成功");
			request.getRequestDispatcher("pinpaiAdd.jsp").forward(request, response);
		}else{
			System.out.println("品牌添加失败");
			request.getRequestDispatcher("pinpaiAdd.jsp").forward(request, response);
		}
	}

}
