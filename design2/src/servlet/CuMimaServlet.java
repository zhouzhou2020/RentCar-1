package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Customer;

/**
 * Servlet implementation class CuMimaServlet
 */
public class CuMimaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CuMimaServlet() {
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
		Customer cu=new Customer();
		String name=request.getParameter("uname");
		String pwd=request.getParameter("upwd");
		
		boolean b=cu.mimaUpdate(name, pwd);
		if(b){
			System.out.println("客户密码修改成功");
			request.getRequestDispatcher("welcome2.jsp").forward(request, response);
		}else{
			System.out.println("客户密码修改失败");
			request.getRequestDispatcher("welcome2.jsp").forward(request, response);
		}
	
	
	}

}
