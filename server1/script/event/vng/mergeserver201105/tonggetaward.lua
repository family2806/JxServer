--Include("\\script\\task\\system\\task_string.lua");
Include("\\script\\event\\vng\\MergeServer201105\\head.lua")
--Include("\\script\\tong\\tong_header.lua")
--Include("\\script\\missions\\citywar_global\\head.lua");
Include("\\script\\missions\\citywar_global\\infocenter_head.lua")

function MergeSV_CheckTime()
	local nCurDate = nCurDate or tonumber(GetLocalDate("%Y%m%d%H%M"))
	local nStartDate = 201203080800
	local nEndDate = 201203091800
	if nCurDate >= nStartDate and nCurDate < nEndDate then
		return 1
	end
	return nil
end

function MergeSV_AddDialog(tbOpt)
	if MergeSV_CheckTime() == 1 then
		tbOpt:AddOptEntry("我来领取10000 挑战令给帮会", MergeSV_TongGetBonus);
	end
end


function MergeSV_TongGetBonus()
	if checkBangHuiLimit() == 0 then
			Say("对不起，大侠未加入任何帮会",0);
			return 0;
	end
	local szTongName, nTongID = GetTongName();
	local figure = TONGM_GetFigure(nTongID, GetName())
	if (figure ~= TONG_MASTER) then
		Say("真遗憾，只有帮助才能领奖.", 0)
		return
	end
	local IsTongGetItem = TONG_GetTaskValue(nTongID, Task_TongGet_Award) 
	if (IsTongGetItem ~= 0) then
		Say("该奖励每个帮会只能领一次.", 0)
		return
	end
	checkCreatLG(szTongName);
	checkJoinLG(szTongName);
	TONG_ApplySetTaskValue(nTongID, Task_TongGet_Award, 1)
	local nCurCount = LG_GetMemberTask(TIAOZHANLING_LGTYPE,TIAOZHANLING_LGName,szTongName,LGTSK_TIAOZHANLING_COUNT)
	LG_ApplyAppendMemberTask(TIAOZHANLING_LGTYPE,TIAOZHANLING_LGName, szTongName, LGTSK_TIAOZHANLING_COUNT, 10000, "", "");
	Msg2Player("大侠充值成功10000 挑战令给帮会!")
	WriteLog(date("%Y%m%d %H%M%S").."\t".."Merge Server 201203"..GetAccount().."\t"..GetName().."\t".."充值成功10000 挑战令给帮会")
end