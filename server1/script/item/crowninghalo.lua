Include([[\script\lib\string.lua]]);
Include([[\script\lib\coordinate.lua]]);
IL("TIMER")
IL("TONG")
MAPFILE = [[\settings\item\004\mask.txt]];

--====Task Value====--
TIMER_ID	= 78				-- ID����д��\settings\timertask.txt
TIMER_LAST	= 3 * 60 * 60 * 18	-- ��ʹ����ʱ�䣬10����
TIMER_FREQ	= 10 * 18			-- �ͷ�Ƶ�ʣ�5��
USE_YES = 1						-- ����ʹ��
USE_NO = 0						-- û��ʹ��

TTK_FACE = {1024, 1025, 1026, 1027, 1028, 1029, 1030, 1031, 1032, 1033};
WSSZ_TK_USING = 1758		--�Ƿ�����ʹ����˫ɱ��
TK_MASK = 1759;				--��˫ɱ����ߵ�Idx

function main(nItem)
	local nRestCount = GetItemParam(nItem, 1)
	
	if (nRestCount <= 0) then
		Say("��˫ɱ���Ѵ򿪣��Ƿ�Ҫ�رգ�", 2, "�ر�/#closebook("..nItem..")", "��ʱ��Ҫ/no")
			--, "�ٸ�һ��/addbook", "ѡ������Ҫ�����/selectface")
	else
		Say("��˫ɱ���ѹرգ��Ƿ�Ҫ�򿪣�", 2, "��/#openbook("..nItem..")", "��ʱ��Ҫ/no")
		--, "�ٸ�һ��/addbook", "ѡ������Ҫ�����/selectface")
	end
	return 1;
end

function addbook()
	local nItem = AddItem(6,1,1106,1,0,0,0)	-- Ҫ��һ������Ʒ��magicscript.txt
	set_rest_count(nItem, TIMER_LAST/TIMER_FREQ)
end

function openbook(nItem)
	local nRestCount = GetItemParam(nItem, 1)
	ItemGenre, DetailType, ParticualrType = GetItemProp(nItem); --�õ���Ʒ���
	if (PlayerIndex ~= GetItemBelong(nItem) or ItemGenre ~= 6 or DetailType ~= 1 or ParticualrType ~= 1106) then
		return
	end;
	
	if (GetTask(WSSZ_TK_USING) == USE_YES) then
		Say("���Ѿ���һ����˫ɱ��", 0);
		Msg2Player("���Ѿ���һ����˫ɱ��");
		return
	end;
	
	SetTaskTemp(193, nItem);
	local nMaskIdx = GetItemParam(nItem, 2);
	Say("����˫ɱ��û��ѡ��������ͣ����Դ��������������һ�����������������˫ɱ��Ӱ������ѽ��Դ�⬵����γ��֣���ȷʵ����Ҫѡ��������", 2, 
	"��Ҫѡ����ص�����/sel_face", 
	"�Ҿ��ô�����β���/select_no");
end

function sel_face()
	nItem = GetTaskTemp(193);
	_, nTongID = GetTongName();
	local tab_face = {};
	local nMaskIdx;
	local szMaskName = "";
	for i = 1, 10 do
		nMaskIdx = TONG_GetTaskValue(nTongID, TTK_FACE[i]);
		if (nMaskIdx > 0) then
			szMaskName = gettabfilestring(MAPFILE, (nMaskIdx + 2), 1);
			tinsert(tab_face, szMaskName.."���β���/#sel_mask("..i..")");
		end;
	end;
	
	if (getn(tab_face) == 0) then
		Say("���Ŀǰû�������˫ɱ������Σ����������Ͽ��Ե����ͼ��ȥ��ɾ�����޸ġ����ӵ��ʮ������ȷʵҪʹ����˫ɱ����", 2,
		"�ǵģ��Ҿ��ô�����β���/select_no",
		"�����Ի�/no");
		return
	end;
	
	tinsert(tab_face, "�����Ի�/no");
	Say("���Ŀǰ��˫ɱ��ӵ�е����ΰ�������һЩ�����ӵ��ʮ�������������Ͽ��Ե����ͼ��ȥ��ɾ�����޸ġ���Ҫѡ���ĸ���Ϊ���ʹ�õ�ģ��", getn(tab_face), tab_face);
end;

function select_no()
	SetTask(TK_MASK, 35);
	start_book(0);
end;

function sel_mask(nMaskIdx)
	local nItem = GetTaskTemp(193);
	if (nItem <= 0) then
		return
	end;
	local nMask = TONG_GetTaskValue(nTongID, TTK_FACE[nMaskIdx]);
	if (nMask == 0) then
		nMask = 35;
	end
	SetTask(TK_MASK, nMask);
	
	SetSpecItemParam(nItem, 2, nMaskIdx);
	SyncItem(nItem);
	start_book(nMaskIdx)
end;
	
function start_book(nMaskIdx)
	local nItem = GetTaskTemp(193);
	if (nItem <= 0) then
		return
	end;
	
	_, nTongID = GetTongName();
	local nRestCount = GetItemParam(nItem, 1)
	local nRestTime = getresttime(nRestCount) * 18;
	local nMask = 35;
	if (nMaskIdx > 0 and nMaskIdx <= 10) then
		nMask = TONG_GetTaskValue(nTongID, TTK_FACE[nMaskIdx]);
	end;

	if (nRestCount > 0) then
		-- TM_SetTimer(Ƶ�ʣ�ID�����������ͣ�0-������ʧ,1-��ʵʱ��,2-����ʱ��)
		TM_SetTimer(TIMER_FREQ, TIMER_ID, nRestCount, 2)
		nt_setTask(WSSZ_TK_USING, USE_YES);
		set_rest_count(nItem, 0)
		
		emitskill(nMask, nRestCount)
		Msg2Player("�����һ����˫ɱ��")
	end
end

function getresttime(nTimes)
	if (nTimes <= 0) then
		return 0
	end;
	return nTimes * 5;
end;

function closebook(nItem)
	local nRestCount = GetItemParam(nItem, 1)
	ItemGenre, DetailType, ParticualrType = GetItemProp(nItem); --�õ���Ʒ���
	if (PlayerIndex ~= GetItemBelong(nItem) or ItemGenre ~= 6 or DetailType ~= 1 or ParticualrType ~= 1106) then
		return
	end;
	if (nRestCount <= 0) then
		nRestCount = TM_GetRestCount(TIMER_ID)
		-- ���ﻹҪ�ж�һ������timer����ļ��ܺ͸���˫ɱ���ǲ������ף�����ж�����˫ɱ��Ļ���
		-- if (������) then nRestCount = 0 end
		TM_StopTimer(TIMER_ID)
		if (not nRestCount or nRestCount <= 0) then
			Msg2Player("����˫ɱ���Ѻľ���")
			RemoveItemByIndex(nItem)
		else
			ChangeOwnFeature( 1, 0, 12);
			SetPkReduceState(0, 80, 80, 50);
			Msg2Player("��˫ɱ���ѹرգ�")
			set_rest_count(nItem, nRestCount)
		end
		nt_setTask(WSSZ_TK_USING, USE_NO);
	else
		Say("��û�д������˫ɱ��", 0);
		Msg2Player("��û�д������˫ɱ��");
	end
end

function GetDesc(nItem)
	local nRestCount = GetItemParam(nItem, 1)
	if (nRestCount <= 0) then
		return "<color=blue>����˫ɱ���Ѵ�<color>"
	else
		return format("<color=blue>����˫ɱ���п�ʹ��%dСʱ%.2f����<color>", floor(nRestCount / 360), mod(nRestCount, 360) / 6)
	end
end

function set_rest_count(nItem, nRestCount)
	SetSpecItemParam(nItem, 1, nRestCount)
	SyncItem(nItem)
end

function no()
	SetTaskTemp(193, 0);
end

function OnTimer()
	local nRestCount = TM_GetRestCount(TIMER_ID)

	if (nRestCount == 0) then --�������Ϊ0��
		nt_setTask(WSSZ_TK_USING, USE_NO);
		Msg2Player("����˫ɱ���Ѿ��ľ���")
		return
	end
	
	_, nTongID = GetTongName();
	local nMask = GetTask(TK_MASK);
	
	emitskill(nMask, nRestCount);
	if (mod(nRestCount, 30) == 0 and nRestCount > 0) then
		Msg2Player("�����<color=yellow>��˫ɱ��<color>������������<color=yellow>"..floor(nRestCount / 360).."<color>Сʱ<color=yellow>"..floor(mod(nRestCount, 360) / 6).."<color>���ӡ�");
	end;
end

function emitskill(nMask, nRestCount) --������
	local nCamp = GetCamp();
	local nTongID;
	_, dwTongID = GetTongName();
	local tab_P = GetMapPlayerList( nCamp, 1, dwTongID );--������Ѱȫ��
	local nOrgPlayerIdx = PlayerIndex;
	--������Ȼ�������ϼ���  
	local nRestTime = 15 * 18;
	local nMaskIdx = gettabfiledata(MAPFILE, nMask + 2, 15);
	
	for i = 1, getn(tab_P) do
		PlayerIndex = tab_P[i];
		if (PlayerIndex > 0) then
			SetPkReduceState(nRestTime, 80, 80, 50);
			--������
			ChangeOwnFeature( 1, nRestTime, nMaskIdx);
		end;
	end
	
	PlayerIndex = nOrgPlayerIdx;
end;

function nt_setTask(nTaskID, nTaskValue)
	SetTask(nTaskID, nTaskValue)
	SyncTaskValue(nTaskID) -- ͬ�����ͻ���
end
