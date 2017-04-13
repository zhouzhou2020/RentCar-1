package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Customer;

/**
 * Servlet implementation class CuAddServlet
 */
public class CuAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CuAddServlet() {
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
		String name=request.getParameter("cname");
		String pwd=request.getParameter("cpwd");
		
		boolean b=cu.addCustom(name, pwd);
		if(b){
			System.out.println("用户注册成功");
			request.getRequestDispatcher("qiantai.jsp").forward(request, response);
		}else{
			System.out.println("用户注册失败");
			request.getRequestDispatcher("qiantai.jsp").forward(request, response);
		}
	}

}
