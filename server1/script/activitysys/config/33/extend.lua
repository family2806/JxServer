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
	

--��ӻNPC
function pActivity:AddInitNpc()
	local tbNpcPos = {
		[1] = {37,1749,3076,},
		[2] = {37,1707,3120,},
	}
	local tbNpc = {
		[1] = {
			szName = "����̨", 
			nLevel = 95,
			nNpcId = 1785,
			nIsboss = 0,
			szScriptPath = "\\script\\activitysys\\npcdailog.lua",
			},
		[2] = {
			szName = "�϶�", 
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
		PlayerFunLib:AddExp(5000000,1,"Event_Խ�Ϲ���","��������Ʒ500��")
		tbVngTransLog:Write(%strQK_TranslogFolder, %nQK_PromotionID, "��������Ʒ500��", "5000000 exp", 1)
	end
	
	if(self:CheckTask(1, 1000,"","<") == 1)  and 
		(self:CheckTask(1, 1000 - nComposeCount,"",">=") == 1)then
		PlayerFunLib:AddExp(5000000,1,"Event_Խ�Ϲ���","��������Ʒ1000��")
		tbVngTransLog:Write(%strQK_TranslogFolder, %nQK_PromotionID, "��������Ʒ1000��", "5000000 exp", 1)
		AddStatData("jxjiuyue_shangjiaoshengzidadaoshangxian", 1)
	end 	
	
	for i = 1, nComposeCount do
		PlayerFunLib:AddExp(1000000,1,"Event_Խ�Ϲ���","������")
		tbVngTransLog:Write(%strQK_TranslogFolder, %nQK_PromotionID, "������", "1000000 exp", 1)		
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
				{szName="��ç��ͼ��",tbProp={6,1,2714,1,0,0},nCount=1,nRate=0.5},
				{szName="��ç��ͼ��",tbProp={6,1,2715,1,0,0},nCount=1,nRate=0.5},
				{szName="��ç����ͼ��",tbProp={6,1,2717,1,0,0},nCount=1,nRate=0.5},
				{szName="��ç����ͼ��",tbProp={6,1,2718,1,0,0},nCount=1,nRate=0.5},
				{szName="��ç��ͼ��",tbProp={6,1,2720,1,0,0},nCount=1,nRate=0.5},
				{szName="��çЬͼ��",tbProp={6,1,2716,1,0,0},nCount=1,nRate=0.5},
				{szName="��ç����ͼ��",tbProp={6,1,2719,1,0,0},nCount=1,nRate=0.3},
				{szName="��ç�Ͻ�ָͼ��",tbProp={6,1,2721,1,0,0},nCount=1,nRate=0.15},
				{szName="��ç�½�ָͼ��",tbProp={6,1,2722,1,0,0},nCount=1,nRate=0.15},
				{szName="��ç��еͼ��",tbProp={6,1,2723,1,0,0},nCount=1,nRate=0.15},
				{szName="ǧ�����ǲ�",tbProp={6,1,1675,1,0,0},nCount=1,nRate=0.1},
				{szName="��ç��",tbProp={6,1,2350,1,0,0},nCount=1,nRate=0.1},
				{szName="��Ԫ��¶",tbProp={6,1,2312,1,0,0},nCount=1,nRate=0.4},
				{szName="���з�",tbProp={6,1,1266,1,0,0},nCount=1,nRate=0.1,nExpiredTime=43200},
				{szName="�����������",tbProp={6,1,2527,1,0,0},nCount=1,nRate=1,nExpiredTime=43200},
				{szName="����������",tbProp={6,1,1672,1,0,0},nCount=1,nRate=0.3},
				{szName="�ر��ɲ�¶",tbProp={6,1,1181,1,0,0},nCount=1,nRate=3},
				{szName="�쾫�׾���",tbProp={6,1,2183,1,0,0},nCount=1,nRate=0.3,nExpiredTime=20160},
				{szName="�ر�׾���",tbProp={6,1,1157,1,0,0},nCount=1,nRate=0.3,nExpiredTime=20160},
				{szName="ɱ������",tbProp={6,1,2339,1,0,0},nCount=1,nRate=0.5,nExpiredTime=43200},
				{szName="���������",tbProp={6,1,2520,1,0,0},nCount=1,nRate=3,nExpiredTime=43200},
				{szName="���������",tbProp={6,1,2517,1,0,0},nCount=1,nRate=3,nExpiredTime=43200},
				{szName="������ʯ",tbProp={6,1,2125,1,0,0},nCount=1,nRate=26.54},
				{szName="������",tbProp={6,1,2115,1,0,0},nCount=1,nRate=0.5,nExpiredTime=43200},
				{szName="�׵���",tbProp={6,1,1617,1,0,0},nCount=1,nRate=0.5,nExpiredTime=43200},
				{szName="�ν��б����",tbProp={6,1,30084,1,0,0},nCount=1,nRate=0.5,nExpiredTime=43200},
				{szName="������",tbProp={6,1,30104,1,0,0},nCount=1,nRate=0.2},
				{szName="�ɷ羪��(��ʱת��)",tbProp={0,3470},nCount=1,nRate=0.1,nQuality = 1,nExpiredTime=20160,},
				{szName="�سǷ�(��) ",tbProp={6,1,1083,1,0,0},nCount=1,nRate=0.1},
				{szName = "�i����ֵ", nExp=6000000,nRate=30},
				{szName = "�i����ֵ", nExp=9000000,nRate=25},
				{szName="������",tbProp={6,1,2104,1,0,0},nCount=1,nRate=0.1},
				{szName="�������",tbProp={6,1,2105,1,0,0},nCount=1,nRate=0.1},
				{szName="��ç�Ͻ�֮��",tbProp={6,1,30140,1,0,0},nCount=1,nRate=0.05,nExpiredTime=20111001,tbParam = {2}},
				{szName="��ç�½�֮��",tbProp={6,1,30140,1,0,0},nCount=1,nRate=0.05,nExpiredTime=20111001,tbParam = {9}},
				{szName="��ç����֮��",tbProp={6,1,30140,1,0,0},nCount=1,nRate=0.05,nExpiredTime=20111001,tbParam = {0}},
				{szName="��çЬ֮��",tbProp={6,1,30140,1,0,0},nCount=1,nRate=0.07,nExpiredTime=20111001,tbParam = {7}},
				{szName="��ç��֮��",tbProp={6,1,30140,1,0,0},nCount=1,nRate=0.06,nExpiredTime=20111001,tbParam = {8}},
				{szName="��ç����֮��",tbProp={6,1,30140,1,0,0},nCount=1,nRate=0.05,nExpiredTime=20111001,tbParam = {3}},
				{szName="��ç����֮��",tbProp={6,1,30140,1,0,0},nCount=1,nRate=0.07,nExpiredTime=20111001,tbParam = {4}},
				{szName="��ç���֮��",tbProp={6,1,30140,1,0,0},nCount=1,nRate=0.05,nExpiredTime=20111001,tbParam = {5}},
				{szName="��ç����֮��",tbProp={6,1,30140,1,0,0},nCount=1,nRate=0.06,nExpiredTime=20111001,tbParam = {1}},
			}		
	if (self:CheckTask(4, 20,"","==") == 1) then
		PlayerFunLib:AddExp(2000000,1,"Event_Խ�Ϲ���","ʹ��20�ι����̻�")
	elseif (self:CheckTask(4, 40,"","==") == 1) then
		PlayerFunLib:AddExp(4000000,1,"Event_Խ�Ϲ���","ʹ��40�ι����̻�")
	elseif (self:CheckTask(4, 60,"","==") == 1) then
		PlayerFunLib:AddExp(6000000,1,"Event_Խ�Ϲ���","ʹ��60�ι����̻�")
	elseif (self:CheckTask(4, 80,"","==") == 1) then
		PlayerFunLib:AddExp(8000000,1,"Event_Խ�Ϲ���","ʹ��80�ι����̻�")
	elseif (self:CheckTask(4, 100,"","==") == 1) then
		PlayerFunLib:AddExp(10000000,1,"Event_Խ�Ϲ���","ʹ��100�ι����̻�")
	elseif (self:CheckTask(4, 200,"","==") == 1) then
		PlayerFunLib:AddExp(12000000,1,"Event_Խ�Ϲ���","ʹ��200�ι����̻�")
	elseif (self:CheckTask(4, 300,"","==") == 1) then
		PlayerFunLib:AddExp(14000000,1,"Event_Խ�Ϲ���","ʹ��300�ι����̻�")
	elseif (self:CheckTask(4, 400,"","==") == 1) then
		PlayerFunLib:AddExp(16000000,1,"Event_Խ�Ϲ���","ʹ��400�ι����̻�")
	elseif (self:CheckTask(4, 500,"","==") == 1) then
		PlayerFunLib:AddExp(20000000,1,"Event_Խ�Ϲ���","ʹ��500�ι����̻�")
		local tb500Award = {szName="��ç֮��",tbProp={6,1,30140,1,0,0},nExpiredTime = 20111001,tbParam = {10}}
		local tbTranslog = {strFolder = %strQK_TranslogFolder, nPromID = %nQK_PromotionID, nResult = 1}
		tbAwardTemplet:Give(tb500Award, 1, {"Event_Խ�Ϲ���", "ʹ�ôι����̻�����Ʒ",tbTranslog})
	elseif (self:CheckTask(4, 600,"","==") == 1) then
		PlayerFunLib:AddExp(20000000,1,"Event_Խ�Ϲ���","ʹ��600�ι����̻�")
	elseif (self:CheckTask(4, 700,"","==") == 1) then
		PlayerFunLib:AddExp(20000000,1,"Event_Խ�Ϲ���","ʹ��700�ι����̻�")
	elseif (self:CheckTask(4, 800,"","==") == 1) then
		PlayerFunLib:AddExp(20000000,1,"Event_Խ�Ϲ���","ʹ��800�ι����̻�")
	elseif (self:CheckTask(4, 900,"","==") == 1) then
		PlayerFunLib:AddExp(20000000,1,"Event_Խ�Ϲ���","ʹ��900�ι����̻�")
	elseif (self:CheckTask(4, 1000,"","==") == 1) then
		PlayerFunLib:AddExp(25000000,1,"Event_Խ�Ϲ���","ʹ��1000�ι����̻�")
		local tb1000Award = {szName="��ç֮��",tbProp={6,1,30140,1,0,0},nExpiredTime = 20111001,tbParam = {10}}
		local tbTranslog = {strFolder = %strQK_TranslogFolder, nPromID = %nQK_PromotionID, nResult = 1}
		tbAwardTemplet:Give(tb1000Award, 1, {"Event_Խ�Ϲ���", "ʹ��1000�ι����̻�����Ʒ", tbTranslog})
	elseif (self:CheckTask(4, 1100,"","==") == 1) then
		PlayerFunLib:AddExp(25000000,1,"Event_Խ�Ϲ���","ʹ��1100�ι����̻�")
	elseif (self:CheckTask(4, 1200,"","==") == 1) then
		PlayerFunLib:AddExp(25000000,1,"Event_Խ�Ϲ���","ʹ��1200�ι����̻�")
	elseif (self:CheckTask(4, 1300,"","==") == 1) then
		PlayerFunLib:AddExp(25000000,1,"Event_Խ�Ϲ���","ʹ��1300�ι����̻�")
	elseif (self:CheckTask(4, 1400,"","==") == 1) then
		PlayerFunLib:AddExp(25000000,1,"Event_Խ�Ϲ���","ʹ��1400�ι����̻�")
	elseif (self:CheckTask(4, 1500,"","==") == 1) then
		PlayerFunLib:AddExp(30000000,1,"Event_Խ�Ϲ���","ʹ��1500�ι����̻�")
		local tb1500Award = {szName="��ç֮��",tbProp={6,1,30140,1,0,0},nExpiredTime = 20111001,tbParam = {6}}
		local tbTranslog = {strFolder = %strQK_TranslogFolder, nPromID = %nQK_PromotionID, nResult = 1}
		tbAwardTemplet:Give(tb1500Award, 1, {"Event_Խ�Ϲ���", "ʹ��1500�ι����̻�����Ʒ", tbTranslog})
	end	
	local tbTranslog = {strFolder = %strQK_TranslogFolder, nPromID = %nQK_PromotionID, nResult = 1}
	tbAwardTemplet:Give(tbAward, 1, {"Event_Խ�Ϲ���", "ʹ�ôι����̻�����Ʒ", tbTranslog})
	tbAwardTemplet:Give(tbAwardExp, 1, {"", ""})	
	CastSkill(251, 1);
end

function pActivity:UseMooncake()
	local tbAward = {
				{szName="��ç��ͼ��",tbProp={6,1,2714,1,0,0},nCount=1,nRate=0.5},
				{szName="��ç��ͼ��",tbProp={6,1,2715,1,0,0},nCount=1,nRate=0.5},
				{szName="��ç����ͼ��",tbProp={6,1,2717,1,0,0},nCount=1,nRate=0.5},
				{szName="��ç����ͼ��",tbProp={6,1,2718,1,0,0},nCount=1,nRate=0.5},
				{szName="��ç��ͼ��",tbProp={6,1,2720,1,0,0},nCount=1,nRate=0.5},
				{szName="��çЬͼ��",tbProp={6,1,2716,1,0,0},nCount=1,nRate=0.5},
				{szName="��ç����ͼ��",tbProp={6,1,2719,1,0,0},nCount=1,nRate=0.3},
				{szName="��ç�Ͻ�ָͼ��",tbProp={6,1,2721,1,0,0},nCount=1,nRate=0.15},
				{szName="��ç�½�ָͼ��",tbProp={6,1,2722,1,0,0},nCount=1,nRate=0.15},
				{szName="��ç��еͼ��",tbProp={6,1,2723,1,0,0},nCount=1,nRate=0.15},
				{szName="ǧ�����ǲ�",tbProp={6,1,1675,1,0,0},nCount=1,nRate=0.1},
				{szName="��ç��",tbProp={6,1,2350,1,0,0},nCount=1,nRate=0.1},
				{szName="��Ԫ��¶",tbProp={6,1,2312,1,0,0},nCount=1,nRate=0.4},
				{szName="���з�",tbProp={6,1,1266,1,0,0},nCount=1,nRate=0.1,nExpiredTime=43200},
				{szName="�����������",tbProp={6,1,2527,1,0,0},nCount=1,nRate=1,nExpiredTime=43200},
				{szName="����������",tbProp={6,1,1672,1,0,0},nCount=1,nRate=0.3},
				{szName="�ر��ɲ�¶",tbProp={6,1,1181,1,0,0},nCount=1,nRate=3},
				{szName="�쾫�׾���",tbProp={6,1,2183,1,0,0},nCount=1,nRate=0.3,nExpiredTime=20160},
				{szName="�ر�׾���",tbProp={6,1,1157,1,0,0},nCount=1,nRate=0.3,nExpiredTime=20160},
				{szName="ɱ������",tbProp={6,1,2339,1,0,0},nCount=1,nRate=0.5,nExpiredTime=43200},
				{szName="���������",tbProp={6,1,2520,1,0,0},nCount=1,nRate=3,nExpiredTime=43200},
				{szName="���������",tbProp={6,1,2517,1,0,0},nCount=1,nRate=3,nExpiredTime=43200},
				{szName="������ʯ",tbProp={6,1,2125,1,0,0},nCount=1,nRate=26.54},
				{szName="������",tbProp={6,1,2115,1,0,0},nCount=1,nRate=0.5,nExpiredTime=43200},
				{szName="�׵���",tbProp={6,1,1617,1,0,0},nCount=1,nRate=0.5,nExpiredTime=43200},
				{szName="�ν��б����",tbProp={6,1,30084,1,0,0},nCount=1,nRate=0.5,nExpiredTime=43200},
				{szName="������",tbProp={6,1,30104,1,0,0},nCount=1,nRate=0.2},
				{szName="�ɷ羪��(��ʱת��)",tbProp={0,3470},nCount=1,nRate=0.1,nQuality = 1,nExpiredTime=20160,},
				{szName="�سǷ�(��) ",tbProp={6,1,1083,1,0,0},nCount=1,nRate=0.1},
				{szName = "�i����ֵ", nExp=6000000,nRate=30},
				{szName = "�i����ֵ", nExp=9000000,nRate=25},
				{szName="������",tbProp={6,1,2104,1,0,0},nCount=1,nRate=0.1},
				{szName="�������",tbProp={6,1,2105,1,0,0},nCount=1,nRate=0.1},
				{szName="��ç�Ͻ�֮��",tbProp={6,1,30140,1,0,0},nCount=1,nRate=0.05,nExpiredTime=20111001,tbParam = {2}},
				{szName="��ç�½�֮��",tbProp={6,1,30140,1,0,0},nCount=1,nRate=0.05,nExpiredTime=20111001,tbParam = {9}},
				{szName="��ç����֮��",tbProp={6,1,30140,1,0,0},nCount=1,nRate=0.05,nExpiredTime=20111001,tbParam = {0}},
				{szName="��çЬ֮��",tbProp={6,1,30140,1,0,0},nCount=1,nRate=0.07,nExpiredTime=20111001,tbParam = {7}},
				{szName="��ç��֮��",tbProp={6,1,30140,1,0,0},nCount=1,nRate=0.06,nExpiredTime=20111001,tbParam = {8}},
				{szName="��ç����֮��",tbProp={6,1,30140,1,0,0},nCount=1,nRate=0.05,nExpiredTime=20111001,tbParam = {3}},
				{szName="��ç����֮��",tbProp={6,1,30140,1,0,0},nCount=1,nRate=0.07,nExpiredTime=20111001,tbParam = {4}},
				{szName="��ç���֮��",tbProp={6,1,30140,1,0,0},nCount=1,nRate=0.05,nExpiredTime=20111001,tbParam = {5}},
				{szName="��ç����֮��",tbProp={6,1,30140,1,0,0},nCount=1,nRate=0.06,nExpiredTime=20111001,tbParam = {1}},
			}	
	local tbTranslog = {strFolder = %strQK_TranslogFolder, nPromID = %nQK_PromotionID, nResult = 1}	
	tbAwardTemplet:Give(tbAward, 1, {"Event_Խ�Ϲ���", "ʹ�ú��������±�",tbTranslog})	
	PlayerFunLib:AddExp(5000000,1,"","")
end




