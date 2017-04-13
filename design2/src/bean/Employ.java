package bean;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import util.DBUtil;

public class Employ {
	DBUtil db=DBUtil.getDB();
	
	private String id;
	private String name;
	private String password;
	private String sex;
	private String age;
	private String tel;
	private String idcard;
	private String leval;
	private String flag;
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
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getIdcard() {
		return idcard;
	}
	public void setIdcard(String idcard) {
		this.idcard = idcard;
	}
	public String getLeval() {
		return leval;
	}
	public void setLeval(String leval) {
		this.leval = leval;
	}
	public String getFlag() {
		return flag;
	}
	public void setFlag(String flag) {
		this.flag = flag;
	}
	
	
	/**
	 * 
	 * 功能：判断用户是否登陆成功<br>
	 * 参数：用户名，密码<br>
	 * 返回值：布尔型
	 */
	public boolean isLogin(String name,String password){
		boolean b=false;
		String sql="select ename,epassword from employee where ename='"+name+"' and epassword='"+password+"'";
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
	 * 功能：判断员工等级
	 */
	public boolean cuLv(String name){
		boolean b=false;
		String sql="select elv from employee where ename='"+name+"' ";
		ResultSet rs=db.executeQuery(sql);
		try {
			while(rs.next()){
				if(rs.getString("elv").equals("0")){
					b=true;
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return b;
	}
	
	/**
	 * 功能：遍历所有员工<br>
	 * 参数：无<br>
	 * 返回值：数组线性表List
	 */
	public ArrayList<Employ> getAllEmploy(int nowp, int perpage){
		ArrayList<Employ> list=new ArrayList<Employ>();
		String sql="select eid,epassword,ename,esex,eage,etel,eidcard,elv from employee where eflag=0 limit "+(nowp-1)*perpage+","+perpage+" ";
		ResultSet rs=db.executeQuery(sql);
		try {
			while(rs.next()){
				Employ em=new Employ();
				em.setId(rs.getString("eid"));
				em.setName(rs.getString("ename"));
				em.setPassword(rs.getString("epassword"));
				em.setSex(rs.getString("esex"));
				em.setAge(rs.getString("eage"));
				em.setTel(rs.getString("etel"));
				em.setIdcard(rs.getString("eidcard"));
				if(rs.getString("elv").equals("0")){
					em.setLeval("管理员");
				}else{
					em.setLeval("员工");
				}
				
				list.add(em);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	/**
	 * 功能：员工总记录数
	 */
	public Integer getAllNum(){
		int num=0;
		String sql="select count(*) as num from employee where eflag=0 ";
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
	
	/**
	 * 功能：修改员工<br>
	 * 参数：员工的所有信息<br>
	 * 返回值：布尔
	 */
	public boolean emUpdate(String id,String newName,String newPwd,String newSex,String newAge,String newTel,String newIDC,String newLv){
		String sql="update employee set ename='"+newName+"',epassword='"+newPwd+"',esex='"+newSex+"',eage='"+newAge+"',etel='"+newTel+"',eidcard='"+newIDC+"',elv='"+newLv+"' where eid="+id;
		return db.executeUpdate(sql)>0?true:false;
	}
	
	/**
	 * 功能：删除员工<br>
	 * 参数：id<br>
	 * 返回值：布尔
	 */
	public boolean emDel(String id){
		String sql="update employee set eflag=1 where eid="+id;
		System.out.println("员工删："+sql);
		return db.executeUpdate(sql)>0?true:false;
	}

	/**
	 * 功能：添加员工<br>
	 * 参数：员工的所有信息<br>
	 * 返回值：布尔
	 */
	public boolean emAdd(String newName,String newPwd,String newSex,String newAge,String newTel,String newIDC,String newLv){
		String sql="insert into employee(ename,epassword,esex,eage,etel,eidcard,elv,eflag)values('"+newName+"','"+newPwd+"','"+newSex+"','"+newAge+"','"+newTel+"','"+newIDC+"','"+newLv+"',0)";
		System.out.println("添员工："+sql);
		return db.executeUpdate(sql)>0?true:false;
	}



}
