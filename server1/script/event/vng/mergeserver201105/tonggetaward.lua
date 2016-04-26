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
		tbOpt:AddOptEntry("������ȡ10000 ��ս������", MergeSV_TongGetBonus);
	end
end


function MergeSV_TongGetBonus()
	if checkBangHuiLimit() == 0 then
			Say("�Բ��𣬴���δ�����κΰ��",0);
			return 0;
	end
	local szTongName, nTongID = GetTongName();
	local figure = TONGM_GetFigure(nTongID, GetName())
	if (figure ~= TONG_MASTER) then
		Say("���ź���ֻ�а��������콱.", 0)
		return
	end
	local IsTongGetItem = TONG_GetTaskValue(nTongID, Task_TongGet_Award) 
	if (IsTongGetItem ~= 0) then
		Say("�ý���ÿ�����ֻ����һ��.", 0)
		return
	end
	checkCreatLG(szTongName);
	checkJoinLG(szTongName);
	TONG_ApplySetTaskValue(nTongID, Task_TongGet_Award, 1)
	local nCurCount = LG_GetMemberTask(TIAOZHANLING_LGTYPE,TIAOZHANLING_LGName,szTongName,LGTSK_TIAOZHANLING_COUNT)
	LG_ApplyAppendMemberTask(TIAOZHANLING_LGTYPE,TIAOZHANLING_LGName, szTongName, LGTSK_TIAOZHANLING_COUNT, 10000, "", "");
	Msg2Player("������ֵ�ɹ�10000 ��ս������!")
	WriteLog(date("%Y%m%d %H%M%S").."\t".."Merge Server 201203"..GetAccount().."\t"..GetName().."\t".."��ֵ�ɹ�10000 ��ս������")
end