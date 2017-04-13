package servlet;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.IOUtils;

import bean.Customer;

/**
 * Servlet implementation class UploadServlet
 */
public class UploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UploadServlet() {
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
		
		String filedValue="";
		
		DiskFileItemFactory factory=new DiskFileItemFactory();
		ServletFileUpload upload=new ServletFileUpload(factory);
		
		String rootPath=getServletContext().getContextPath();
		System.out.println("相对路径："+rootPath);
		String realPath=getServletContext().getRealPath("pics");
		System.out.println("绝对路径："+realPath);
		
		String fileName="";
		try {
			List<FileItem> list=upload.parseRequest(request);
			for(FileItem item:list){
				if(item.isFormField()){
					String filedName=item.getFieldName();
					System.out.println("filedName:"+filedName);
					//filedValue=item.getString();
					filedValue=new String(item.getString().getBytes("iso-8859-1"),"utf-8");
					System.out.println("filedValue："+filedValue);
				}else{
					fileName=item.getName();
					InputStream in=item.getInputStream();
					OutputStream out=new FileOutputStream(new File(realPath,fileName));
					IOUtils.copy(in, out);
					in.close();
					out.close();
				}
			}
		} catch (FileUploadException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			String path=rootPath+"/pics/"+fileName;
			System.out.println(path);
			boolean b=cu.picAdd(filedValue, path);
			if(b){
				System.out.println("图片路径存入成功");
				request.getRequestDispatcher("welcome2.jsp").forward(request, response);
			}else{
				System.out.println("图片路径存入失败");
				request.getRequestDispatcher("welcome2.jsp").forward(request, response);
			}
		}
	
	
	}

}
