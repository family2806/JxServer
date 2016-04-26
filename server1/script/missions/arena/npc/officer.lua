Include("\\script\\missions\\arena\\player.lua")
Include("\\script\\global\\titlefuncs.lua")
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\maps\\checkmap.lua")
IncludeLib("TITLE")

local tbTitle2Id = 
{
	["独孤求败"] = 237,
	["武林至尊"] = 238,
	["一代宗师"] = 239,
	["绝世高手"] = 240,
	["闻名江湖"] = 241,
	["侠名远播"] = 242,
	["武林新秀"] = 243,
	["初入江湖"] = 244,
	["入门弟子"] = 245,
}

function want_get_title()
	local szTitle = "大侠每周参加够20场竞技战就可以得到竞技战名号"	
	local tbOpt = 
	{
		{"我想领名号", get_title, {}},

		{"我只是看看"},
	}
	CreateNewSayEx(szTitle, tbOpt)
end

function get_title()
	if tbPlayer:GetTitleFlag() ~= 0 then
		return Talk(1, "", "一周只领一次")
	end
	
	if tbPlayer:GetCurCount() < tbPlayer.PER_WEEK_COUNT then
		return Talk(1, "", format("要参加够 %d场才可以领取", tbPlayer.PER_WEEK_COUNT))
	end
	
	local szTitle = tbPlayer:GetTitle()
	local nTitleId = %tbTitle2Id[szTitle]
	if not nTitleId then
		return
	end
	
	tbPlayer:SetTitleFlag()
	local nTime = GetCurServerTime() + 60*60*24*7
	nTime = tonumber(FormatTime2String("%m%d%H%M", nTime))
	SetTask(TASK_ACTIVE_TITLE, nTitleId);
	Title_AddTitle(nTitleId, 2, nTime)
	Title_ActiveTitle(nTitleId)
end

function show_introduction()
	local szTitle = "各位好！竞技场已经在江湖中广泛宣传了<enter>报名：点击鼠标右键进入位于主页面右上角的竞技场版块打开报名界面; <enter> 竞技场荣誉徽章: 每月逢头20场可以领取荣誉徽章, 大侠打够20场也可以领取其他荣誉徽章; <enter>战队等级: 根据你在战队中的个人表现会提高或降低你的战队等级; <enter> 荣誉徽章商店：使用荣誉徽章购买各类贵重道具"
	local tbOpt = 
	{
		{"可以!", },
	}
	CreateNewSayEx(szTitle, tbOpt)
end

function open_credits_shop()
	local nMapId = GetWorldPos()
	if (IsFreshmanMap(nMapId) == 1 or IsCityMap(nMapId) == 1) and GetFightState() == 0 then
		Sale(175, 16)
	else
		Msg2Player("只能在城市和农村等安全区域开商店.")
	end
end


function main()
	--关闭竞技场技能 - Modified By NgaVN - 20120305
	do	
		Talk(1,"","技能暂闭!")
		return
	end	
	local szTitle = "大侠好,本人是竞技场官员."	
	local tbOpt = 
	{
		{"领取本周竞技场战队名号", want_get_title, {}},
		{"开竞技场荣誉商店", open_credits_shop, {}},
		{"介绍竞技场性能", show_introduction, {}},
		{"取消"},
	}
	CreateNewSayEx(szTitle, tbOpt)
end