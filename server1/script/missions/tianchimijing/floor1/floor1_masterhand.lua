Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\activitysys\\answer.lua")
Include("\\script\\missions\\tianchimijing\\floor1\\gamefloor1.lua")
Include("\\script\\lib\\composeex.lua")
--Bonus award - Modified By DinhHQ - 20120405
Include("\\script\\missions\\tianchimijing\\vnextaward.lua")
function main()
	if GetFightState() == 1 then
		DealWithFightPlayer()
	else
		DealWithUnFightPlayer()
	end	
end

function DealWithFightPlayer()
	local nNpcIndex = GetLastDiagNpc()
	local szNpcName = GetNpcName(nNpcIndex)
	local tbDailog = DailogClass:new(szNpcName)
	tbDailog.szTitleMsg = "<#><npc> 该路断了，只有轻功才能过去，想获得试用轻功的能力，就要去找我带来这丢失的刀，枪，剑，这些兵器在地面上的兵器箱子内。."
	G_ACTIVITY:OnMessage("ClickNpc", tbDailog, nNpcIndex)
	tinsert(tbDailog, {"多谢，找到了", ThrowPlayer})
	tinsert(tbDailog, {"让我想想"})
	CreateNewSayEx(tbDailog.szTitleMsg, tbDailog)
end

function ThrowPlayer()
	local tbOpt = {}
	local szTitle = ""
	local tbFormula =
	{
		szFailMsg = "隐世高人：你带来的都是我不需要的东西，你想骗我吗?",
		nFreeItemCellLimit = 0,
		szComposeTitle = "",
		tbMaterial = 
		{
			{szName = "刀", tbProp = {6, 1, 2592}, nCount = 1},
			{szName = "枪", tbProp = {6, 1, 2593}, nCount = 1},
			{szName = "剑", tbProp = {6, 1, 2594}, nCount = 1},
		},
		tbProduct = 
		{
			szName = nil,
			pFun = function (self, nItemCount, szLogTitle)
			end	
		},
		pLimitFun = function (self, nItemCount)
			return 1
		end
	}
	local pCompose = tbActivityCompose:new()
	pCompose:_init(tbFormula, "用天池秘境的刀枪剑换取轻功.")
	local nRetCode = pCompose:Compose(1)
	if nRetCode == 1 then
		--Bonus award - Modified By DinhHQ - 20120405
		tbVnExtAward:SetAwardFlag(1)
		SetAForbitSkill(210, 0)
		szTitle = "<#><npc> 哈哈，好，好。果然是我的兵器，明白了，轻功用来这样使用。（你可以使用轻功了） )"
		tinsert(tbOpt, {"多谢大侠"})
		CreateNewSayEx(szTitle, tbOpt)
	else
	end
end

function DealWithUnFightPlayer()
	local nNpcIndex = GetLastDiagNpc()
	local szNpcName = GetNpcName(nNpcIndex)
	local tbDailog = DailogClass:new(szNpcName)
	tbDailog.szTitleMsg = "<#><npc>小侠，我已等你许久了，你需要我带你进去那里吗？进入了就不能出来了哦"
	G_ACTIVITY:OnMessage("ClickNpc", tbDailog, nNpcIndex)
	tinsert(tbDailog, {"多谢你带我进来", TransPlayer})
	tinsert(tbDailog, {"让我想想"})
	CreateNewSayEx(tbDailog.szTitleMsg, tbDailog)
end


function TransPlayer()
	--Bonus award - Modified By DinhHQ - 20120405
	tbVnExtAward:SetAwardFlag(1)
	GameFloor1:MoveToTrap("隐世高人的传送点")
end