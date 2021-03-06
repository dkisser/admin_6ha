package org.lf.utils.servlet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.lf.admin.db.pojo.User;
import org.lf.admin.db.pojo.WebUser;
import org.lf.admin.service.sorcket.Constants;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

/**
 * 登录验证拦截器
 * @author Administrator
 *
 */
public class LoginInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		HttpSession session=request.getSession();
//		session.getServletContext().getAttribute(request.getRemoteAddr());
		WebUser user = (WebUser) session.getAttribute(Constants.USER_LOGIN_INFO);
		User admin = (User) session.getAttribute(Constants.ADMIN_LOGIN_INFO);
		if(user==null&&admin ==null){
			////如果是ajax请求响应头会有，x-requested-with； 
			if (request.getHeader("x-requested-with") != null&& request.getHeader("x-requested-with").equalsIgnoreCase("XMLHttpRequest")){
				response.setHeader("sessionstatus", "timeout");//在响应头设置session状态      
				response.getWriter().print("timeout"); //打印一个返回值，没这一行，无法跳出
			}else{
				response.sendRedirect(request.getContextPath()+"/web/main.do");
			}
			return false;
		}
		
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
	}

	@Override
	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		
	}

}
