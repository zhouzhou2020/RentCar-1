package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Employ;

/**
 * Servlet implementation class EmployList2Servlet
 */
public class EmployList2Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EmployList2Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Employ em=new Employ();
		
		//总行数
		int totalRows=em.getAllNum();
		//每页三条记录
		int perPage=3;
		//总共分几页
		int totalPages=0;
		if(totalRows%perPage==0 && totalRows!=0){
			totalPages=totalRows/perPage;
		}else{
			totalPages=totalRows/perPage+1;
		}
		//当前第几页
		int nowP=1;
		if(request.getParameter("nowPage")==null){
			nowP=1;
		}else{
			nowP=Integer.parseInt(request.getParameter("nowPage"));
		}
		request.setAttribute("emKey",em.getAllEmploy(nowP, perPage));
		request.getRequestDispatcher("employlist2.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
