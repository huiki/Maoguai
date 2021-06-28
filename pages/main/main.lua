--
-- @author 寒歌
-- @description Main是应用的主模块，其中注册了应用运行中UI事件的回调、Activity生命周期的回调等
-- 你也可以在此编写启动事件代码，或控制应用运行逻辑、自定义应用UI等等。
-- @other 本模版已为你编写好基础事件，建议在阅读注释并理解相关参数意义后再进行扩展编写


-- 需启用的模块:云储远程更新和公告,中文函数模块,事件助手,杂类功能

-- ****默认导入包****
require "import"
import "android.os.*"
import "android.widget.*"
import "android.view.*"
-- ****不需要请删除****

FusionUtil = luajava.bindClass "net.fusionapp.core.util.FusionUtil"
android_R = luajava.bindClass "android.R"

-- @param data 侧滑栏列表的全部数据
-- @param recyclerView 侧滑栏列表控件
-- @param listIndex 点击的列表索引（点击的是第几个列表）
-- @param clickIndex 点击的项目索引（点击的第几个项目）
function onDrawerListItemClick(data, recyclerView, listIndex, itemIndex)
    --侧滑栏列表的数据是二维结构，所以需要先获取到点击项目所在列表的数据
    local listData = data.get(listIndex);
    --获取到所在列表的数据后获取点击项目的数据
    local itemData = listData.get(itemIndex);
    --最后获取到点击的项目的标题
    local itemTitle = itemData.getTitle();
    if itemTitle == "Dark Theme" then
        if itemData.isChecked() then
            switchNightTheme(itemData, false, "Default_Light.json")
        else
            switchNightTheme(itemData, true, "Night.json")
        end
      else
        print("Click: "..itemTitle)
    end
end

--重新加载当前activity
function recreate()
    activity.finish();
    activity.startFusionActivity(activity.getLoader().getPageName());
    activity.overridePendingTransition(android_R.anim.fade_in,android_R.anim.fade_out);
end

--切换主题和夜间模式
function switchNightTheme(listItemData, isNightMode, newThemeName)
    listItemData.setChecked(isNightMode)
    activity.getLoader().updatePageConfig()
    FusionUtil.changeTheme(activity.getLoader().getProjectDir().getAbsolutePath(), newThemeName)
    FusionUtil.setNightMode(isNightMode)
    recreate()
end

-- @param keyword 搜索栏输入的文本
-- @description 顶栏搜索功能回调事件
function onSearchEvent(keyword)
    --TODO：
    
end

-- @param title 点击的菜单标题
-- @description 顶栏菜单项目点击回调事件
function onMenuItemClick(title)
  刷新网页()
     --TODO：
    
end


--悬浮按钮点击事件
function onFloatingActionButtonClick(v)
  
     --TODO：
    
end

--初始化一张点击事件表
functions={}

functions["资源下载"]=function()
 进入子页面("1",{"参数"})
end

functions["迷你微博"]=function()
 进入子页面("2",{"参数"})
end

functions["其他社区"]=function()
 进入子页面("4",{"参数"})
end

functions["直播间&FM"]=function()
 进入子页面("3",{"参数"})
end

functions["百科"]=function()
 进入子页面("5",{"参数"})
end

functions["资源库"]=function()
 进入子页面("6",{"参数"})
end

functions["同人作"]=function()
 进入子页面("7",{"参数"})
end

functions["专刊"]=function()
 进入子页面("8",{"参数"})
end

functions["游戏"]=function()
 进入子页面("9",{"参数"})
end

functions["获取网页版链接(适用于pc/ios)"]=function()
 复制文本("https://mgzspc.mysxl.cn/")
 弹出消息("复制成功！")
end

functions["联系我们[Q群]"]=function()
  对话框()
.设置标题("注意")
.设置消息("即将跳转QQ")
.设置积极按钮("确定",function()
  加QQ群(1128216585)
end)
.设置消极按钮("取消")
.显示()
end

functions["关于"]=function()
  对话框()
.设置标题("关于")
.设置消息("毛怪助手重制版使用Fusion app2.0制作\n作者:哔哩哔哩@千凪Sennagi\n技术帮助:哔哩哔哩@绫沫Yokina\n感谢你的使用~")
.设置积极按钮("确定",function()
end)
.设置消极按钮("取消")
.显示()
--中文对话框编写者：难忘的旋律
end
  
  
--[=[仍然同理，需要写哪个项目的点击事件就添加

functions["你的项目标题"]=function()
end

以上代码块到文件中]=]

--注册点击事件，如无其它需求，不用扩展写
function onDrawerListItemClick(data, recyclerView, listIndex, itemIndex)
    --侧滑栏列表的数据是二维结构，所以需要先获取到点击项目所在列表的数据
    local listData = data.get(listIndex);
    --获取到所在列表的数据后获取点击项目的数据
    local itemData = listData.get(itemIndex);
    --最后获取到点击的项目的标题
    local title = itemData.getTitle();
    local event=functions[title]
    if(event~=nil)then
      event()
    end
end




--首次使用提醒
泡沫对话框(666)--666请更换为其他id以保证对话框的唯一性
.设置标题("毛怪助手重置5.0版")
.设置消息("感谢毛怪们的支持呀！！！")
.设置积极按钮("确定",function()
  printprint("点开侧滑栏查看更多功能~")
end)
.设置消极按钮("取消")
.显示()








