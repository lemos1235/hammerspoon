-- 设置动画时间
hs.window.animationDuration = 0

-- 全屏显示
hs.hotkey.bind({"command", "ctrl"}, "F", function()
  local win = hs.window.focusedWindow()
  if (win:isFullScreen())
  then
    win:setFullScreen(false)
  else
    win:setFullScreen(true)
  end
end)

-- 最大化显示
hs.hotkey.bind({"alt", "ctrl"}, "Return", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()
  if (f.w == max.w and f.h == max.h)
  then
      f.x = max.x + (max.w / 6)
      f.y = max.y + (max.h / 4)
      f.w = max.w / 3 * 2
      f.h = max.h / 2
  else
      f.x = max.x
      f.y = max.y
      f.w = max.w
      f.h = max.h
  end
  win:setFrame(f)
end)

-- 放到屏幕中间
hs.hotkey.bind({"alt", "ctrl"}, "C", function()
  local win = hs.window.focusedWindow()
  win:centerOnScreen()
end)

-- 返回桌面
hs.hotkey.bind({"alt", "ctrl"}, "D", function()
    local desktop = hs.window.desktop()
    desktop:focus()
end)

function resizeFrame(frame, ratio)
    frame.x = frame.x + frame.w / 2 * (1 - ratio)
    frame.y = frame.y + frame.h / 2 * (1 - ratio)
    frame.w = frame.w * ratio
    frame.h = frame.h * ratio
end

-- 放大窗口
hs.hotkey.bind({"alt", "ctrl"}, "=", function()
    local window = hs.window.focusedWindow()
    local frame = window:frame()
    resizeFrame(frame, 1.1)
    window:setFrame(frame)
end)

-- 缩小窗口
hs.hotkey.bind({"alt", "ctrl"}, "-", function()
    local window = hs.window.focusedWindow()
    local frame = window:frame()
    resizeFrame(frame, 0.9)
    window:setFrame(frame)
end)

-- 上侧分屏
hs.hotkey.bind({"alt", "ctrl"}, "Up", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y
  f.w = max.w
  f.h = max.h / 2
  win:setFrame(f)
end)

-- 下侧分屏
hs.hotkey.bind({"alt", "ctrl"}, "Down", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y + (max.h / 2)
  f.w = max.w
  f.h = max.h / 2
  win:setFrame(f)
end)

-- 左侧分屏
hs.hotkey.bind({"alt", "ctrl"}, "Left", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
  win:setFrame(f)
end)

-- 右侧分屏
hs.hotkey.bind({"alt", "ctrl"}, "Right", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + (max.w / 2)
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
  win:setFrame(f)
end)

-- move up
hs.hotkey.bind({"shift", "alt", "ctrl"}, "Up", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()

  f.y = f.y - 10
  win:setFrame(f)
end)

-- move down
hs.hotkey.bind({"shift", "alt", "ctrl"}, "Down", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()

  f.y = f.y + 10
  win:setFrame(f)
end)

-- move left
hs.hotkey.bind({"shift", "alt", "ctrl"}, "Left", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()

  f.x = f.x - 10
  win:setFrame(f)
end)

-- move right
hs.hotkey.bind({"shift", "alt", "ctrl"}, "Right", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()

  f.x = f.x + 10
  win:setFrame(f)
end)

-- move left up
hs.hotkey.bind({"shift", "alt", "ctrl"}, "Y", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()

  f.x = f.x - 10
  f.y = f.y - 10
  win:setFrame(f)
end)

-- -- 移动到上边屏幕
-- hs.hotkey.bind({"alt", "cmd"}, "Up", function()
--   local win = hs.window.focusedWindow()
--   win:moveOneScreenNorth()
-- end)

-- -- 移动到下边屏幕
-- hs.hotkey.bind({"alt", "cmd"}, "Down", function()
--   local win = hs.window.focusedWindow()
--   win:moveOneScreenSouth()
-- end)

-- -- 移动到左边屏幕
-- hs.hotkey.bind({"alt", "cmd"}, "Left", function()
--   local win = hs.window.focusedWindow()
--   win:moveOneScreenWest()
-- end)

-- -- 移动到右边屏幕
-- hs.hotkey.bind({"alt", "cmd"}, "Right", function()
--   local win = hs.window.focusedWindow()
--   win:moveOneScreenEast()
-- end)

-- 快捷启动应用
function launchApp(object)
    hs.hotkey.bind(object.basicKey, object.key, function()
        hs.application.launchOrFocus(object.app)
        local application = hs.application.get(object.app)
        if application ~= nil then
            local window = application:focusedWindow()
--            if window ~= nil then
--                moveToCenterOfWindow(window)
--            end
        end
    end)
end

hs.fnutils.each({
    { basicKey = {"command", "ctrl"}, key = "Return", app = "iTerm" },
}, function(object)
    launchApp(object)
end)


hs.hotkey.bind({"alt", "ctrl"}, "R", function()
  hs.reload()
end)

hs.notify.new({title='Hammerspoon', informativeText='Ready to rock 🤘'}):send()

