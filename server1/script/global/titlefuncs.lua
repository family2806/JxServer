IL("TITLE");
MAX_TITLE_PERPAGE = 5
TASK_ACTIVE_TITLE = 1122

function change_title()
	Say("Ng­¬i cÇn ta ®Ó cho ng­¬i kia h¹ng trî gióp ? ", 3,  "Tra xĞt hoÆc kİch ho¹t ®· cã danh hiÖu /title_ShowTitleList(1)", "Kh«ng kİch ho¹t tr­íc mÆt ®İch danh hiÖu /title_choose(0)", "Tİnh / chän /OnCancel")
end

function title_ShowTitleList(nPage)
	local tab = Title_GetTitleTab()
	
	if (tab == nil or getn(tab) == 0) then
		Say("Ng­¬i tr­íc m¾t còng kh«ng cã bÊt kú ®İch danh hiÖu ",0)
		return
	end
	
	local titletab = {};
	local iter = 1
	--·ÇµÚÒ»Ò³ÔòÏÔÊ¾ÉÏÒ»Ò³
	if (nPage > 1) then
		titletab[iter] = " trang tr­íc /title_ShowTitleList("..(nPage - 1)..")"
		iter = iter + 1
	end
	
	--Èç¹ûÒ³ÊıÓÃÍêµÄ»°
	if (getn(tab) <= MAX_TITLE_PERPAGE * nPage) then
		for i = MAX_TITLE_PERPAGE * (nPage - 1) + 1, getn(tab) do 
			titletab[iter] = Title_GetTitleName(tab[i]).."/title_choose("..tab[i]..")";
			iter = iter + 1
		end
	else
		for i = 1, MAX_TITLE_PERPAGE do 
			tabiter = i + (nPage - 1)*MAX_TITLE_PERPAGE 
			titletab[iter] = Title_GetTitleName(tab[tabiter]).."/title_choose("..tab[tabiter]..")";
			iter = iter + 1
		end
		titletab[iter] = "ÏÂÒ»Ò³/title_ShowTitleList("..(nPage + 1)..")"
		iter = iter + 1
	end
	
	titletab[iter] = " gi÷ v÷ng nguyªn d¹ng /OnCancel"
	iter = iter + 1
	Say("Ng­¬i tr­íc m¾t cã danh hiÖu cã "..getn(tab).." c¸ , ng­¬i muèn chän kİch ho¹t c¸i nµo danh hiÖu ?", getn(titletab), titletab);
end

function title_choose(titleid)
	Title_ActiveTitle(titleid)
	SetTask(TASK_ACTIVE_TITLE,titleid)
end

function title_loginactive()
	Title_ActiveTitle(GetTask(TASK_ACTIVE_TITLE))
end;