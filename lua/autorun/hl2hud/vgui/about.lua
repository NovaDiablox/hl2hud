
if SERVER then return end

local PANEL = {}

local URL_STEAM   = 'https://steamcommunity.com/id/dyametr/myworkshopfiles/'
local URL_GITHUB  = 'https://github.com/DyaMetR/hl2hud'

local LOCALE_AUTHOR     = 'by %s'
local LOCALE_VERSION    = 'Version %s'
local LOCALE_THANKS     = 'Thank you very much for downloading and using %s.'
local LOCALE_DISCLAIMER = 'All third-party fonts and designs belong to their original owners.'
local LOCALE_COPYRIGHT  = 'No copyright infringement intended.'
local LOCALE_WORKSHOP   = 'Check out the rest of my Workshop!'
local LOCALE_REPOSITORY = 'GitHub repository'

-- title font
surface.CreateFont('hl2hud_about_title', {
  font = 'HalfLife2',
  size = 36
})

-- subtitle font
surface.CreateFont('hl2hud_about_subtitle', {
  font = 'Verdana',
  size = 18,
  weight = 600
})

--[[------------------------------------------------------------------
  Populate the about page.
]]--------------------------------------------------------------------
function PANEL:Init()
  local background = vgui.Create('DImage', self)
  background:Dock(FILL)
  background:DockPadding(8, 24, 8, 1)
  background:SetImage('hl2hud/background0.png')
  background:SetImageColor(Color(144, 144, 144))
  background:SetKeepAspect(true)
  background:SetMouseInputEnabled(true)

  local title = vgui.Create('DLabel', background)
  title:SetFont('hl2hud_about_title')
  title:SetText('HALF-LIFE\'')
  title:SizeToContents()
  title:Dock(TOP)
  title:DockMargin(0, 0, 0, 6)
  title:SetContentAlignment(8)

  local subtitle = vgui.Create('DLabel', background)
  subtitle:SetFont('hl2hud_about_subtitle')
  subtitle:SetText('CUSTOMIZABLE HEADS UP DISPLAY')
  subtitle:Dock(TOP)
  subtitle:DockMargin(0, 0, 0, 8)
  subtitle:SetContentAlignment(8)

  local version = vgui.Create('DLabel', background)
  version:SetText(string.format(LOCALE_VERSION, HL2HUD.version))
  version:SetFont('DermaDefaultBold')
  version:Dock(TOP)
  version:SetContentAlignment(8)

  local thanks = vgui.Create('DLabel', background)
  thanks:SetText(string.format(LOCALE_THANKS, HL2HUD.name))
  thanks:SizeToContents()
  thanks:Dock(TOP)
  thanks:DockMargin(0, 16, 0, 0)
  thanks:SetContentAlignment(8)

  local disclaimer = vgui.Create('DLabel', background)
  disclaimer:SetText(LOCALE_DISCLAIMER)
  disclaimer:SizeToContents()
  disclaimer:Dock(TOP)
  disclaimer:DockMargin(0, 12, 0, 4)
  disclaimer:SetContentAlignment(8)

  local copyright = vgui.Create('DLabel', background)
  copyright:SetText(LOCALE_COPYRIGHT)
  copyright:SetFont('DermaDefaultBold')
  copyright:SizeToContents()
  copyright:Dock(TOP)
  copyright:SetContentAlignment(8)

  local footer = vgui.Create('Panel', background)
  footer:Dock(BOTTOM)

    local author = vgui.Create('DLabel', footer)
    author:SetText(string.format(LOCALE_AUTHOR, 'DyaMetR'))
    author:SizeToContents()
    author:Dock(LEFT)

    local buttons = vgui.Create('Panel', footer)
    buttons:Dock(LEFT)
    buttons:SetWide(36)
    buttons:DockMargin(4, 4, 0, 0)

      local steam = vgui.Create('DImageButton', buttons)
      steam:SetTooltip(LOCALE_WORKSHOP)
      steam:SetSize(16, 16)
      steam:SetImage('hl2hud/steam16.png')
      steam.DoClick = function() gui.OpenURL(URL_STEAM) end

      local github = vgui.Create('DImageButton', buttons)
      github:SetTooltip(LOCALE_REPOSITORY)
      github:SetX(20)
      github:SetSize(16, 16)
      github:SetImage('hl2hud/github16.png')
      github.DoClick = function() gui.OpenURL(URL_GITHUB) end

    local date = vgui.Create('DLabel', footer)
    date:SetText(HL2HUD.date)
    date:SizeToContents()
    date:Dock(RIGHT)

  self:SetSize(480, 270)
  self:SetDraggable(false)
  self:SetBackgroundBlur(true)
  self:MakePopup()
  self:DoModal()
end

vgui.Register('HL2HUD_About', PANEL, 'DFrame')
