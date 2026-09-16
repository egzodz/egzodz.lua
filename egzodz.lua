-- ============================================
-- EGZODZ HUB v1.0
-- by egzodz
-- Red Team Edition - Anti-Cheat Testing
-- ============================================

local P=game:GetService("Players")
local R=game:GetService("RunService")
local T=game:GetService("TweenService")
local C=game:GetService("CoreGui")
local CP=game:GetService("ContentProvider")
local UIS=game:GetService("UserInputService")
local WS=game:GetService("Workspace")
local LT=game:GetService("Lighting")
local TS=game:GetService("TeleportService")
local CH=game:GetService("Chat")
local L=P.LocalPlayer

if C:FindFirstChild("EGZODZHUB")then C.EGZODZHUB:Destroy()end

local function log(m)print("[EGZODZ] "..tostring(m))end
local function hrp(p)p=p or L local c=p.Character or p.CharacterAdded:Wait()return c:FindFirstChild("HumanoidRootPart")or c:WaitForChild("HumanoidRootPart",2)end
local function hum(p)p=p or L local c=p.Character or p.CharacterAdded:Wait()return c:FindFirstChildOfClass("Humanoid")or c:WaitForChild("Humanoid",2)end
local function tw(o,t,pr)T:Create(o,TweenInfo.new(t,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),pr):Play()end
local function tp(cf,s)s=s or 12 local h=hrp()if not h then return end local a=h.CFrame for i=1,s do h.CFrame=a:Lerp(cf,i/s)R.RenderStepped:Wait()end end

-- ===== BYPASS =====
pcall(function()
  if getrawmetatable and setreadonly and newcclosure then
    local mt=getrawmetatable(game)
    local oi=mt.__index
    setreadonly(mt,false)
    mt.__index=newcclosure(function(t,k)
      if k=="WalkSpeed" and typeof(t)=="Instance" and t:IsA("Humanoid") then
        if oi(t,k)~=16 then return 16 end
      end
      return oi(t,k)
    end)
    setreadonly(mt,true)
    log("spoof ok")
  end
end)
pcall(function()
  if hookfunction then
    hookfunction(L.Kick,function()end)
    log("antikick ok")
  end
end)

-- ===== UI =====
local S=Instance.new("ScreenGui")
S.Name="EGZODZHUB"
S.ResetOnSpawn=false
S.ZIndexBehavior=Enum.ZIndexBehavior.Sibling
S.Parent=C

-- Botão flutuante
local B=Instance.new("TextButton")
B.Size=UDim2.new(0,64,0,64)
B.Position=UDim2.new(0,20,.4,0)
B.BackgroundColor3=Color3.fromRGB(140,60,255)
B.Text="EZ"
B.TextColor3=Color3.new(1,1,1)
B.TextSize=20
B.Font=Enum.Font.GothamBlack
B.BorderSizePixel=0
B.Draggable=true
B.Parent=S

local bc=Instance.new("UICorner")bc.CornerRadius=UDim.new(1,0)bc.Parent=B
local bs=Instance.new("UIStroke")bs.Color=Color3.fromRGB(200,140,255)bs.Thickness=2 bs.Parent=B
local bg=Instance.new("UIGradient")
bg.Color=ColorSequence.new(Color3.fromRGB(180,80,255),Color3.fromRGB(60,130,255))
bg.Rotation=45
bg.Parent=B

-- Painel principal
local M=Instance.new("Frame")
M.Size=UDim2.new(0,460,0,600)
M.Position=UDim2.new(.5,-230,.5,-300)
M.BackgroundColor3=Color3.fromRGB(14,14,22)
M.BorderSizePixel=0
M.Draggable=true
M.Visible=false
M.ClipsDescendants=true
M.Parent=S

local mc=Instance.new("UICorner")mc.CornerRadius=UDim.new(0,16)mc.Parent=M
local ms=Instance.new("UIStroke")
ms.Color=Color3.fromRGB(140,60,255)
ms.Thickness=1.5
ms.Transparency=.2
ms.Parent=M

-- Header
local H=Instance.new("Frame")
H.Size=UDim2.new(1,0,0,60)
H.BackgroundColor3=Color3.fromRGB(25,25,40)
H.BorderSizePixel=0
H.Parent=M

local hc=Instance.new("UICorner")hc.CornerRadius=UDim.new(0,16)hc.Parent=H
local hcv=Instance.new("Frame")
hcv.Size=UDim2.new(1,0,.5,0)
hcv.Position=UDim2.new(0,0,.5,0)
hcv.BackgroundColor3=Color3.fromRGB(25,25,40)
hcv.BorderSizePixel=0
hcv.Parent=H
local hg=Instance.new("UIGradient")
hg.Color=ColorSequence.new(Color3.fromRGB(140,60,255),Color3.fromRGB(60,130,255))
hg.Rotation=90
hg.Parent=H

local ico=Instance.new("TextLabel")
ico.Size=UDim2.new(0,55,1,0)
ico.BackgroundTransparency=1
ico.Text="⚡"
ico.TextSize=28
ico.Font=Enum.Font.GothamBold
ico.Parent=H

local ti=Instance.new("TextLabel")
ti.Size=UDim2.new(1,-140,0,26)
ti.Position=UDim2.new(0,60,0,10)
ti.BackgroundTransparency=1
ti.Text="EGZODZ HUB"
ti.TextColor3=Color3.new(1,1,1)
ti.TextSize=20
ti.Font=Enum.Font.GothamBlack
ti.TextXAlignment=Enum.TextXAlignment.Left
ti.Parent=H

local su=Instance.new("TextLabel")
su.Size=UDim2.new(1,-140,0,14)
su.Position=UDim2.new(0,60,0,36)
su.BackgroundTransparency=1
su.Text="v1.0 • by egzodz • red team"
su.TextColor3=Color3.fromRGB(210,210,240)
su.TextSize=10
su.Font=Enum.Font.Gotham
su.TextXAlignment=Enum.TextXAlignment.Left
su.Parent=H

-- Indicador ON
local onDot=Instance.new("Frame")
onDot.Size=UDim2.new(0,10,0,10)
onDot.Position=UDim2.new(1,-100,0,15)
onDot.BackgroundColor3=Color3.fromRGB(80,220,120)
onDot.BorderSizePixel=0
onDot.Parent=H
local onC=Instance.new("UICorner")onC.CornerRadius=UDim.new(1,0)onC.Parent=onDot
local onT=Instance.new("TextLabel")
onT.Size=UDim2.new(0,50,0,12)
onT.Position=UDim2.new(1,-86,0,14)
onT.BackgroundTransparency=1
onT.Text="BYPASS ON"
onT.TextColor3=Color3.fromRGB(80,220,120)
onT.TextSize=9
onT.Font=Enum.Font.GothamBold
onT.TextXAlignment=Enum.TextXAlignment.Left
onT.Parent=H

local cl=Instance.new("TextButton")
cl.Size=UDim2.new(0,38,0,38)
cl.Position=UDim2.new(1,-46,0,11)
cl.BackgroundColor3=Color3.fromRGB(220,60,80)
cl.Text="✕"
cl.TextColor3=Color3.new(1,1,1)
cl.TextSize=18
cl.Font=Enum.Font.GothamBold
cl.BorderSizePixel=0
cl.Parent=H
local cc=Instance.new("UICorner")cc.CornerRadius=UDim.new(0,9)cc.Parent=cl

local open=false
local function setP(s)
  open=s
  if s then
    M.Visible=true
    M.Size=UDim2.new(0,460,0,0)
    tw(M,.3,{Size=UDim2.new(0,460,0,600)})
  else
    tw(M,.2,{Size=UDim2.new(0,460,0,0)})
    task.wait(.2)
    M.Visible=false
  end
end
B.MouseButton1Click:Connect(function()setP(not open)end)
cl.MouseButton1Click:Connect(function()setP(false)end)
task.defer(function()setP(true)end)

-- Abas
local TB=Instance.new("ScrollingFrame")
TB.Size=UDim2.new(1,-20,0,38)
TB.Position=UDim2.new(0,10,0,70)
TB.BackgroundColor3=Color3.fromRGB(20,20,32)
TB.BorderSizePixel=0
TB.ScrollBarThickness=2
TB.CanvasSize=UDim2.new(0,0,0,0)
TB.AutomaticCanvasSize=Enum.AutomaticSize.X
TB.ScrollingDirection=Enum.ScrollingDirection.X
TB.Parent=M
local tbc=Instance.new("UICorner")tbc.CornerRadius=UDim.new(0,8)tbc.Parent=TB
local tbl=Instance.new("UIListLayout")
tbl.FillDirection=Enum.FillDirection.Horizontal
tbl.Padding=UDim.new(0,3)
tbl.VerticalAlignment=Enum.VerticalAlignment.Center
tbl.Parent=TB
local tbp=Instance.new("UIPadding")
tbp.PaddingLeft=UDim.new(0,3)
tbp.PaddingRight=UDim.new(0,3)
tbp.Parent=TB

local CT=Instance.new("Frame")
CT.Size=UDim2.new(1,-20,1,-125)
CT.Position=UDim2.new(0,10,0,115)
CT.BackgroundTransparency=1
CT.Parent=M

local pages={}
local function tab(n,i)
  local b=Instance.new("TextButton")
  b.Size=UDim2.new(0,78,1,-8)
  b.BackgroundColor3=Color3.fromRGB(32,32,50)
  b.Text=i.." "..n
  b.TextColor3=Color3.fromRGB(180,180,200)
  b.TextSize=10
  b.Font=Enum.Font.GothamBold
  b.BorderSizePixel=0
  b.Parent=TB
  local c=Instance.new("UICorner")c.CornerRadius=UDim.new(0,6)c.Parent=b
  local p=Instance.new("ScrollingFrame")
  p.Size=UDim2.new(1,0,1,0)
  p.BackgroundTransparency=1
  p.BorderSizePixel=0
  p.ScrollBarThickness=4
  p.CanvasSize=UDim2.new(0,0,0,0)
  p.AutomaticCanvasSize=Enum.AutomaticSize.Y
  p.Visible=false
  p.Parent=CT
  local l=Instance.new("UIListLayout")l.Padding=UDim.new(0,6)l.Parent=p
  pages[n]={b=b,p=p}
  b.MouseButton1Click:Connect(function()
    for _,v in pairs(pages)do
      v.p.Visible=false
      tw(v.b,.15,{BackgroundColor3=Color3.fromRGB(32,32,50),TextColor3=Color3.fromRGB(180,180,200)})
    end
    p.Visible=true
    tw(b,.15,{BackgroundColor3=Color3.fromRGB(140,60,255),TextColor3=Color3.new(1,1,1)})
  end)
  return p
end

local PG=tab("Players","👥")
local PP=tab("Salvos","📍")
local PM=tab("Move","🏃")
local PC=tab("Combate","⚔️")
local PV=tab("Visual","👁")
local PI=tab("Itens","🎒")
local PW=tab("Mundo","🌍")
local PS=tab("Social","💬")
local PRT=tab("RedTeam","🛡")
task.defer(function()pages["Players"].b:Fire("MouseButton1Click")end)

local function btn(par,txt,col,fn)
  local b=Instance.new("TextButton")
  b.Size=UDim2.new(1,0,0,32)
  b.BackgroundColor3=col or Color3.fromRGB(45,45,65)
  b.Text=txt
  b.TextColor3=Color3.fromRGB(235,235,245)
  b.TextSize=11
  b.Font=Enum.Font.GothamBold
  b.BorderSizePixel=0
  b.Parent=par
  local c=Instance.new("UICorner")c.CornerRadius=UDim.new(0,7)c.Parent=b
  local st=Instance.new("UIStroke")st.Color=Color3.fromRGB(90,90,130)st.Thickness=1 st.Transparency=.5 st.Parent=b
  b.MouseEnter:Connect(function()tw(b,.15,{BackgroundColor3=Color3.fromRGB(math.min(col and col.R*255+30 or 75,255)/255,math.min(col and col.G*255+30 or 75,255)/255,math.min(col and col.B*255+30 or 95,255)/255)})end)
  b.MouseLeave:Connect(function()tw(b,.15,{BackgroundColor3=col or Color3.fromRGB(45,45,65)})end)
  if fn then b.MouseButton1Click:Connect(fn)end
  return b
end

local function label(par,txt)
  local l=Instance.new("TextLabel")
  l.Size=UDim2.new(1,0,0,18)
  l.BackgroundTransparency=1
  l.Text=txt
  l.TextColor3=Color3.fromRGB(150,150,180)
  l.TextSize=10
  l.Font=Enum.Font.GothamBlack
  l.TextXAlignment=Enum.TextXAlignment.Left
  l.Parent=par
  return l
end

local function input(par,ph)
  local b=Instance.new("TextBox")
  b.Size=UDim2.new(1,0,0,28)
  b.BackgroundColor3=Color3.fromRGB(20,20,32)
  b.Text=""
  b.PlaceholderText=ph
  b.TextColor3=Color3.new(1,1,1)
  b.PlaceholderColor3=Color3.fromRGB(120,120,150)
  b.TextSize=11
  b.Font=Enum.Font.Gotham
  b.BorderSizePixel=0
  b.Parent=par
  local c=Instance.new("UICorner")c.CornerRadius=UDim.new(0,6)c.Parent=b
  local p=Instance.new("UIPadding")p.PaddingLeft=UDim.new(0,8)p.Parent=b
  return b
end

-- ===== ABA PLAYERS =====
local sb=input(PG,"🔍 Buscar jogador...")
local PLF=Instance.new("Frame")
PLF.Size=UDim2.new(1,0,0,0)
PLF.AutomaticSize=Enum.AutomaticSize.Y
PLF.BackgroundTransparency=1
PLF.Parent=PG
local PLL=Instance.new("UIListLayout")PLL.Padding=UDim.new(0,5)PLL.Parent=PLF
local pbs={}

local function row(p)
  if pbs[p]then return end
  local r=Instance.new("Frame")
  r.Size=UDim2.new(1,0,0,42)
  r.BackgroundColor3=Color3.fromRGB(25,25,38)
  r.BorderSizePixel=0
  r.Parent=PLF
  local rc=Instance.new("UICorner")rc.CornerRadius=UDim.new(0,8)rc.Parent=r
  local st=Instance.new("UIStroke")st.Color=Color3.fromRGB(60,60,90)st.Thickness=1 st.Transparency=.6 st.Parent=r
  local av=Instance.new("ImageLabel")
  av.Size=UDim2.new(0,32,0,32)
  av.Position=UDim2.new(0,5,.5,-16)
  av.BackgroundColor3=Color3.fromRGB(50,50,70)
  av.BorderSizePixel=0
  av.Image="rbxthumb://type=AvatarHeadShot&id="..p.UserId.."&w=48&h=48"
  av.Parent=r
  local avc=Instance.new("UICorner")avc.CornerRadius=UDim.new(1,0)avc.Parent=av
  local nl=Instance.new("TextLabel")
  nl.Size=UDim2.new(1,-160,0,16)
  nl.Position=UDim2.new(0,44,0,6)
  nl.BackgroundTransparency=1
  nl.Text=p.Name
  nl.TextColor3=Color3.fromRGB(240,240,255)
  nl.TextSize=11
  nl.Font=Enum.Font.GothamBold
  nl.TextXAlignment=Enum.TextXAlignment.Left
  nl.TextTruncate=Enum.TextTruncate.AtEnd
  nl.Parent=r
  local il=Instance.new("TextLabel")
  il.Size=UDim2.new(1,-160,0,11)
  il.Position=UDim2.new(0,44,0,24)
  il.BackgroundTransparency=1
  il.Text="..."
  il.TextColor3=Color3.fromRGB(150,150,180)
  il.TextSize=9
  il.Font=Enum.Font.Gotham
  il.TextXAlignment=Enum.TextXAlignment.Left
  il.Parent=r
  local t1=Instance.new("TextButton")
  t1.Size=UDim2.new(0,38,0,24)
  t1.Position=UDim2.new(1,-84,.5,-12)
  t1.BackgroundColor3=Color3.fromRGB(80,140,240)
  t1.Text="TP"
  t1.TextColor3=Color3.new(1,1,1)
  t1.TextSize=10
  t1.Font=Enum.Font.GothamBold
  t1.BorderSizePixel=0
  t1.Parent=r
  local t1c=Instance.new("UICorner")t1c.CornerRadius=UDim.new(0,5)t1c.Parent=t1
  local t2=Instance.new("TextButton")
  t2.Size=UDim2.new(0,38,0,24)
  t2.Position=UDim2.new(1,-42,.5,-12)
  t2.BackgroundColor3=Color3.fromRGB(200,110,60)
  t2.Text="Puxa"
  t2.TextColor3=Color3.new(1,1,1)
  t2.TextSize=9
  t2.Font=Enum.Font.GothamBold
  t2.BorderSizePixel=0
  t2.Parent=r
  local t2c=Instance.new("UICorner")t2c.CornerRadius=UDim.new(0,5)t2c.Parent=t2
  t1.MouseButton1Click:Connect(function()local h=hrp(p)if h then tp(h.CFrame*CFrame.new(0,0,3))end end)
  t2.MouseButton1Click:Connect(function()local a=hrp(p)local b=hrp()if a and b then a.CFrame=b.CFrame*CFrame.new(0,0,3)end end)
  task.spawn(function()
    while r.Parent do
      local a=hrp()local b=hrp(p)
      if a and b then il.Text=string.format("dist: %.0f",(a.Position-b.Position).Magnitude)
      else il.Text="sem char"end
      task.wait(.5)
    end
  end)
  pbs[p]={r=r}
end

for _,p in ipairs(P:GetPlayers())do if p~=L then row(p)end end
P.PlayerAdded:Connect(function(p)if p~=L then row(p)end end)
P.PlayerRemoving:Connect(function(p)if pbs[p]then pbs[p].r:Destroy()pbs[p]=nil end end)

-- ===== ABA TP SALVO =====
local sp={}
for i=1,6 do
  local c=Instance.new("Frame")
  c.Size=UDim2.new(1,0,0,50)
  c.BackgroundColor3=Color3.fromRGB(25,25,38)
  c.BorderSizePixel=0
  c.Parent=PP
  local cc2=Instance.new("UICorner")cc2.CornerRadius=UDim.new(0,8)cc2.Parent=c
  local n=Instance.new("TextLabel")
  n.Size=UDim2.new(0,28,0,28)
  n.Position=UDim2.new(0,10,.5,-14)
  n.BackgroundColor3=Color3.fromRGB(140,60,255)
  n.Text=tostring(i)
  n.TextColor3=Color3.new(1,1,1)
  n.TextSize=14
  n.Font=Enum.Font.GothamBlack
  n.BorderSizePixel=0
  n.Parent=c
  local nc=Instance.new("UICorner")nc.CornerRadius=UDim.new(1,0)nc.Parent=n
  local cl2=Instance.new("TextLabel")
  cl2.Size=UDim2.new(1,-160,0,20)
  cl2.Position=UDim2.new(0,44,0,15)
  cl2.BackgroundTransparency=1
  cl2.Text="(vazio)"
  cl2.TextColor3=Color3.fromRGB(200,200,220)
  cl2.TextSize=10
  cl2.Font=Enum.Font.Gotham
  cl2.TextXAlignment=Enum.TextXAlignment.Left
  cl2.Parent=c
  local sb2=Instance.new("TextButton")
  sb2.Size=UDim2.new(0,30,0,30)
  sb2.Position=UDim2.new(1,-38,.5,-15)
  sb2.BackgroundColor3=Color3.fromRGB(60,160,90)
  sb2.Text="💾"
  sb2.TextSize=12
  sb2.Font=Enum.Font.GothamBold
  sb2.BorderSizePixel=0
  sb2.Parent=c
  local s2c=Instance.new("UICorner")s2c.CornerRadius=UDim.new(0,6)s2c.Parent=sb2
  local tb2=Instance.new("TextButton")
  tb2.Size=UDim2.new(0,30,0,30)
  tb2.Position=UDim2.new(1,-72,.5,-15)
  tb2.BackgroundColor3=Color3.fromRGB(80,140,240)
  tb2.Text="🎯"
  tb2.TextSize=12
  tb2.Font=Enum.Font.GothamBold
  tb2.BorderSizePixel=0
  tb2.Parent=c
  local t2c2=Instance.new("UICorner")t2c2.CornerRadius=UDim.new(0,6)t2c2.Parent=tb2
  local db=Instance.new("TextButton")
  db.Size=UDim2.new(0,30,0,30)
  db.Position=UDim2.new(1,-106,.5,-15)
  db.BackgroundColor3=Color3.fromRGB(180,60,80)
  db.Text="✕"
  db.TextColor3=Color3.new(1,1,1)
  db.TextSize=12
  db.Font=Enum.Font.GothamBold
  db.BorderSizePixel=0
  db.Parent=c
  local dbc=Instance.new("UICorner")dbc.CornerRadius=UDim.new(0,6)dbc.Parent=db
  sb2.MouseButton1Click:Connect(function()local h=hrp()if h then sp[i]=h.CFrame local p=h.CFrame.Position cl2.Text=string.format("%.0f,%.0f,%.0f",p.X,p.Y,p.Z)end end)
  tb2.MouseButton1Click:Connect(function()if sp[i]then tp(sp[i])end end)
  db.MouseButton1Click:Connect(function()sp[i]=nil cl2.Text="(vazio)"end)
end

-- ===== ABA MOVIMENTO =====
label(PM,"VELOCIDADE")
local spdInp=input(PM,"WalkSpeed (ex: 100)")
btn(PM,"⚡ Aplicar Speed",Color3.fromRGB(180,150,60),function()local h=hum()if h then h.WalkSpeed=tonumber(spdInp.Text)or 16 end end)
btn(PM,"↩ Reset Speed (16)",Color3.fromRGB(80,80,110),function()local h=hum()if h then h.WalkSpeed=16 end end)

label(PM,"PULO")
local jmpInp=input(PM,"JumpPower (ex: 200)")
btn(PM,"⬆ Aplicar Jump",Color3.fromRGB(180,150,60),function()local h=hum()if h then h.JumpPower=tonumber(jmpInp.Text)or 50 end end)
btn(PM,"↩ Reset Jump (50)",Color3.fromRGB(80,80,110),function()local h=hum()if h then h.JumpPower=50 end end)

label(PM,"VOAR")
local flyOn=false
local flyCon
local flySpeed=80
btn(PM,"🕊 Toggle Fly",Color3.fromRGB(70,130,220),function()
  flyOn=not flyOn
  if flyOn then
    log("Fly ON")
    flyCon=R.Heartbeat:Connect(function()
      local h=hrp()
      local hh=hum()
      if not h or not hh then return end
      hh.PlatformStand=true
      local dir=Vector3.new(0,0,0)
      local cam=WS.CurrentCamera
      if UIS:IsKeyDown(Enum.KeyCode.W)then dir=dir+cam.CFrame.LookVector end
      if UIS:IsKeyDown(Enum.KeyCode.S)then dir=dir-cam.CFrame.LookVector end
      if UIS:IsKeyDown(Enum.KeyCode.A)then dir=dir-cam.CFrame.RightVector*-1 end
      if UIS:IsKeyDown(Enum.KeyCode.D)then dir=dir+cam.CFrame.RightVector end
      if UIS:IsKeyDown(Enum.KeyCode.Space)then dir=dir+Vector3.new(0,1,0)end
      if UIS:IsKeyDown(Enum.KeyCode.LeftControl)then dir=dir-Vector3.new(0,1,0)end
      h.Velocity=dir*flySpeed
    end)
  else
    log("Fly OFF")
    if flyCon then flyCon:Disconnect()end
    local hh=hum()if hh then hh.PlatformStand=false end
  end
end)

local flySpdInp=input(PM,"Fly speed (padrão 80)")
btn(PM,"⚙ Aplicar Fly Speed",Color3.fromRGB(70,130,220),function()
  flySpeed=tonumber(flySpdInp.Text)or 80
end)

label(PM,"NOCLIP")
local ncOn=false
local ncCon
btn(PM,"👻 Toggle Noclip",Color3.fromRGB(120,100,180),function()
  ncOn=not ncOn
  if ncOn then
    log("Noclip ON")
    ncCon=R.Stepped:Connect(function()
      local c=L.Character
      if not c then return end
      for _,v in ipairs(c:GetDescendants())do
        if v:IsA("BasePart")then v.CanCollide=false end
      end
    end)
  else
    log("Noclip OFF")
    if ncCon then ncCon:Disconnect()end
  end
end)

label(PM,"PULO INFINITO")
local ijOn=false
local ijCon
btn(PM,"🦘 Toggle Infinite Jump",Color3.fromRGB(120,100,180),function()
  ijOn=not ijOn
  if ijOn then
    ijCon=UIS.JumpRequest:Connect(function()
      local h=hum()
      if h then h:ChangeState(Enum.HumanoidStateType.Jumping)end
    end)
  else
    if ijCon then ijCon:Disconnect()end
  end
end)

label(PM,"GRAVIDADE")
btn(PM,"🌍 Gravity 0",Color3.fromRGB(80,120,180),function()WS.Gravity=0 end)
btn(PM,"🌍 Gravity 196 (normal)",Color3.fromRGB(80,80,110),function()WS.Gravity=196 end)

label(PM,"HipHeight")
local hhInp=input(PM,"HipHeight (padrão 2)")
btn(PM,"⚙ Aplicar HipHeight",Color3.fromRGB(80,120,180),function()local h=hum()if h then h.HipHeight=tonumber(hhInp.Text)or 2 end end)-- ===== ABA COMBATE =====
label(PC,"DEFESA")
local gmOn=false
local gmCon
btn(PC,"🛡 Toggle Godmode",Color3.fromRGB(60,160,90),function()
  gmOn=not gmOn
  if gmOn then
    gmCon=R.Heartbeat:Connect(function()
      local h=hum()
      if h then h.MaxHealth=math.huge h.Health=math.huge end
    end)
  else
    if gmCon then gmCon:Disconnect()end
    local h=hum()if h then h.MaxHealth=100 h.Health=100 end
  end
end)

label(PC,"ATAQUE")
btn(PC,"💀 Kill All",Color3.fromRGB(200,60,60),function()
  for _,p in ipairs(P:GetPlayers())do
    if p~=L then
      local h=hum(p)
      if h then h.Health=0 end
    end
  end
end)

btn(PC,"🌀 Fling Players",Color3.fromRGB(200,100,60),function()
  for _,p in ipairs(P:GetPlayers())do
    if p~=L then
      local h=hrp(p)
      if h then h.Velocity=Vector3.new(math.random(-500,500),math.random(200,500),math.random(-500,500))end
    end
  end
end)

label(PC,"ARMA")
local rapidOn=false
local rapidCon
btn(PC,"🔫 Toggle Rapid Fire",Color3.fromRGB(180,80,80),function()
  rapidOn=not rapidOn
  if rapidOn then
    rapidCon=R.Heartbeat:Connect(function()
      local c=L.Character if not c then return end
      for _,t in ipairs(c:GetChildren())do
        if t:IsA("Tool")then t:Activate()end
      end
    end)
  else
    if rapidCon then rapidCon:Disconnect()end
  end
end)

-- ===== ABA VISUAL =====
label(PV,"INVISIBILIDADE")

local invOn=false
local invMode="local"
local invCon

-- Dropdown de modo
local modeFrame=Instance.new("Frame")
modeFrame.Size=UDim2.new(1,0,0,28)
modeFrame.BackgroundColor3=Color3.fromRGB(20,20,32)
modeFrame.BorderSizePixel=0
modeFrame.Parent=PV
local mfc=Instance.new("UICorner")mfc.CornerRadius=UDim.new(0,6)mfc.Parent=modeFrame
local modeBtn=Instance.new("TextButton")
modeBtn.Size=UDim2.new(1,0,1,0)
modeBtn.BackgroundTransparency=1
modeBtn.Text="Modo: LOCAL (só você não vê)"
modeBtn.TextColor3=Color3.fromRGB(220,220,240)
modeBtn.TextSize=11
modeBtn.Font=Enum.Font.Gotham
modeBtn.Parent=modeFrame
modeBtn.MouseButton1Click:Connect(function()
  if invMode=="local"then
    invMode="global"
    modeBtn.Text="Modo: GLOBAL (todos não veem)"
  else
    invMode="local"
    modeBtn.Text="Modo: LOCAL (só você não vê)"
  end
end)

btn(PV,"👻 Toggle Invisibilidade",Color3.fromRGB(120,100,180),function()
  invOn=not invOn
  if invOn then
    log("Invisibilidade ON ("..invMode..")")
    if invCon then invCon:Disconnect()end
    if invMode=="local"then
      local c=L.Character
      if not c then return end
      for _,v in ipairs(c:GetDescendants())do
        if v:IsA("BasePart")or v:IsA("Decal")then
          v.LocalTransparencyModifier=1
        end
      end
    else
      invCon=R.Heartbeat:Connect(function()
        local c=L.Character
        if not c then return end
        for _,v in ipairs(c:GetDescendants())do
          if v:IsA("BasePart")then v.Transparency=1
          elseif v:IsA("Decal")then v.Transparency=1
          end
        end
      end)
    end
  else
    if invCon then invCon:Disconnect()end
    local c=L.Character
    if c then
      for _,v in ipairs(c:GetDescendants())do
        if v:IsA("BasePart")then
          v.Transparency=0
          v.LocalTransparencyModifier=0
        elseif v:IsA("Decal")then
          v.Transparency=0
        end
      end
    end
  end
end)

label(PV,"TRANSPARÊNCIA")
local transInp=input(PV,"Transparência (0 a 1)")
btn(PV,"🎨 Aplicar Transparência",Color3.fromRGB(120,100,180),function()
  local v=tonumber(transInp.Text)or 0.5
  local c=L.Character
  if not c then return end
  for _,p in ipairs(c:GetDescendants())do
    if p:IsA("BasePart")then p.Transparency=v end
  end
end)

label(PV,"ACESSÓRIOS")
btn(PV,"🎩 Remover Acessórios",Color3.fromRGB(120,100,180),function()
  local c=L.Character
  if not c then return end
  for _,v in ipairs(c:GetDescendants())do
    if v:IsA("Accessory")or v:IsA("Hat")then v:Destroy() end
  end
end)

log("=== EGZODZ HUB v1.0 carregado ===")
