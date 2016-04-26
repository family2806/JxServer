--zero 20070713 银牌召唤
--第一个字节记录银 第二个字节记录金 第三个字节记录玉，因为只用一次，只需要记录时间

Include( "\\script\\event\\mengjiang2007\\callboss.lua" )
Include("\\script\\lib\\pay.lua");
yinpai_Task=1827;
function main( nItemIdx )
	local TaskValue=GetTask(yinpai_Task);
	local nDate = tonumber(GetLocalDate("%Y%m%d"));
	if(nDate>20080331) then
		Say("令牌已过使用期，失去效力!",0)
		return 0;
	end
	if( IsCharged() == 0) then
		Say("真是遗憾，只有已充值玩家才能使用.",0);
		return 1; 
	end
	if( GetLevel() <90 ) then
		Say("真是遗憾，只有90级以上玩家才能使用.",0);
		return 1;
	end
	nDate = tonumber(GetLocalDate("%d"));
	if(nDate ~= GetByte(TaskValue,1) ) then --不是今天
		if( CallBoss(3) == 0) then
			TaskValue=SetByte(TaskValue,1,nDate); --设置银牌日期 第1字节
			SetTask(yinpai_Task,TaskValue);
			return 0;
		else
			return 1;
		end	
	else
		Say("今天已使用1个银牌了，等明天才能继续使用了!",0);
		return 1;
	end
	
end

function GetDesc(nItem)

end