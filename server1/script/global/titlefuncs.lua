IL("TITLE");
MAX_TITLE_PERPAGE = 5
TASK_ACTIVE_TITLE = 1122

function change_title()
	Say("你需要我给于你哪项帮助？", 3,  "查看或激活已拥有的称号/#title_ShowTitleList(1)", "不激活当前的称号/#title_choose(0)", "算了/OnCancel")
end

function title_ShowTitleList(nPage)
	local tab = Title_GetTitleTab()
	
	if (tab == nil or getn(tab) == 0) then
		Say("你目前并不拥有任何的称号！",0)
		return
	end
	
	local titletab = {};
	local iter = 1
	--非第一页则显示上一页
	if (nPage > 1) then
		titletab[iter] = "上一页/#title_ShowTitleList("..(nPage - 1)..")"
		iter = iter + 1
	end
	
	--如果页数用完的话
	if (getn(tab) <= MAX_TITLE_PERPAGE * nPage) then
		for i = MAX_TITLE_PERPAGE * (nPage - 1) + 1, getn(tab) do 
			titletab[iter] = Title_GetTitleName(tab[i]).."/#title_choose("..tab[i]..")";
			iter = iter + 1
		end
	else
		for i = 1, MAX_TITLE_PERPAGE do 
			tabiter = i + (nPage - 1)*MAX_TITLE_PERPAGE 
			titletab[iter] = Title_GetTitleName(tab[tabiter]).."/#title_choose("..tab[tabiter]..")";
			iter = iter + 1
		end
		titletab[iter] = "下一页/#title_ShowTitleList("..(nPage + 1)..")"
		iter = iter + 1
	end
	
	titletab[iter] = "保持原样/OnCancel"
	iter = iter + 1
	Say("你目前拥有的称号有"..getn(tab).."个，你要选择激活哪个称号?", getn(titletab), titletab);
end

function title_choose(titleid)
	Title_ActiveTitle(titleid)
	SetTask(TASK_ACTIVE_TITLE,titleid)
end

function title_loginactive()
	Title_ActiveTitle(GetTask(TASK_ACTIVE_TITLE))
end;