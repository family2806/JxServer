-- Created by Danielsun 2006-12-07
-- ף����
-- һ��������ף����,ÿ�ŵ�ף���ﶼ��ͬ.

Include("\\script\\lib\\string.lua")

--<playerbless> -- [�տ�������]
--<name> -- [����������]
tbMessage={
	["6,1,1328"] = "ף <color=red><playerbless><color> ʥ�����������<color=red><name><color>",
	["6,1,1329"] = "<color=red><playerbless><color> �װ��ģ�ף��ʥ������ <color=red><name><color>",
	["6,1,1330"] = "<color=red><playerbless><color> �װ��ģ�ף��ʥ������ <color=red><name><color>",
	["6,1,1331"] = "ף��<color=red><playerbless><color> ʥ������. <color=red><name><color>",
	["6,1,1332"] = "ף�� <color=red><playerbless><color> ������ֺ��Ҹ�<color=red><name><color>",
	}

ITEM_TASK_TEMP=26
UNIQUE_USE_TASK_TEMP=20
--��֤һ��ף��û����ǰ����ʹ�õڶ�����

function main(sel)

	if (GetTaskTemp(UNIQUE_USE_TASK_TEMP) > 0) then
		Msg2Player("��Ŀǰ���ڷ�ף������һ��!");
		return 1;
	end
	SetTaskTemp(UNIQUE_USE_TASK_TEMP, 1);
	SetTaskTemp(ITEM_TASK_TEMP,sel);
	
	Say("�����ʥ������������?", 2, "��/sendWish","��ʱ����/wishCancel");
	return 1;
end

function sendWish()
		QueryWiseMan("BlessPlayerOnline", "BlessPlayerOffline", 1);
end

function BlessPlayerOnline(TargetName, nSelect, LifeMax, ManaMax, PKValue, PlayerLevel, MapName, nPosX, nPosY, nSex, nWorldRank)
	local ItemIdx = GetTaskTemp(ITEM_TASK_TEMP);
	local ItemGenre
	local DetailType
	local ParticularType
	
	ItemGenre,DetailType,ParticularType = GetItemProp(ItemIdx)
	local szItemkey = ItemGenre..","..DetailType..","..ParticularType;
	if (ItemIdx > 0 and tbMessage[szItemkey] ~= nil) then
		if (RemoveItemByIndex(ItemIdx) == 1) then
			local szMsg
			szMsg = replace(tbMessage[szItemkey],"<playerbless>",TargetName);
			szMsg = replace(szMsg,"<name>",GetName());
			AddGlobalCountNews(szMsg,1);
		else
			Msg2Player("�Ҳ�������������һ��!.")
		end
	else
		Msg2Player("ʹ�ÿ�ʧ�ܣ�������һ��.")
	end
	SetTaskTemp(ITEM_TASK_TEMP,0)
	SetTaskTemp(UNIQUE_USE_TASK_TEMP, 0);
end

function BlessPlayerOffline(TargetName, nP)
	Msg2Player("����ף���������ڲ����ߣ��Ժ�����!.");
	SetTaskTemp(UNIQUE_USE_TASK_TEMP, 0);
end

function wishCancel()
	SetTaskTemp(ITEM_TASK_TEMP,0);
	SetTaskTemp(UNIQUE_USE_TASK_TEMP, 0);
end