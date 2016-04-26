IncludeLib("ITEM");
--huihuangzhiguo_level
MX_LANTERN_COUNT = 2;
GOLDFRUIT_MX_COUNT = 365;
TASKIDDAY = 2321;
TASKMAXEAT = 2314;
TASKEATCOUNT = 2322;
GOLDENSEED100_MAXCOUNT = 100;

function main(ItemIndex)
	if (GetLevel() < 120) then
		Say("<#> ���ļ��𲻹��������ʵ.", 0)
		return 1
	end
	local nDate = tonumber(GetLocalDate("%m%d"))
	if ( GetTask(TASKIDDAY) ~= nDate ) then
		SetTask(TASKIDDAY, nDate)
		SetTask(TASKEATCOUNT, 0);
	end
	
	if ( GetTask(TASKIDDAY) == nDate and MX_LANTERN_COUNT <= GetTask(TASKEATCOUNT)) then
		local szMsg = format("<#>��������Գ�%d�ƽ�֮��, �书����̫�������и�����, �������.",MX_LANTERN_COUNT)
		Say(szMsg, 0)
		Msg2Player(szMsg)
		return 1
	end
	
	local n_param = tonumber(GetItemParam(ItemIndex,1)) + 1
	local itemname = "<color=yellow>"..GetItemName(ItemIndex).."<color>"
	SetSpecItemParam(ItemIndex,1,n_param)
	SyncItem(ItemIndex)
	if (n_param >= GOLDENSEED100_MAXCOUNT) then
		RemoveItemByIndex(ItemIndex)
		Msg2Player("<#> "..itemname.."<#> ��ʹ��"..GOLDENSEED100_MAXCOUNT.."<#> ��, ����������!")
	else
		Msg2Player("<#> "..itemname.."<#> ����ʹ��"..(GOLDENSEED100_MAXCOUNT - n_param).."<#> ��")
	end
	
	SetTask(TASKMAXEAT, GetTask(TASKMAXEAT) + 1)	--��α�֤��1��ʼ�����أ���
	SetTask(TASKEATCOUNT, GetTask(TASKEATCOUNT) + 1)
	local award_exp = 50000000
	AddOwnExp(award_exp)
	return 1
end


function GetDesc(nItem)	
	local szDesc = ""
	local n_param = tonumber(GetItemParam( nItem, 1 ))
	szDesc = szDesc..format("\n��ʹ��<color=yellow>%d<color>l��", (GOLDENSEED100_MAXCOUNT - n_param));
	return szDesc;
end
