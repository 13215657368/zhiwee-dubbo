package com.zhiwei;

import com.zhiwei.po.vo.MenuVo;
import com.zhiwei.service.ProvideMenuService;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

/**
 * @author jiake
 * @date 2020-02-12 21:01
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring.xml"})
//(locations= {"classpath:bean.xml"}

public class Test {

    @Autowired
    private ProvideMenuService  provideMenuService;

    @org.junit.Test
    public void test(){
        List<MenuVo> list = provideMenuService.getMenuList(6);
        System.out.println(list);

    }
}
