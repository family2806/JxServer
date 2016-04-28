Include("\\script\\missions\\qianchonglou\\rule.lua")
Include("\\script\\missions\\qianchonglou\\challenger.lua")
Include("\\script\\dailogsys\\dailogsay.lua")
IncludeLib("SETTING")
function signup()
	if tbPlayerHandle:CheckDate() ~= 1 then
		local nAwardPoint = tbPlayerHandle:GetAwardPoint(nPoint)
		if nAwardPoint > 0 then
			return Talk(1, "", "你需要先领取之前的奖励才能继续参加.")
		end
	end
	if ST_IsTransLife() ~= 1  and GetLevel() < 120 then
		return Talk(1, "", format("%d 级以下不能参加该活动", 120))
	end
	local pDungeonType = DungeonType["endless tower"]
	local pChallenger = tbChallenger:new()
	pChallenger:Update()
	if pChallenger:GetPlayTime() <= 0 then
		return Talk(1, "", "今天你的时间已用完")
	end
	if pDungeonType then
		local pDungeon = pDungeonType:new_dungeon(pDungeonType.TEMPLATE_MAP_ID, {pChallenger})
		if pDungeon then
			pChallenger:Update()
			local nMapId, nX, nY = pDungeon:GetTowerPos()
			NewWorld(nMapId, nX, nY)
		else
			print("fail")
		end
	end
end

function give_award()
	local nAwardPoint = tbPlayerHandle:GetAwardPoint(nPoint)
	if nAwardPoint <= 0 then
		return Talk(1, "","你的奖励值不够用来领奖")
	end
	Msg2Player(format("你已获得%d 奖励值的奖励.", nAwardPoint))
	tbPlayerHandle:SetAwardPoint(0)
end
--关闭天重楼功能- Modified By DinhHQ - 20120402
function dialog()
do return end
	local szTitle = "打开副本后，每个玩家将获得一点的基础分，每次发出攻击将消耗基础分。暴怒不相同，消耗的基础分也不相同，可以通过鼠标点击屏幕左右来更换暴怒等级。暴怒等级越高，击中怪物的机会越大。打中怪物后，将获得奖励，当基础分分消耗完后，也可以用奖励分来换暴怒。每次击中一定数量的怪物，都能获得相对应的暴怒，可以打中周围所有的敌人。"
	local tbOpt = 
	{
		{"我想参加", signup},
		{"领奖", give_award},
		{"取消"}
	}
	CreateNewSayEx(szTitle, tbOpt)
end


Include("\\script\\misc\\eventsys\\type\\npc.lua")

--pEventType:Reg("提点官皇城司, "天重楼", dialog, {})
