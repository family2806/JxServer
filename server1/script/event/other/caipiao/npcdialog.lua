Include("\\script\\event\\other\\caipiao\\head_gs.lua")
Include("\\script\\event\\poster\\head.lua")

function main()
	

	local nDate = tonumber(GetLocalDate("%Y%m%d%H%M"))
	if (nDate >= 201006190000 and nDate <= 201007310000) then
		local tbOpt = {}
		local szTitle = "<#>".."���ʴ���Ҫʲô";
		tinsert(tbOpt, "��Ҫ�콱 Poster/GetDialogPoster")
		tinsert(tbOpt, "�뿪/OnCancel")
		Say(szTitle, getn(tbOpt), tbOpt)
	end

	
	if 201002040000 > nDate or nDate > 201003220000 then
		--return Talk(1, "", "�������.")	
	else
	
		local szTitle = "<npc>".."�����ˣ������ˣ�������λ�������Ϸ����Ե��!";
		
		
		
		local nWeekDay = tbCaiPiao:GetCurAwardWeekDay()
		
		local szKey = ""
		local szKey2 = ""
		if not nWeekDay or nWeekDay <=0 then
			
			szKey = nil
		elseif mod(nWeekDay, 10) == 0 then
			szKey = "ÿ�ܽ���"
			szKey2 = szKey
		else
			szKey = "���"
			szKey2 = "��㽱��"
		end
		
		
		
		local tbOpt = {}
		if szKey then
			local szOpt1 = format("���н����� %s", szKey)
			local szOpt2 = format("�õ� %s", szKey2)	
			tinsert(tbOpt, {szOpt1, tbCaiPiao.QueryResult,{tbCaiPiao, nWeekDay}})
			tinsert(tbOpt, {szOpt2, tbCaiPiao.ApplyGetAward,{tbCaiPiao, nWeekDay}})
			tinsert(tbOpt, {"��ֻ��·��"})
		else
			tinsert(tbOpt, {"���ڻ�û�н�����н��֮�������ɣ�"})
		end
			
		
		CreateNewSayEx(szTitle, tbOpt)
	end
end

