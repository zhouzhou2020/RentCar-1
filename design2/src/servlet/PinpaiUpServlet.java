package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Car;

/**
 * Servlet implementation class PinpaiUpServlet
 */
public class PinpaiUpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PinpaiUpServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Car c=new Car();
		String id=request.getParameter("id");
		String name=request.getParameter("name");
		
		//总行数
				int totalRows=c.getAllCarNum();
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
				
		boolean b=c.pinpaiUp(id, name);
		if(b){
			System.out.println("品牌修改成功");
			request.setAttribute("pages",totalPages);
			request.setAttribute("now", nowP);
			request.setAttribute("carlist",c.getAllCar(nowP, perPage));
			request.getRequestDispatcher("carlist.jsp").forward(request, response);
		}else{
			System.out.println("品牌修改失败");
			request.setAttribute("pages",totalPages);
			request.setAttribute("now", nowP);
			request.setAttribute("carlist",c.getAllCar(nowP, perPage));
			request.getRequestDispatcher("carlist.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
