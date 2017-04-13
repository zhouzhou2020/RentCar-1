package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Car;

/**
 * Servlet implementation class PinpaiDelServlet
 */
public class PinpaiDelServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PinpaiDelServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String id=request.getParameter("id");
		
		Car c=new Car();
		
		
		boolean b=c.pinpaiDel(id);
		if(b){
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
			
			System.out.println("品牌删除成功");
			request.setAttribute("pages",totalPages);
			request.setAttribute("now", nowP);
			request.setAttribute("carlist",c.getAllCar(nowP, perPage));
			request.getRequestDispatcher("carlist.jsp").forward(request,response);
		}else{
			//总行数
			int totalRows=c.getPinpaiNum();
			//每页三条记录
			int perPage=3;
			//总共分几页
			int totalPages=0;
			if(totalRows%perPage==0 && totalRows!=0){
				totalPages=totalRows/perPage;
			}else{
				totalPages=totalRows/perPage+1;				}
			//当前第几页
			int nowP=1;
			if(request.getParameter("nowPage")==null){
				nowP=1;
			}else{
				nowP=Integer.parseInt(request.getParameter("nowPage"));
			}
			request.setAttribute("pages",totalPages);
			request.setAttribute("now", nowP);
			
			System.out.println("品牌删除失败");
			request.setAttribute("pinpai", c.getAllPinpai(nowP, perPage));
			request.getRequestDispatcher("pinpaiSelect.jsp").forward(request, response);
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
