Include("\\script\\lib\\composeex.lua")
Include("\\script\\misc\\eventsys\\type\\npc.lua")

local tbFormula = 
{
	szName = "白虎金牌",
	tbMaterial = {{szName="行侠令",tbProp={6,1,2566,1,0,0},nCount = 1000,},},
	tbProduct = {szName="白虎金牌",tbProp={6,1,3183,1,0,0},},
	nWidth = 1,
	nHeight = 1,
	nFreeItemCellLimit = 1,
}
local tbCompose_XinXiaLing2BaiHuJinPai = tbActivityCompose:new(tbFormula, "xingxialin2baihujinpai")


--暂时关闭铸造白虎装备性能 -Modified By DinhHQ - 20120511
--pEventType:Reg("小贩", "买白虎金牌", tbCompose_XinXiaLing2BaiHuJinPai.ComposeDailog, {tbCompose_XinXiaLing2BaiHuJinPai})

--用风云石换白虎令 - Modified By DinhHQ - 20120612
local tbFormula2 = 
{
	szName = "白虎令",
	tbMaterial = {{szName="风云令",tbProp={6,1,30224,1,0,0},nCount = 10,},},
	tbProduct = {szName="白虎令",tbProp={6,1,2357,1,0,0},},
	nWidth = 1,
	nHeight = 1,
	nFreeItemCellLimit = 1,
}
local tbCompose_PVT2BHL = tbActivityCompose:new(tbFormula2, "DungPhongVanThachDoiBachHoLenh")
pEventType:Reg("小贩", "兑换白虎令", tbCompose_PVT2BHL.ComposeDailog, {tbCompose_PVT2BHL})