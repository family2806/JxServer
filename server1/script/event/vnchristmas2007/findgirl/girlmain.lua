Include("\\script\\event\\vnchristmas2007\\head.lua")
Include("\\script\\task\\system\\task_string.lua")


function xmas2007_getnextgirlname()
	local sznextgirl = ""
	local ntask = GetTask(xmas2007_findgirl_taskID)
	if ntask == 0 then
		sznextgirl = "����"
	elseif ntask == 1 then
		sznextgirl = "����"
	elseif ntask == 2 then
		sznextgirl = "�׶�"
	elseif ntask == 3 then
		sznextgirl = "ѩ��"
	end
	return sznextgirl
end
function main()
	--local nidx = GetNpcIdx()

	local tbarytalk = 
	{
		[1]= "<dec><npc>�Һ͸�λ������ʧȥ�����ˣ��������԰����ҵ������𣿿�ȥ�Ȱ�����<color=yellow>����<color> ���������ڳ���.",
		[2]= "<dec><npc>ԭ�����ýд��������ң��������ڻ�δ�ҵ�<color=yellow>%s<color>�鷳������!",
		[3]= "<dec><npc>������������Ȼδ�ҵ�<color=yellow>%s<color> �鷳������ȥһ��.",
		[4]= "<dec><npc>��ϲ�������ѻ�ü�ֵ������ϣ���´��ټ�",
		[5]= "<dec><npc>��ϲ���������ҵ�����.",
		[6]= "��� <color=yellow>%s<color> ����ֵ",
		[7]= "<dec><npc>��������̫���ˣ�����3���ҵ��ˣ��´������Ŷ",

	}
	local nidx = GetLastDiagNpc()
	local ngirl = GetNpcParam(nidx,1)
	local szgirl = GetNpcName(nidx)
	local ntask = GetTask(xmas2007_findgirl_taskID)
	local sznextgirl = ""
	sznextgirl = xmas2007_getnextgirlname()
	local ntaskdate = GetTask(xmas2007_findgirl_limit_taskID)
	local ndate = xmas2007_findgirl_returndate()
	if ntaskdate ~= ndate then
		SetTask(xmas2007_findgirl_limit_taskID,ndate)
		SetTask(xmas2007_findgirl_taskID,0)
		local arysay = {}
		arysay[1] = tbarytalk[1]
		arysay[2] = "��!/NoChoice"
		CreateTaskSay(arysay)
		return
	end
	if ntask == 0 then
		local arysay = {}
		arysay[1] = tbarytalk[1]
		arysay[2] = "��!/NoChoice"
		CreateTaskSay(arysay)
		return
	
	elseif ntask == 4 then
		local arysay = {}
		arysay[1] = tbarytalk[4]
		arysay[2] = "��!/NoChoice"
		CreateTaskSay(arysay)		
		return
	end
	if ngirl == 1 then
		if ntask == 1 then
			SetTask(xmas2007_findgirl_taskID,2)
			sznextgirl = xmas2007_getnextgirlname()
			local arysay = {}
			arysay[1] = format(tbarytalk[2],sznextgirl)
			arysay[2] = "��!/NoChoice"
			CreateTaskSay(arysay)
			return
		else
			local arysay = {}
			arysay[1] = format(tbarytalk[3],sznextgirl)
			arysay[2] = " ��!/NoChoice"
			CreateTaskSay(arysay)
			return
		end
		
	elseif ngirl == 2 then
		if ntask == 2 then
			SetTask(xmas2007_findgirl_taskID,3)
			sznextgirl = xmas2007_getnextgirlname()
			local arysay = {}
			arysay[1] = format(tbarytalk[2],sznextgirl)
			arysay[2] = "��!/NoChoice"
			CreateTaskSay(arysay)
			return
		else
			local arysay = {}
			arysay[1] = format(tbarytalk[3],sznextgirl)
			arysay[2] = "��!/NoChoice"
			CreateTaskSay(arysay)
			return
		end
	elseif ngirl == 3 then
		if ntask == 3 then
			
			local nsort = GetNpcParam(nidx,2)
			if nsort < 3 then
				SetTask(xmas2007_findgirl_taskID,4)
				SetNpcParam(nidx,2,(nsort+1))
				AddOwnExp(xmas2007_findgirl_exp)
				Msg2Player(format(tbarytalk[6],xmas2007_findgirl_exp))
				xmas2007_sdl_writeLog("Ѱ��������Ů",format("���%s ����ֵ",xmas2007_findgirl_exp),0)
				xmas2007_findgirl_award()
				local arysay = {}
				arysay[1] = format(tbarytalk[5])
				arysay[2] = "��!/NoChoice"
				CreateTaskSay(arysay)
				return
			else
				local arysay = {}
				arysay[1] = format(tbarytalk[7])
				arysay[2] = "��!/NoChoice"
				CreateTaskSay(arysay)
				return
			end
		else
			local arysay = {}
			arysay[1] = format(tbarytalk[3],sznextgirl)
			arysay[2] = "��!/NoChoice"
			CreateTaskSay(arysay)
			return
		end
	end
	
end

function xmas2007_findgirl_award()
	local nallrate = tb_xmas2007_findgirl_item[1]
	local np = random(1,nallrate)
	local nsum = 0
	for ni=2,getn(tb_xmas2007_findgirl_item) do
		local tbitem = tb_xmas2007_findgirl_item[ni]
		nsum = nsum + tbitem[1]*nallrate
		if nsum > np then
			AddGoldItem(tbitem[2][1],tbitem[2][2])
			Msg2Player(format("���<color=yellow>%s<color>",tbitem[3]))
			xmas2007_sdl_writeLog("Ѱ��������Ů",format("��ûƽ�װ�� %s",tbitem[3]))
			return 
		end
	end
end
