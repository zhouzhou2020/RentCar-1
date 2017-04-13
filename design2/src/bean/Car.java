package bean;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import util.DBUtil;

public class Car {
	DBUtil db=DBUtil.getDB();
	
	//品牌
	private String pid;
	private String pinpai;
	private String pflag;
	//型号
	private String xid;
	private String xname;
	private String xpid;
	private String xjinjia;
	private String xshoujia;
	private String xzujin;
	private String xyajin;
	private String xnum;
	private String xflag;

	//车辆
	private String cid;
	private String cxid;
	private String cflag;
	
	
	private String count;
	private String cXid;
	public String getcXid() {
		return cXid;
	}
	public void setcXid(String cXid) {
		this.cXid = cXid;
	}
	public String getCount() {
		return count;
	}
	public void setCount(String count) {
		this.count = count;
	}
	
	
	//品牌
	public String getPid() {
		return pid;
	}
	public void setPid(String pid) {
		this.pid = pid;
	}
	public String getPinpai() {
		return pinpai;
	}
	public void setPinpai(String pinpai) {
		this.pinpai = pinpai;
	}
	public String getPflag() {
		return pflag;
	}
	public void setPflag(String pflag) {
		this.pflag = pflag;
	}
	//型号
	public String getXid() {
		return xid;
	}
	public void setXid(String xid) {
		this.xid = xid;
	}
	public String getXname() {
		return xname;
	}
	public void setXname(String xname) {
		this.xname = xname;
	}
	public String getXpid() {
		return xpid;
	}
	public void setXpid(String xpid) {
		this.xpid = xpid;
	}
	public String getXjinjia() {
		return xjinjia;
	}
	public void setXjinjia(String xjinjia) {
		this.xjinjia = xjinjia;
	}
	public String getXshoujia() {
		return xshoujia;
	}
	public void setXshoujia(String xshoujia) {
		this.xshoujia = xshoujia;
	}
	public String getXzujin() {
		return xzujin;
	}
	public void setXzujin(String xzujin) {
		this.xzujin = xzujin;
	}
	public String getXyajin() {
		return xyajin;
	}
	public void setXyajin(String xyajin) {
		this.xyajin = xyajin;
	}
	public String getXnum() {
		return xnum;
	}
	public void setXnum(String xnum) {
		this.xnum = xnum;
	}
	public String getXflag() {
		return xflag;
	}
	public void setXflag(String xflag) {
		this.xflag = xflag;
	}
	//车辆
	public String getCid() {
		return cid;
	}
	public void setCid(String cid) {
		this.cid = cid;
	}
	public String getCxid() {
		return cxid;
	}
	public void setCxid(String cxid) {
		this.cxid = cxid;
	}
	public String getCflag() {
		return cflag;
	}
	public void setCflag(String cflag) {
		this.cflag = cflag;
	}
	
	//品牌方法
	/**
	 * 功能：添加品牌<br>
	 * 参数：品牌名称<br>
	 * 返回值：布尔
	 */
	public boolean addPinpai(String name){
		String sql="insert into pinpai(pinpai,pflag)values('"+name+"',0)";
		System.out.println("加品牌："+sql);
		return db.executeUpdate(sql)>0?true:false;
	}
	
	/**
	 * 功能：遍历品牌<br>
	 * 参数：id,name,flag
	 * 返回值：list
	 */
	public ArrayList<Car> getAllPinpai(int nowp, int perpage){
		ArrayList<Car> list=new ArrayList<Car>();
		String sql="select pid,pinpai from pinpai where pflag=0 limit "+(nowp-1)*perpage+","+perpage+" ";
		ResultSet rs=db.executeQuery(sql);
		try {
			while(rs.next()){
				Car c=new Car();
				
				c.setPid(rs.getString("pid"));
				c.setPinpai(rs.getString("pinpai"));
				
				list.add(c);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	/**
	 * 功能：获取所有品牌不分页
	 */
	public ArrayList<Car> getAllPinpai2(){
		ArrayList<Car> list=new ArrayList<Car>();
		String sql="select pid,pinpai from pinpai where pflag=0 ";
		ResultSet rs=db.executeQuery(sql);
		try {
			while(rs.next()){
				Car c=new Car();
				
				c.setPid(rs.getString("pid"));
				c.setPinpai(rs.getString("pinpai"));
				
				list.add(c);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	

	/**
	 * 功能：删除品牌
	 */
	public boolean pinpaiDel(String id){
		boolean b=false;
		String sql="select cpid from car where cpid="+id;
		ResultSet rs=db.executeQuery(sql);
		try {
			if(rs.next()){
				return b=false;
			}else{
				String sql2="update pinpai set pflag=1 where pid="+id;
				int num=db.executeUpdate(sql2);
				if(num>0){
					return b=true;
				}else{
					return b=false;
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return b;
	}
	
	/**
	 * 功能：修改品牌
	 */
	public boolean pinpaiUp(String id,String pname){
		String sql="update pinpai set pinpai='"+pname+"' where pid="+id;
		System.out.println("改品牌："+sql);
		return db.executeUpdate(sql)>0?true:false;
	}
	
	/**
	 * 功能：获取品牌总记录
	 */
	public Integer getPinpaiNum(){
		int num=0;
		String sql="select count(*) as num from pinpai where pflag=0 ";
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

	
	//型号方法
	/**
	 * 功能：遍历型号
	 */
	public ArrayList<Car> getAllXinghao(int nowp, int perpage){
		ArrayList<Car> xlist=new ArrayList<Car>();
		
		String sql2="SELECT cxid,COUNT(*) FROM car GROUP BY cxid ";
		ResultSet rs2=db.executeQuery(sql2);
		try {
			while(rs2.next()){
				Car c=new Car();
				c.setCount(rs2.getString("count(*)"));
				c.setcXid(rs2.getString("cxid"));
				xlist.add(c);
			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}finally{
			for(int i=0;i<xlist.size();i++){
				String sql="update xinghao set xnum='"+xlist.get(i).getCount()+"' where xid='"+xlist.get(i).getcXid()+"'";
				int num=db.executeUpdate(sql);
				if(num>0){
					System.out.println("修改数量成功");
				}else{
					System.out.println("修改数量失败");
				}
			}
		}
		
		ArrayList<Car> list=new ArrayList<Car>();
		String sql="select xid,xname,xnum from xinghao where xflag=0 limit "+(nowp-1)*perpage+","+perpage+" ";
		ResultSet rs=db.executeQuery(sql);
		try {
			while(rs.next()){
				Car c=new Car();
				c.setXid(rs.getString("xid"));
				c.setXname(rs.getString("xname"));
				c.setXnum(rs.getString("xnum"));
				list.add(c);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	/**
	 * 功能：型号总记录数
	 */
	public Integer getXinghaoNum(){
		int num=0;
		String sql="select count(*) as num from xinghao where xflag=0 ";
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
	 * 功能：添加型号
	 */
	public boolean xinghaoAdd(String xinghao,String pinpaiID,String jinjia,String shoujia,String zujin,String yajin){
		String sql="insert into xinghao(xname,xpid,xjinjia,xshoujia,xzujin,xyajin,xflag)values('"+xinghao+"','"+pinpaiID+"','"+jinjia+"','"+shoujia+"','"+zujin+"','"+yajin+"',0)";
		System.out.println("添加型号："+sql);
		return db.executeUpdate(sql)>0?true:false;
	}
	
	/**
	 * 功能：删除型号
	 */
	public boolean xinghaoDel(String id){
		boolean b=false;
		String sql="select cxid from car where cxid="+id;
		ResultSet rs=db.executeQuery(sql);
		try {
			if(rs.next()){
				return b=false;
			}else{
				String sql2="update xinghao set xflag=1 where xid="+id;
				int num=db.executeUpdate(sql2);
				if(num>0){
					return b=true;
				}else{
					return b=false;
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return b;
	}
	
	/**
	 * 功能：修改型号
	 */
	public boolean xinghaoUp(String id,String xname){
		String sql="update xinghao set xname='"+xname+"' where xid="+id;
		System.out.println("改型号："+sql);
		return db.executeUpdate(sql)>0?true:false;
	}
	
	//汽车方法
	/**
	 * 功能：遍历所有汽车
	 */
	public ArrayList<Car> getAllCar(int nowp, int perpage){
		ArrayList<Car> list=new ArrayList<Car>();
		String sql="select c.cid,c.cxid,x.xid,p.pid,x.xpid,c.cpid,c.cflag,p.pinpai,x.xname from pinpai as p,xinghao as x,car as c where c.cxid=x.xid and p.pid=x.xpid limit "+(nowp-1)*perpage+","+perpage+" ";
		System.out.println("遍历车："+sql);
		ResultSet rs=db.executeQuery(sql);
		try {
			while(rs.next()){
				Car c=new Car();
				
				c.setCid(rs.getString("cid"));
				c.setPinpai(rs.getString("pinpai"));
				c.setXname(rs.getString("xname"));
				if(rs.getString("cflag").equals("0")){
					c.setCflag("待用");
				}else if(rs.getString("cflag").equals("1")){
					c.setCflag("已出租");
				}else if(rs.getString("cflag").equals("2")){
					c.setCflag("已出售");
				}else{
					c.setCflag("已删除");
				}
				
				list.add(c);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	/**
	 * 功能：获取所有车数量
	 */
	public Integer getAllCarNum(){
		int num=0;
		String sql="select count(*) as num from car ";
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
	 * 功能：添加汽车
	 */
	public boolean carAdd(String cid,String cpid,String cxid){
		String sql="insert into car(cid,cpid,cxid,cflag)values('"+cid+"','"+cpid+"','"+cxid+"',0)";
		return db.executeUpdate(sql)>0?true:false;
	}
	
	/**
	 * 功能：通过型号中pid找到品牌
	 */
	public List<Map<String,Object>> getXinghaoByPinpaiId(String pid){
		List<Map<String,Object>> alist=new ArrayList<Map<String,Object>>();
		DBUtil db=DBUtil.getDB();
		String sql="select xid,xname from xinghao where xpid="+pid;
		System.out.println(sql);
		return db.list(sql);
	}
	

	/**
	 * 功能：删除汽车
	 */
	public boolean carDel(String id){
		String sql="update set cflag=3 where cid='"+id+"' and cflag=0 ";
		return db.executeUpdate(sql)>0?true:false;
	}

	/**
	 * 功能：修改汽车
	 */
	public boolean carUpdate(String id,String flag){
		String sql="update car set cid='"+id+"',cflag="+flag+" where cid='"+id+"' ";
		return db.executeUpdate(sql)>0?true:false;
	}
	
	/**
	 * 共能：只遍历能用的车
	 */
	public ArrayList<Car> getUseCar(int nowp, int perpage){
		ArrayList<Car> list=new ArrayList<Car>();
		String sql="select x.xshoujia,x.xzujin,x.xyajin,c.cid,c.cxid,x.xid,p.pid,x.xpid,c.cpid,p.pinpai,x.xname from pinpai as p,xinghao as x,car as c where c.cxid=x.xid and p.pid=x.xpid and c.cflag=0 limit "+(nowp-1)*perpage+","+perpage+" ";
		System.out.println("遍历能用的车："+sql);
		ResultSet rs=db.executeQuery(sql);
		try {
			while(rs.next()){
				Car a=new Car();
				
				a.setCid(rs.getString("cid"));
				a.setPinpai(rs.getString("pinpai"));
				a.setXname(rs.getString("xname"));
				a.setXshoujia(rs.getString("xshoujia"));
				a.setXzujin(rs.getString("xzujin"));
				a.setXyajin(rs.getString("xyajin"));
				
				list.add(a);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	/**
	 *功能：设定汽车已卖出 
	 */
	public boolean sellCar(String cid){
		String sql="update car set cflag=2 where cid='"+cid+"' ";
		return db.executeUpdate(sql)>0?true:false;
	}
	
	/**
	 * 功能：设定汽车已租出
	 */
	public boolean rentCar(String cid){
		String sql="update car set cflag=1 where cid='"+cid+"' ";
		return db.executeUpdate(sql)>0?true:false;
	}
	/**
	 * 功能：汽车已归还
	 */
	public boolean backCar(String cid){
		String sql="update car set cflag=0 where cid='"+cid+"' ";
		return db.executeUpdate(sql)>0?true:false;
	}
	
	/**
	 * 功能：模糊搜索车型
	 */
	public ArrayList<Car> selectCar(String name){
		ArrayList<Car> list=new ArrayList<Car>();
		String sql="SELECT x.xshoujia,x.xzujin,x.xyajin,c.cid,c.cxid,x.xid,p.pid,x.xpid,c.cpid,p.pinpai,x.xname FROM pinpai AS p,xinghao AS X,car AS c WHERE c.cxid=x.xid AND p.pid=x.xpid AND c.cflag=0 AND x.xname LIKE '%"+name+"%' ";
		ResultSet rs=db.executeQuery(sql);
		try {
			if(rs.next()){
				Car a=new Car();
				
				a.setCid(rs.getString("cid"));
				a.setPinpai(rs.getString("pinpai"));
				a.setXname(rs.getString("xname"));
				a.setXshoujia(rs.getString("xshoujia"));
				a.setXzujin(rs.getString("xzujin"));
				a.setXyajin(rs.getString("xyajin"));
				
				list.add(a);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	/**
	 * 功能;查出可用车总记录数
	 */
	public Integer allCar(){
		int num=0;
		String sql="SELECT COUNT(*) AS num FROM car WHERE cflag=0 ";
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
