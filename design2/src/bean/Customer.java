package bean;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import util.DBUtil;

public class Customer {
	DBUtil db=DBUtil.getDB();
	
	private String id;
	private String name;
	private String password;
	private String head;
	private String flag;
	
	public String getHead() {
		return head;
	}
	public void setHead(String head) {
		this.head = head;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getFlag() {
		return flag;
	}
	public void setFlag(String flag) {
		this.flag = flag;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	/**
	 * 功能：遍历所有客户<br>
	 * 参数：无<br>
	 * 返回值：数组线性表list
	 */
	public ArrayList<Customer> getAllCustom(int nowp, int perpage){
		ArrayList<Customer> list=new ArrayList<Customer>();
		String sql="select cid,cpassword,cname,cflag from customer where cflag=0 limit "+(nowp-1)*perpage+","+perpage+" ";
		System.out.println("jsdf:"+sql);
		ResultSet rs=db.executeQuery(sql);
		try {
			while(rs.next()){
				Customer cu=new Customer();
				cu.setId(rs.getString("cid"));
				cu.setName(rs.getString("cname"));
				
				if(rs.getString("cflag").equals("0")){
					cu.setFlag("普通顾客");
				}else if(rs.getString("clv").equals("1")){
					cu.setFlag("VIP");
				}else{
					cu.setFlag("黑名单");
				}
				
				list.add(cu);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	/**
	 * 功能：修改用户<br>
	 * 参数：通过id修改所有<br>
	 * 返回值：布尔
	 */
	public boolean cuUpdate(String id,String newName,String newSex,String newAge,String newTel,String newIDC,String newLv){
		String sql="update customer set cname='"+newName+"',clv='"+newLv+"' Where cid="+id;
		System.out.println("客户改："+sql);
		return db.executeUpdate(sql)>0?true:false;
	}
	
	/**
	 * 功能：删除<br>
	 * 参数：id<br>
	 * 返回值：布尔
	 */
	public boolean cuDelete(String id){
		String sql="update customer set cflag=1 where cid="+id;
		System.out.println("拉黑："+sql);
		return db.executeUpdate(sql)>0?true:false;
	}

	/**
	 * 功能：登陆判断
	 */
	public boolean isLogin(String name,String password){
		boolean b=false;
		String sql="select cname,cpassword from customer where cname='"+name+"' and cpassword='"+password+"' and cflag=0 ";
		System.out.println("登陆判断"+sql);
		ResultSet rs=db.executeQuery(sql);
		try {
			if(rs.next()){
				b=true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return b;
	}
	
	/**
	 * 功能：添加用户
	 */
	public boolean addCustom(String name,String password){
		String sql="insert into customer(cname,cpassword,cflag)values('"+name+"','"+password+"',0)";
		return db.executeUpdate(sql)>0?true:false;
	}
	/**
	 * 功能：填加用户图片路径
	 */
	public boolean picAdd(String name,String address){
		String sql="update customer set chead='"+address+"' where cname='"+name+"' ";
		return db.executeUpdate(sql)>0?true:false;
	}
	
	/**
	 * 功能：获取头像地址
	 */
	public String getAddress(String name){
		String ad="";
		String sql="select chead from customer where cname='"+name+"' ";
		System.out.println("地址："+sql);
		ResultSet rs=db.executeQuery(sql);
		try {
			while(rs.next()){
				ad=rs.getString("chead");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ad;
	}
	
	/**
	 * 功能：修改密码
	 */
	public boolean mimaUpdate(String name,String password){
		String sql="update customer set cpassword='"+password+"' where cname='"+name+"' ";
		return db.executeUpdate(sql)>0?true:false;
	}
	
	
	public boolean searchCu(String name){
		boolean b=false;
		String sql="select cname from customer where cname='"+name+"'";
		ResultSet rs=db.executeQuery(sql);
		try {
			if(rs.next()){
				b=true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return b;
	}
	
	/**
	 * 功能：客户总记录数
	 */
	public Integer allCuNum(){
		int num=0;
		String sql="select count(*) as num from customer where cflag=0 ";
		ResultSet rs=db.executeQuery(sql);
		try {
			while(rs.next()){
				num=Integer.parseInt(rs.getString("num"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return num;
	}
	
}
