package com.atguigu.system.service;

import com.atguigu.model.system.SysMenu;
import com.atguigu.model.system.SysRole;
import com.atguigu.model.vo.AssginMenuVo;
import com.atguigu.model.vo.RouterVo;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 * 菜单表 服务类
 * </p>
 *
 * @author yuan
 * @since 2023-05-22
 */
public interface SysMenuService extends IService<SysMenu> {
    /**
     * public final static（默认）
     */
    String STATUS_FALSE="0";
    String STATUS_TRUE="1";

    List<SysMenu> findNodes();

    void removeMenuById(String id);

    List<SysMenu> findMenuByRoleId(String roleId);

    void doAssign(AssginMenuVo assginMenuVo);

    List<RouterVo> getUserMenuList(String userId);

    List<String> getUserButtonList(String userId);
}
