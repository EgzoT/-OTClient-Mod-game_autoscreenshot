local autoScreenshotButton = nil
local autoScreenshotWindow = nil

local autoScreenshotDirName = "/auto_screenshots"
local autoScreenshotDir = g_resources.getWriteDir()..autoScreenshotDirName

local levelScreenshot = nil
local mlvlScreenshot = nil
local fistScreenshot = nil
local clubScreenshot = nil
local swordScreenshot = nil
local axeScreenshot = nil
local distanceScreenshot = nil
local shieldingScreenshot = nil
local fishingScreenshot = nil
local deadScreenshot = nil

function init()
  autoScreenshotButton = modules.client_topmenu.addRightToggleButton('autoScreenshotButton', tr('Auto screenshot'), '/game_autoscreenshot/img_game_autoscreenshot/autoScreenshot_icon', toggle)
  autoScreenshotButton:setOn(false)

  autoScreenshotWindow = g_ui.displayUI('game_autoscreenshot')
  autoScreenshotWindow:setVisible(false)

  if not g_resources.directoryExists(autoScreenshotDir) then
    g_resources.makeDir(autoScreenshotDirName)
  end

  levelScreenshot = autoScreenshotWindow:recursiveGetChildById('levelScreenshotCheckBox')
  mlvlScreenshot = autoScreenshotWindow:recursiveGetChildById('magicScreenshotCheckBox')
  fistScreenshot = autoScreenshotWindow:recursiveGetChildById('fistScreenshotCheckBox')
  clubScreenshot = autoScreenshotWindow:recursiveGetChildById('clubScreenshotCheckBox')
  swordScreenshot = autoScreenshotWindow:recursiveGetChildById('swordScreenshotCheckBox')
  axeScreenshot = autoScreenshotWindow:recursiveGetChildById('axeScreenshotCheckBox')
  distanceScreenshot = autoScreenshotWindow:recursiveGetChildById('distanceScreenshotCheckBox')
  shieldingScreenshot = autoScreenshotWindow:recursiveGetChildById('shieldingScreenshotCheckBox')
  fishingScreenshot = autoScreenshotWindow:recursiveGetChildById('fishingScreenshotCheckBox')
  deadScreenshot = autoScreenshotWindow:recursiveGetChildById('onDeathScreenshotCheckBox')

  loadStateUI()
  addScreenshotEvents()
end

function terminate()
  saveStateUI()
  removeScreenshotEvents()

  autoScreenshotButton:destroy()
  autoScreenshotButton = nil
  autoScreenshotWindow:destroy()
  autoScreenshotWindow = nil
end

function toggle()
  if autoScreenshotWindow:isOn() then
    autoScreenshotWindow:setOn(false)
    autoScreenshotWindow:setVisible(false)
    autoScreenshotButton:setOn(false)
  else
    autoScreenshotWindow:setOn(true)
    autoScreenshotWindow:setVisible(true)
    autoScreenshotButton:setOn(true)
  end
end

function onMiniWindowClose()
  autoScreenshotWindow:setOn(false)
end

function clear()
  --code
end

-------------------------------------------------
--Scripts----------------------------------------
-------------------------------------------------

function addScreenshotEvents()
  connect(g_game, { onTextMessage = onTextMessage })
  connect(g_game, { onDeath = onDeath })
end

function removeScreenshotEvents()
  disconnect(g_game, { onTextMessage = onTextMessage })
  disconnect(g_game, { onDeath = onDeath })
end

function onTextMessage(messageMode, message)
  if messageMode ~= 18 then
    return
  end

  if string.find(message, 'You advanced from Level') then
    if levelScreenshot:isChecked() then
      local screenshotName = g_game.getLocalPlayer():getName().."_".."Level_"..g_game.getLocalPlayer():getLevel().."_"..os.date("%Y%m%d%H%M%S")..".png"
      scheduleEvent(function()
        g_window.makeScreenShot(autoScreenshotDirName.."/"..screenshotName)
      end, 50)
    end
  elseif string.find(message, 'You advanced to magic') then
    if mlvlScreenshot:isChecked() then
      local screenshotName = g_game.getLocalPlayer():getName().."_".."MagicLevel_"..g_game.getLocalPlayer():getBaseMagicLevel().."_"..os.date("%Y%m%d%H%M%S")..".png"
      scheduleEvent(function()
        g_window.makeScreenShot(autoScreenshotDirName.."/"..screenshotName)
      end, 50)
    end
  elseif string.find(message, 'You advanced to fist') then
    if fistScreenshot:isChecked() then
      local screenshotName = g_game.getLocalPlayer():getName().."_".."Fist_"..g_game.getLocalPlayer():getSkillBaseLevel(0).."_"..os.date("%Y%m%d%H%M%S")..".png"
      scheduleEvent(function()
        g_window.makeScreenShot(autoScreenshotDirName.."/"..screenshotName)
      end, 50)
    end
  elseif string.find(message, 'You advanced to club') then
    if clubScreenshot:isChecked() then
      local screenshotName = g_game.getLocalPlayer():getName().."_".."Club_"..g_game.getLocalPlayer():getSkillBaseLevel(1).."_"..os.date("%Y%m%d%H%M%S")..".png"
      scheduleEvent(function()
        g_window.makeScreenShot(autoScreenshotDirName.."/"..screenshotName)
      end, 50)
    end
  elseif string.find(message, 'You advanced to sword') then
    if swordScreenshot:isChecked() then
      local screenshotName = g_game.getLocalPlayer():getName().."_".."Sword_"..g_game.getLocalPlayer():getSkillBaseLevel(2).."_"..os.date("%Y%m%d%H%M%S")..".png"
      scheduleEvent(function()
        g_window.makeScreenShot(autoScreenshotDirName.."/"..screenshotName)
      end, 50)
    end
  elseif string.find(message, 'You advanced to axe') then
    if axeScreenshot:isChecked() then
      local screenshotName = g_game.getLocalPlayer():getName().."_".."Axe_"..g_game.getLocalPlayer():getSkillBaseLevel(3).."_"..os.date("%Y%m%d%H%M%S")..".png"
      scheduleEvent(function()
        g_window.makeScreenShot(autoScreenshotDirName.."/"..screenshotName)
      end, 50)
    end
  elseif string.find(message, 'You advanced to distance') then
    if distanceScreenshot:isChecked() then
      local screenshotName = g_game.getLocalPlayer():getName().."_".."Distance_"..g_game.getLocalPlayer():getSkillBaseLevel(4).."_"..os.date("%Y%m%d%H%M%S")..".png"
      scheduleEvent(function()
        g_window.makeScreenShot(autoScreenshotDirName.."/"..screenshotName)
      end, 50)
    end
  elseif string.find(message, 'You advanced to shielding') then
    if shieldingScreenshot:isChecked() then
      local screenshotName = g_game.getLocalPlayer():getName().."_".."Shielding_"..g_game.getLocalPlayer():getSkillBaseLevel(5).."_"..os.date("%Y%m%d%H%M%S")..".png"
      scheduleEvent(function()
        g_window.makeScreenShot(autoScreenshotDirName.."/"..screenshotName)
      end, 50)
    end
  elseif string.find(message, 'You advanced to fishing') then
    if fishingScreenshot:isChecked() then
      local screenshotName = g_game.getLocalPlayer():getName().."_".."Fishing_"..g_game.getLocalPlayer():getSkillBaseLevel(6).."_"..os.date("%Y%m%d%H%M%S")..".png"
      scheduleEvent(function()
        g_window.makeScreenShot(autoScreenshotDirName.."/"..screenshotName)
      end, 50)
    end
  end
end

function onDeath()
  if deadScreenshot:isChecked() then
    local screenshotName = g_game.getLocalPlayer():getName().."_".."Dead".."_"..os.date("%Y%m%d%H%M%S")..".png"
    g_window.makeScreenShot(autoScreenshotDirName.."/"..screenshotName)
  end
end

function loadStateUI()
  levelScreenshot:setChecked(g_settings.getBoolean('levelScreenshot'))
  mlvlScreenshot:setChecked(g_settings.getBoolean('mlvlScreenshot'))
  fistScreenshot:setChecked(g_settings.getBoolean('fistScreenshot'))
  clubScreenshot:setChecked(g_settings.getBoolean('clubScreenshot'))
  swordScreenshot:setChecked(g_settings.getBoolean('swordScreenshot'))
  axeScreenshot:setChecked(g_settings.getBoolean('axeScreenshot'))
  distanceScreenshot:setChecked(g_settings.getBoolean('distanceScreenshot'))
  shieldingScreenshot:setChecked(g_settings.getBoolean('shieldingScreenshot'))
  fishingScreenshot:setChecked(g_settings.getBoolean('fishingScreenshot'))
  deadScreenshot:setChecked(g_settings.getBoolean('deadScreenshot'))
end

function saveStateUI()
  if levelScreenshot:isChecked() then
    g_settings.set('levelScreenshot', true)
  else
    g_settings.set('levelScreenshot', false)
  end

  if mlvlScreenshot:isChecked() then
    g_settings.set('mlvlScreenshot', true)
  else
    g_settings.set('mlvlScreenshot', false)
  end

  if fistScreenshot:isChecked() then
    g_settings.set('fistScreenshot', true)
  else
    g_settings.set('fistScreenshot', false)
  end

  if clubScreenshot:isChecked() then
    g_settings.set('clubScreenshot', true)
  else
    g_settings.set('clubScreenshot', false)
  end

  if swordScreenshot:isChecked() then
    g_settings.set('swordScreenshot', true)
  else
    g_settings.set('swordScreenshot', false)
  end

  if axeScreenshot:isChecked() then
    g_settings.set('axeScreenshot', true)
  else
    g_settings.set('axeScreenshot', false)
  end

  if distanceScreenshot:isChecked() then
    g_settings.set('distanceScreenshot', true)
  else
    g_settings.set('distanceScreenshot', false)
  end

  if shieldingScreenshot:isChecked() then
    g_settings.set('shieldingScreenshot', true)
  else
    g_settings.set('shieldingScreenshot', false)
  end

  if fishingScreenshot:isChecked() then
    g_settings.set('fishingScreenshot', true)
  else
    g_settings.set('fishingScreenshot', false)
  end

  if deadScreenshot:isChecked() then
    g_settings.set('deadScreenshot', true)
  else
    g_settings.set('deadScreenshot', false)
  end
end