Include("\\script\\lib\\gb_modulefuncs.lua")
IncludeLib("LEAGUE")
MAX_TJL_USE_COUNT = 5
str_endmsg = "��ʹ�õ�������Ѿ��ﵽʹ������"..MAX_TJL_USE_COUNT.."�Σ���˴ӱ�����ȥ����";

function main(nItem)
	local nUsedCount = GetItemParam(nItem, 1);

	Msg2Player("��ʹ����������һСʱ����ɻ�֪���ڵ�ͼ���й�����Ʒ��ʰȡ��Ϣ.")
	AddSkillState(707, 1, 1, 18*60*60);

	nUsedCount = nUsedCount + 1
	if (nUsedCount >= MAX_TJL_USE_COUNT) then
		Msg2Player(str_endmsg)
		return 0
	else
		SetItemMagicLevel(nItem, 1, nUsedCount)
	end
	SyncItem(nItem)
	return 1
end

function GetDesc(nItem)
	local nUsedCount = GetItemParam(nItem, 1);
	return "ʣ��ʹ�ô���:" ..(MAX_TJL_USE_COUNT - nUsedCount).." / "..MAX_TJL_USE_COUNT
end