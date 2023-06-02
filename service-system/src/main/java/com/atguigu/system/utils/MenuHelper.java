package com.atguigu.system.utils;

import com.atguigu.model.system.SysMenu;

import java.util.ArrayList;
import java.util.List;

public class MenuHelper {
    public static List<SysMenu> buildTree(List<SysMenu> sysMenuList){
        //创建集合封装最后数据
        List<SysMenu> trees = new ArrayList<>();
        //遍历所有菜单集合
        for (SysMenu sysMenu:sysMenuList) {
            //找到递归入口，parentId=0
            if(sysMenu.getParentId().longValue()==0) {
                trees.add(findChildren(sysMenu,sysMenuList));
            }
        }
        return trees;
    }

    private static SysMenu findChildren(SysMenu sysMenu, List<SysMenu> treeNodes) {
        //数据初始化
        sysMenu.setChildren(new ArrayList<>());
        for (SysMenu node : treeNodes) {
            if(Long.parseLong(sysMenu.getId())==node.getParentId()){
                if(sysMenu.getChildren()==null){
                    sysMenu.setChildren(new ArrayList<>());
                }
                sysMenu.getChildren().add(findChildren(node,treeNodes));
            }
        }
        return sysMenu;
    }
}
