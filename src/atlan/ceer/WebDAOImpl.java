package atlan.ceer;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.jdbc.core.JdbcTemplate;


public class WebDAOImpl implements WebDAO{

	private JdbcTemplate jdbcTemplate;
	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	//用户注册 返回boolean判断是否有重名
	@Override
	public int Register(String username, String password, String phone,String time) {
		int countname=jdbcTemplate.queryForObject("select count(*) from user where username=?", Integer.class,username);
		int countphone=jdbcTemplate.queryForObject("select count(*) from user where phone=?",Integer.class,phone);
		if(countname!=0) {
			return 1;//表明用户名存在
		}else if(countphone!=0){
			return 2;//表明手机号已经被注册
		}else {
			jdbcTemplate.update("insert into user values(?,?,?,?)",username,password,phone,time);
			//int i=1/0;
			jdbcTemplate.update("insert into url(username) values(?)",username);
			return 0;//表面注册成功
		}
	}
	
	//添加用户的导航网址
	@Override
	public void AddNavigation(String username, int id, String navigation) {
		jdbcTemplate.update("update url set navigation?=? where username=?",id,navigation,username);
		/*try {
			JSONObject json=new JSONObject(navigation);
			String webname=json.getString("webName");
			if(webname==null||webname=="") {
				jdbcTemplate.update("update url set navigation?=? where username=?",id,null,username);			
			}else {			
				jdbcTemplate.update("update url set navigation?=? where username=?",id,navigation,username);			
			}
		} catch (JSONException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}*/
	}

	//用户修改导航网址
	@Override
	public void ChangeNavigation(String username, int id, String newNavigation) {
		jdbcTemplate.update("update url set navigation?=? where username=?",id,newNavigation,username);
	}
	
	//修改密码  返回boolean判断手机号是否正确
	@Override
	public boolean ChangePassword(String phone, String password) {
		int count=jdbcTemplate.queryForObject("select count(*) from user where phone=?", Integer.class,phone);
		if(count==0) {
			return false;
		}else {
			jdbcTemplate.update("update user set password=? where phone=?",password,phone);
			return true;
		}
	}

	//修改用户名 返回boolean判断手机号是否正确
	@Override
	public int ChangeUsername(String phone, String username,String oldname) {
		int count=jdbcTemplate.queryForObject("select count(*) from user where phone=?", Integer.class,phone);
		if(count==0) {
			return 1;//查不到手机号
		}else {
			int newuser=jdbcTemplate.queryForObject("select count(*) from user where username=?", Integer.class,username);
			if(newuser==0) {
				jdbcTemplate.update("update user set username=? where phone=?",username,phone);
				jdbcTemplate.update("update url set username=? where username=?",username,oldname);
				return 0;//修改成功				
			}else {
				return 2;//用户名已存在
			}
		}
	}

	@Override
	public void ChangePhone(String username, String newphone) {
		jdbcTemplate.update("update user set phone=? where username=?",newphone,username);
	}

	@Override
	public List<Url> QueryNavigations(String username) {
		/*int count=jdbcTemplate.queryForObject("select count(*) from url where username=?", Integer.class,username);//查询用户有几条记录
		System.out.println(count);*/
		List<Url> urls=new ArrayList<>();
		for(int i=1;i<=24;i++) {//循环遍历用户的24条导航
			Url url=jdbcTemplate.queryForObject("select navigation? from url where username=?", new MyRowMapper(), i,username);
			urls.add(url);
		}
		return urls;
	}
	
	class MyRowMapper implements org.springframework.jdbc.core.RowMapper<Url>{

		@Override
		public Url mapRow(ResultSet rs, int rowNum) throws SQLException {//re为结果集，rowNum为行号
			Url url=new Url();
			url.setNavigation(rs.getString(1));
			return url;
		}
		
	}

	@Override
	public int Login(String username, String password, String phone) {
		if(username=="") {
			int count=jdbcTemplate.queryForObject("select count(*) from user where phone=?", Integer.class,phone);
			if(count!=0) {
				String passwd=jdbcTemplate.queryForObject("select password from user where phone=?", String.class,phone);
				if(passwd.equals(password)) {
					return 0;//登录成功
				}else {
					return 2;//密码不匹配
				}
			}else {
				return 1;//手机号码不正确
			}
		}else {
			int count=jdbcTemplate.queryForObject("select count(*) from user where username=?", Integer.class,username);
			if(count!=0) {
				String passwd=jdbcTemplate.queryForObject("select password from user where username=?", String.class,username);
				if(passwd.equals(password)) {
					return 0;//登录成功
				}else {
					return 2;//密码不匹配
				}
			}else {
				return 1;//用户名不正确
			}
		}
	}

	@Override
	public String FindUsername(String phone) {//查找用户名（手机号登录的时候使用）
		String username=jdbcTemplate.queryForObject("select username from user where phone=?", String.class,phone);
		return username;
	}

}
