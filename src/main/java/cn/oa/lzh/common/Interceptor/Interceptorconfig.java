package cn.oa.lzh.common.Interceptor;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

//配置拦截器
@Configuration
public class Interceptorconfig extends WebMvcConfigurerAdapter{
    //除验证码接口其他全部拦截
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
    	 registry.addInterceptor(new Interceptor()).addPathPatterns("/**").excludePathPatterns("/logins").excludePathPatterns("/captcha");
    }
}