-- Created by tsh 2004-12-09
-- õ�忨
-- ���������ſ�

szTitle="<#>��ѡ��ף���"
Message=
{
	{"<#>���Ƿ�����һ������","<#>������������ӯ�䣬ֻ��֪�����Ƿ���������һ�������ҡ�"},
	{"<#>�����ҵ�����","<#>����˵�����ҵ�������������Ҫ���죬��Ϊ�����ҵ�������"},
    {"<#>ѩҹ����Ƶ���","<#>������ʱ����ů�ĸо�����ѩҹ������ƻ����������Ƶ��ˡ�"},
    {"<#>�������㲻������","<#>���ڷ�ǰ��������꣬Ը�ܽ�˳�Ե������������ز������롣"},
    {"<#>Ը��������������","<#>����Ҳ���ı䣬��˵�Ǿ����������ԣ�Ը����������������"},
    {"<#>�������������������Ե","<#>�����మʱ����ж�ã������ҽ������������������Ե��"},
    {"<#>����˼","<#>�쳤·Զ��ɿ࣬�λ겻����ɽ�ѣ�����˼�����ĸΡ�"},
    {"<#>�ҵ����౦��","<#>�ҵ����౦�������~ཱུ�Ѷ�ţ�ԭ���ҵ����������㣬���ܡ�"},
    {"<#>����ҵ���͵��","<#>���龫�ֵ��㣬���ҵ���͵���ˣ������Ժ��ﶼ�������Ӱ��"},
}

ITEM_TASK_TEMP=26
UNIQUE_USE_TASK_TEMP=20
--��֤һ��ף��û����ǰ����ʹ�õڶ�����

ITEM_GENRE=6
ITEM_DETAIL=1
ITEM_PARTI=236

FuncBless={}

function main(sel)
	if (GetTaskTemp(UNIQUE_USE_TASK_TEMP) > 0) then
		Msg2Player("���������ڽ�������ף�������Ժ����ԡ�");
		return 1
	end
	SetTaskTemp(UNIQUE_USE_TASK_TEMP, 1);

	local nSelectCount = getn(Message);
	for i=1, nSelectCount do
		FuncBless[i] = Message[i][1].."/PlayerSelect"
	end

	nSelectCount = nSelectCount + 1;
	FuncBless[nSelectCount] = "ȡ��/QueryWiseManCancel"

	Say(szTitle, getn(FuncBless), FuncBless);
	SetTaskTemp(ITEM_TASK_TEMP,sel);
--�Ȳ�ɾ����ҵĿ�Ƭ����ʵ�ʷ�����ף��ʱ��ɾ����ʱ��¼����װ����ţ�
	return 1;

end

function PlayerSelect(nSelect)
	QueryWiseMan("BlessPlayerOnline", "BlessPlayerOffline", nSelect);
end

function BlessPlayerOnline(TargetName, nSelect, LifeMax, ManaMax, PKValue, PlayerLevel, MapName, nPosX, nPosY, nSex, nWorldRank)
	local ItemIdx
	ItemIdx = GetTaskTemp(ITEM_TASK_TEMP);
	local ItemGenre
	local DetailType
	local ParticularType
	local Level
	local Series
	local Luck
	ItemGenre,DetailType,ParticularType,Level,Series,Luck = GetItemProp(ItemIdx)
	if (ItemIdx > 0 and ItemGenre == ITEM_GENRE and DetailType == ITEM_DETAIL and ParticularType == ITEM_PARTI) then
		if (RemoveItemByIndex(ItemIdx) == 1) then
			local szMsg
			szMsg = GetName().."<#>��"..TargetName.."<#>˵��"..Message[nSelect + 1][2]
			AddGlobalCountNews(szMsg,1);
		else
			Msg2Player("�Ҳ�����Ƭ��������һ�Ρ�")
		end
	else
		Msg2Player("��Ƭʹ��ʧ�ܣ�������һ�Ρ�")
	end
	SetTaskTemp(ITEM_TASK_TEMP,0)
	SetTaskTemp(UNIQUE_USE_TASK_TEMP, 0);
end

function BlessPlayerOffline(TargetName, nSelect)
	Msg2Player("����ף����������ڲ����ߣ����Ժ����ԡ�");
	SetTaskTemp(UNIQUE_USE_TASK_TEMP, 0);
end

function QueryWiseManCancel()
	SetTaskTemp(ITEM_TASK_TEMP,0);
	SetTaskTemp(UNIQUE_USE_TASK_TEMP, 0);
end