--双龙洞出口NPC会话脚本


function main()
	local tbDialog =
	{
		--"<desc><npc>你打算让我送你出去吗？",
	  	"离开/return_city",
	  	"一会回来 /no",
	}
	--CreateTaskSay(tbDialog)
	Describe("<color=yellow>战龙洞传送人: <color>你确定要我带你出去吗?",getn(tbDialog), unpack(tbDialog))
end;

function no()
end

function return_city()
	UseTownPortal()--同使用回城符的效果
--	nCityIndex = 2 --回成都
--	if (nCityIndex == 1) then
--		NewWorld(1, 1557, 3112) -- 凤翔		
--	elseif (nCityIndex == 2) then
--		NewWorld(11, 3193, 5192) -- 成都	
--	elseif (nCityIndex == 3) then
--		NewWorld(162, 1669, 3129) -- 大理	
--	elseif (nCityIndex == 4) then
--		NewWorld(37, 1598, 3000) -- 汴京
--	elseif (nCityIndex == 5) then
--		NewWorld(78, 1592, 3377) -- 襄阳
--	elseif (nCityIndex == 6) then
--		NewWorld(80, 1670, 2996) -- 扬州		
--	elseif (nCityIndex == 7) then
--		NewWorld(176, 1603, 2917) -- 临安
--	else
--		Msg2Player("系统出现错误！请找客服人员确认解决问题");
--	end	
end



