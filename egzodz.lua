-- EGZODZ HUB v3.0 - by egzodz
local P=game:GetService("Players")
local R=game:GetService("RunService")
local T=game:GetService("TweenService")
local C=game:GetService("CoreGui")
local UIS=game:GetService("UserInputService")
local WS=game:GetService("Workspace")
local L=P.LocalPlayer

if C:FindFirstChild("EGZODZHUB")then C.EGZODZHUB:Destroy()end

local VERDE=Color3.fromRGB(0,220,140)
local AZUL=Color3.fromRGB(40,150,255)

local function log(m)print("[EGZODZ] "..tostring(m))end
local function hrp(p)p=p or L local c=p.Character or p.CharacterAdded:Wait()return c:FindFirstChild("HumanoidRootPart")or c:WaitForChild("HumanoidRootPart",2)end
local function hum(p)p=p or L local c=p.Character or p.CharacterAdded:Wait()return c:FindFirstChildOfClass("Humanoid")or c:WaitForChild("Humanoid",2)end
local function tw(o,t,pr)T:Create(o,TweenInfo.new(t),pr):Play()end
local function tp(cf,s)s=s or 12 local h=hrp()if not h then return end local a=h.CFrame for i=1,s do h.CFrame=a:Lerp(cf,i/s)R.RenderStepped:Wait()end end

pcall(function()
  if getrawmetatable and setreadonly and newcclosure then
    local mt=getrawmetatable(game)
    local oi=mt.__index
    setreadonly(mt,false)
    mt.__index=newcclosure(function(t,k)
      if k=="WalkSpeed"and typeof(t)=="Instance"and t:IsA("Humanoid")then
        if oi(t,k)~=16 then return 16 end
      end
      return oi(t,k)
    end)
    setreadonly(mt,true)
  end
end)
pcall(function()
  if hookfunction then hookfunction(L.Kick,function()end)end
end)-- UI
local S=Instance.new("ScreenGui")
S.Name="EGZODZHUB"
S.ResetOnSpawn=false
S.Parent=C

local B=Instance.new("TextButton")
B.Size=UDim2.new(0,50,0,50)
B.Position=UDim2.new(0,20,.4,0)
B.BackgroundColor3=VERDE
B.Text="EZ"
B.TextColor3=Color3.new(1,1,1)
B.TextSize=16
B.Font=Enum.Font.GothamBlack
B.BorderSizePixel=0
B.Draggable=true
B.Parent=S
local bc=Instance.new("UICorner")bc.CornerRadius=UDim.new(1,0)bc.Parent=B
local bg=Instance.new("UIGradient")bg.Color=ColorSequence.new(VERDE,AZUL)bg.Rotation=45 bg.Parent=B

local M=Instance.new("Frame")
M.Size=UDim2.new(0,380,0,440)
M.Position=UDim2.new(.5,-190,.5,-220)
M.BackgroundColor3=Color3.fromRGB(16,20,26)
M.BorderSizePixel=0
M.Draggable=true
M.Visible=false
M.ClipsDescendants=true
M.Parent=S
local mc=Instance.new("UICorner")mc.CornerRadius=UDim.new(0,12)mc.Parent=M
local ms=Instance.new("UIStroke")ms.Color=VERDE ms.Thickness=1.5 ms.Transparency=.3 ms.Parent=M

local H=Instance.new("Frame")
H.Size=UDim2.new(1,0,0,40)
H.BackgroundColor3=Color3.fromRGB(20,28,38)
H.BorderSizePixel=0
H.Parent=M
local hc=Instance.new("UICorner")hc.CornerRadius=UDim.new(0,12)hc.Parent=H
local hcv=Instance.new("Frame")hcv.Size=UDim2.new(1,0,.5,0)hcv.Position=UDim2.new(0,0,.5,0)hcv.BackgroundColor3=Color3.fromRGB(20,28,38)hcv.BorderSizePixel=0 hcv.Parent=H
local hg=Instance.new("UIGradient")hg.Color=ColorSequence.new(VERDE,AZUL)hg.Rotation=90 hg.Parent=H

local ti=Instance.new("TextLabel")
ti.Size=UDim2.new(1,-90,0,20)
ti.Position=UDim2.new(0,12,0,10)
ti.BackgroundTransparency=1
ti.Text="EGZODZ v3"
ti.TextColor3=Color3.new(1,1,1)
ti.TextSize=14
ti.Font=Enum.Font.GothamBlack
ti.TextXAlignment=Enum.TextXAlignment.Left
ti.Parent=H

local cl=Instance.new("TextButton")
cl.Size=UDim2.new(0,26,0,26)
cl.Position=UDim2.new(1,-32,0,7)
cl.BackgroundColor3=Color3.fromRGB(220,60,80)
cl.Text="X"
cl.TextColor3=Color3.new(1,1,1)
cl.TextSize=14
cl.Font=Enum.Font.GothamBold
cl.BorderSizePixel=0
cl.Parent=H
local cc=Instance.new("UICorner")cc.CornerRadius=UDim.new(0,7)cc.Parent=cl

local open=false
local function setP(s)
  open=s
  if s then
    M.Visible=true
    M.Size=UDim2.new(0,380,0,0)
    tw(M,.25,{Size=UDim2.new(0,380,0,440)})
  else
    tw(M,.2,{Size=UDim2.new(0,380,0,0)})
    task.wait(.2)
    M.Visible=false
  end
end
B.MouseButton1Click:Connect(function()setP(not open)end)
cl.MouseButton1Click:Connect(function()setP(false)end)
UIS.InputBegan:Connect(function(i,g)if g then return end if i.KeyCode==Enum.KeyCode.RightShift then setP(not open)end end)

local SB=Instance.new("Frame")
SB.Size=UDim2.new(0,44,1,-50)
SB.Position=UDim2.new(0,6,0,46)
SB.BackgroundColor3=Color3.fromRGB(20,28,38)
SB.BorderSizePixel=0
SB.Parent=M
local sbc=Instance.new("UICorner")sbc.CornerRadius=UDim.new(0,8)sbc.Parent=SB
local sbl=Instance.new("UIListLayout")sbl.Padding=UDim.new(0,4)sbl.HorizontalAlignment=Enum.HorizontalAlignment.Center sbl.Parent=SB
local sbp=Instance.new("UIPadding")sbp.PaddingTop=UDim.new(0,6)sbp.Parent=SB

local CT=Instance.new("Frame")
CT.Size=UDim2.new(1,-58,1,-50)
CT.Position=UDim2.new(0,54,0,46)
CT.BackgroundTransparency=1
CT.Parent=M

local pages={}
local function tab(ico)
  local b=Instance.new("TextButton")
  b.Size=UDim2.new(0,34,0,34)
  b.BackgroundColor3=Color3.fromRGB(28,36,48)
  b.Text=ico
  b.TextColor3=Color3.fromRGB(180,200,220)
  b.TextSize=16
  b.Font=Enum.Font.GothamBold
  b.BorderSizePixel=0
  b.Parent=SB
  local c=Instance.new("UICorner")c.CornerRadius=UDim.new(0,8)c.Parent=b
  local p=Instance.new("ScrollingFrame")
  p.Size=UDim2.new(1,0,1,0)
  p.BackgroundTransparency=1
  p.BorderSizePixel=0
  p.ScrollBarThickness=3
  p.CanvasSize=UDim2.new(0,0,0,0)
  p.AutomaticCanvasSize=Enum.AutomaticSize.Y
  p.Visible=false
  p.Parent=CT
  local l=Instance.new("UIListLayout")l.Padding=UDim.new(0,5)l.Parent=p
  pages[ico]={b=b,p=p}
  b.MouseButton1Click:Connect(function()
    for _,v in pairs(pages)do
      v.p.Visible=false
      tw(v.b,.15,{BackgroundColor3=Color3.fromRGB(28,36,48),TextColor3=Color3.fromRGB(180,200,220)})
    end
    p.Visible=true
    tw(b,.15,{BackgroundColor3=VERDE,TextColor3=Color3.new(1,1,1)})
  end)
  return p
end

local PG=tab("👥")
local PP=tab("📍")
local PM=tab("🏃")
local PC=tab("⚔️")
local PA=tab("🎯")
local PE=tab("👁")
local PV=tab("🚗")
task.defer(function()pages["👥"].b:Fire("MouseButton1Click")end)

local function btn(par,txt,col,fn)
  local b=Instance.new("TextButton")
  b.Size=UDim2.new(1,0,0,28)
  b.BackgroundColor3=col or Color3.fromRGB(40,50,65)
  b.Text=txt
  b.TextColor3=Color3.fromRGB(230,240,250)
  b.TextSize=10
  b.Font=Enum.Font.GothamBold
  b.BorderSizePixel=0
  b.Parent=par
  local c=Instance.new("UICorner")c.CornerRadius=UDim.new(0,6)c.Parent=b
  if fn then b.MouseButton1Click:Connect(fn)end
  return b
end

local function label(par,txt)
  local l=Instance.new("TextLabel")
  l.Size=UDim2.new(1,0,0,14)
  l.BackgroundTransparency=1
  l.Text=txt
  l.TextColor3=VERDE
  l.TextSize=9
  l.Font=Enum.Font.GothamBlack
  l.TextXAlignment=Enum.TextXAlignment.Left
  l.Parent=par
  return l
end

local function input(par,ph)
  local b=Instance.new("TextBox")
  b.Size=UDim2.new(1,0,0,26)
  b.BackgroundColor3=Color3.fromRGB(20,28,38)
  b.Text=""
  b.PlaceholderText=ph
  b.TextColor3=Color3.new(1,1,1)
  b.PlaceholderColor3=Color3.fromRGB(100,120,150)
  b.TextSize=10
  b.Font=Enum.Font.Gotham
  b.BorderSizePixel=0
  b.Parent=par
  local c=Instance.new("UICorner")c.CornerRadius=UDim.new(0,6)c.Parent=b
  return b
end)-- ABA PLAYERS
local sb=input(PG,"Buscar jogador...")
local PLF=Instance.new("Frame")
PLF.Size=UDim2.new(1,0,0,0)
PLF.AutomaticSize=Enum.AutomaticSize.Y
PLF.BackgroundTransparency=1
PLF.Parent=PG
local PLL=Instance.new("UIListLayout")PLL.Padding=UDim.new(0,4)PLL.Parent=PLF
local pbs={}

local function row(p)
  if pbs[p]then return end
  local r=Instance.new("Frame")
  r.Size=UDim2.new(1,0,0,38)
  r.BackgroundColor3=Color3.fromRGB(24,32,42)
  r.BorderSizePixel=0
  r.Parent=PLF
  local rc=Instance.new("UICorner")rc.CornerRadius=UDim.new(0,6)rc.Parent=r
  local nl=Instance.new("TextLabel")
  nl.Size=UDim2.new(1,-80,0,14)
  nl.Position=UDim2.new(0,8,0,4)
  nl.BackgroundTransparency=1
  nl.Text=p.Name
  nl.TextColor3=Color3.fromRGB(240,250,255)
  nl.TextSize=10
  nl.Font=Enum.Font.GothamBold
  nl.TextXAlignment=Enum.TextXAlignment.Left
  nl.TextTruncate=Enum.TextTruncate.AtEnd
  nl.Parent=r
  local il=Instance.new("TextLabel")
  il.Size=UDim2.new(1,-80,0,10)
  il.Position=UDim2.new(0,8,0,22)
  il.BackgroundTransparency=1
  il.Text="..."
  il.TextColor3=VERDE
  il.TextSize=9
  il.Font=Enum.Font.Gotham
  il.TextXAlignment=Enum.TextXAlignment.Left
  il.Parent=r
  local t1=Instance.new("TextButton")
  t1.Size=UDim2.new(0,34,0,22)
  t1.Position=UDim2.new(1,-74,.5,-11)
  t1.BackgroundColor3=AZUL
  t1.Text="TP"
  t1.TextColor3=Color3.new(1,1,1)
  t1.TextSize=9
  t1.Font=Enum.Font.GothamBold
  t1.BorderSizePixel=0
  t1.Parent=r
  local t1c=Instance.new("UICorner")t1c.CornerRadius=UDim.new(0,5)t1c.Parent=t1
  local t2=Instance.new("TextButton")
  t2.Size=UDim2.new(0,34,0,22)
  t2.Position=UDim2.new(1,-38,.5,-11)
  t2.BackgroundColor3=VERDE
  t2.Text="Pux"
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
      if a and b then il.Text=string.format("%.0f studs",(a.Position-b.Position).Magnitude)end
      task.wait(.5)
    end
  end)
  pbs[p]={r=r}
end

for _,p in ipairs(P:GetPlayers())do if p~=L then row(p)end end
P.PlayerAdded:Connect(function(p)if p~=L then row(p)end end)
P.PlayerRemoving:Connect(function(p)if pbs[p]then pbs[p].r:Destroy()pbs[p]=nil end end)

-- ABA TP SALVO
local sp={}
for i=1,4 do
  local c=Instance.new("Frame")
  c.Size=UDim2.new(1,0,0,36)
  c.BackgroundColor3=Color3.fromRGB(24,32,42)
  c.BorderSizePixel=0
  c.Parent=PP
  local cc2=Instance.new("UICorner")cc2.CornerRadius=UDim.new(0,6)cc2.Parent=c
  local n=Instance.new("TextLabel")
  n.Size=UDim2.new(0,22,0,22)
  n.Position=UDim2.new(0,6,.5,-11)
  n.BackgroundColor3=VERDE
  n.Text=tostring(i)
  n.TextColor3=Color3.new(1,1,1)
  n.TextSize=11
  n.Font=Enum.Font.GothamBlack
  n.BorderSizePixel=0
  n.Parent=c
  local nc=Instance.new("UICorner")nc.CornerRadius=UDim.new(1,0)nc.Parent=n
  local cl2=Instance.new("TextLabel")
  cl2.Size=UDim2.new(1,-130,0,14)
  cl2.Position=UDim2.new(0,32,0,11)
  cl2.BackgroundTransparency=1
  cl2.Text="vazio"
  cl2.TextColor3=Color3.fromRGB(200,220,240)
  cl2.TextSize=9
  cl2.Font=Enum.Font.Gotham
  cl2.TextXAlignment=Enum.TextXAlignment.Left
  cl2.Parent=c
  local sb2=Instance.new("TextButton")
  sb2.Size=UDim2.new(0,26,0,26)
  sb2.Position=UDim2.new(1,-58,.5,-13)
  sb2.BackgroundColor3=VERDE
  sb2.Text="S"
  sb2.TextColor3=Color3.new(1,1,1)
  sb2.TextSize=10
  sb2.Font=Enum.Font.GothamBold
  sb2.BorderSizePixel=0
  sb2.Parent=c
  local s2c=Instance.new("UICorner")s2c.CornerRadius=UDim.new(0,5)s2c.Parent=sb2
  local tb2=Instance.new("TextButton")
  tb2.Size=UDim2.new(0,26,0,26)
  tb2.Position=UDim2.new(1,-30,.5,-13)
  tb2.BackgroundColor3=AZUL
  tb2.Text="T"
  tb2.TextColor3=Color3.new(1,1,1)
  tb2.TextSize=10
  tb2.Font=Enum.Font.GothamBold
  tb2.BorderSizePixel=0
  tb2.Parent=c
  local t2c2=Instance.new("UICorner")t2c2.CornerRadius=UDim.new(0,5)t2c2.Parent=tb2
  sb2.MouseButton1Click:Connect(function()local h=hrp()if h then sp[i]=h.CFrame cl2.Text=string.format("%.0f,%.0f,%.0f",h.CFrame.X,h.CFrame.Y,h.CFrame.Z)end end)
  tb2.MouseButton1Click:Connect(function()if sp[i]then tp(sp[i])end end)
end

-- ABA MOVE
label(PM,"VELOCIDADE")
local spdInp=input(PM,"WalkSpeed")
btn(PM,"Aplicar Speed",VERDE,function()local h=hum()if h then h.WalkSpeed=tonumber(spdInp.Text)or 16 end end)
btn(PM,"Reset Speed",Color3.fromRGB(60,70,90),function()local h=hum()if h then h.WalkSpeed=16 end end)

label(PM,"PULO")
local jmpInp=input(PM,"JumpPower")
btn(PM,"Aplicar Jump",VERDE,function()local h=hum()if h then h.JumpPower=tonumber(jmpInp.Text)or 50 end end)
btn(PM,"Reset Jump",Color3.fromRGB(60,70,90),function()local h=hum()if h then h.JumpPower=50 end end)

label(PM,"FLY (4 MODOS)")
local flyOn=false
local flyCon
local flySpeed=80
local flyMode="velocity"
local modeBtn=Instance.new("TextButton")
modeBtn.Size=UDim2.new(1,0,0,26)
modeBtn.BackgroundColor3=Color3.fromRGB(20,28,38)
modeBtn.Text="Modo: VELOCITY"
modeBtn.TextColor3=VERDE
modeBtn.TextSize=10
modeBtn.Font=Enum.Font.GothamBold
modeBtn.BorderSizePixel=0
modeBtn.Parent=PM
local mbc=Instance.new("UICorner")mbc.CornerRadius=UDim.new(0,6)mbc.Parent=modeBtn
modeBtn.MouseButton1Click:Connect(function()
  if flyMode=="velocity"then flyMode="cframe"modeBtn.Text="Modo: CFRAME"
  elseif flyMode=="cframe"then flyMode="bodyvelocity"modeBtn.Text="Modo: BODYVELOCITY"
  elseif flyMode=="bodyvelocity"then flyMode="antigravity"modeBtn.Text="Modo: ANTIGRAVITY"
  else flyMode="velocity"modeBtn.Text="Modo: VELOCITY"end
end)

btn(PM,"Toggle Fly",AZUL,function()
  flyOn=not flyOn
  if flyOn then
    local bv
    if flyMode=="bodyvelocity"then
      local h=hrp()if h then bv=Instance.new("BodyVelocity")bv.MaxForce=Vector3.new(math.huge,math.huge,math.huge)bv.Parent=h end
    end
    flyCon=R.Heartbeat:Connect(function()
      local h=hrp()local hh=hum()
      if not h or not hh then return end
      local cam=WS.CurrentCamera
      local dir=Vector3.new(0,0,0)
      if UIS:IsKeyDown(Enum.KeyCode.W)then dir=dir+cam.CFrame.LookVector end
      if UIS:IsKeyDown(Enum.KeyCode.S)then dir=dir-cam.CFrame.LookVector end
      if UIS:IsKeyDown(Enum.KeyCode.A)then dir=dir-cam.CFrame.RightVector*-1 end
      if UIS:IsKeyDown(Enum.KeyCode.D)then dir=dir+cam.CFrame.RightVector end
      if UIS:IsKeyDown(Enum.KeyCode.Space)then dir=dir+Vector3.new(0,1,0)end
      if UIS:IsKeyDown(Enum.KeyCode.LeftControl)then dir=dir-Vector3.new(0,1,0)end
      if flyMode=="velocity"then hh.PlatformStand=true h.Velocity=dir*flySpeed
      elseif flyMode=="cframe"then h.CFrame=h.CFrame+dir*(flySpeed/60)
      elseif flyMode=="bodyvelocity"then if bv then bv.Velocity=dir*flySpeed end
      elseif flyMode=="antigravity"then hh.PlatformStand=true h.Velocity=dir*flySpeed+Vector3.new(0,0.5,0)end
    end)
  else
    if flyCon then flyCon:Disconnect()end
    local hh=hum()if hh then hh.PlatformStand=false end
    local h=hrp()if h then for _,v in ipairs(h:GetChildren())do if v:IsA("BodyVelocity")then v:Destroy()end end end
  end
end)

local flySpdInp=input(PM,"Fly speed")
btn(PM,"Aplicar Fly Speed",AZUL,function()flySpeed=tonumber(flySpdInp.Text)or 80 end)

label(PM,"NOCLIP")
local ncOn=false
local ncCon
btn(PM,"Toggle Noclip",VERDE,function()
  ncOn=not ncOn
  if ncOn then
    ncCon=R.Stepped:Connect(function()
      local c=L.Character
      if not c then return end
      for _,v in ipairs(c:GetDescendants())do if v:IsA("BasePart")then v.CanCollide=false end end
    end)
  else
    if ncCon then ncCon:Disconnect()end
  end
end)

label(PM,"INFINITE JUMP")
local ijOn=false
local ijCon
btn(PM,"Toggle Inf Jump",AZUL,function()
  ijOn=not ijOn
  if ijOn then
    ijCon=UIS.JumpRequest:Connect(function()
      local h=hum()if h then h:ChangeState(Enum.HumanoidStateType.Jumping)end
    end)
  else
    if ijCon then ijCon:Disconnect()end
  end
end)

label(PM,"GRAVIDADE")
btn(PM,"Gravity 0",VERDE,function()WS.Gravity=0 end)
btn(PM,"Gravity Normal",Color3.fromRGB(60,70,90),function()WS.Gravity=196 end)-- ABA COMBATE
label(PC,"DEFESA")
local gmOn=false
local gmCon
btn(PC,"Toggle Godmode",VERDE,function()
  gmOn=not gmOn
  if gmOn then
    gmCon=R.Heartbeat:Connect(function()
      local h=hum()if h then h.MaxHealth=math.huge h.Health=math.huge end
    end)
  else
    if gmCon then gmCon:Disconnect()end
    local h=hum()if h then h.MaxHealth=100 h.Health=100 end
  end
end)

label(PC,"ATAQUE")
btn(PC,"Kill All",Color3.fromRGB(200,60,80),function()
  for _,p in ipairs(P:GetPlayers())do
    if p~=L then local h=hum(p)if h then h.Health=0 end end
  end
end)

btn(PC,"Fling Players",AZUL,function()
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
btn(PC,"Toggle Rapid Fire",VERDE,function()
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

-- ABA AIMBOT
label(PA,"AIMBOT")
local aimOn=false
local aimCon
local aimFov=90
local aimPart="Head"

local fovInp=input(PA,"FOV (padrao 90)")
btn(PA,"Aplicar FOV",AZUL,function()aimFov=tonumber(fovInp.Text)or 90 end)

local partBtn=Instance.new("TextButton")
partBtn.Size=UDim2.new(1,0,0,26)
partBtn.BackgroundColor3=Color3.fromRGB(20,28,38)
partBtn.Text="Alvo: HEAD"
partBtn.TextColor3=VERDE
partBtn.TextSize=10
partBtn.Font=Enum.Font.GothamBold
partBtn.BorderSizePixel=0
partBtn.Parent=PA
local pbc=Instance.new("UICorner")pbc.CornerRadius=UDim.new(0,6)pbc.Parent=partBtn
partBtn.MouseButton1Click:Connect(function()
  if aimPart=="Head"then aimPart="Torso"partBtn.Text="Alvo: TORSO"
  elseif aimPart=="Torso"then aimPart="Nearest"partBtn.Text="Alvo: NEAREST"
  else aimPart="Head"partBtn.Text="Alvo: HEAD"end
end)

local function getClosest()
  local cam=WS.CurrentCamera
  local center=Vector2.new(cam.ViewportSize.X/2,cam.ViewportSize.Y/2)
  local closest=nil
  local minDist=aimFov
  for _,p in ipairs(P:GetPlayers())do
    if p~=L then
      local h=hrp(p)
      if h then
        local pos,onScreen=cam:WorldToViewportPoint(h.Position)
        if onScreen then
          local dist=(Vector2.new(pos.X,pos.Y)-center).Magnitude
          if dist<minDist then minDist=dist closest=p end
        end
      end
    end
  end
  return closest
end

btn(PA,"Toggle Aimbot",VERDE,function()
  aimOn=not aimOn
  if aimOn then
    aimCon=R.RenderStepped:Connect(function()
      if not UIS:IsMouseButtonPressed(Enum.UserInputType.MouseButton2)then return end
      local target=getClosest()
      if target then
        local h=hrp(target)
        if h then
          local part
          if aimPart=="Head"then part=target.Character:FindFirstChild("Head")
          elseif aimPart=="Torso"then part=target.Character:FindFirstChild("UpperTorso")or target.Character:FindFirstChild("Torso")
          else part=h end
          if part then WS.CurrentCamera.CFrame=CFrame.new(WS.CurrentCamera.CFrame.Position,part.Position)end
        end
      end
    end)
  else
    if aimCon then aimCon:Disconnect()end
  end
end)

label(PA,"SILENT AIM")
local silentOn=false
btn(PA,"Toggle Silent Aim",AZUL,function()
  silentOn=not silentOn
  if silentOn then
    pcall(function()
      if getrawmetatable and setreadonly and newcclosure then
        local mt=getrawmetatable(game)
        local oldNC=mt.__namecall
        setreadonly(mt,false)
        mt.__namecall=newcclosure(function(self,...)
          local m=getnamecallmethod()
          if m=="FireServer"then
            local target=getClosest()
            if target then
              local h=hrp(target)
              if h then return oldNC(self,h.Position)end
            end
          end
          return oldNC(self,...)
        end)
        setreadonly(mt,true)
      end
    end)
    log("Silent Aim ON")
  else
    log("Silent Aim OFF (re-executa pra resetar)")
  end
end)

label(PA,"TRIGGERBOT")
local tbOn=false
local tbCon
btn(PA,"Toggle Triggerbot",VERDE,function()
  tbOn=not tbOn
  if tbOn then
    tbCon=R.RenderStepped:Connect(function()
      local target=getClosest()
      if target then
        local c=L.Character
        if c then
          for _,t in ipairs(c:GetChildren())do
            if t:IsA("Tool")then t:Activate()end
          end
        end
      end
    end)
  else
    if tbCon then tbCon:Disconnect()end
  end
end)-- ABA VISUAL
label(PE,"ESP")
local espOn=false
local espFolder=Instance.new("Folder")
espFolder.Name="EGZ_ESP"
espFolder.Parent=C

local function createESP(p)
  local box=Instance.new("BillboardGui")
  box.Name=p.Name
  box.Size=UDim2.new(0,80,0,36)
  box.StudsOffset=Vector3.new(0,3,0)
  box.AlwaysOnTop=true
  box.Parent=espFolder
  local name=Instance.new("TextLabel")
  name.Size=UDim2.new(1,0,.5,0)
  name.BackgroundTransparency=1
  name.Text=p.Name
  name.TextColor3=VERDE
  name.TextStrokeTransparency=0
  name.TextSize=12
  name.Font=Enum.Font.GothamBold
  name.Parent=box
  local dist=Instance.new("TextLabel")
  dist.Size=UDim2.new(1,0,.5,0)
  dist.Position=UDim2.new(0,0,.5,0)
  dist.BackgroundTransparency=1
  dist.Text=""
  dist.TextColor3=AZUL
  dist.TextStrokeTransparency=0
  dist.TextSize=10
  dist.Font=Enum.Font.Gotham
  dist.Parent=box
  task.spawn(function()
    while box.Parent and espOn do
      local h=hrp(p)
      if h then
        box.Adornee=h
        local my=hrp()
        if my then dist.Text=string.format("%.0f studs",(my.Position-h.Position).Magnitude)end
      end
      task.wait(.1)
    end
  end)
end

btn(PE,"Toggle ESP",VERDE,function()
  espOn=not espOn
  if espOn then
    for _,p in ipairs(P:GetPlayers())do if p~=L then createESP(p)end end
    P.PlayerAdded:Connect(function(p)if espOn and p~=L then createESP(p)end end)
  else
    for _,v in ipairs(espFolder:GetChildren())do v:Destroy()end
  end
end)

label(PE,"INVISIBILIDADE")
local invOn=false
local invCon
btn(PE,"Toggle Invisibilidade",AZUL,function()
  invOn=not invOn
  if invOn then
    invCon=R.Heartbeat:Connect(function()
      local c=L.Character
      if not c then return end
      for _,v in ipairs(c:GetDescendants())do
        if v:IsA("BasePart")then v.Transparency=1
        elseif v:IsA("Decal")then v.Transparency=1 end
      end
    end)
  else
    if invCon then invCon:Disconnect()end
    local c=L.Character
    if c then
      for _,v in ipairs(c:GetDescendants())do
        if v:IsA("BasePart")then v.Transparency=0
        elseif v:IsA("Decal")then v.Transparency=0 end
      end
    end
  end
end)

label(PE,"COR")
local corInp=input(PE,"R,G,B (ex: 255,0,0)")
btn(PE,"Aplicar Cor",VERDE,function()
  local c=L.Character
  if not c then return end
  local parts=string.split(corInp.Text,",")
  if #parts>=3 then
    local r,g,b=tonumber(parts[1]),tonumber(parts[2]),tonumber(parts[3])
    if r and g and b then
      for _,v in ipairs(c:GetDescendants())do
        if v:IsA("BasePart")then v.Color=Color3.fromRGB(r,g,b)end
      end
    end
  end
end)

-- ABA VEICULO
label(PV,"FLING CAR")
local carForce=500
local forceInp=input(PV,"Forca (padrao 500)")
btn(PV,"Aplicar Forca",AZUL,function()carForce=tonumber(forceInp.Text)or 500 end)

local function getMyVehicle()
  local c=L.Character
  if not c then return nil end
  local hh=c:FindFirstChildOfClass("Humanoid")
  if not hh then return nil end
  local seat=hh.SeatPart
  if seat then
    local veh=seat:FindFirstAncestorOfClass("Model")
    if veh and veh.PrimaryPart then return veh end
    return seat.Parent
  end
  return nil
end

btn(PV,"Fling Car",VERDE,function()
  local veh=getMyVehicle()
  if not veh then log("Voce nao esta em veiculo")return end
  for _,v in ipairs(veh:GetDescendants())do
    if v:IsA("BasePart")then
      v.Velocity=Vector3.new(math.random(-carForce,carForce),math.random(carForce*0.8,carForce*1.5),math.random(-carForce,carForce))
      v.RotVelocity=Vector3.new(math.random(-carForce,carForce),math.random(-carForce,carForce),math.random(-carForce,carForce))
    end
  end
  log("Carro flingado")
end)

btn(PV,"Flip Car (virar)",AZUL,function()
  local veh=getMyVehicle()
  if not veh then return end
  local pp=veh.PrimaryPart or veh:FindFirstChildWhichIsA("BasePart")
  if pp then pp.CFrame=pp.CFrame*CFrame.Angles(math.rad(180),0,0)end
end)

btn(PV,"Parar Carro",Color3.fromRGB(200,60,80),function()
  local veh=getMyVehicle()
  if not veh then return end
  for _,v in ipairs(veh:GetDescendants())do
    if v:IsA("BasePart")then v.Velocity=Vector3.new(0,0,0)v.RotVelocity=Vector3.new(0,0,0)end
  end
end)

btn(PV,"Deletar Carro",Color3.fromRGB(180,40,60),function()
  local veh=getMyVehicle()
  if not veh then return end
  veh:Destroy()
end)

-- FIM
log("=== EGZODZ HUB v3.0 carregado ===")
log("by egzodz | verde+azul | aimbot+esp")
