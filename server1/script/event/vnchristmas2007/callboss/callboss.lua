Include("\\script\\event\\vnchristmas2007\\head.lua")

function xmars2007_callboss(nmapid)
	local worldsub = SubWorldID2Idx(tonumber(nmapid))
	if worldsub < 0 then
		return
	end
	local nmapidw = tonumber(nmapid)
	local tbitem = tb_xmas2007_bossmap[nmapidw]
	local mappos = tbitem[random(1,getn(tbitem))]
	local nidx = xmas2007_callnpc(1,nmapidw,mappos)	--召唤圣诞树	
	SetNpcDeathScript(nidx,"\\script\\event\\vnchristmas2007\\callboss\\npcdead.lua")
	local mappositem = mappos
	mappositem[1] = mappos[1] + 1
	xmas2007_callnpc(2,nmapidw,mappositem)	--召唤阿山
	mappositem[1] = mappos[1] - 1
	xmas2007_callnpc(3,nmapidw,mappos)	--召唤阿雄
	AddGlobalNews(format("[圣诞活动]神秘圣诞树由两个圣诞天神守护已开始出现，快去找找[%s] 看, 打败他们将获得奇珍异宝.",tb_xmas_city[nmapidw]))
end

function xmas2007_callnpc(ni,nmapidw,mappos)
	local worldsub = SubWorldID2Idx(nmapidw)
	local bossid = tb_xmas_boss[ni][1]
	local bosslv = tb_xmas_boss[ni][2]
	local bossseries = tb_xmas_boss[ni][3]
	local bossname = tb_xmas_boss[ni][4]
	if bossseries < 0 or bossseries > 4 then
		bossseries = random(0,4)
	end
	local nidx = AddNpcEx(bossid,bosslv,bossseries,worldsub,mappos[1]*32,mappos[2]*32,1,bossname, 1) 
	if nidx <= 0 then
		print("呼叫Boss活动失败")
	end
	return nidx
end