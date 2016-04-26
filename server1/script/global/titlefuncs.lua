IL("TITLE");
MAX_TITLE_PERPAGE = 5
TASK_ACTIVE_TITLE = 1122

function change_title()
	Say("����Ҫ�Ҹ��������������", 3,  "�鿴�򼤻���ӵ�еĳƺ�/#title_ShowTitleList(1)", "�����ǰ�ĳƺ�/#title_choose(0)", "����/OnCancel")
end

function title_ShowTitleList(nPage)
	local tab = Title_GetTitleTab()
	
	if (tab == nil or getn(tab) == 0) then
		Say("��Ŀǰ����ӵ���κεĳƺţ�",0)
		return
	end
	
	local titletab = {};
	local iter = 1
	--�ǵ�һҳ����ʾ��һҳ
	if (nPage > 1) then
		titletab[iter] = "��һҳ/#title_ShowTitleList("..(nPage - 1)..")"
		iter = iter + 1
	end
	
	--���ҳ������Ļ�
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
		titletab[iter] = "��һҳ/#title_ShowTitleList("..(nPage + 1)..")"
		iter = iter + 1
	end
	
	titletab[iter] = "����ԭ��/OnCancel"
	iter = iter + 1
	Say("��Ŀǰӵ�еĳƺ���"..getn(tab).."������Ҫѡ�񼤻��ĸ��ƺ�?", getn(titletab), titletab);
end

function title_choose(titleid)
	Title_ActiveTitle(titleid)
	SetTask(TASK_ACTIVE_TITLE,titleid)
end

function title_loginactive()
	Title_ActiveTitle(GetTask(TASK_ACTIVE_TITLE))
end;