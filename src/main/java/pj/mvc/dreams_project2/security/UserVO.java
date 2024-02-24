package pj.mvc.dreams_project2.security;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

public class UserVO extends User{
	public UserVO(String username, String password, boolean enabled, boolean accountNonExpired,			
			boolean credentialNonExpired, boolean accountNonLocked,
			Collection<? extends GrantedAuthority> authorities) {
		super(username, password, enabled, accountNonExpired,			
				credentialNonExpired, accountNonLocked ,authorities);
	}
}
