package com.etech.shiro;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
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
import org.apache.shiro.authc.UsernamePasswordToken;
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
	
	//shiro登录验证
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(
			org.apache.shiro.authc.AuthenticationToken token) {
		TokenAuthentication authenticationToken=null;
		try {
			 authenticationToken = (TokenAuthentication) token;			
			
			String username = authenticationToken.getUsername();
			log.debug("current uername:"+username);
			String password = new String(authenticationToken.getPassword());
			TbaseUser user = (TbaseUser)etechService.findObjectByProperty(TbaseUser.class,"loginName",username);
			if(DigestUtils.md5Hex(password).equals(user.getPassword())){
				log.debug(user.getLoginName() +" 验证通过验证success!");
				log.debug(user.getPassword()+"  ：密碼");
				return new SimpleAuthenticationInfo(new Principal((long)user.getId(), username), "believeus", getName());
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
		log.debug("doGetAuthorizationInfo:"+principal.getUsername());
		List<String> authorities =new ArrayList<String>();
		authorities.add("admin:check");
		SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();
		authorizationInfo.addStringPermissions(authorities);
		return authorizationInfo;
	}

}
