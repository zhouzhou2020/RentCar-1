package bean;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import util.DBUtil;

public class Buy {
	DBUtil db=DBUtil.getDB();
	
	private String sid;
	private String scid;
	private String scuid;
	private String spay;
	private String selltime;
	private String sflag;
	private String sname;
	private String cid;
	private String cname;
	
	public String getCid() {
		return cid;
	}
	public void setCid(String cid) {
		this.cid = cid;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public String getSid() {
		return sid;
	}
	public void setSid(String sid) {
		this.sid = sid;
	}
	public String getScid() {
		return scid;
	}
	public void setScid(String scid) {
		this.scid = scid;
	}
	public String getScuid() {
		return scuid;
	}
	public void setScuid(String scuid) {
		this.scuid = scuid;
	}
	public String getSpay() {
		return spay;
	}
	public void setSpay(String spay) {
		this.spay = spay;
	}
	public String getSelltime() {
		return selltime;
	}
	public void setSelltime(String selltime) {
		this.selltime = selltime;
	}
	public String getSflag() {
		return sflag;
	}
	public void setSflag(String sflag) {
		this.sflag = sflag;
	}
	public String getSname() {
		return sname;
	}
	public void setSname(String sname) {
		this.sname = sname;
	}
	
	/**
	 * 功能：遍历所有购买表
	 */
	public ArrayList<Buy> buyList(){
		ArrayList<Buy> list=new ArrayList<Buy>();
		String sql="select s.sflag,s.sid,s.scid,s.scuid,s.spay,s.selltime,c.cid,c.cname from sell as s,customer as c where s.scuid=c.cid and s.sflag=0 ";
		System.out.println("遍历购买："+sql);
		ResultSet rs=db.executeQuery(sql);
		try {
			while(rs.next()){
				Buy y=new Buy();
				
				y.setSid(rs.getString("sid"));
				y.setScid(rs.getString("scid"));
				y.setSname(rs.getString("cname"));
				y.setScuid(rs.getString("scuid"));
				y.setSpay(rs.getString("spay"));
				y.setSelltime(rs.getString("selltime"));
				if(rs.getString("sflag").equals("0")){
					y.setSflag("已卖出");
				}
				
				
				list.add(y);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	/**
	 * 功能：通过姓名显示购买表
	 */
	public ArrayList<Buy> getBuy(String name){
		ArrayList<Buy> list=new ArrayList<Buy>();
		String sql="select cid from customer where cname='"+name+"' ";
		ResultSet rs=db.executeQuery(sql);
		try {
			if(rs.next()){
				String id=rs.getString("cid");
				String sql2="select scid,spay,selltime,sflag from sell where scuid="+id+" ";
				ResultSet rs2=db.executeQuery(sql2);
				try {
					while(rs2.next()){
						Buy b=new Buy();
						b.setScid(rs2.getString("scid"));
						b.setSpay(rs2.getString("spay"));
						b.setSelltime(rs2.getString("selltime"));
						if(rs2.getString("sflag").equals("0")){
							b.setSflag("已卖出");
						}else{
							b.setSflag("正在分期");
						}
						
						list.add(b);
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
	 * 功能：添加一条买车信息
	 */
	public boolean addBuy(String cid,String uname,String pay,String selltime){
		boolean b=false;
		String sql="select cid from customer where cname='"+uname+"' ";
		ResultSet rs=db.executeQuery(sql);
		try {
			if(rs.next()){
				String id=rs.getString("cid");
				String sql2="insert into sell(scid,scuid,spay,selltime,sflag)values('"+cid+"',"+id+",'"+pay+"','"+selltime+"',0)";
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
	 * 功能：获取售车总额
	 */
	public Double getBuyMoney(){
		double d=0;
		String sql="select spay from sell where sflag=0 ";
		ResultSet rs=db.executeQuery(sql);
		try {
			while(rs.next()){
				d=d+Double.parseDouble(rs.getString("spay"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return d;
	}

}
