--
-- @author 寒歌
-- @description Main是应用的主模块，其中注册了应用运行中UI事件的回调、Activity生命周期的回调等
-- 你也可以在此编写启动事件代码，或控制应用运行逻辑、自定义应用UI等等。
-- @other 本模版已为你编写好基础事件，建议在阅读注释并理解相关参数意义后再进行扩展编写
--

-- ****默认导入包****
require "import"
import "android.os.*"
import "android.widget.*"
import "android.view.*"
local uiManager=activity.getUiManager()

--获取当前页面的WebView
local webView=uiManager.getCurrentFragment().getWebView()
webView.setDownloadListener{
    onDownloadStart=function(url,a,b,c,d)
      import "android.content.Intent"
      import "android.net.Uri"
    
      viewIntent = Intent("android.intent.action.VIEW",Uri.parse(url))
      activity.startActivity(viewIntent)

    end
  }
-- ****不需要请删除****

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

  --TODO：
  print(itemTitle)
end

-- @param keyword 搜索栏输入的文本
-- @description 顶栏搜索功能回调事件
function onSearchEvent(keyword)
  --TODO：
  print("Search keyword:"..keyword)
end

-- @param title 点击的菜单标题
-- @description 顶栏菜单项目点击回调事件
设置应用栏菜单项点击事件("答疑",function()
  对话框()
.设置标题("无法下载？")
.设置消息("1.下载时请选用浏览器下载，下载器可能会导致文件名错误\n2.进入系统下载器调整路径为Download即可(适用于MIUI/JOY UI)")
.设置积极按钮("确定",function()
end)
.设置消极按钮("取消")
.显示()
end)
--使用该功能，请确保你未在main.lua注册onMenuItemClick方法



--悬浮按钮点击事件
function onFloatingActionButtonClick(v)
  退出页面()
end


--初始化一张点击事件表
functions={}

functions["未在音乐平台上传的曲目"]=function()
 加载网页("https://mayfly.lanzoui.com/b015zsrob")

end

functions["直播剪辑/其他歌曲"]=function()
 加载网页("https://mayfly.lanzoui.com/b015nbxla")
end

functions["素材"]=function()
 加载网页("https://mayfly.lanzoui.com/b015nbxod")
end

functions["资源库"]=function()
 加载网页("http://mgzsresources.mysxl.cn/")
end

functions["资源整和下载"]=function()
 加载网页("https://mayfly.lanzoui.com/b015spmda")
end

functions["毛怪助手历代版本(更新)"]=function()
 加载网页("https://mayfly.lanzoui.com/b015nisvc")
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