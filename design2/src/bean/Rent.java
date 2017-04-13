package bean;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import util.DBUtil;

public class Rent {
	DBUtil db=DBUtil.getDB();
	
	private String rid;
	private String rcid;
	private String rcuid;
	private String ryajin;
	private String renttime;
	private String backtime;
	private String realtime;
	private String realpay;
	private String rflag;
	private String cname;
	private String cid;
	private String rday;
	
	public String getRday() {
		return rday;
	}
	public void setRday(String rday) {
		this.rday = rday;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public String getCid() {
		return cid;
	}
	public void setCid(String cid) {
		this.cid = cid;
	}
	public String getRid() {
		return rid;
	}
	public void setRid(String rid) {
		this.rid = rid;
	}
	public String getRcid() {
		return rcid;
	}
	public void setRcid(String rcid) {
		this.rcid = rcid;
	}
	public String getRcuid() {
		return rcuid;
	}
	public void setRcuid(String rcuid) {
		this.rcuid = rcuid;
	}
	public String getRyajin() {
		return ryajin;
	}
	public void setRyajin(String ryajin) {
		this.ryajin = ryajin;
	}
	public String getRenttime() {
		return renttime;
	}
	public void setRenttime(String renttime) {
		this.renttime = renttime;
	}
	public String getBacktime() {
		return backtime;
	}
	public void setBacktime(String backtime) {
		this.backtime = backtime;
	}
	public String getRealtime() {
		return realtime;
	}
	public void setRealtime(String realtime) {
		this.realtime = realtime;
	}
	public String getRealpay() {
		return realpay;
	}
	public void setRealpay(String realpay) {
		this.realpay = realpay;
	}
	public String getRflag() {
		return rflag;
	}
	public void setRflag(String rflag) {
		this.rflag = rflag;
	}
	
	/**
	 * 功能：遍历租赁表
	 */
	public ArrayList<Rent> rentList(){
		ArrayList<Rent> list=new ArrayList<Rent>();
		String sql="SELECT c.cid,c.cname,r.rid,r.rcid,r.rcuid,r.ryajin,r.renttime,r.backtime,r.realtime,r.realpay,r.rflag FROM rent AS r,customer AS c WHERE r.rcuid=c.cid ";
		System.out.println("遍历租赁："+sql);
		ResultSet rs=db.executeQuery(sql);
		try {
			while(rs.next()){
				Rent t=new Rent();
				
				t.setRid(rs.getString("rid"));
				t.setRcid(rs.getString("rcid"));
				t.setCname(rs.getString("cname"));
				t.setCid(rs.getString("rcuid"));
				t.setRyajin(rs.getString("ryajin"));
				t.setRealpay(rs.getString("realpay"));
				t.setRenttime(rs.getString("renttime"));
				t.setBacktime(rs.getString("backtime"));
				t.setRealtime(rs.getString("realtime"));
				if(rs.getString("rflag").equals("0")){
					t.setRflag("未归还");
				}else{
					t.setRflag("已归还");
				}
				
				
				list.add(t);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	/**
	 * 查询自己的租赁历史纪录
	 */
	public ArrayList<Rent> getRent(String name){
		ArrayList<Rent> list=new ArrayList<Rent>();
		String sql="select cid from customer where cname='"+name+"' ";
		ResultSet rs=db.executeQuery(sql);
		try {
			if(rs.next()){
				String id=rs.getString("cid");
				String sql2="select rcid,ryajin,renttime,backtime,realtime,realpay,rflag from rent where rcuid="+id+" ";
				ResultSet rs2=db.executeQuery(sql2);
				try {
					while(rs2.next()){
						Rent r=new Rent();
						r.setRcid(rs2.getString("rcid"));
						r.setRyajin(rs2.getString("ryajin"));
						r.setRenttime(rs2.getString("renttime"));
						r.setBacktime(rs2.getString("backtime"));
						r.setRealtime(rs2.getString("realtime"));
						r.setRealpay(rs2.getString("realpay"));
						if(rs2.getString("rflag").equals("0")){
							r.setRflag("未归还");
						}else{
							r.setRflag("已归还");
						}
						list.add(r);
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		return list;
	}
	/**
	 * 添加一条租车信息
	 */
	public boolean rentCar(String cid,String uname,String yajin,String rtime,String btime,String day){
		boolean b=false;
		String sql="select cid from customer where cname='"+uname+"'";
		ResultSet rs=db.executeQuery(sql);
		try {
			if(rs.next()){
				String id=rs.getString("cid");
				String sql2="insert into rent(rcid,rcuid,ryajin,renttime,backtime,rday,rflag)values('"+cid+"','"+id+"','"+yajin+"','"+rtime+"','"+btime+"',"+day+",0)";
				int num=db.executeUpdate(sql2);
				if(num>0){
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
	 * 功能：客户未还车表
	 */
	public ArrayList<Rent> getRentList(String name){
		ArrayList<Rent> list=new ArrayList<Rent>();
		String sql="select cid from customer where cname='"+name+"' ";
		ResultSet rs=db.executeQuery(sql);
		try {
			if(rs.next()){
				String id=rs.getString("cid");
				String sql2="select rcid,ryajin,renttime,backtime from rent where rcuid="+id+" and rflag=0 ";
				System.out.println("没还车"+sql2);
				ResultSet rs2=db.executeQuery(sql2);
				try {
					while(rs2.next()){
						Rent r=new Rent();
						r.setRcid(rs2.getString("rcid"));
						r.setRyajin(rs2.getString("ryajin"));
						r.setRenttime(rs2.getString("renttime"));
						r.setBacktime(rs2.getString("backtime"));
						list.add(r);
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		return list;
	}
	
	/**
	 * 功能：取出本该租的天数
	 */
	public String getDay(String name){
		String day="";
		String sql="select cid from customer where cname='"+name+"'";
		System.out.println("本该租的天数"+sql);
		ResultSet rs=db.executeQuery(sql);
		try {
			if(rs.next()){
				String id=rs.getString("cid");
				String sql2="select rday from rent where rcuid="+id;
				ResultSet rs2=db.executeQuery(sql2);
				if(rs2.next()){
					day=rs2.getString("rday");
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return day;
	}
	
	/**
	 * 功能：获取日租金
	 */
	public String getMoney(String cid){
		String zj="";
		String sql="SELECT r.rcid,c.cid,c.cxid,c.cpid,x.xid,x.xzujin FROM car AS c,xinghao AS X,rent AS r WHERE r.rcid=c.cid AND c.cxid=x.xid AND r.rcid='"+cid+"' ";
		System.out.println("日租金"+sql);
		ResultSet rs=db.executeQuery(sql);
		try {
			if(rs.next()){
				zj=rs.getString("xzujin");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return zj;
	}
	
	/**
	 * 功能：还车时修改记录
	 */
	public boolean upRent(String cid,String name,String rtime,String rpay){
		boolean b=false;
		String sql="select cid from customer where cname='"+name+"' ";
		ResultSet rs=db.executeQuery(sql);
		try {
			if(rs.next()){
				String id=rs.getString("cid");
				String sql2="update rent set realtime='"+rtime+"',realpay='"+rpay+"',rflag=1 where rcid='"+cid+"' and rcuid="+id;
				int num=db.executeUpdate(sql2);
				if(num>0){
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
	 * 功能：获取租车总额
	 */
	public double getRentMoney(){
		double d=0;
		String sql="select realpay from rent where rflag=1 ";
		ResultSet rs=db.executeQuery(sql);
		try {
			while(rs.next()){
				d=d+Double.parseDouble(rs.getString("realpay"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return d;
	}
	

}





