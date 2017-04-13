package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Customer;
import bean.Employ;

/**
 * Servlet implementation class LoginServlet
 */
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
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
		String piccode = (String) request.getSession().getAttribute("piccode");
		String checkcode = request.getParameter("checkcode");
		checkcode = checkcode.toUpperCase();
		response.setContentType("text/html;charset=gbk");
		if(checkcode.equals(piccode)){
			System.out.println("验证码填写成功");
			String name=request.getParameter("uname");
			String pwd=request.getParameter("upwd");
			
			Employ em=new Employ();
			boolean b=em.isLogin(name, pwd);
			if(b){
				System.out.println("登陆成功");
				boolean l=em.cuLv(name);
				if(l){
					System.out.println("管理员进入");
					request.getSession().setAttribute("flag",name);
					request.getRequestDispatcher("main.jsp").forward(request, response);
				}else{
					System.out.println("员工进入");
					request.getSession().setAttribute("flag",name);
					request.getRequestDispatcher("main3.jsp").forward(request, response);
				}
			}else{
				System.out.println("登陆失败");
				request.getRequestDispatcher("login.jsp").forward(request, response);
			}
			
		}else{
			System.out.println("验证码填写错误");
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
		
	}

}
