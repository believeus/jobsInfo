package com.etech.shiro;

import java.util.Iterator;
import java.util.Set;

import javax.annotation.Resource;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import com.etech.entity.TbaseUser;
import com.etech.entity.Trole;
import com.etech.service.EtechService;


public class AuthenticationRealm extends AuthorizingRealm{
	private static final Log log=LogFactory.getLog(AuthenticationRealm.class); 
	@Resource
	private EtechService etechService;
	
	//shiro登录验证
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) {
		TokenAuthentication authenticationToken=null;
		try {
			//该authenticationToken是从AuthenticationFilter中的TokenAuthentication传递过来的
			authenticationToken = (TokenAuthentication) token;			
			String username = authenticationToken.getUsername();
			log.debug("current uername:"+username);
			String password = new String(authenticationToken.getPassword());
			TbaseUser user = (TbaseUser)etechService.findObjectByProperty(TbaseUser.class,"loginName",username);
			if(password.equals(user.getPassword())){
				log.debug(user.getLoginName() +" 验证通过验证success!");
				log.debug(user.getPassword()+"  ：密碼");
				//该验证信息必须和AuthenticationFilter中的TokenAuthentication用户名和密码一致
				return new SimpleAuthenticationInfo(new Principal((long)user.getId(), username), user.getPassword(), getName());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		throw new UnknownAccountException();
	}
	//shiro授权
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		Principal principal = (Principal) principals.fromRealm(getName()).iterator().next();
		String username=principal.getUsername();
		log.debug("doGetAuthorizationInfo:"+principal.getUsername());
		TbaseUser user = (TbaseUser)etechService.findObjectByProperty(TbaseUser.class,"loginName",username);
		SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();
		Set<Trole> roles = user.getRoles();
		Iterator<Trole> it = roles.iterator();  
		while (it.hasNext()) {  
		  Trole role = it.next(); 
		  String roleName = role.getRoleName();
		  log.debug("roleName:"+roleName);
		  authorizationInfo.addRole(roleName);
		}  
		return authorizationInfo;
	}

}
