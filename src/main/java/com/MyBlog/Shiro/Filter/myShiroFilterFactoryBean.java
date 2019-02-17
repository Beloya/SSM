package com.MyBlog.Shiro.Filter;

import java.util.List;
import java.util.Map;

import org.apache.shiro.config.Ini;
import org.apache.shiro.spring.web.ShiroFilterFactoryBean;
import org.apache.shiro.util.CollectionUtils;
import org.apache.shiro.web.config.IniFilterChainResolverFactory;
import org.apache.shiro.web.filter.mgt.DefaultFilterChainManager;
import org.apache.shiro.web.filter.mgt.PathMatchingFilterChainResolver;
import org.apache.shiro.web.servlet.AbstractShiroFilter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.MyBlog.Logger.MyLogger;
import com.MyBlog.Service.UrlPermissionsService;
import com.MyBlog.entity.UrlPermissions;


public class myShiroFilterFactoryBean extends ShiroFilterFactoryBean{
	private String definitions;
	private String suffix;
	@Autowired
	private UrlPermissionsService upService;
	 @Override
	   public void setFilterChainDefinitions(String definitions) {
	        Ini ini = new Ini();
	        this.definitions=definitions;
	        ini.load(definitions);
	        //did they explicitly state a 'urls' section?  Not necessary, but just in case:
	        Ini.Section section = ini.getSection(IniFilterChainResolverFactory.URLS);
	        if (CollectionUtils.isEmpty(section)) {
	            //no urls section.  Since this _is_ a urls chain definition property, just assume the
	            //default section contains only the definitions:
	            section = ini.getSection(Ini.DEFAULT_SECTION_NAME);
	        }
	        urlFilterLoad(section);
	        setFilterChainDefinitionMap(section);
	    }

	 @Override
public void setFilterChainDefinitionMap(Map<String, String> filterChainDefinitionMap) {
		
		 //filterChainDefinitionMap.put("/trainquery.do", "authc");
		 super.setFilterChainDefinitionMap(filterChainDefinitionMap);
}
	 public void urlFilterLoad( Ini.Section  section) {
		 UrlPermissions permissions=new UrlPermissions();
		 permissions.setDatalevel(0);
		 permissions.setOrderColumn("`url`");
		 permissions.setOrderType("desc");
		 List<UrlPermissions> UrlPermissionsList=upService.FindByParam(permissions);

		 for (UrlPermissions urlPermissions : UrlPermissionsList) {
			 String check=urlPermissions.getCheck();
			 
			 String upURL;
			if(!urlPermissions.getUrl().endsWith(".do")
					&&!urlPermissions.getUrl().endsWith("/")
					&&!urlPermissions.getUrl().endsWith("**")) {
				upURL=urlPermissions.getUrl()+suffix;
			}
			else if(urlPermissions.getUrl().endsWith("/")) {
				upURL=urlPermissions.getUrl()+"**";
			}
			else {
				upURL=urlPermissions.getUrl();
			}
			
			switch (urlPermissions.getType()) {
			case 0: 
				if(section.containsKey(upURL)) {
section.put(upURL,
		section.get(upURL)+check.replace(check, ",roles["+check+"]"));
				
					
				}
				else {
					section.put(upURL, "roles["+urlPermissions.getCheck()+"]");
				}
					
				break;
			case 1:
				
				if(section.containsKey(upURL)) {
					section.put(upURL,
							section.get(upURL)+check.replace(check, ",perms["+check+"]"));
				}
				else {
					section.put(upURL,  "perms["+urlPermissions.getCheck()+"]");
				}
				break;
	case 2:
				
				if(section.containsKey(upURL)) {
					section.put(upURL,
							section.get(upURL)+","+check);
				}
				else {
					section.put(upURL,urlPermissions.getCheck());
				}
				break;
			default:
				break;
			}
		}
		}
	 
	 public synchronized void updatePermission(Map<String, String> filterMap) {
		 AbstractShiroFilter shiroFilter = null;
		 try {
			 shiroFilter = (AbstractShiroFilter) this.getObject();
PathMatchingFilterChainResolver filterChainResolver = (PathMatchingFilterChainResolver) shiroFilter
	                    .getFilterChainResolver();
DefaultFilterChainManager filterManager = (DefaultFilterChainManager) filterChainResolver.getFilterChainManager();
//filterManager.getFilterChains().clear();
Map<String, String> chains = this.getFilterChainDefinitionMap();
for (Map.Entry<String, String> entry:filterMap.entrySet()) {
	String url = entry.getKey().trim().replace(" ", "");
    //地址持有的权限
    String chainDefinition = entry.getValue().trim().replace(" ", "");
    chains.put(url, chainDefinition);

}

		}catch (Exception e) {
			 MyLogger.error(getClass(),"updatePermission error,filterMap=" + filterMap);
		} finally {
			// TODO: handle finally clause
		}
	 }
	 
	 public synchronized void reSetPermission(Map<String, String> filterMap) {
		 AbstractShiroFilter shiroFilter = null;
	        try {
	            shiroFilter = (AbstractShiroFilter) this.getObject();

	            // 获取过滤管理器
	            PathMatchingFilterChainResolver filterChainResolver = (PathMatchingFilterChainResolver) shiroFilter
	                    .getFilterChainResolver();
	            DefaultFilterChainManager filterManager = (DefaultFilterChainManager) filterChainResolver.getFilterChainManager();

	            //清空拦截管理器中的存储
	            filterManager.getFilterChains().clear();
	            /*
	            清空拦截工厂中的存储,如果不清空这里,还会把之前的带进去
	            ps:如果仅仅是更新的话,可以根据这里的 map 遍历数据修改,重新整理好权限再一起添加
	             */
	            this.getFilterChainDefinitionMap().clear();

	            // 相当于新建的 map, 因为已经清空了
	            Map<String, String> chains = this.getFilterChainDefinitionMap();
	            //把修改后的 map 放进去
	            chains.putAll(filterMap);

	            //这个相当于是全量添加
	            for (Map.Entry<String, String> entry : filterMap.entrySet()) {
	                //要拦截的地址
	                String url = entry.getKey().trim().replace(" ", "");
	                //地址持有的权限
	                String chainDefinition = entry.getValue().trim().replace(" ", "");
	                //生成拦截
	                filterManager.createChain(url, chainDefinition);
	            }
	        } catch (Exception e) {
	            MyLogger.error(getClass(),"reSetPermission error,filterMap=" + filterMap);
	        }


	 }

	public String getSuffix() {
		return suffix;
	}

	public void setSuffix(String suffix) {
		this.suffix = suffix;
	}
	 
}
