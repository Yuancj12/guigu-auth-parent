package com.atguigu.system.controller;


import com.atguigu.common.result.Result;
import com.atguigu.common.utils.MD5;
import com.atguigu.model.system.SysUser;
import com.atguigu.model.vo.SysUserQueryVo;
import com.atguigu.system.service.SysUserService;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;


/**
 * <p>
 * 用户表 前端控制器
 * </p>
 *
 * @author yuan
 * @since 2023-05-19
 */
@Api(tags = "用户管理接口")
@RestController
@RequestMapping("/admin/system/sysUser")
public class SysUserController {
    @Autowired
    private SysUserService sysUserService;

    @ApiOperation("用户列表")
    @GetMapping("{pageNum}/{limit}")
    public Result list(@PathVariable("pageNum") Long pageNum,
                       @PathVariable("limit") Long limit,
                       SysUserQueryVo sysUserQueryVo){
        Page<SysUser> sysUserPage = new Page<>(pageNum,limit);
        IPage<SysUser> pageModel = sysUserService.selectPage(sysUserPage,sysUserQueryVo);
        return Result.ok(pageModel);
    }
    @ApiOperation("添加用户")
    @PostMapping("save")
    public Result save(@RequestBody SysUser sysUser){
        String encrypt = MD5.encrypt(sysUser.getPassword());
        sysUser.setPassword(encrypt);
        boolean is_success = sysUserService.save(sysUser);
        if(is_success){
            return Result.ok();
        }else {
            return Result.fail();
        }
    }

    @ApiOperation("根据id查询用户")
    @GetMapping("getUser/{id}")
    public Result getUser(@PathVariable("id")String id){
        SysUser sysUser = sysUserService.getById(id);
        return Result.ok(sysUser);
    }

    @ApiOperation("根据id删除用户")
    @DeleteMapping("remove/{id}")
    public Result remove(@PathVariable("id")String id){
        boolean is_success = sysUserService.removeById(id);
        if(is_success){
            return Result.ok();
        }else {
            return Result.fail();
        }
    }

    @ApiOperation("修改用户信息")
    @PostMapping("update")
    public Result update(@RequestBody SysUser sysUser){
        boolean is_success = sysUserService.updateById(sysUser);
        if(is_success){
            return Result.ok();
        }else {
            return Result.fail();
        }
    }

    @ApiOperation("根据id修改用户状态")
    @PutMapping("updateStatus/{id}/{status}")
    public Result updateStatus(@PathVariable("id")String id,
                               @PathVariable("status")Integer status){
        sysUserService.updateStatus(id,status);
        return Result.ok();
    }
}

