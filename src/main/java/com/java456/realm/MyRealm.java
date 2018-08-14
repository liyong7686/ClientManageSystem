package com.java456.realm;

import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import javax.annotation.Resource;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;

import com.java456.entity.Client;
import com.java456.entity.Tree;
import com.java456.entity.User;
import com.java456.service.ClientService;
import com.java456.service.TreeService;
import com.java456.service.UserService;
import com.java456.util.CryptographyUtil;
import com.java456.util.MyUtil;
import com.java456.util.StringUtil;



/**
 * �Զ���Realm
 * @author Administrator
 *
 */
public class MyRealm extends AuthorizingRealm{

	@Resource
	private UserService  userService;
	@Resource
	private ClientService  clientService;
	@Resource
	private TreeService  treeService;
	
	
	/**
	 * Ϊ��ǰ�ĵ�¼���û���ɫ��Ȩ��
	 */
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		
		// ͨ���û�ȡ����Ӧ��ӵ�е�Ȩ��
		SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();
		// ���ý�ɫ ���� ���Ŀǰ�ò�����
		// authorizationInfo.setRoles(roles);
		User user = (User) SecurityUtils.getSubject().getSession().getAttribute("currentUser");
		if(user==null)return null;
		
		user = userService.findById(user.getId());
		
		Map<String, Object> map = new HashMap<String, Object>();
		List<Integer> ids = MyUtil.Str_ids_To_ListInteger_ids(user.getMenuIds());
		map.put("ids", ids);
		if(ids.size()>0){
		}else{
			return authorizationInfo;
		}
		
		List<Tree> treeList = treeService.getTreesByFatherOrIds(map);
		// Ȩ�޼���
		Set<String> stringPermissions = new HashSet<String>();
		for (Tree tree : treeList) {
			if (StringUtil.isNotEmpty(tree.getPermissions())) {
				stringPermissions.add(tree.getPermissions());
			}
		}
		authorizationInfo.setStringPermissions(stringPermissions);
		return authorizationInfo;
	}
	
	
	/**
	 * ��֤��ǰ��¼���û�
	 */
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
		
		String login_type = (String) SecurityUtils.getSubject().getSession().getAttribute("login_type");
		switch (login_type) {
		case "wx_login":
			String openid =(String) token.getPrincipal();//������ʹ����openid
			if(openid!=null){
				AuthenticationInfo authcInfo=new SimpleAuthenticationInfo(openid, CryptographyUtil.md5(openid, "chenhao"), "xxx");
				return authcInfo;
			}else{
			}
			break;
		case "user_login":
			String name=(String) token.getPrincipal();//������ʹ����name
			User user=userService.findByName(name);
			if(user!=null){
				//SecurityUtils.getSubject().getSession().setAttribute("currentUser", user); //�ѵ�ǰ�û���Ϣ�浽session��
				AuthenticationInfo authcInfo=new SimpleAuthenticationInfo(user.getName(), user.getPassword(), "xxx");
				return authcInfo;
			}else{
			}
			break;
		}
		return null;
	}

}
