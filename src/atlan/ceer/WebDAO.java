package atlan.ceer;

import java.util.List;

public interface WebDAO {
	//用户注册 返回boolean判断是否有重名
	public int Register(String username,String password,String phone,String time);
	
	//添加用户的导航网址
	public void AddNavigation(String username,int id,String navigation);
	
	//用户修改导航网址
	public void ChangeNavigation(String username,int id,String newNavigation);
	
	//修改密码  返回boolean判断手机号是否正确
	public boolean ChangePassword(String phone,String password);
	
	//修改用户名 返回boolean判断手机号是否正确
	public int ChangeUsername(String phone,String username,String oldname);//注意url表中的用户名改变
	
	//修改手机号 
	public void ChangePhone(String username,String newphone);
	
	//查询导航信息 返回查询到的集合
	public List QueryNavigations(String username);
	
	//登录操作
	public int Login(String username,String password,String phone);//登录时候可以选择手机号或者用户名登录，选用户名登录则手机号传null
	
	//查找用户名（手机号登录的时候使用）
	public String FindUsername(String phone);
}
