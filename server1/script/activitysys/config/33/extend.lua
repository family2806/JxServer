Include("\\script\\activitysys\\config\\33\\head.lua")
Include("\\script\\activitysys\\config\\33\\variables.lua")
Include("\\script\\lib\\objbuffer_head.lua")

pActivity.tbNpc = {}
pActivity.nPak = curpack()
SeptemperRewardsCityMapID = nil

function SetSeptemperRewardsCityMapID(handle)
	
	local CityMapID = ObjBuffer:PopObject(handle);
	SeptemperRewardsCityMapID = CityMapID;
end
	

--添加活动NPC
function pActivity:AddInitNpc()
	local tbNpcPos = {
		[1] = {37,1749,3076,},
		[2] = {37,1707,3120,},
	}
	local tbNpc = {
		[1] = {
			szName = "国旗台", 
			nLevel = 95,
			nNpcId = 1785,
			nIsboss = 0,
			szScriptPath = "\\script\\activitysys\\npcdailog.lua",
			},
		[2] = {
			szName = "嫦娥", 
			nLevel = 95,
			nNpcId = 1867,
			nIsboss = 0,
			szScriptPath = "\\script\\activitysys\\npcdailog.lua",
			}
	}
	for i=1,getn(tbNpcPos) do
		local nMapId, nPosX, nPosY = unpack(tbNpcPos[i])
		basemission_CallNpc(tbNpc[i], nMapId, nPosX * 32, nPosY * 32)	
	end
end	

function pActivity:HandinString(nComposeCount)
	nComposeCount = nComposeCount or 1
	
	if(self:CheckTask(1, 0,"","==") == 1) then
		AddStatData("jxjiuyue_shangjiaodiyigeshengzi", 1)
	end
	
	if(self:CheckTask(1, 500,"","<") == 1) and 
		(self:CheckTask(1, 500 - nComposeCount,"",">=") == 1) then
		PlayerFunLib:AddExp(5000000,1,"Event_越南国庆","交绳子物品500次")
		tbVngTransLog:Write(%strQK_TranslogFolder, %nQK_PromotionID, "交绳子物品500次", "5000000 exp", 1)
	end
	
	if(self:CheckTask(1, 1000,"","<") == 1)  and 
		(self:CheckTask(1, 1000 - nComposeCount,"",">=") == 1)then
		PlayerFunLib:AddExp(5000000,1,"Event_越南国庆","交绳子物品1000次")
		tbVngTransLog:Write(%strQK_TranslogFolder, %nQK_PromotionID, "交绳子物品1000次", "5000000 exp", 1)
		AddStatData("jxjiuyue_shangjiaoshengzidadaoshangxian", 1)
	end 	
	
	for i = 1, nComposeCount do
		PlayerFunLib:AddExp(1000000,1,"Event_越南国庆","交绳子")
		tbVngTransLog:Write(%strQK_TranslogFolder, %nQK_PromotionID, "交绳子", "1000000 exp", 1)		
	end
end

function pActivity:ConvertFireworks(nComposeCount)
	nComposeCount = nComposeCount or 1
	AddStatData("jxjiuyue_guoqinghuapao", nComposeCount)
end

function pActivity:ConvertMooncake(nComposeCount)
	nComposeCount = nComposeCount or 1
	AddStatData("jxjiuyue_hanyueyuebing", nComposeCount)
end

function pActivity:UseFirworks()
	
	local nTime = tonumber(date("%H"))
	local multiple = 1
	if SeptemperRewardsCityMapID ~= nil and nTime == 20 then
		if PlayerFunLib:CheckInMap(SeptemperRewardsCityMapID) == 1 then
			multiple = 1.1
		else
			multiple = 1
		end
	end		
	
	local tbAwardExp = {
			[1]={nExp_tl=1,nRate = 50.0,nCount = 3000000*multiple,},
			[2]={nExp_tl=1,nRate = 45.0,nCount = 5000000*multiple,},
			[3]={nExp_tl=1,nRate = 4.0,nCount = 10000000*multiple,},
			[4]={nExp_tl=1,nRate = 1.0,nCount = 200000000*multiple,},
		}
		
	local tbAward = {
				{szName="紫莽盔图谱",tbProp={6,1,2714,1,0,0},nCount=1,nRate=0.5},
				{szName="紫莽衣图谱",tbProp={6,1,2715,1,0,0},nCount=1,nRate=0.5},
				{szName="紫莽腰带图谱",tbProp={6,1,2717,1,0,0},nCount=1,nRate=0.5},
				{szName="紫莽护腕图谱",tbProp={6,1,2718,1,0,0},nCount=1,nRate=0.5},
				{szName="紫莽佩图谱",tbProp={6,1,2720,1,0,0},nCount=1,nRate=0.5},
				{szName="紫莽鞋图谱",tbProp={6,1,2716,1,0,0},nCount=1,nRate=0.5},
				{szName="紫莽项链图谱",tbProp={6,1,2719,1,0,0},nCount=1,nRate=0.3},
				{szName="紫莽上戒指图谱",tbProp={6,1,2721,1,0,0},nCount=1,nRate=0.15},
				{szName="紫莽下戒指图谱",tbProp={6,1,2722,1,0,0},nCount=1,nRate=0.15},
				{szName="紫莽器械图谱",tbProp={6,1,2723,1,0,0},nCount=1,nRate=0.15},
				{szName="千年七星草",tbProp={6,1,1675,1,0,0},nCount=1,nRate=0.1},
				{szName="紫莽令",tbProp={6,1,2350,1,0,0},nCount=1,nRate=0.1},
				{szName="混元灵露",tbProp={6,1,2312,1,0,0},nCount=1,nRate=0.4},
				{szName="神行符",tbProp={6,1,1266,1,0,0},nCount=1,nRate=0.1,nExpiredTime=43200},
				{szName="回天再造礼包",tbProp={6,1,2527,1,0,0},nCount=1,nRate=1,nExpiredTime=43200},
				{szName="北斗传功术",tbProp={6,1,1672,1,0,0},nCount=1,nRate=0.3},
				{szName="特别仙草露",tbProp={6,1,1181,1,0,0},nCount=1,nRate=3},
				{szName="天精白驹丸",tbProp={6,1,2183,1,0,0},nCount=1,nRate=0.3,nExpiredTime=20160},
				{szName="特别白驹丸",tbProp={6,1,1157,1,0,0},nCount=1,nRate=0.3,nExpiredTime=20160},
				{szName="杀手锏礼盒",tbProp={6,1,2339,1,0,0},nCount=1,nRate=0.5,nExpiredTime=43200},
				{szName="飞速丸礼包",tbProp={6,1,2520,1,0,0},nCount=1,nRate=3,nExpiredTime=43200},
				{szName="大力丸礼包",tbProp={6,1,2517,1,0,0},nCount=1,nRate=3,nExpiredTime=43200},
				{szName="五行奇石",tbProp={6,1,2125,1,0,0},nCount=1,nRate=26.54},
				{szName="海龙珠",tbProp={6,1,2115,1,0,0},nCount=1,nRate=0.5,nExpiredTime=43200},
				{szName="炎帝令",tbProp={6,1,1617,1,0,0},nCount=1,nRate=0.5,nExpiredTime=43200},
				{szName="宋金招兵礼包",tbProp={6,1,30084,1,0,0},nCount=1,nRate=0.5,nExpiredTime=43200},
				{szName="玉重练",tbProp={6,1,30104,1,0,0},nCount=1,nRate=0.2},
				{szName="飞风惊雷(及时转移)",tbProp={0,3470},nCount=1,nRate=0.1,nQuality = 1,nExpiredTime=20160,},
				{szName="回城符(大) ",tbProp={6,1,1083,1,0,0},nCount=1,nRate=0.1},
				{szName = "经验值", nExp=6000000,nRate=30},
				{szName = "经验值", nExp=9000000,nRate=25},
				{szName="呈祥红包",tbProp={6,1,2104,1,0,0},nCount=1,nRate=0.1},
				{szName="安康红包",tbProp={6,1,2105,1,0,0},nCount=1,nRate=0.1},
				{szName="紫莽上戒之宝",tbProp={6,1,30140,1,0,0},nCount=1,nRate=0.05,nExpiredTime=20111001,tbParam = {2}},
				{szName="紫莽下戒之宝",tbProp={6,1,30140,1,0,0},nCount=1,nRate=0.05,nExpiredTime=20111001,tbParam = {9}},
				{szName="紫莽项链之宝",tbProp={6,1,30140,1,0,0},nCount=1,nRate=0.05,nExpiredTime=20111001,tbParam = {0}},
				{szName="紫莽鞋之宝",tbProp={6,1,30140,1,0,0},nCount=1,nRate=0.07,nExpiredTime=20111001,tbParam = {7}},
				{szName="紫莽佩之宝",tbProp={6,1,30140,1,0,0},nCount=1,nRate=0.06,nExpiredTime=20111001,tbParam = {8}},
				{szName="紫莽护腕之宝",tbProp={6,1,30140,1,0,0},nCount=1,nRate=0.05,nExpiredTime=20111001,tbParam = {3}},
				{szName="紫莽腰带之宝",tbProp={6,1,30140,1,0,0},nCount=1,nRate=0.07,nExpiredTime=20111001,tbParam = {4}},
				{szName="紫莽金盔之宝",tbProp={6,1,30140,1,0,0},nCount=1,nRate=0.05,nExpiredTime=20111001,tbParam = {5}},
				{szName="紫莽发冠之宝",tbProp={6,1,30140,1,0,0},nCount=1,nRate=0.06,nExpiredTime=20111001,tbParam = {1}},
			}		
	if (self:CheckTask(4, 20,"","==") == 1) then
		PlayerFunLib:AddExp(2000000,1,"Event_越南国庆","使用20次国庆烟花")
	elseif (self:CheckTask(4, 40,"","==") == 1) then
		PlayerFunLib:AddExp(4000000,1,"Event_越南国庆","使用40次国庆烟花")
	elseif (self:CheckTask(4, 60,"","==") == 1) then
		PlayerFunLib:AddExp(6000000,1,"Event_越南国庆","使用60次国庆烟花")
	elseif (self:CheckTask(4, 80,"","==") == 1) then
		PlayerFunLib:AddExp(8000000,1,"Event_越南国庆","使用80次国庆烟花")
	elseif (self:CheckTask(4, 100,"","==") == 1) then
		PlayerFunLib:AddExp(10000000,1,"Event_越南国庆","使用100次国庆烟花")
	elseif (self:CheckTask(4, 200,"","==") == 1) then
		PlayerFunLib:AddExp(12000000,1,"Event_越南国庆","使用200次国庆烟花")
	elseif (self:CheckTask(4, 300,"","==") == 1) then
		PlayerFunLib:AddExp(14000000,1,"Event_越南国庆","使用300次国庆烟花")
	elseif (self:CheckTask(4, 400,"","==") == 1) then
		PlayerFunLib:AddExp(16000000,1,"Event_越南国庆","使用400次国庆烟花")
	elseif (self:CheckTask(4, 500,"","==") == 1) then
		PlayerFunLib:AddExp(20000000,1,"Event_越南国庆","使用500次国庆烟花")
		local tb500Award = {szName="紫莽之宝",tbProp={6,1,30140,1,0,0},nExpiredTime = 20111001,tbParam = {10}}
		local tbTranslog = {strFolder = %strQK_TranslogFolder, nPromID = %nQK_PromotionID, nResult = 1}
		tbAwardTemplet:Give(tb500Award, 1, {"Event_越南国庆", "使用次国庆烟花领礼品",tbTranslog})
	elseif (self:CheckTask(4, 600,"","==") == 1) then
		PlayerFunLib:AddExp(20000000,1,"Event_越南国庆","使用600次国庆烟花")
	elseif (self:CheckTask(4, 700,"","==") == 1) then
		PlayerFunLib:AddExp(20000000,1,"Event_越南国庆","使用700次国庆烟花")
	elseif (self:CheckTask(4, 800,"","==") == 1) then
		PlayerFunLib:AddExp(20000000,1,"Event_越南国庆","使用800次国庆烟花")
	elseif (self:CheckTask(4, 900,"","==") == 1) then
		PlayerFunLib:AddExp(20000000,1,"Event_越南国庆","使用900次国庆烟花")
	elseif (self:CheckTask(4, 1000,"","==") == 1) then
		PlayerFunLib:AddExp(25000000,1,"Event_越南国庆","使用1000次国庆烟花")
		local tb1000Award = {szName="紫莽之宝",tbProp={6,1,30140,1,0,0},nExpiredTime = 20111001,tbParam = {10}}
		local tbTranslog = {strFolder = %strQK_TranslogFolder, nPromID = %nQK_PromotionID, nResult = 1}
		tbAwardTemplet:Give(tb1000Award, 1, {"Event_越南国庆", "使用1000次国庆烟花领礼品", tbTranslog})
	elseif (self:CheckTask(4, 1100,"","==") == 1) then
		PlayerFunLib:AddExp(25000000,1,"Event_越南国庆","使用1100次国庆烟花")
	elseif (self:CheckTask(4, 1200,"","==") == 1) then
		PlayerFunLib:AddExp(25000000,1,"Event_越南国庆","使用1200次国庆烟花")
	elseif (self:CheckTask(4, 1300,"","==") == 1) then
		PlayerFunLib:AddExp(25000000,1,"Event_越南国庆","使用1300次国庆烟花")
	elseif (self:CheckTask(4, 1400,"","==") == 1) then
		PlayerFunLib:AddExp(25000000,1,"Event_越南国庆","使用1400次国庆烟花")
	elseif (self:CheckTask(4, 1500,"","==") == 1) then
		PlayerFunLib:AddExp(30000000,1,"Event_越南国庆","使用1500次国庆烟花")
		local tb1500Award = {szName="紫莽之宝",tbProp={6,1,30140,1,0,0},nExpiredTime = 20111001,tbParam = {6}}
		local tbTranslog = {strFolder = %strQK_TranslogFolder, nPromID = %nQK_PromotionID, nResult = 1}
		tbAwardTemplet:Give(tb1500Award, 1, {"Event_越南国庆", "使用1500次国庆烟花领物品", tbTranslog})
	end	
	local tbTranslog = {strFolder = %strQK_TranslogFolder, nPromID = %nQK_PromotionID, nResult = 1}
	tbAwardTemplet:Give(tbAward, 1, {"Event_越南国庆", "使用次国庆烟花领物品", tbTranslog})
	tbAwardTemplet:Give(tbAwardExp, 1, {"", ""})	
	CastSkill(251, 1);
end

function pActivity:UseMooncake()
	local tbAward = {
				{szName="紫莽盔图谱",tbProp={6,1,2714,1,0,0},nCount=1,nRate=0.5},
				{szName="紫莽衣图谱",tbProp={6,1,2715,1,0,0},nCount=1,nRate=0.5},
				{szName="紫莽腰带图谱",tbProp={6,1,2717,1,0,0},nCount=1,nRate=0.5},
				{szName="紫莽护腕图谱",tbProp={6,1,2718,1,0,0},nCount=1,nRate=0.5},
				{szName="紫莽佩图谱",tbProp={6,1,2720,1,0,0},nCount=1,nRate=0.5},
				{szName="紫莽鞋图谱",tbProp={6,1,2716,1,0,0},nCount=1,nRate=0.5},
				{szName="紫莽项链图谱",tbProp={6,1,2719,1,0,0},nCount=1,nRate=0.3},
				{szName="紫莽上戒指图谱",tbProp={6,1,2721,1,0,0},nCount=1,nRate=0.15},
				{szName="紫莽下戒指图谱",tbProp={6,1,2722,1,0,0},nCount=1,nRate=0.15},
				{szName="紫莽器械图谱",tbProp={6,1,2723,1,0,0},nCount=1,nRate=0.15},
				{szName="千年七星草",tbProp={6,1,1675,1,0,0},nCount=1,nRate=0.1},
				{szName="紫莽令",tbProp={6,1,2350,1,0,0},nCount=1,nRate=0.1},
				{szName="混元灵露",tbProp={6,1,2312,1,0,0},nCount=1,nRate=0.4},
				{szName="神行符",tbProp={6,1,1266,1,0,0},nCount=1,nRate=0.1,nExpiredTime=43200},
				{szName="回天再造礼包",tbProp={6,1,2527,1,0,0},nCount=1,nRate=1,nExpiredTime=43200},
				{szName="北斗传功术",tbProp={6,1,1672,1,0,0},nCount=1,nRate=0.3},
				{szName="特别仙草露",tbProp={6,1,1181,1,0,0},nCount=1,nRate=3},
				{szName="天精白驹丸",tbProp={6,1,2183,1,0,0},nCount=1,nRate=0.3,nExpiredTime=20160},
				{szName="特别白驹丸",tbProp={6,1,1157,1,0,0},nCount=1,nRate=0.3,nExpiredTime=20160},
				{szName="杀手锏礼盒",tbProp={6,1,2339,1,0,0},nCount=1,nRate=0.5,nExpiredTime=43200},
				{szName="飞速丸礼包",tbProp={6,1,2520,1,0,0},nCount=1,nRate=3,nExpiredTime=43200},
				{szName="大力丸礼包",tbProp={6,1,2517,1,0,0},nCount=1,nRate=3,nExpiredTime=43200},
				{szName="五行奇石",tbProp={6,1,2125,1,0,0},nCount=1,nRate=26.54},
				{szName="海龙珠",tbProp={6,1,2115,1,0,0},nCount=1,nRate=0.5,nExpiredTime=43200},
				{szName="炎帝令",tbProp={6,1,1617,1,0,0},nCount=1,nRate=0.5,nExpiredTime=43200},
				{szName="宋金招兵礼包",tbProp={6,1,30084,1,0,0},nCount=1,nRate=0.5,nExpiredTime=43200},
				{szName="玉重练",tbProp={6,1,30104,1,0,0},nCount=1,nRate=0.2},
				{szName="飞风惊雷(及时转移)",tbProp={0,3470},nCount=1,nRate=0.1,nQuality = 1,nExpiredTime=20160,},
				{szName="回城符(大) ",tbProp={6,1,1083,1,0,0},nCount=1,nRate=0.1},
				{szName = "经验值", nExp=6000000,nRate=30},
				{szName = "经验值", nExp=9000000,nRate=25},
				{szName="呈祥红包",tbProp={6,1,2104,1,0,0},nCount=1,nRate=0.1},
				{szName="安康红包",tbProp={6,1,2105,1,0,0},nCount=1,nRate=0.1},
				{szName="紫莽上戒之宝",tbProp={6,1,30140,1,0,0},nCount=1,nRate=0.05,nExpiredTime=20111001,tbParam = {2}},
				{szName="紫莽下戒之宝",tbProp={6,1,30140,1,0,0},nCount=1,nRate=0.05,nExpiredTime=20111001,tbParam = {9}},
				{szName="紫莽项链之宝",tbProp={6,1,30140,1,0,0},nCount=1,nRate=0.05,nExpiredTime=20111001,tbParam = {0}},
				{szName="紫莽鞋之宝",tbProp={6,1,30140,1,0,0},nCount=1,nRate=0.07,nExpiredTime=20111001,tbParam = {7}},
				{szName="紫莽佩之宝",tbProp={6,1,30140,1,0,0},nCount=1,nRate=0.06,nExpiredTime=20111001,tbParam = {8}},
				{szName="紫莽护腕之宝",tbProp={6,1,30140,1,0,0},nCount=1,nRate=0.05,nExpiredTime=20111001,tbParam = {3}},
				{szName="紫莽腰带之宝",tbProp={6,1,30140,1,0,0},nCount=1,nRate=0.07,nExpiredTime=20111001,tbParam = {4}},
				{szName="紫莽金盔之宝",tbProp={6,1,30140,1,0,0},nCount=1,nRate=0.05,nExpiredTime=20111001,tbParam = {5}},
				{szName="紫莽发冠之宝",tbProp={6,1,30140,1,0,0},nCount=1,nRate=0.06,nExpiredTime=20111001,tbParam = {1}},
			}	
	local tbTranslog = {strFolder = %strQK_TranslogFolder, nPromID = %nQK_PromotionID, nResult = 1}	
	tbAwardTemplet:Give(tbAward, 1, {"Event_越南国庆", "使用寒月中秋月饼",tbTranslog})	
	PlayerFunLib:AddExp(5000000,1,"","")
end




