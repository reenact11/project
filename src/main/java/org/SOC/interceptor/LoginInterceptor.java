package org.SOC.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class LoginInterceptor extends HandlerInterceptorAdapter {

	private static final String LOGIN = "login";
	private static final String TEAMINFO = "teaminfo";

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {

		HttpSession session = request.getSession();

		ModelMap modelMap = modelAndView.getModelMap();
		Object userVO = modelMap.get("userVO");
		Object teamVO = modelMap.get("teamVO");
		if (userVO != null) {
			
			log.info("new login success");
			session.setAttribute(LOGIN, userVO);
			
			if (teamVO != null) {
				
				log.info("have a team");
				session.setAttribute(TEAMINFO, teamVO);
			}

			if (request.getParameter("useCookie") != null) {
				// "아이디 저장" 체크하면 쿠키 생성
				log.info("remember me................");
				Cookie loginCookie = new Cookie("loginCookie", session.getId());
				loginCookie.setPath("/");
				loginCookie.setMaxAge(60 * 60 * 24 * 7);
				response.addCookie(loginCookie);
			}


			/* response.sendRedirect("/"); */

			Object dest = session.getAttribute("dest");
			// dest : 로그인체크 전 머물러있던 URL , 로그인을 하기위해 이 동작을 수행중이기에 처음 입력한 URL을 담고있음

			response.sendRedirect(dest != null ? (String) dest : "/");
		}
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		HttpSession session = request.getSession();
		
		if (session.getAttribute(LOGIN) != null) {
			log.info("clear login data before");
			session.removeAttribute(LOGIN);
		}

		return true;
	}
}
