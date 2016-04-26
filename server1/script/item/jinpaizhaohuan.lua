--zero 20070713 金牌召唤
--第一个字节记录银 第二个字节记录金 第三个字节记录玉，因为只用一次，只需要记录时间
--tinhpn 20100720: forbid item
Include("\\script\\item\\forbid_jinpai_yupai.lua");


Include( "\\script\\event\\mengjiang2007\\callboss.lua" )
Include("\\script\\lib\\pay.lua");

--tinhpn 20100803: Patch Request
local tbUseOnlyInMap = 
{
	586,587,588,589,590,591,592,593,594,595,596,597,598,599,600,601,602,603,604,
}
local checkOnlyUseInMap = function()
	local nMapId = SubWorldIdx2MapCopy(SubWorld)
	for i = 1, getn( %tbUseOnlyInMap ) do		--特殊地图禁用
		if( %tbUseOnlyInMap[i] == nMapId ) then
			return 1
		end
	end
	return 0
end


jinpai_Task=1827;
function main( nItemIdx )
	local TaskValue=GetTask(jinpai_Task);
	local nDate = tonumber(GetLocalDate("%Y%m%d"));
	--if(nDate>20080331) then
	--	Say("令牌过了使用期限，无效了，只能丢掉",0)
	--	return 0;
	--end
	
	--tinhpn 20100803: Patch ReQuest
	if %checkOnlyUseInMap() ~= 1 then
		Msg2Player("不能在我这使用物品.")
		return 1
	end
	
	--tinhpn 20100720: forbid item
	if (ForbidMap() == 1) then
		return 1
	end
	
	if( IsCharged() == 0) then
		Say("真遗憾，只有已充值玩家才能使用.",0);
		return 1; 
	end
	if( GetLevel() <90 ) then
		Say("真遗憾，只有已充值玩家才能使用.",0);
		return 1;
	end
	nDate = tonumber(GetLocalDate("%d"));
	if(nDate ~= GetByte(TaskValue,2) ) then --不是今天
		if( CallBoss(4) == 0) then
			TaskValue=SetByte(TaskValue,2,nDate); --设置金牌日期 第1字节
			SetTask(jinpai_Task,TaskValue);
			return 0;
		else
			return 1;
		end	
	else
		Say("今天已使用1个金牌了！等明天才能继续使用!",0);
		return 1;
	end
	
end

function GetDesc(nItem)

end