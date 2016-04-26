Include("\\script\\activitysys\\config\\31\\head.lua")
Include("\\script\\lib\\log.lua")

pActivity.tbNpc = {}

function pActivity:UseBlueBox()
	local tbAward
	tbAward = 
	{
		[1]={szName="鲜奶",tbProp={6,1,2851,1,0,0},nRate = 40.0,nExpiredTime=20110630,},
		[2]={szName="糖精",tbProp={6,1,2852,1,0,0},nRate = 40.0,nExpiredTime=20110630,},
		[3]={szName="面粉",tbProp={6,1,2853,1,0,0},nRate = 20.0,nExpiredTime=20110630,},
	}
	tbAwardTemplet:Give(tbAward, 1, {"武林传奇生日", "SuDungHopQua(Xanh)"})
end

function pActivity:UseRedBox()
	local tbAward
	tbAward = 
	{
		[1]={szName="巧克力",tbProp={6,1,2854,1,0,0},nRate = 30,nExpiredTime=20110630,},
		[2]={szName="黄油",tbProp={6,1,2855,1,0,0},nRate = 40,nExpiredTime=20110630,},
		[3]={szName="冰淇淋",tbProp={6,1,2856,1,0,0},nRate = 30,nExpiredTime=20110630,},
	}
	tbAwardTemplet:Give(tbAward, 1, {"武林传奇生日", "SuDungHopQua(Do)"})
end

function pActivity:GetCake(nCount)
	local tbAward
	tbAward = 
	{
		[1]={szName="小生日蛋糕",tbProp={6,1,2860,1,0,0},nRate = 40.0,nExpiredTime=20110630,},
		[2]={szName="大生日蛋糕",tbProp={6,1,2861,1,0,0},nRate = 60.0,nExpiredTime=20110630,},
	}
	for i = 1, nCount do
		tbAwardTemplet:Give(tbAward, 1, {"武林传奇生日", "合成生日蛋糕"})
	end
end

function pActivity:GetRabbit()
	local rtotal = 10000000
	local rcur=random(1,rtotal)
	local szLuaFile = "\\script\\activitysys\\config\\31\\whiterabbit.lua"
	if (rcur > rtotal/2) then 
		--生成兔子
		local x ,y, worldindex = GetPos()
		local nW, nX, nY =GetWorldPos()
		local nNpcIndex = AddNpc(1799, 1, worldindex, x + 5, y + 5, "兔子")
		SetNpcScript(nNpcIndex, szLuaFile)	
		SetNpcTimer(nNpcIndex, 60*18)
		self.tbNpc[nNpcIndex] = GetName()
		%tbLog:PlayerActionLog("SinhNhatVoLamTruyenKy","兔子出现",  nW, nX, nY)
	end
	
end

function pActivity:UseNaiYouBing()
	print(TSKG_NaiYouBing)
	if(self:CheckTask(1, 500,"","==") == 1) then
		PlayerFunLib:AddExp(5000000,1,"武林传奇生日","使用冰淇淋饼500次")
	elseif (self:CheckTask(1, 1000,"","==") == 1) then
		PlayerFunLib:AddExp(10000000,1,"武林传奇生日","使用冰淇淋饼1000次")
	end
	PlayerFunLib:AddExp(1000000,1,"武林传奇生日","使用冰淇淋饼")
end

function pActivity:UseXiaoDanGao()
	--print(TKSG_XiaoDanGao)
	if(self:CheckTask(2, 20,"","==") == 1) then
		PlayerFunLib:AddExp(2000000,1,"武林传奇生日","使用生日蛋糕(小)20次")
	elseif (self:CheckTask(2, 40,"","==") == 1) then
		PlayerFunLib:AddExp(4000000,1,"武林传奇生日","使用生日蛋糕(小)40次")
	elseif (self:CheckTask(2, 60,"","==") == 1) then
		PlayerFunLib:AddExp(6000000,1,"武林传奇生日","使用生日蛋糕(小)60次")
	elseif (self:CheckTask(2, 100,"","==") == 1) then
		PlayerFunLib:AddExp(10000000,1,"武林传奇生日","使用生日蛋糕(小)100次")
	elseif (self:CheckTask(2, 200,"","==") == 1) then
		PlayerFunLib:AddExp(15000000,1,"武林传奇生日","使用生日蛋糕(小)200次")
	elseif (self:CheckTask(2, 300,"","==") == 1) then
		PlayerFunLib:AddExp(20000000,1,"武林传奇生日","使用生日蛋糕(小)300次")
	elseif (self:CheckTask(2, 400,"","==") == 1) then
		PlayerFunLib:AddExp(20000000,1,"武林传奇生日","使用生日蛋糕(小)400次")
	elseif (self:CheckTask(2, 500,"","==") == 1) then
		PlayerFunLib:AddExp(20000000,1,"武林传奇生日","使用生日蛋糕(小)500次")
	end
	PlayerFunLib:AddExp(4000000,1,"武林传奇生日","使用生日蛋糕(小)")
	self:Vn_GetItemAward("PhanThuongItem使用生日蛋糕(小)")
end
	
function pActivity:UseDaDanGao()

--	if(self:CheckTaskDaily(3, 10,"","==") == 1) then
--		PlayerFunLib:AddExp(10000000,1,"武林传奇生日","使用生日蛋糕(大)10次")
--	end
	PlayerFunLib:AddExp(8000000,1,"武林传奇生日","使用生日蛋糕(大)")
	self:Vn_GetItemAward("PhanThuongItem使用生日蛋糕(大)")
end

function pActivity:UseTeBieDanGao()

	if (self:CheckTask(4, 100,"","==") == 1) then
		PlayerFunLib:AddExp(10000000,1,"武林传奇生日","使用特别生日蛋糕100次")
	elseif (self:CheckTask(4, 200,"","==") == 1) then
		PlayerFunLib:AddExp(20000000,1,"武林传奇生日","使用特别生日蛋糕200次")
	elseif (self:CheckTask(4, 300,"","==") == 1) then
		PlayerFunLib:AddExp(30000000,1,"武林传奇生日","使用特别生日蛋糕300次")
	elseif (self:CheckTask(4, 400,"","==") == 1) then
		PlayerFunLib:AddExp(40000000,1,"武林传奇生日","使用特别生日蛋糕400次")
	end
	PlayerFunLib:AddExp(15000000,1,"武林传奇生日","使用特别生日蛋糕")
	
	self:Vn_GetItemAward("PhanThuongItem使用特别生日蛋糕")	
end

--添加活动NPC
function pActivity:AddInitNpc()
	local tbNpcPos = {
		[1] = {37,1708,3119,},
		[2] = {37,1699,3128,},
	}
	local tbNpc = {
		[1] = {
			szName = "生日蛋糕", 
			nLevel = 95,
			nNpcId = 1797,
			nIsboss = 0,
			szScriptPath = "\\script\\activitysys\\npcdailog.lua",
			},
		[2] = {
			szName = "大人团", 
			nLevel = 95,
			nNpcId = 1798,
			nIsboss = 0,
			szScriptPath = "\\script\\activitysys\\npcdailog.lua",
			}
	}
	for i=1,getn(tbNpcPos) do
		local nMapId, nPosX, nPosY = unpack(tbNpcPos[i])
		basemission_CallNpc(tbNpc[i], nMapId, nPosX * 32, nPosY * 32)	
	end
end	

function pActivity:YDBZ_GiveRedBox(YDBZ_mission_match, nTeam)

	local pidx,nj
	local tbPlayer = {}
	local nPlayerCount = 0
	local nOldPlayer = PlayerIndex
	
	AddStatData("jxshengri_yandibosschanchuhongselihe", 1)
	for nj = 1, 10 do
		idx , pidx = GetNextPlayer(YDBZ_mission_match, idx, nTeam )
		if pidx > 0 then
				PlayerIndex = pidx
				if PlayerFunLib:CheckTotalLevel(150, "", ">=") == 1 then
					nPlayerCount = nPlayerCount + 1
					tbPlayer[nPlayerCount] = {pidx, 1}
				end
		end
		
		if idx == 0 then
			break;
		end
	end 
	
	for i = nPlayerCount + 1, 30 do   
		local p = random(1,nPlayerCount)
		tbPlayer[p][2] = tbPlayer[p][2] + 1
	end	

	for nj = 1, nPlayerCount do
		CallPlayerFunction(tbPlayer[nj][1], PlayerFunLib.GetItem, PlayerFunLib, {tbProp={6,1,2863,1,0,0},nExpiredTime=20110630,}, tbPlayer[nj][2], {"", ""})

			
	end
	
	PlayerIndex = oldplayer		
end

function pActivity:GetFanYu()
	
	local nDate = tonumber(GetLocalDate("%Y12%d"))
	print(nDate)
	
	PlayerFunLib:GetItem({tbProp={0,10,7,1,0,0},nExpiredTime=nDate,},1,"武林传奇生日","换兔毛物品获取翻羽")
end

function pActivity:GiveRedBox(nCount, strMaiDian, strActionLog)
	
	PlayerFunLib:GetItem({tbProp={6,1,2863,1,0,0},nExpiredTime=20110630,}, nCount, "武林传奇生日", strActionLog)
	AddStatData(strMaiDian, 1)
end
	

function pActivity:Vn_GetItemAward(strActionLog)
	local tbItemAward = 
		{
			{szName="紫莽盔图谱",tbProp={6,1,2714,1,0,0},nCount=1,nRate=0.3},
			{szName="紫莽衣图谱",tbProp={6,1,2715,1,0,0},nCount=1,nRate=0.3},
			{szName="紫莽腰带图谱",tbProp={6,1,2717,1,0,0},nCount=1,nRate=0.3},
			{szName="紫莽护腕图谱",tbProp={6,1,2718,1,0,0},nCount=1,nRate=0.3},
			{szName="紫莽佩图谱",tbProp={6,1,2720,1,0,0},nCount=1,nRate=0.3},
			{szName="紫莽鞋图谱",tbProp={6,1,2716,1,0,0},nCount=1,nRate=0.3},
			{szName="紫莽项链图谱",tbProp={6,1,2719,1,0,0},nCount=1,nRate=0.15},
			{szName="紫莽上戒图谱",tbProp={6,1,2721,1,0,0},nCount=1,nRate=0.15},
			{szName="紫莽下戒图谱",tbProp={6,1,2722,1,0,0},nCount=1,nRate=0.15},
			{szName="紫莽器械图谱",tbProp={6,1,2723,1,0,0},nCount=1,nRate=0.15},
			{szName="玄猿令",tbProp={6,1,2351,1,0,0},nCount=1,nRate=0.3},
			{szName="紫莽令",tbProp={6,1,2350,1,0,0},nCount=1,nRate=0.150},
			{szName="行侠令",tbProp={6,1,2566,1,0,0},nCount=3,nRate=2},
			{szName="水贼令牌",tbProp={6,1,2745,1,0,0},nCount=1,nRate=1.5,nExpiredTime=20160},
			{szName="黄金之果",tbProp={6,1,907,1,0,0},nCount=1,nRate=1,nExpiredTime=10080},
			{szName="飞速丸礼包",tbProp={6,1,2520,1,0,0},nCount=1,nRate=1,nExpiredTime=20160},
			{szName="大力丸礼包",tbProp={6,1,2517,1,0,0},nCount=1,nRate=1,nExpiredTime=20160},
			{szName="杀手锏礼包",tbProp={6,1,2339,1,0,0},nCount=1,nRate=1.5,nExpiredTime=20160},
			{szName="宋金招兵礼包",tbProp={6,1,30084,1,0,0},nCount=1,nRate=1,nExpiredTime=20160},
			{szName="漠北传送令",tbProp={6,1,1448,1,0,0},nCount=1,nRate=1,nExpiredTime=20160},
			{szName="海龙珠",tbProp={6,1,2115,1,0,0},nCount=1,nRate=1,nExpiredTime=20160},
			{szName="玄天锦囊",tbProp={6,1,2355,1,0,0},nCount=1,nRate=1,nExpiredTime=20160},
			{szName="特别仙草露",tbProp={6,1,1181,1,0,0},nCount=1,nRate=2.185},
			{szName="百年珍露",tbProp={6,1,2266,1,0,0},nCount=1,nRate=1.5,nExpiredTime=20160},
			{szName="千年珍露",tbProp={6,1,2267,1,0,0},nCount=1,nRate=1,nExpiredTime=20160},
			{szName="万年珍露",tbProp={6,1,2268,1,0,0},nCount=1,nRate=1,nExpiredTime=20160},
			{szName="五行奇石",tbProp={6,1,2125,1,0,0},nCount=1,nRate=25},
			{szName="龙血丸",tbProp={6,1,2117,1,0,0},nCount=1,nRate=1.5,nExpiredTime=20160},
			{szName="天精白驹丸",tbProp={6,1,2183,1,0,0},nCount=1,nRate=1},
			{szName="特别白驹丸",tbProp={6,1,1157,1,0,0},nCount=1,nRate=1},
			{szName="回天再造礼包",tbProp={6,1,2527,1,0,0},nCount=1,nRate=1},
			{szName="玉罐",tbProp={6,1,2311,1,0,0},nCount=1,nRate=1},
			{szName="呈祥红包",tbProp={6,1,2104,1,0,0},nCount=1,nRate=0.17},
			{szName="安康红包",tbProp={6,1,2105,1,0,0},nCount=1,nRate=0.15},
			{szName = "经验值", nExp=4000000,nRate=19.045},
			{szName = "  经验值", nExp=6000000,nRate=16},
			{szName = "经验值", nExp=8000000,nRate=10},
			{szName = "经验值", nExp=10000000,nRate=3},
			{szName="紫金真丹",tbProp={6,1,2263,1,0,0},nCount=1,nRate=0.15,tbParam={2000000000}},
			{szName="玄真丹",tbProp={6,1,1678,1,0,0},nCount=1,nRate=0.15,tbParam={1500000000}},
			{szName="血真丹",tbProp={6,1,1677,1,0,0},nCount=1,nRate=0.15,tbParam={1000000000}},
			{szName="白真丹",tbProp={6,1,1676,1,0,0},nCount=1,nRate=0.15,tbParam={500000000}},
		}
	tbAwardTemplet:Give(tbItemAward, 1, {"武林传奇生日", strActionLog})
end

function pActivity:Vn_CheckPLDTime()
	local nHour = tonumber(GetLocalDate("%H"));
	local tb_sptime = {
		[10] = 1,
		[14] = 1,
		[16] = 1,
		[18] = 1,
		[20] = 1,
	};
	if (tb_sptime[nHour] and tb_sptime[nHour] == 1) then
		return 1
	else
		return nil
	end
end

function pActivity:Vn_AwardOnSJMatchCount()
	PlayerFunLib:AddTaskDaily(2725, 1)
	local nSJDailyMatchCount = PlayerFunLib:GetTaskDailyCount(2725)
	if nSJDailyMatchCount <= 0 or nSJDailyMatchCount > 2 then
		return
	end
	local nAwardCount = 0
	local strAction = ""
	if nSJDailyMatchCount == 1 then
		nAwardCount = 10
		strAction = "HoanThanhTranTKDauTien"
	elseif nSJDailyMatchCount == 2 then
		nAwardCount = 20
		strAction = "HoanThanhTranTKThuHai"
	end
	PlayerFunLib:GetItem({tbProp={6,1,2863,1,0,0},nExpiredTime=20110630,},nAwardCount,"武林传奇生日",strAction)
end

function pActivity:Vn_AwardOnCOTMatchCount()
	PlayerFunLib:AddTaskDaily(2726, 1)
	local nCOTDailyMatchCount = PlayerFunLib:GetTaskDailyCount(2726)
	if nCOTDailyMatchCount <= 0 or nCOTDailyMatchCount > 3 then
		return
	end	
	local nAwardCount = 0
	local strAction = ""
	if nCOTDailyMatchCount == 1 then
		nAwardCount = 5
		strAction = "完成第一次闯关"
	elseif nCOTDailyMatchCount == 2 then
		nAwardCount = 10
		strAction = "完成第二次闯关"
	elseif nCOTDailyMatchCount == 3 then
		nAwardCount = 15
		strAction = "完成第三次闯关"
	end
	PlayerFunLib:GetItem({tbProp={6,1,2863,1,0,0},nExpiredTime=20110630,},nAwardCount,"武林传奇生日",strAction)
end
