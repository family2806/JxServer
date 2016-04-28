Include("\\script\\event\\vnchristmas2007\\head.lua")
Include("\\script\\task\\system\\task_string.lua")


function xmas2007_getnextgirlname()
	local sznextgirl = ""
	local ntask = GetTask(xmas2007_findgirl_taskID)
	if ntask == 0 then
		sznextgirl = "B╪g Nhi"
	elseif ntask == 1 then
		sznextgirl = "Йng Nhi"
	elseif ntask == 2 then
		sznextgirl = "B筩h Nhi"
	elseif ntask == 3 then
		sznextgirl = "Tuy誸 Nhi"
	end
	return sznextgirl
end
function main()
	--local nidx = GetNpcIdx()

	local tbarytalk = 
	{
		[1]= "<dec><npc>我和各位姐妹已失去联络了，大侠可以帮我找到她们吗？快去先帮我找<color=yellow>B╪g Nhi<color> 可能她正在城内.",
		[2]= "<dec><npc>Th� ra c竎 t� mu閕 ta nh� i hi謕 甶 t譵 ta, nh璶g gi� v蒼 ch璦 t譵 頲 <color=yellow>%s<color> n鱝, l祄 phi襫 i hi謕 v藋!",
		[3]= "<dec><npc>Чi hi謕, ch髇g t玦 v蒼 ch璦 t譵 th蕐 <color=yellow>%s<color> n鱝, phi襫 i hi謕 甶 t譵 m閠 chuy課 n鱝.",
		[4]= "<dec><npc>Xin ch骳 m鮪g, i hi謕  nh薾 頲 ph莕 thng gi� tr�, hi v鋘g l莕 sau s� g苝 l筰",
		[5]= "<dec><npc>Xin ch骳 m鮪g, i hi謕  t譵 頲 ch髇g t玦.",
		[6]= "Nh薾 頲 <color=yellow>%s<color> 甶觤 kinh nghi謒",
		[7]= "<dec><npc>Чi hi謕 n qu� mu閚 r錳,  c� 3 ngi  t譵 th蕐 t玦, l莕 sau n s韒 h琻 nh�.",

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
		arysay[2] = "Л頲!/NoChoice"
		CreateTaskSay(arysay)
		return
	end
	if ntask == 0 then
		local arysay = {}
		arysay[1] = tbarytalk[1]
		arysay[2] = "Л頲!/NoChoice"
		CreateTaskSay(arysay)
		return
	
	elseif ntask == 4 then
		local arysay = {}
		arysay[1] = tbarytalk[4]
		arysay[2] = "Л頲!/NoChoice"
		CreateTaskSay(arysay)		
		return
	end
	if ngirl == 1 then
		if ntask == 1 then
			SetTask(xmas2007_findgirl_taskID,2)
			sznextgirl = xmas2007_getnextgirlname()
			local arysay = {}
			arysay[1] = format(tbarytalk[2],sznextgirl)
			arysay[2] = "Л頲!/NoChoice"
			CreateTaskSay(arysay)
			return
		else
			local arysay = {}
			arysay[1] = format(tbarytalk[3],sznextgirl)
			arysay[2] = " Л頲!/NoChoice"
			CreateTaskSay(arysay)
			return
		end
		
	elseif ngirl == 2 then
		if ntask == 2 then
			SetTask(xmas2007_findgirl_taskID,3)
			sznextgirl = xmas2007_getnextgirlname()
			local arysay = {}
			arysay[1] = format(tbarytalk[2],sznextgirl)
			arysay[2] = "Л頲!/NoChoice"
			CreateTaskSay(arysay)
			return
		else
			local arysay = {}
			arysay[1] = format(tbarytalk[3],sznextgirl)
			arysay[2] = "Л頲!/NoChoice"
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
				xmas2007_sdl_writeLog("T譵 ki誱 thi誹 n� th莕 b�",format("Nh薾 頲 %s 甶觤 kinh nghi謒",xmas2007_findgirl_exp),0)
				xmas2007_findgirl_award()
				local arysay = {}
				arysay[1] = format(tbarytalk[5])
				arysay[2] = "Л頲!/NoChoice"
				CreateTaskSay(arysay)
				return
			else
				local arysay = {}
				arysay[1] = format(tbarytalk[7])
				arysay[2] = "Л頲!/NoChoice"
				CreateTaskSay(arysay)
				return
			end
		else
			local arysay = {}
			arysay[1] = format(tbarytalk[3],sznextgirl)
			arysay[2] = "Л頲!/NoChoice"
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
			Msg2Player(format("Nh薾 頲 <color=yellow>%s<color>",tbitem[3]))
			xmas2007_sdl_writeLog("T譵 ki誱 thi誹 n� th莕 b�",format("Nh薾 頲 trang b� ho祅g kim %s",tbitem[3]))
			return 
		end
	end
end
