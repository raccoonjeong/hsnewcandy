package org.candy.interceptor;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.candy.service.FreeboardService;
import org.candy.service.TruckService;

import com.mysql.jdbc.StringUtils;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
public class ViewsInterceptor extends HandlerInterceptorAdapter {

	@Setter(onMethod_= {@Autowired})
	private FreeboardService service;
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
		 	Cookie cookies[] = request.getCookies();
		    Map map = new HashMap();
		    
		    if(request.getCookies() != null){
		    for (int i = 0; i < cookies.length; i++) {
		    Cookie obj = cookies[i];
		    log.info("obj.............."+obj);
		    log.info("objName.............."+obj.getName());
		    log.info("objValue.............."+obj.getValue());
		    map.put(obj.getName(),obj.getValue());
		    }
		    }

		    
		    Object object = modelAndView.getModel().get("bno");
		    
		    Integer bno = (Integer) object;
		    
		    
		    log.info("viewbno................." + bno);
		    
		    String viewCount = (String) map.get("view_count");
		    
		    String newReadCount = "|" + bno;
		    
		    
		    if ( StringUtils.indexOfIgnoreCase(viewCount, newReadCount) == -1 ) {
		          
		          Cookie cookie = new Cookie("view_count", viewCount + newReadCount);
		          cookie.setMaxAge(60*60*24);
		          response.addCookie(cookie);
		          //service.updateViewCnt(bno); // 업데이트 실행
			  
			 }
		
	}

}
