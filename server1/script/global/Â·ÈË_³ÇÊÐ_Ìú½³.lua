--城市铁匠公共入口
--by 廖志山

if (not __H_CHAT_CITY_SMITH__) then
	__H_CHAT_CITY_SMITH__ = 1;


function main(sel)
	local tab_Content = {
		"我想买一些兵器/tj_default_chat",		--原铁匠功能入口
		"取消/oncancel",
	};
	
	-- 如果活动时间,插入活动对话,以下举例
--	if (isEventDay() ==1) then
--		tinsert(tab_Content,1, "参加活动/onEventMain");
--	end;
	
	if (getn(tab_Content) > 2) then		--如果有活动插入对话

		Say("铁匠：客官找我有什么事吗？", getn(tab_Content), tab_Content);

	else					--没有活动直接进入原对话

		tj_default_chat();

	end;
end;

function oncancel()
end;

end; --// end of __H_CHAT_CITY_SMITH__;