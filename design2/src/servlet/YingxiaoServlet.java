package servlet;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Youhui;
import util.DateUtil;

/**
 * Servlet implementation class YingxiaoServlet
 */
public class YingxiaoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public YingxiaoServlet() {
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
		String str=request.getParameter("container");
		String end=request.getParameter("etime");
		
		DateUtil d=new DateUtil();
		Youhui yh=new Youhui();
		boolean b=yh.saveYouhui(str,d.getTime(),end);
		if(b){
			System.out.println("营销活动添加成功");
		}else{
			System.out.println("营销活动添加失败");
		}
		
		
		request.getRequestDispatcher("yingxiao.jsp").forward(request, response);
	}

}
