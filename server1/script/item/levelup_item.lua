-- FILE_LEVEL = "\\settings\\npc\\player\\level_exp.txt"
Include("\\script\\lib\\gb_modulefuncs.lua")
Include("\\script\\task\\task_addplayerexp.lua")  --������ۼӾ���Ĺ�������

TV_LAST_APPLY_TIME = 1571 -- �ϴ����봫��ʱ��
TV_CHUANGONG_TIMES = 1572 -- �Ѵ����Ĵ���
TV_CHUANGONG_EAT = 1573 --ʹ�ô������Ĵ���

IncludeLib("FILESYS")
IncludeLib("LEAGUE")
IncludeLib("SETTING")
tabLevelRate = 
{
{100,119,95},--100��120������������Ϊ95%
{120,149,90},
{150,160,80},
}


function GetDesc(nItem)
	local nEndLevel = GetItemParam(nItem, 1);
	local nP2 = GetItemParam(nItem,2);
	local nP3 = GetItemParam(nItem,3);
	local nP4 = GetItemParam(nItem,4);
	local nRestExp = nP4
	nRestExp = SetByte(nRestExp, 3, GetByte(nP3,1))
	nRestExp = SetByte(nRestExp, 4, GetByte(nP3,2))
	nLevelFullExp = tl_getUpLevelExp(nEndLevel+ 1)
	local fPerc = format("%.2f", (nEndLevel)+(nRestExp/nLevelFullExp) )
	local str = "�ɵ��ȼ�:"..fPerc.."\n ����һλ<color=yellow>"..nEndLevel.."��<color>�ľ���������ȫ���书���ɵ��ɵ�������10����������ú���������ô�������㣡";
	return "�Բ��𣬸���Ʒ����ʹ��";
end

function main(nItem)
	if (gb_GetModule("Ԫ��") ~= 1) then
		Say("�Բ��𣬴��������ѹرգ��ٿ�����ʱ���뵽��ҳ����Ϣ!", 0)
		return 1
	end
	if (ST_IsTransLife() == 1 and GetLevel() < 80) then
		Say("ѧ��<����������-�ķ���> ����ʹ��Ԫ��.", 0);
		return 1
	end;
	local nEndLevel = GetItemParam(nItem, 1);
	local nP2 = GetItemParam(nItem,2);
	local nNameId = GetItemParam(nItem,5)
	if (GetLevel() > 10 or GetLastFactionNumber() ~= -1) then
		Say("�Բ�����ȼ�����10�������������ɣ����ܷ���Ԫ�񵤣�",0) 
		return 1
	elseif (LG_GetLeagueObjByRole(1,GetName())  ~= 0) then
		Say("�Բ�����ʦͽ��ϵ����Ҳ��ܷ���Ԫ�񵤣�",0)
		return 1
	end
	local nowday = tonumber(date("%y%m%d"))
	WriteLog("[����]��"..nowday.." Acc:"..GetAccount().."Role:"..GetName().." ʹ��Ԫ�񵤳ɹ���Item: Level:"..nEndLevel.." Exp:"..nP2.." ItemParam5:"..nNameId)
	server_main(nEndLevel, nP2)
end
--Itemparam1 Դ��ҽ���ǰ�ĵȼ�
--ItemParam2 Դ��ҽ���ǰ�ľ���
--ItemParam3 Դ��ҽ���ǰ��ʣ�ھ����Word
--ItemParam4 Դ��ҽ���ǰ��ʣ�ھ����Word

function client_main(nEndLevel, nRestExp)
	if (nEndLevel < 80 or nEndLevel > 200) then
		return 
	end
	if (nRestExp < 0) then
		nRestExp = 0
	end
	
	local str = ""
	local testlevel = 10;
	local testexp = 0;
	if (GetLevel() <= 10) then
		testlevel = GetLevel();
		testexp = GetExp();
		level, restexp = exp_clt_levelup(nEndLevel, GetLevel(), GetExp(), nRestExp)
		local fullexp = tl_getUpLevelExp(level+1) --���ȼ�������Ҫ�ľ������ֵ
		local nPerc = floor((restexp/fullexp)*100)
		str = "\n<color=yellow>�������ú󣬿�������"..level.."����ʣ"..nPerc.."%�ľ���<color>";
	else
		level, restexp = exp_clt_levelup(nEndLevel, 10, 0, nRestExp)
		local fullexp = tl_getUpLevelExp(level+1) --���ȼ�������Ҫ�ľ������ֵ
		local nPerc = floor((restexp/fullexp)*100)
		str = "\n<color=yellow> 10�������������"..level.."����ʣ"..nPerc.."%�ľ���<color> ";
	end
	return str
end

function gw_item(level,restexp)
	
	nIt = AddItem(6,1,12,1,0,0,0)
	SetItemMagicLevel(nIt, 1, level)
	SetItemMagicLevel(nIt, 2, restexp)

	m1 = GetByte(restexp, 3)
	m2 = GetByte(restexp, 4)
	m = m1
	m = SetByte(m1, 2, m2)
	
	n1 = SetByte(restexp, 3,0)
	n =  SetByte(n1, 4, 0)

	SetItemMagicLevel(nIt, 3, m)
	SetItemMagicLevel(nIt, 4, n)
	print(m,n)
	SyncItem(nIt)
end

function server_main(level,exp)
	exp_svr_levelup(level,exp)
end

function exp_getRate(endlevel)
	local nRate = 0
	for j = 1, getn(tabLevelRate) do 
		if (endlevel >= tabLevelRate[j][1] and endlevel <= tabLevelRate[j][2] ) then
			nRate = tabLevelRate[j][3]
			return nRate
		end
	end
	return nRate
end

function exp_clt_levelup(endlevel, nowlevel, nowrestexp, restexp)
	if (endlevel > 200) then
		return
	end
	
	local lExp = 0;
	local nRate = exp_getRate(endlevel)
	
	if (nRate == 0) then
		return
	end
	-- LLG_ALLINONE_TODO_20070802
	local nleveladd = 80
	for j = 1, getn(tabLevelRate) do 
		if (endlevel >= tabLevelRate[j][1]) then
			nRate = tabLevelRate[j][3]
			local nlevelend = tabLevelRate[j][2]
			
			if ( tabLevelRate[j][2] >= (endlevel - 1) ) then
				nlevelend = endlevel - 1
			else
				nlevelend = tabLevelRate[j][2]
			end
			
			for i = nleveladd, nlevelend  do 
				--print("-----:add level:["..i.."->"..(i+1).."] exp:"..tonumber(GetTabFileData(FILE_LEVEL, i + 1, 2)).." nRate:"..nRate)
				lExp = floor(tl_getUpLevelExp(i + 1) * nRate / 100)
				nowlevel, nowrestexp = exp_addexp(nowrestexp, lExp, nowlevel)	
			end
			nleveladd = nlevelend + 1
		else
			break
		end
	end
	
	nowlevel, nowrestexp = exp_addexp(nowrestexp, restexp * nRate / 100, nowlevel)		
	return nowlevel, nowrestexp
end

function exp_svr_levelup(endlevel, restexp)
	if (endlevel > 200) then
		return
	end

	local lExp = 0;
	
	local nRate = exp_getRate(endlevel)
	if (nRate == 0) then
		return
	end
	-- LLG_ALLINONE_TODO_20070802
	local nleveladd = 80
	for j = 1, getn(tabLevelRate) do 
		if (endlevel >= tabLevelRate[j][1]) then
			nRate = tabLevelRate[j][3]
			local nlevelend = tabLevelRate[j][2]
			
			if ( tabLevelRate[j][2] >= (endlevel - 1) ) then
				nlevelend = endlevel - 1
			else
				nlevelend = tabLevelRate[j][2]
			end
			
			for i = nleveladd, nlevelend  do 
				--print("-----:add level:["..i.."->"..(i+1).."] exp:"..tonumber(GetTabFileData(FILE_LEVEL, i + 1, 2)).." nRate:"..nRate)
				lExp = floor(tl_getUpLevelExp(i + 1, 2)* nRate / 100)
				nowlevel, nowrestexp = exp_svr_addexp(lExp)	
			end
			nleveladd = nlevelend + 1
		else
			break
		end
	end
	
	exp_svr_addexp(restexp * nRate / 100)
	
	return nowlevel, nowrestexp
end

function exp_addexp(curexp, n_exp, curlel)--��ǰ׼����������ҵľ��顢��Ҫ���ӵľ��顢��ǰ�ĵȼ�;����ֵΪ�����ĵȼ�����������һ����ʣ�ľ���
	--print("addexp "..curexp..":"..n_exp)
	
	while( n_exp > 0 ) do
		local fullexp = tl_getUpLevelExp(curlel+1) --���ȼ�������Ҫ�ľ������ֵ
		
		local needexp = fullexp - curexp --ʵ����Ҫ�ľ���ֵ
	--	print(curexp .."/"..fullexp..":+"..n_exp)
		
		if (needexp <= n_exp) then --����㹻������
			curlel= curlel + 1           --����
			n_exp = n_exp - needexp	    --���㻹ʣ���پ���
			curexp = 0
	--		print("levelup:"..curlel)
		else
		   	return curlel , curexp + n_exp
		end
	end

	return curlel , curexp + n_exp 
	
end

function exp_svr_addexp(n_exp)
	tl_addPlayerExp(n_exp)
end



---------------------------------------------------------------------------------------
function GetTabFileHeight(mapfile)
	if (TabFile_Load(mapfile, mapfile) == 0) then
		print("Load TabFileError!"..mapfile);
		return 0
	end
	return TabFile_GetRowCount(mapfile)
end;

function GetTabFileData(mapfile, row, col)
	if (TabFile_Load(mapfile, mapfile) == 0) then
		print("Load TabFile Error!"..mapfile)
		return 0
	else
		return tonumber(TabFile_GetCell(mapfile, row, col))
	end
end


