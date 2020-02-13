package com.zhiwei.service;

import com.zhiwei.dao.MenuMapper;
import com.zhiwei.po.Menu;
import com.zhiwei.po.vo.MenuDao;
import com.zhiwei.po.vo.MenuVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


public interface ProvideMenuService {



    /**
     * ztree信息
     */
    public List<MenuDao> menuZtreeService(Integer userId);


    /**
     * 获取菜单信息
     */
    public List<MenuVo>  getMenuList(Integer userId);

}
