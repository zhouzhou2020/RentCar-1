package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Customer;

/**
 * Servlet implementation class TestNameServlet
 */
public class TestNameServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TestNameServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Customer cu=new Customer();
		response.setContentType("text/html; charset=UTF-8");    //告知客户端以UTF8形式编码
		PrintWriter out=response.getWriter();
		String name=request.getParameter("name");
		name=URLDecoder.decode(name,"utf8");    //处理中文传值乱码
		
		boolean b=cu.searchCu(name);
		if(b){
				out.println("用户名已经存在");
		}else{
			if(name.length()==0){
				out.println("姓名不能为空");
			}else{
				out.println("用户名可以正常使用");
			}
		}
		out.flush();
		out.close();
	
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
