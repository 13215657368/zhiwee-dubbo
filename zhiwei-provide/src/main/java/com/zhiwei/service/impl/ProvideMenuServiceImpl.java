package com.zhiwei.service.impl;

import com.zhiwei.dao.MenuMapper;
import com.zhiwei.po.Menu;
import com.zhiwei.po.vo.MenuDao;
import com.zhiwei.po.vo.MenuVo;
import com.zhiwei.service.ProvideMenuService;
import com.zhiwei.util.JsonUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.BoundHashOperations;
import org.springframework.data.redis.core.HashOperations;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author jiake
 * @date 2020-02-12 21:52
 */
@Service
public class ProvideMenuServiceImpl  implements ProvideMenuService {


    @Autowired
    private MenuMapper menuMapper;


    @Autowired
    private RedisTemplate redisTemplate;

    /**
     * ztree信息
     */
    @Override
    public List<MenuDao> menuZtreeService(Integer userId){
        return menuMapper.queryMenuList(userId);

    }


    /**
     * 获取菜单信息
     */
    @Override
    public List<MenuVo>  getMenuList(Integer userId){
        //获取顶级菜单
        Map<String,Object> param = new HashMap<>();
        param.put("userId",userId);
        param.put("parentId",0);
        List<Menu> rootMenu =  menuMapper.queryRootMenu(param);

        List<MenuVo> list = new ArrayList<>();

        // HashOperations<String, String, String> hashOperations = redisTemplate.opsForHash();


        String  menuStr = (String) redisTemplate.opsForValue().get("menu-"+userId);

        if(null == menuStr || menuStr.length()==0){

            //根据父级目录查询子目录
            for(Menu m : rootMenu){
                MenuVo  menuVo =  new MenuVo();
                menuVo.setParent(m);
                Map<String,Object> param2 = new HashMap<>();
                param2.put("parentId",m.getId());
                param2.put("userId",userId);
                List<Menu>  childList =  menuMapper.queryByParentId(param2);
                menuVo.setChirldList(childList);
                list.add(menuVo);
            }

            //将列表信息存入redis
            redisTemplate.opsForValue().set("menu-"+userId, JsonUtil.object2JsonStr(list));

        }else {

            list = JsonUtil.jsonToList(menuStr,MenuVo.class);

        }


        return  list;

    }


}
