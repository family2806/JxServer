Include("\\script\\event\\funv_jieri\\200903\\class.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\missions\\basemission\\lib.lua")

Include("\\script\\lib\\string.lua")
local tbExpAward = 
{
	--[nSex] = {nExp = nExp}
	[0] = {nExp = 2000000},
	[1] = {nExp = 3000000},
	
}


local tbBless = 
{
	"嘴唇上总是露出亲切的微笑，",
	"总是快乐和幸福",
	"总是遇到很多幸运和幸福",
	"很美了，要更美，让花羡慕，月亮嫉妒",
	"美好的东西总在身边",
	"在生活中总是强大和自信",
	"前行的路上总是光明就像铺了玫瑰花",
	"容易越过生活中的困难",
	"时间不会褪掉容颜",
	"总是感到快乐和舒服",
	"对生活充满信念",
	"永远美丽",
	"永远像百花一样美丽",
	"生活在朋友和亲人的感情中",
	"相信事业会成功",
	"永远美丽和有魅力",
	"跌倒的时候总能站起来，勇敢越过困难",
	"3月8号真是快乐和充满意义的一天",
	"早日找到依靠的地方在人生中坚定的前行",
	"全家快乐、幸福、健康",
}
local _AddRoseCardExp = function (nItemIndex)
	local nSex = GetSex()
	if tbFunv0903.tbTask:CheckExpFromRose() ~= 1 then
		Msg2Player(format("每人最多只能从玫瑰卡中获得 %u 经验", tbFunv0903.tbTask.nMaxExpFromRose))	
	else
		local tbExp = %tbExpAward[nSex]
		tbAwardTemplet:GiveAwardByList(tbExp, "use "..GetItemName(nItemIndex))
		tbFunv0903.tbTask:AddCurExpFromRose(tbExp.nExp)
	end
	
end

function main(nItemIndex)
	
	if GetItemParam(nItemIndex, 1) ~= 0 and GetItemParam(nItemIndex, 1) <= tonumber(GetLocalDate("%Y%m%d")) then
		Talk(1,"", "该物品已过期")
		return 0
	end
	
	local nTeamSize = GetTeamSize()
	if GetSex() ~= 0 then
		Talk(1, "", "该物品只有男人才能使用")
		return 1
	end
	if nTeamSize ~= 2 then
		Talk(1, "", "需要1男1女组队才能使用.")
		return 1
	end
	local nSexFlag = 0
	local szName_Male = GetName()
	local szName_Female = ""
	for i=1, nTeamSize do
		local nPlayerIndex = GetTeamMember(i)
		local nSex = doFunByPlayer(nPlayerIndex, GetSex)
		local szName = doFunByPlayer(nPlayerIndex, GetName)
		local bRet, szFailMsg = doFunByPlayer(nPlayerIndex, tbFunv0903.IsPlayerEligible, tbFunv0903)
		if bRet ~= 1 then
			local szMsg = format("<color=yellow>%s<color>%s",szName, szFailMsg)
			Msg2Team(szMsg)
			Talk(1, "", szMsg)
			
			return 1
		end
		
		nSexFlag = nSexFlag + nSex
		if szName ~= szName_Male then
			szName_Female = szName
		end
	end
	
	if nSexFlag ~= 1 then --2人组队的情况下，同性别相加必定为0+0=0或者1+1=2，异型为0+1=1
		Talk(1, "", "需要1男1女组队才能使用.")
		return 1
	end
	local nColor = toColor(random(0,255), random(0,255), random(0,255)) 
	local szBless = format("<color=%s>%s<color>", tostring(nColor), %tbBless[random(1, getn(%tbBless))])
	local szMsg = format("<color=yellows>%s<color>祝<color=yellows>%s<color>: %s", szName_Male, szName_Female, szBless)
	AddGlobalNews(szMsg)
	Msg2SubWorld(szMsg)
	for i=1, nTeamSize do
		local nPlayerIndex = GetTeamMember(i)
		doFunByPlayer(nPlayerIndex, %_AddRoseCardExp, nItemIndex)
	end
	
	
	
	
	
end