package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Customer;

/**
 * Servlet implementation class CuLoginServlet
 */
public class CuLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CuLoginServlet() {
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
		String name=request.getParameter("cuName");
		String pwd=request.getParameter("cuPwd");
		boolean b=cu.isLogin(name, pwd);
		if(b){
			System.out.println("登陆成功");
			request.setAttribute("name", name);
			request.getRequestDispatcher("shouye.jsp").forward(request, response);
		}else{
			System.out.println("登陆失败");
			request.getRequestDispatcher("qiantai.jsp").forward(request, response);
		}
	}

}
