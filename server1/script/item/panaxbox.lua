--领取特技时，开启参罐，加技能，
--提示给与参罐，并开启参罐，关闭参罐即可使灵参力保存下来。
TASKID_PANAXBOX_OPEND = 1577
TASKID_PANAXBOX_LASTIME = 1578
LINGSHENLI_TIME = 7 * 60 * 60

function main(nItemIndex)
	local nParam1 = GetItemParam(nItemIndex, 1)
	if (nParam1 == 0 and GetTask(TASKID_PANAXBOX_OPEND) == 0) then
		Say("要开启参罐，使用灵参之力么？", 2, "开启/#lingshenli_want2open("..nItemIndex..")", "取消/OnCancel")
	elseif (nParam1 == 1 and GetTask(TASKID_PANAXBOX_OPEND) == 1) then
		Say("要合上参罐么？", 2, "关闭/#lingshenli_want2close("..nItemIndex..")", "取消/OnCancel")
	elseif (nParam1 == 1 and GetTask(TASKID_PANAXBOX_OPEND) == 0) then
		SetTask(TASKID_PANAXBOX_OPEND, 1)
	else
		Say("已有一罐百年人参在发挥效用", 0)
	end
	return 1
end

function lingshenli_confirm(nItemIndex)
	if (RemoveItemByIndex(nItemIndex) == 1) then
		AddSkillState(735, 5, 1, LINGSHENLI_TIME * 18, 1);
		Msg2Player("您获得了百年人参的灵力，提高血内20%、全抗10点效果持续7小时。");
	else
		print("ERROR!! ADD LINGSHENLI FAILED! NO ITEMINDEX");
	end;
end;

function OnCancel()
end

function lingshenli_want2open(nItemIndex)
	local nParam2 = GetItemParam(nItemIndex, 2)
	local nParam3 = GetItemParam(nItemIndex, 3)

	if (nParam2 == 0) then
		SetSpecItemParam(nItemIndex, 2, LINGSHENLI_TIME)
		nParam2 = LINGSHENLI_TIME
	elseif (nParam2 == -1) then
		RemoveItemByIndex(nItemIndex)
		SetTask(TASKID_PANAXBOX_OPEND, 0)
		Msg2Player("此罐中的人参已耗尽百年灵力！")
	end
	SetSpecItemParam(nItemIndex, 3, GetGameTime())
	SetSpecItemParam(nItemIndex, 1, 1)
	SyncItem(nItemIndex)
	SetTask(TASKID_PANAXBOX_OPEND, 1)
	AddSkillState(735, 5, 1, nParam2 * 18, 1)
	local nMin, nSec = GetTimeSec2Min(nParam2)
	if (nMin <= 0) then
		Msg2Player("此罐人参还能持续释放灵力"..nSec.."秒钟")
	else
		Msg2Player("此罐人参还能持续释放灵力"..nMin.."分钟")
	end
end

function lingshenli_want2close(nItemIndex)
	local nParam2 = GetItemParam(nItemIndex, 2)
	local nParam3 = GetItemParam(nItemIndex, 3)
	local nGameTime = GetGameTime()
	local nlast = nParam2 - (nGameTime - nParam3)
	if (nlast <= 0) then
		SetSpecItemParam(nItemIndex, 2, -1)
		RemoveItemByIndex(nItemIndex)
		Msg2Player("此罐人参已耗尽百年灵力！")
		AddSkillState(735, 5, 0, 0)
	else
		SetSpecItemParam(nItemIndex, 3, GetGameTime())
		SetSpecItemParam(nItemIndex, 2, nlast)
		SetSpecItemParam(nItemIndex, 1, 0)
		SyncItem(nItemIndex)
		local nMin, nSec = GetTimeSec2Min(nlast)
		if (nMin <= 0) then
			Msg2Player("此罐人参还保有灵力"..nSec.."秒钟")
		else
			Msg2Player("此罐人参还保有灵力"..nMin.."分钟")
		end
		AddSkillState(735, 5, 0, 0)
	end
	SetTask(TASKID_PANAXBOX_OPEND, 0)
end

function GetTimeSec2Min(nlast)
	return floor(nlast / 60), mod(nlast, 60)
end

function GetDesc(nItem)
	local nParam1 = GetItemParam(nItem, 1)
	if (nParam1 <= 0) then
		return "<color=blue>关闭状态<color>"
	else
		return "<color=blue>开启状态<color>"
	end
end