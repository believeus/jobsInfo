package com.etech.shiro;

import java.util.Iterator;
import java.util.Set;
import javax.annotation.Resource;
import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.util.StringUtils;
import com.etech.entity.TbaseUser;
import com.etech.entity.Trole;
import com.etech.service.EtechService;


public class AuthenticationRealm extends AuthorizingRealm{
	private static final Log log=LogFactory.getLog(AuthenticationRealm.class); 
	@Resource
	private EtechService etechService;
	//shiro授权
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		Principal principal = (Principal) principals.fromRealm(getName()).iterator().next();
		log.debug("doGetAuthorizationInfo:"+principal.getUsername());
		if (StringUtils.isEmpty(principal)) {
			int userid=new Long(principal.getId()).intValue();
			TbaseUser user = (TbaseUser)etechService.findObjectById(TbaseUser.class,userid);
			SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();
			Set<Trole> roles = user.getRoles();
			Iterator<Trole> iterator = roles.iterator();
			while (iterator.hasNext()) {
				Trole trole = (Trole) iterator.next();
				log.debug("该用户角色:"+trole.getRoleName());
				authorizationInfo.addRole(trole.getRoleName());
			}
			return authorizationInfo;
		}
		return null;
	}
	//shiro登录验证
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(
			AuthenticationToken token) throws AuthenticationException {
		TokenAuthentication authenticationToken = (TokenAuthentication) token;
		String username = authenticationToken.getUsername();
		log.debug("current uername:"+username);
		String password = new String(authenticationToken.getPassword());
		TbaseUser user = (TbaseUser)etechService.findObjectByProperty(TbaseUser.class,"loginName",username);
		if(DigestUtils.md5Hex(password).equals(password)){
			log.debug(user.getLoginName() +" 验证success!");
			return new SimpleAuthenticationInfo(new Principal((long)user.getId(), username), password, getName());
		}
		throw new UnknownAccountException();
	}

}
