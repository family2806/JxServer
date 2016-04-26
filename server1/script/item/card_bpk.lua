-- Created by tsh 2004-12-09
-- ���ɿ�
-- ���������ſ�

szTitle="<#>��ѡ��ף���"
Bless=
{
	"<#>���쾭��ǧǧ�򣬽���Ԫ���ɺ�ʯ������һ����һ�䡣",
	"<#>û��ʲô�Ȱ����������ů�������˧����Ů������ϧ��",
	"<#>�ֵܽ��þ�����������ʱ��ο�㡢���㿪��ʱһͬ������ˡ�",
	"<#>ף���ɵĸ�λ�ֵܽ���һ�꿪������,һ���������,һ��ƽƽ����",
	"<#>ף���ɵĸ�λ�ֵܽ�������������,�������彡��,�����Դ�����",
	"<#>����Ǳܷ�ĸ��塢�����ǹķ�ĺ�������������������������Ҹ���",
}

ITEM_TASK_TEMP=25
UNIQUE_USE_TASK_TEMP=20
--��֤һ��ף��û����ǰ����ʹ�õڶ�����

ITEM_GENRE=6
ITEM_DETAIL=1
ITEM_PARTI=136

FuncBless={}

function main(sel)
	if (GetTaskTemp(UNIQUE_USE_TASK_TEMP) > 0) then
		Msg2Player("���������ڽ�������ף�������Ժ����ԡ�");
		return 1
	end

	local TongName
	local Result
	TongName, Result = GetTong();
	if (TongName == "") then
		Msg2Player("��û�м�����ɣ��޷�ʹ�ð��ɿ���")
		SetTaskTemp(ITEM_TASK_TEMP,0);
		SetTaskTemp(UNIQUE_USE_TASK_TEMP, 0);
		return 1;
	end

	SetTaskTemp(UNIQUE_USE_TASK_TEMP, 1);

	local nSelectCount = getn(Bless);
	for i=1, nSelectCount do
		FuncBless[i] = Bless[i].."/PlayerSelect"
	end

	nSelectCount = nSelectCount + 1;
	FuncBless[nSelectCount] = "ȡ��/QueryWiseManCancel"

	Say(szTitle, getn(Bless) + 1, FuncBless);
	SetTaskTemp(ITEM_TASK_TEMP,sel);
--�Ȳ�ɾ����ҵĿ�Ƭ����ʵ�ʷ�����ף��ʱ��ɾ����ʱ��¼����װ����ţ�
	return 1;
end

function PlayerSelect(nSelect)
	local TongName
	local Result
	TongName, Result = GetTong();
	if (TongName == "") then
		Msg2Player("��û�м�����ɣ��޷�ʹ�ð��ɿ���")
		SetTaskTemp(ITEM_TASK_TEMP,0);
		SetTaskTemp(UNIQUE_USE_TASK_TEMP, 0);
		return
	end
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
			szMsg = GetName().."<#>��"..TongName.."<#>����˵��"..Bless[nSelect + 1]
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

function QueryWiseManCancel()
	SetTaskTemp(ITEM_TASK_TEMP,0);
	SetTaskTemp(UNIQUE_USE_TASK_TEMP, 0);
end