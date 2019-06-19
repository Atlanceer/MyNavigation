package atlan.ceer;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.Session;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;


/**
 * Servlet implementation class UtilServlet
 */
@WebServlet("/UtilServlet")
public class UtilServlet extends HttpServlet {
	
	private WebDAO webDao;
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UtilServlet() {
        super();
        // TODO Auto-generated constructor stub
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
		String method=request.getParameter("method");
		
		if(method.equals("1")) {//查询导航信息
				try {
					String username=request.getParameter("username");
					System.out.println(username);
					if(!(username.equals("null"))) {
						List<Url> urls=webDao.QueryNavigations(username);
						JSONObject json=new JSONObject();
						JSONArray jsonarr=new JSONArray();
						for(Url url:urls) {
							if(url.getNavigation()!=null&&url.getNavigation()!="") {
								JSONObject temp=new JSONObject(url.getNavigation());
								jsonarr.put(temp);
							}
						}
						json.put("navigation", jsonarr);
						out.print(jsonarr.toString());
					}
				} catch (JSONException e) {
					// TODO 自动生成的 catch 块
					e.printStackTrace();
				}
		}else if(method.equals("2")) {//退出登录
			request.getSession().invalidate();
			//out.print("<script>alert('欢迎您')</script>");
			//response.sendRedirect("test.jsp");
		}else if(method.equals("3")) {//修改密码
			String phone=request.getParameter("phone");
			String newpassword=request.getParameter("newpassword");
			if(webDao.ChangePassword(phone, newpassword)) {
				out.print("<script>alert('密码 修改成功');window.location='login.jsp'</script>");
			}else {
				out.print("<script>alert('手机号不正确');window.location='forgot.jsp'</script>");
			}
		}else if(method.equals("4")) {//修改导航信息
			if(request.getSession().getAttribute("username")==null) {
				out.print("<script>alert('你还没有登录');</script>");
			}else {
				String username=(String) request.getSession().getAttribute("username");
				//out.print("<script>alert('"+username+"');</script>");
				for(int i=1;i<=24;i++) {
					String webname=request.getParameter("webname"+i);
					if(webname!=null&&webname!="") {
						String url=request.getParameter("url"+i);
						//String id=String.valueOf(i);
						JSONObject navigation=new JSONObject();
						try {
							navigation.put("id", i);
							navigation.put("webName", webname);
							navigation.put("url", url);
							webDao.AddNavigation(username, i,navigation.toString());
						} catch (JSONException e) {
							// TODO 自动生成的 catch 块
							e.printStackTrace();
						}
					}else {
						webDao.AddNavigation(username, i,null);
					}
				}
			}
			out.print("<script>alert('修改导航成功');</script>");
		}else {
			out.print("<script>alert('请求错误');");
		}
	}

}
