package com.atguigu.system.service;

import com.atguigu.model.system.SysUser;
import com.atguigu.model.vo.SysUserQueryVo;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.Map;

/**
 * <p>
 * 用户表 服务类
 * </p>
 *
 * @author yuan
 * @since 2023-05-19
 */
public interface SysUserService extends IService<SysUser> {

    IPage<SysUser> selectPage(Page<SysUser> sysUserPage, SysUserQueryVo sysUserQueryVo);

    void updateStatus(String id, Integer status);

    SysUser getUserInfoByUserName(String username);

    Map<String, Object> getUserInfo(String username);
}
