package model;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

public class EmployeeDAO {
	//������������
	public void delete(String ecode) {
		try {
			String sql="delete from employee where ecode=?";
			PreparedStatement ps=DB.con.prepareStatement(sql);
			ps.setString(1, ecode);
			ps.execute();
		}catch(Exception e) {
			
		}
	}
	//��������
	public void update(EmployeeVO vo) {
		try {
			String sql="update employee set eid=?,epass=?,ename=?,edep=?,ejobtitle=?,etel=?,eemail=? where ecode=?";
			PreparedStatement ps=DB.con.prepareStatement(sql);
			ps.setString(1, vo.getEid());
			ps.setString(2, vo.getEpass());
			ps.setString(3, vo.getEname());
			ps.setString(4, vo.getEdep());
			ps.setString(5, vo.getEjobtitle());
			ps.setString(6, vo.getEtel());
			ps.setString(7, vo.getEemail());
			ps.setString(8, vo.getEcode());
			ps.execute();
		}catch(Exception e) {
			System.out.println("������������:" + e.toString());
		}
	}
	
	//�ڵ� �ڵ�
	public String getCode() {
		String ecode="E100";
		try {
			String sql="select max(ecode) from employee";
			PreparedStatement ps=DB.con.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			if(rs.next()) {
				String lastId=rs.getString("max(ecode)");
				ecode="E" + (Integer.parseInt(lastId.substring(1))+1);
			}
		}catch(Exception e) {
			System.out.println("�ڵ��ڵ����:" + e.toString());
		}
		return ecode;
	}
	//�Ի���
	public void insert(EmployeeVO vo) {
		try {
			String sql="insert into employee(ecode,eid,epass,ename,edep,ejobtitle,etel,eemail) values(?,?,?,?,?,?,?,?)";
			PreparedStatement ps=DB.con.prepareStatement(sql);
			ps.setString(1, vo.getEcode());
			ps.setString(2, vo.getEid());
			ps.setString(3, vo.getEpass());
			ps.setString(4, vo.getEname());
			ps.setString(5, vo.getEdep());
			ps.setString(6, vo.getEjobtitle());
			ps.setString(7, vo.getEtel());
			ps.setString(8, vo.getEemail());
			ps.execute();
		}catch(Exception e) {
			System.out.println("�Ի��Ͽ���:" + e.toString());
		}
	}
	//���������б�
	public EmployeeVO read(String ecode) {
		 EmployeeVO vo=new EmployeeVO();
		try {
			String sql="select * from employee where ecode=?";
			PreparedStatement ps=DB.con.prepareStatement(sql);
			ps.setString(1, ecode);
			ResultSet rs=ps.executeQuery();
			if(rs.next()) {
				vo.setEcode(rs.getString("ecode"));
				vo.setEid(rs.getString("eid"));
				vo.setEpass(rs.getString("epass"));
				vo.setEname(rs.getString("ename"));
				vo.setEdep(rs.getString("edep"));
				vo.setEjobtitle(rs.getString("ejobtitle"));
				vo.setEtel(rs.getString("etel"));
				vo.setEemail(rs.getString("eemail"));
			}
		}catch(Exception e) {
			System.out.println("���������б�:" + e.toString());
		}
		return vo;
	}
	//�������
	public JSONObject list(SqlVO vo) {
		JSONObject jObject=new JSONObject();
		try {
			String sql="{call list(?,?,?,?,?,?,?,?,?)}";
			CallableStatement cs=DB.con.prepareCall(sql);
			cs.setString(1, "employee");
			cs.setString(2, vo.getKey());
			cs.setString(3, vo.getWord());
			cs.setInt(4, vo.getPage());
			cs.setInt(5, vo.getPerpage());
			cs.setString(6, vo.getOrder());
			cs.setString(7, vo.getDesc());
			cs.registerOutParameter(8, oracle.jdbc.OracleTypes.CURSOR);
			cs.registerOutParameter(9, oracle.jdbc.OracleTypes.INTEGER);
			cs.execute();
			
			ResultSet rs=(ResultSet)cs.getObject(8);
			JSONArray array=new JSONArray();
			while(rs.next()) {
				JSONObject obj=new JSONObject();
				obj.put("ecode", rs.getString("ecode"));
				obj.put("eid", rs.getString("eid"));
				obj.put("epass", rs.getString("epass"));
				obj.put("ename", rs.getString("ename"));
				obj.put("edep", rs.getString("edep"));
				obj.put("ejobtitle", rs.getString("ejobtitle"));
				obj.put("etel", rs.getString("etel"));
				obj.put("eemail", rs.getString("eemail"));
				array.add(obj);
			}
			jObject.put("array", array);
			
			int count=cs.getInt(9);
			jObject.put("count", count);
		}catch(Exception e) {
			System.out.println("������Ͽ���:" + e.toString());
		}
		return jObject;
	}
}
