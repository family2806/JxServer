Include("\\script\\lib\\composeex.lua")
Include("\\script\\misc\\eventsys\\type\\npc.lua")

local tbFormula = 
{
	szName = "�׻�����",
	tbMaterial = {{szName="������",tbProp={6,1,2566,1,0,0},nCount = 1000,},},
	tbProduct = {szName="�׻�����",tbProp={6,1,3183,1,0,0},},
	nWidth = 1,
	nHeight = 1,
	nFreeItemCellLimit = 1,
}
local tbCompose_XinXiaLing2BaiHuJinPai = tbActivityCompose:new(tbFormula, "xingxialin2baihujinpai")


--��ʱ�ر�����׻�װ������ -Modified By DinhHQ - 20120511
--pEventType:Reg("С��", "��׻�����", tbCompose_XinXiaLing2BaiHuJinPai.ComposeDailog, {tbCompose_XinXiaLing2BaiHuJinPai})

--�÷���ʯ���׻��� - Modified By DinhHQ - 20120612
local tbFormula2 = 
{
	szName = "�׻���",
	tbMaterial = {{szName="������",tbProp={6,1,30224,1,0,0},nCount = 10,},},
	tbProduct = {szName="�׻���",tbProp={6,1,2357,1,0,0},},
	nWidth = 1,
	nHeight = 1,
	nFreeItemCellLimit = 1,
}
local tbCompose_PVT2BHL = tbActivityCompose:new(tbFormula2, "DungPhongVanThachDoiBachHoLenh")
pEventType:Reg("С��", "�һ��׻���", tbCompose_PVT2BHL.ComposeDailog, {tbCompose_PVT2BHL})