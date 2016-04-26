function HoatDong()
giay = tonumber(date("%S"))
gio = tonumber(date("%H"))
phut = tonumber(date("%M"))
SubWorld = SubWorldID2Idx(53)
if (gio == 9) or (gio == 12) or (gio == 17) or (gio == 21) or (gio == 23) then
if (phut == 0) then
idnpc = random(931,935)
tongkim = SubWorldID2Idx(586)
boss1 = AddNpc(idnpc,150,tongkim,1716*32,3213*32)
SetNpcScript(boss1, "\\script\Pass");
idnpc = random(936,940)
tongkim = SubWorldID2Idx(586)
boss2 = AddNpc(idnpc,150,tongkim,1689*32,3224*32)
SetNpcScript(boss2, "\\script\\boss\\bosstieu.lua");
idnpc = random(941,945)
tongkim = SubWorldID2Idx(586)
boss3 = AddNpc(idnpc,150,tongkim,1647*32,3285*32)
SetNpcScript(boss3, "\\script\\boss\\bosstieu.lua");
idnpc = random(946,950)
tongkim = SubWorldID2Idx(586)
boss4 = AddNpc(idnpc,150,tongkim,1616*32,3312*32)
--SetNpcScript(boss4, "\\script\\boss\\bosstieu.lua");
idnpc = random(951,955)
tongkim = SubWorldID2Idx(586)
boss5 = AddNpc(idnpc,200,tongkim,1607*32,3196*32)
SetNpcScript(boss5,"\\script\\boss\\bossdai.lua");
Msg2SubWorld("Giang ho truyen rang {Boss Huyen Thoai} xuat hien tren Khu Vuc Bang Hoi")
elseif (phut == 15) or (phut == 20) then
phutcl = 30 - phut
Msg2SubWorld("Hoat dong san boss da dien ra "..phut.." phut, con lai "..phutcl.." phut nua")
elseif (phut == 31) then
VeLang()
end
end
if (gio == 8) or (gio == 11) or (gio == 16) or (gio == 20) or (gio == 22) then
if (phut == 46) or (phut == 48) or (phut == 50) or (phut== 52) or (phut== 54) or (phut== 56) or (phut== 58) then
phutcl = 60 - phut
DelNpc(boss1)
DelNpc(boss2)
DelNpc(boss3) 
DelNpc(boss4)
DelNpc(boss5)
AddGlobalCountNews("Hoat dong san boss Bang Hoi con "..phutcl.." phut nua se dien ra.",1)
end
end
end;

function VeLang()
W,X,Y = GetWorldPos()
for i=1,GetPlayerCount() do
PlayerIndex = i 
if W == 586 then
Msg2Player("Het thoi gian nhiem vu, su mang hoan thanh")
NewWorld(53, 200*8, 200*16);
SetFightState(0)
end
end
end

function no()
end;
