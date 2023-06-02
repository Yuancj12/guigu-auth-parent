package com.atguigu.system.controller;


import com.atguigu.common.result.Result;
import com.atguigu.model.system.SysMenu;
import com.atguigu.model.system.SysRole;
import com.atguigu.model.vo.AssginMenuVo;
import com.atguigu.system.service.SysMenuService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * <p>
 * 菜单表 前端控制器
 * </p>
 *
 * @author yuan
 * @since 2023-05-22
 */
@Api(tags = "菜单管理")
@RestController
@RequestMapping("/admin/system/sysMenu")
public class SysMenuController {

    @Autowired
    private SysMenuService sysMenuService;

    @ApiOperation("菜单列表")
    @GetMapping("findNodes")
    public Result findNodes(){
        List<SysMenu> sysMenuList = sysMenuService.findNodes();
        return Result.ok(sysMenuList);
    }

    @ApiOperation("根据id查询菜单")
    @GetMapping("findNode/{id}")
    public Result findNode(@PathVariable("id") String id){
        SysMenu sysMenu = sysMenuService.getById(id);
        return Result.ok(sysMenu);
    }

    @ApiOperation("添加菜单")
    @PostMapping("save")
    public Result save(@RequestBody SysMenu sysMenu){
        boolean isSuccess = sysMenuService.save(sysMenu);
        if(isSuccess){
            return Result.ok();
        }else {
            return Result.fail();
        }
    }

    @ApiOperation("修改菜单")
    @PostMapping("update")
    public Result update(@RequestBody SysMenu sysMenu){
        boolean isSuccess = sysMenuService.updateById(sysMenu);
        if(isSuccess){
            return Result.ok();
        }else {
            return Result.fail();
        }
    }

    @ApiOperation("删除菜单")
    @DeleteMapping("remove/{id}")
    public Result remove(@PathVariable("id")String id){
        sysMenuService.removeMenuById(id);
        return Result.ok();
    }

    @ApiOperation("获取角色的菜单数据")
    @GetMapping("toAssign/{roleId}")
    public Result toAssign(@PathVariable("roleId")String roleId){
        List<SysMenu> sysMenuList = sysMenuService.findMenuByRoleId(roleId);
        return Result.ok(sysMenuList);
    }

    @ApiOperation("给角色分配权限")
    @PostMapping("doAssign")
    public Result doAssign(@RequestBody AssginMenuVo assginMenuVo){
        sysMenuService.doAssign(assginMenuVo);
        return Result.ok();
    }
}

