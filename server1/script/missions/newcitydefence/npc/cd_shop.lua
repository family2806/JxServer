Include("\\script\\missions\\newcitydefence\\headinfo.lua")

--排名奖励表
TSKID_PLAYER_GETAWARD = 1880 --领取标志
tb_cdPaiMingAward = 
{
	[1] = {nGuangHuan=187,szGuanghuan="定国元帅",tbManMask={0,11,418},tbMaleMask={0,11,417}},
	[2] = {nGuangHuan=186,szGuanghuan="安邦大将军",},
	[3] = {nGuangHuan=185,szGuanghuan="镖马大将军",},
	[4] = {nGuangHuan=184,szGuanghuan="武林中郎将",},
	[5] = {nGuangHuan=183,szGuanghuan="昭武校尉",},
}
function cd_getFengHuoLianCheng()
	if tonumber(GetLocalDate("%w")) == FIRE_OPENDAY_SUNDAY then
		Say("周日不能领奖.",0)
		return
	end
	local szMsg = "<dec><npc>本周烽火连城排行榜: \n"
	for i = 1, 5 do
		name , value = Ladder_GetLadderInfo(LADDER_ID_FANIEL, i)
		if name == 0 or name =="" or name == nil then
			break
		end
		szMsg = format("%s - <color=red>%s<color>: <color=red>%s<color>\t\t\t 战功值: <color=red>%s<color>\n",szMsg,i,name,value)
	end
	local tbAryTalk ={}
	tbAryTalk[1] = szMsg
	tinsert(tbAryTalk,"领取每周排名奖励/cd_doGetPaiMingAward")
	tinsert(tbAryTalk,"退出/NoChoice")
	CreateTaskSay(tbAryTalk)
end

function cd_doGetPaiMingAward()
	if tonumber(GetLocalDate("%w")) == FIRE_OPENDAY_SUNDAY then
		Say("周日不能领奖.",0)
		return
	end
	local nladder = 0;
	for i = 1, 5 do
		name , value = Ladder_GetLadderInfo(LADDER_ID_FANIEL, i)
		if name == GetName() then
			nladder = i
			break
		end
	end	
	if nladder == 0 then
		Say("在排名榜上没有名字，下周继续努力哦.",0)
		return
	end
	if GetTask(TSKID_PLAYER_GETAWARD) == tonumber(GetLocalDate("%W")) then
		Say("已领奖了，还来找我有什么事？ ",0)
		return
	end
	SetTask(TSKID_PLAYER_GETAWARD,tonumber(GetLocalDate("%W")))
	local nweek = tonumber(GetLocalDate("%w"));
	local nhour = tonumber(GetLocalDate("%H"));
	local nmint = tonumber(GetLocalDate("%M"));
	local ntime = (7-nweek) * 24 * 60 * 60 + (24 - nhour) * 60 *60 + (-nmint) * 60;
	local nDate = mod(FormatTime2Number(GetCurServerTime() + ntime), 100000000);
--	Title_AddTitle(tb_cdPaiMingAward[nladder].nGuangHuan, 2, nDate);
--	Title_ActiveTitle(tb_cdPaiMingAward[nladder].nGuangHuan);
	SetTask(1122,tb_cdPaiMingAward[nladder].nGuangHuan)
	if nladder == 1 then
		local nG = 0
		local nD = 0
		local nP = 0
		if GetSex() == 0 then
			nG = tb_cdPaiMingAward[nladder].tbManMask[1]
			nD = tb_cdPaiMingAward[nladder].tbManMask[2]
			nP = tb_cdPaiMingAward[nladder].tbManMask[3]
		else
			nG = tb_cdPaiMingAward[nladder].tbMaleMask[1]
			nD = tb_cdPaiMingAward[nladder].tbMaleMask[2]
			nP = tb_cdPaiMingAward[nladder].tbMaleMask[3]			
		end
		local nIdx = AddItem(nG,nD,nP,1,0,0)
		SetItemBindState(nIdx, -2)
		Msg2Player(format("恭喜你获得 1 <color=yellow>%s<color>",GetItemName(nIdx)))
		WriteLog(format("[烽火连城排行奖励]\t Date:%s\t Account:%s\t Name:%s\t GetItem:%s",GetLocalDate("%y-%m-%d %H:%M:%S"),GetAccount(),GetName(),GetItemName(nIdx)));
	end
	Msg2Player(format("恭喜你获得称号 <color=yellow>%s<color>",tb_cdPaiMingAward[nladder].szGuanghuan))
	WriteLog(format("[烽火连城排行奖励]\t Date:%s\t Account:%s\t Name:%s\t GetItem:%s",GetLocalDate("%y-%m-%d %H:%M:%S"),GetAccount(),GetName(),tb_cdPaiMingAward[nladder].szGuanghuan));
end