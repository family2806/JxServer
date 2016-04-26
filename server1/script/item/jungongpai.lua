--zero 2007-07-30
IncludeLib("SETTING");
JUNGONGPAI_exp={
	100000,
	{2000000,30},
	{3000000,40},
	{5000000,30}}
function main(nItem)	
	local nEndYear= GetItemParam(nItem, 1);
	local nMonthDay= GetItemParam(nItem, 2);
	
	if( nEndYear < tonumber(GetLocalDate("%Y")) or nMonthDay < tonumber(GetLocalDate("%m%d")) ) then
		Say("宋金军功牌在领取后次日24点前使用，该军功牌已过期。",0)
		return 0;
	end
		
	
	
	local prob = JUNGONGPAI_exp[1];
	local sum = 0;
	local num = random(1,prob);
	for i = 2,getn(JUNGONGPAI_exp) do
		local odds = JUNGONGPAI_exp[i][2];
		sum = sum + odds * prob/100;
		if num < sum then
			AddOwnExp(JUNGONGPAI_exp[i][1])
			Msg2Player(format("因使用宋金军功牌得到%d经验",JUNGONGPAI_exp[i][1]))
			WriteLog(format("[宋金军功牌]\t date:%s \t Account:%s \t Name:%s \t 使用宋金军功牌得到%d的经验 \t",GetLocalDate("%Y-%m-%d %H:%M:%S"),GetAccount(),GetName(),JUNGONGPAI_exp[i][1]));
			break;
		end
	end
end

function GetDesc(nItem)
	local nEndYear= GetItemParam(nItem, 1);
	local nMonthDay= GetItemParam(nItem, 2);
	local nEndMonth=floor(nMonthDay/100);
	local nEndDay=mod(nMonthDay,100);
	return "使用截止日期:"..nEndYear.."年"..nEndMonth.."月"..nEndDay.."日";
end