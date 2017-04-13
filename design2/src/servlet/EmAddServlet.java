package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Employ;

/**
 * Servlet implementation class EmAddServlet
 */
public class EmAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EmAddServlet() {
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
		Employ em=new Employ();
		
		String name=request.getParameter("ename");
		String pwd=request.getParameter("epwd");
		String sex=request.getParameter("esex");
		String age=request.getParameter("eage");
		String tel=request.getParameter("etel");
		String idcard=request.getParameter("eidcard");
		String lv=request.getParameter("elv");
		
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
		
		boolean b=em.emAdd(name, pwd, sex, age, tel, idcard, lv);
		if(b){
			System.out.println("员工添加成功");
			request.setAttribute("pages",totalPages);
			request.setAttribute("now", nowP);
			request.setAttribute("emKey",em.getAllEmploy(nowP, perPage));
			request.getRequestDispatcher("employlist.jsp").forward(request, response);
		}else{
			System.out.println("员工添加失败");
			request.setAttribute("pages",totalPages);
			request.setAttribute("now", nowP);
			request.setAttribute("emKey",em.getAllEmploy(nowP, perPage));
			request.getRequestDispatcher("employlist.jsp").forward(request, response);
		}
	}

}
