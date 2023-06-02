package com.atguigu.system.service;

import com.atguigu.model.system.SysRole;
import com.atguigu.model.vo.AssginRoleVo;
import com.atguigu.model.vo.SysRoleQueryVo;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.Map;

public interface SysRoleService extends IService<SysRole> {
    IPage<SysRole> selectPage(Page<SysRole> sysRolePage, SysRoleQueryVo sysRoleQueryVo);

    /**
     * 获取用户的角色数据
     */
    Map<String, Object> getRolesByUserId(String userId);

    /**
     * 用户分配角色
     */
    void doAssign(AssginRoleVo assginRoleVo);
}
