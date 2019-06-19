package atlan.ceer;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 * Servlet implementation class Register
 */
@WebServlet("/UserRegister")
public class UserRegister extends HttpServlet {
	
	private WebDAO webDao;
	/*public void setWebDao(WebDAO webDao) {
		this.webDao = webDao;
	}*/

	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserRegister() {
        super();
    }

	@Override
	public void init() throws ServletException {
		// TODO 自动生成的方法存根
		super.init();
		ApplicationContext context=new ClassPathXmlApplicationContext("applicationContext.xml");
		webDao=(WebDAO) context.getBean("webDao");
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setHeader("Content-Type","text/html; charset=utf-8");  
		
		PrintWriter out=response.getWriter(); 
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		String phone=request.getParameter("phone");
		Date date=new Date();
		String time=new SimpleDateFormat("yy-MM-dd").format(date);
		
		int judge=webDao.Register(username, password, phone, time);		
		if(judge==0) {
			out.print("<script>alert('恭喜您！"+username+",注册成功')</script>");
			//System.out.println("注册成功！！！");
		}else if(judge==1){
			out.print("<script>alert('用户名"+username+",已存在，请重新输入！');window.location='zhuce.jsp'</script>");
			//System.out.println("用户名存在！！！");			
		}else {
			out.print("<script>alert('手机号"+phone+",已被注册！');window.location='zhuce.jsp'</script>");
			//System.out.println("手机号已经被注册！！！");
		}
		out.close();
	}

}
