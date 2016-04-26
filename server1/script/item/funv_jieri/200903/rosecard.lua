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
	"�촽������¶�����е�΢Ц��",
	"���ǿ��ֺ��Ҹ�",
	"���������ܶ����˺��Ҹ�",
	"�����ˣ�Ҫ�������û���Ľ����������",
	"���õĶ����������",
	"������������ǿ�������",
	"ǰ�е�·�����ǹ�����������õ�廨",
	"����Խ�������е�����",
	"ʱ�䲻���ʵ�����",
	"���Ǹе����ֺ����",
	"�������������",
	"��Զ����",
	"��Զ��ٻ�һ������",
	"���������Ѻ����˵ĸ�����",
	"������ҵ��ɹ�",
	"��Զ������������",
	"������ʱ������վ�������¸�Խ������",
	"3��8�����ǿ��ֺͳ��������һ��",
	"�����ҵ������ĵط��������мᶨ��ǰ��",
	"ȫ�ҿ��֡��Ҹ�������",
}
local _AddRoseCardExp = function (nItemIndex)
	local nSex = GetSex()
	if tbFunv0903.tbTask:CheckExpFromRose() ~= 1 then
		Msg2Player(format("ÿ�����ֻ�ܴ�õ�忨�л�� %u ����", tbFunv0903.tbTask.nMaxExpFromRose))	
	else
		local tbExp = %tbExpAward[nSex]
		tbAwardTemplet:GiveAwardByList(tbExp, "use "..GetItemName(nItemIndex))
		tbFunv0903.tbTask:AddCurExpFromRose(tbExp.nExp)
	end
	
end

function main(nItemIndex)
	
	if GetItemParam(nItemIndex, 1) ~= 0 and GetItemParam(nItemIndex, 1) <= tonumber(GetLocalDate("%Y%m%d")) then
		Talk(1,"", "����Ʒ�ѹ���")
		return 0
	end
	
	local nTeamSize = GetTeamSize()
	if GetSex() ~= 0 then
		Talk(1, "", "����Ʒֻ�����˲���ʹ��")
		return 1
	end
	if nTeamSize ~= 2 then
		Talk(1, "", "��Ҫ1��1Ů��Ӳ���ʹ��.")
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
	
	if nSexFlag ~= 1 then --2����ӵ�����£�ͬ�Ա���ӱض�Ϊ0+0=0����1+1=2������Ϊ0+1=1
		Talk(1, "", "��Ҫ1��1Ů��Ӳ���ʹ��.")
		return 1
	end
	local nColor = toColor(random(0,255), random(0,255), random(0,255)) 
	local szBless = format("<color=%s>%s<color>", tostring(nColor), %tbBless[random(1, getn(%tbBless))])
	local szMsg = format("<color=yellows>%s<color>ף<color=yellows>%s<color>: %s", szName_Male, szName_Female, szBless)
	AddGlobalNews(szMsg)
	Msg2SubWorld(szMsg)
	for i=1, nTeamSize do
		local nPlayerIndex = GetTeamMember(i)
		doFunByPlayer(nPlayerIndex, %_AddRoseCardExp, nItemIndex)
	end
	
	
	
	
	
end