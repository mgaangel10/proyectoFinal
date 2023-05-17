package com.salesianostriana.dam.seguridad.security;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.annotation.Bean;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import lombok.extern.java.Log;
@Component
	@Log
public class RoleBasedSuccesHandler implements AuthenticationSuccessHandler{
	
	
	private RedirectStrategy redirect = new DefaultRedirectStrategy();
	private final String ROLE_USER_URL="/me";
	private final String ROLE_ADMIN_URL="/administrador";

	@Override
	
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		// TODO Auto-generated method stub
//		determinar el rol
		List<GrantedAuthority> autho= new ArrayList<>(authentication.getAuthorities());
		String role=autho.get(0).toString();
		String redirectUrl;
		//en funcion del rol, redirigira a una rl o otra
		if (role.endsWith("ADMIN")) {
			redirectUrl = ROLE_ADMIN_URL;
		} else {
			redirectUrl = ROLE_USER_URL;
		}
		if (response.isCommitted()) {
			log.info("Can't redirect");
			return;
		}
		
		
		redirect.sendRedirect(request, response, redirectUrl);
		
	}
	

}
