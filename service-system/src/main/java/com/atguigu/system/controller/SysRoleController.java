package com.atguigu.system.controller;


import com.atguigu.common.result.Result;
import com.atguigu.model.system.SysRole;
import com.atguigu.model.vo.AssginRoleVo;
import com.atguigu.model.vo.SysRoleQueryVo;
import com.atguigu.system.annotation.Log;
import com.atguigu.system.enums.BusinessType;
import com.atguigu.system.service.SysRoleService;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@Api(tags="角色管理接口")
@RestController
@RequestMapping("/admin/system/sysRole")
public class SysRoleController {
    @Autowired
    private SysRoleService sysRoleService;

    /**
     * 查询所有角色
     * @return
     */
    @ApiOperation("查询所有记录")
    @GetMapping("findAll")
    public Result findAllRole(){
        List<SysRole> list = sysRoleService.list();
        return Result.ok(list);
    }
    /**
     * 逻辑删除
     */
    @ApiOperation("逻辑删除接口")
    @DeleteMapping("remove/{id}")
    public Result removeRole(@PathVariable String id){
        boolean isSuccess = sysRoleService.removeById(id);
        if(isSuccess){
            return Result.ok();
        }else {
            return Result.fail();
        }
    }

    /**
     * 条件分页查询
     */
    @ApiOperation("条件分页查询")
    @GetMapping("{pageNum}/{limit}")
    public Result findPageQueryRole(@PathVariable("pageNum") Long pageNum,
                                    @PathVariable("limit") Long limit,
                                    SysRoleQueryVo sysRoleQueryVo){
        Page<SysRole> sysRolePage = new Page<>(pageNum,limit);
        IPage<SysRole> pageModel = sysRoleService.selectPage(sysRolePage,sysRoleQueryVo);
        return  Result.ok(pageModel);
    }
    /**
     * 添加角色
     */
    @Log(title = "角色管理",businessType = BusinessType.INSERT)
    @ApiOperation("添加角色")
    @PostMapping("save")
    public Result saveRole(@RequestBody SysRole sysRole){
        boolean isSuccess = sysRoleService.save(sysRole);
        if (isSuccess){
            return Result.ok();
        }else{
            return Result.fail();
        }
    }
    /**
     * 查询角色
     */
    @ApiOperation("查询角色")
    @PostMapping("findRoleById/{id}")
    public Result findOne(@PathVariable String id){
        SysRole sysRole = sysRoleService.getById(id);
        return Result.ok(sysRole);
    }
    /**
     * 修改角色
     */
    @ApiOperation("修改角色")
    @PutMapping("update")
    public Result updateRole(@RequestBody SysRole sysRole){
        boolean isSuccess = sysRoleService.updateById(sysRole);
        if(isSuccess){
            return Result.ok();
        }else{
            return Result.fail();
        }
    }

    /**
     * 批量删除角色
     */
    @ApiOperation("批量删除角色")
    @DeleteMapping("batchRemove")
    public Result batchRemove(@RequestBody List<String> ids){
        boolean isSuccess = sysRoleService.removeByIds(ids);
        if(isSuccess){
            return Result.ok();
        }else{
            return Result.fail();
        }
    }

    @ApiOperation("获取用户的角色数据")
    @GetMapping("toAssign/{userId}")
    public Result toAssign(@PathVariable String userId) {
        Map<String,Object> roleMap = sysRoleService.getRolesByUserId(userId);
        return Result.ok(roleMap);
    }

    @ApiOperation("用户分配角色")
    @PostMapping("doAssign")
    public Result doAssign(@RequestBody AssginRoleVo assginRoleVo) {
        sysRoleService.doAssign(assginRoleVo);
        return Result.ok();
    }



}
