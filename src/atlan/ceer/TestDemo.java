package atlan.ceer;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.json.JSONException;
import org.json.JSONObject;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class TestDemo {
	
	@Resource(name="webDao")
	private WebDAO webDao;
	@Test
	public void test1() {//测试注册
		Date date=new Date();
		String time=new SimpleDateFormat("yy-MM-dd").format(date);
		int judge=webDao.Register("test", "test", "178",time);
		if(judge==0) {
			System.out.println("注册成功！！！");
		}else if(judge==1){
			System.out.println("用户名存在！！！");			
		}else {
			System.out.println("手机号已经被注册！！！");
		}
	}
	
	@Test
	public void test2() throws JSONException {//测试添加导航
		JSONObject navigation=new JSONObject();
		navigation.put("id", 24);
		navigation.put("webName", "baidu");
		navigation.put("url", "www.baidu.com");
		webDao.AddNavigation("atlan", 24,navigation.toString());
	}
	
	@Test
	public void test3() throws JSONException {//测试修改导航
		JSONObject navigation=new JSONObject();
		navigation.put("id", 3);
		navigation.put("webName", "谷歌");
		navigation.put("url", "www.google.com");
		webDao.AddNavigation("atlan2", 3,navigation.toString());
	}
	
	@Test
	public void test4() {//测试修改密码
		if(webDao.ChangePassword("110", "ceer")) {
			System.out.println("修改成功");
		}else {
			System.out.println("手机号错误！！！");
		}
	}
	
	@Test
	public void test5() {//测试修改用户名
		int judge=webDao.ChangeUsername("110", "atlan","atlan");
		if(judge==2) {
			System.out.println("用户名已存在！！！");
		}else if(judge==1) {
			System.out.println("手机号不正确！！！");			
		}else{
			System.out.println("修改成功");
		}
		
	}
	
	@Test
	public void test6() {//测试修改手机
		webDao.ChangePhone("atlan", "110");
	}
	
	@Test
	public void test07() {//测试查询用户所有的导航
		List<Url> urls=webDao.QueryNavigations("atlan");
		for(Url url:urls) {
			System.out.println(url.getNavigation());			
		}
	}
	
	@Test
	public void test08() {//测试登录
		int judge=webDao.Login(null, "ceer", "17828298850");
		if(judge==0) {
			System.out.println("登录成功！！！");
		}else if(judge==1) {
			System.out.println("用户名或手机号错误！！！");
		}else {
			System.out.println("密码错误！！！");
		}
	}
}

