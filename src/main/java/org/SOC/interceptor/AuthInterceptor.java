package org.SOC.interceptor;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.SOC.domain.TeamVO;
import org.SOC.domain.UserVO;
import org.SOC.service.TeamService;
import org.SOC.service.UserService;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class AuthInterceptor extends HandlerInterceptorAdapter {
	// controller로 보내기 전에 처리하는 Interceptor
	// 반환이 false라면 controller로 요청X
	// 매개변수 Object는 핸들러 정보를 의미 ( RequestMapping , DefaultServletHandler )

	@Inject
	private UserService service;
	@Inject
	private TeamService teamservice;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		HttpSession session = request.getSession();

		if (session.getAttribute("login") == null) {

			log.info("current user is not logined");

			saveDest(request);

			Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");

			if (loginCookie != null) {

				UserVO userVO = service.checkLoginBefore(loginCookie.getValue());
				TeamVO teamVO = teamservice.search(userVO.getUserno());
				log.info("USERVO: " + userVO);

				if (userVO != null) {
					session.setAttribute("login", userVO);
					if (teamVO != null) {
						session.setAttribute("teaminfo",teamVO);
					}
					return true;
				}

			}
			response.sendRedirect("/main/Alert");
			return false;
		}
		UserVO uvo = (UserVO) session.getAttribute("login");
		int userno = uvo.getUserno();
		session.setAttribute("login",null);
		
		UserVO userVO = service.rolecheck(userno);
		TeamVO teamVO = teamservice.search(userVO.getUserno());
		
		if (userVO != null) {
			session.setAttribute("login", userVO);
			session.setAttribute("teaminfo",null);
			if (teamVO != null) {
				session.setAttribute("teaminfo",teamVO);
			}
			
		}
		return true;
	}

	private void saveDest(HttpServletRequest req) {
		// 세션이 없을때 진입하려는 페이지를 기억했다가 세션이 생기면 그 페이지를 반환하기 위해
		String uri = req.getRequestURI();

		String query = req.getQueryString();

		if (query == null || query.equals("null")) {
			query = "";
		} else {
			query = "?" + query;
		}

		if (req.getMethod().equals("GET")) {
			log.info("dest: " + (uri + query));
			req.getSession().setAttribute("dest", uri + query);
		}
	}
}
