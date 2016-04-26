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
		Say("<#> 您的级别不够吃这个果实.", 0)
		return 1
	end
	local nDate = tonumber(GetLocalDate("%m%d"))
	if ( GetTask(TASKIDDAY) ~= nDate ) then
		SetTask(TASKIDDAY, nDate)
		SetTask(TASKEATCOUNT, 0);
	end
	
	if ( GetTask(TASKIDDAY) == nDate and MX_LANTERN_COUNT <= GetTask(TASKEATCOUNT)) then
		local szMsg = format("<#>今天你可以吃%d黄金之果, 武功进步太快容易有副作用, 明天继续.",MX_LANTERN_COUNT)
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
		Msg2Player("<#> "..itemname.."<#> 已使用"..GOLDENSEED100_MAXCOUNT.."<#> 次, 不能再用了!")
	else
		Msg2Player("<#> "..itemname.."<#> 还可使用"..(GOLDENSEED100_MAXCOUNT - n_param).."<#> 次")
	end
	
	SetTask(TASKMAXEAT, GetTask(TASKMAXEAT) + 1)	--如何保证从1开始计数呢？？
	SetTask(TASKEATCOUNT, GetTask(TASKEATCOUNT) + 1)
	local award_exp = 50000000
	AddOwnExp(award_exp)
	return 1
end


function GetDesc(nItem)	
	local szDesc = ""
	local n_param = tonumber(GetItemParam( nItem, 1 ))
	szDesc = szDesc..format("\n可使用<color=yellow>%d<color>l个", (GOLDENSEED100_MAXCOUNT - n_param));
	return szDesc;
end
