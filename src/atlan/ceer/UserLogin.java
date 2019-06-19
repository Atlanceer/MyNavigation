package atlan.ceer;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 * Servlet implementation class UserLogin
 */
@WebServlet("/UserLogin")
public class UserLogin extends HttpServlet {
	
	private WebDAO webDao;
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserLogin() {
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
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setHeader("Content-Type","text/html; charset=utf-8");
		PrintWriter out=response.getWriter(); 
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		String phone=request.getParameter("phone");
		
		int judge=webDao.Login(username, password, phone);
		if(judge==1) {
			if(username==null) {
				out.print("<script>alert('手机号+"+phone+" 不正确');window.location='login.jsp'</script>");
			}else {
				out.print("<script>alert('用户 "+username+" 不存在');window.location='login.jsp'</script>");				
			}
		}else if(judge==2) {
			out.print("<script>alert('密码错误');window.location='login.jsp'</script>");
		}else {
			if(phone!="") {
				username=webDao.FindUsername(phone);
			}
			HttpSession session=request.getSession();
			session.setAttribute("username", username);
			//response.sendRedirect(request.getContextPath()+"/test.jsp");
			out.print("<script>alert('"+username+" 欢迎您');window.location='index.jsp'</script>");
			//out.print("<script>success();</script>");
			
		}
		
	}

}
