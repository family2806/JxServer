Include("\\script\\activitysys\\config\\1010\\head.lua")
Include("\\script\\activitysys\\config\\1010\\variables.lua")
Include("\\script\\activitysys\\config\\1010\\award_ext.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\lib\\droptemplet.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\lib\\log.lua")
IL("TONG")

local tbItemOtherAward = {
	["use50banhkem"] = {
			[50] 		= "ʹ��2�ֱ���ܱ�50��",
	},
	["banhsinhnhat"] = {
			[50] 		= "ʹ�����ִ������յ���50��",
			[100] 	= "ʹ�����ִ������յ���100��",
			[150] 	= "ʹ�����ִ������յ���150��",
			[200] 	= "ʹ�����ִ������յ���200��",
	},
	["banhkem"] = {
			[100] 	= "ʹ��2�ֱ���ܱ�100��",
			[200] 	= "ʹ��2�ֱ���ܱ�200��",
			[300] 	= "ʹ��2�ֱ���ܱ�300��",
			[400] 	= "ʹ��2�ֱ���ܱ�00��",
			[500] 	= "ʹ��2�ֱ���ܱ�500��",
			[600] 	= "ʹ��2�ֱ���ܱ�600 ��",
			[700] 	= "ʹ��2�ֱ���ܱ�700��",
			[800] 	= "ʹ��2�ֱ���ܱ�800��",
			[900] 	= "ʹ��2�ֱ���ܱ�900��",
			[1000] 	= "ʹ��2�ֱ���ܱ�1000��",
			[1100] 	= "ʹ��2�ֱ���ܱ�1100��",
			[1200] 	= "ʹ��2�ֱ���ܱ�1200��",
			[1300] 	= "ʹ��2�ֱ���ܱ�1300��",
			[1400] 	= "ʹ��2�ֱ���ܱ�1400��",
			[1500] 	= "ʹ��2�ֱ���ܱ�1500��",
	},		
}
function pActivity:AddInitNpc()
	local tbNpcPos = {
		[1] = {78,1579,3208,},
	}
	local tbNpc = {	
			szName = "����ʦ", 
			nLevel = 95,
			nNpcId = 1888,
			nIsboss = 0,
			szScriptPath = "\\script\\activitysys\\npcdailog.lua",
	}
	for i=1,getn(tbNpcPos) do
		local nMapId, nPosX, nPosY = unpack(tbNpcPos[i])
		basemission_CallNpc(tbNpc, nMapId, nPosX * 32, nPosY * 32)	
	end
end

function pActivity:CheckAwardExp(strFailMessage)
		local tb = {[1] = 201206110000, [2] = 201206112400}
		local nDate = tonumber(GetLocalDate("%Y%m%d%H%M"))
		if nDate >= tb[1] and nDate <= tb[2] then
			return 1
		end 
		Talk(1, "", strFailMessage)
		return nil
end
--ʹ��ˮ������ܱ����ɿ�������ܱ���
function pActivity:UseCake(nTask,nLimit,nRes)
	local tbLog = %tbItemOtherAward["����ܱ�"]
	local nCount = tbVNG_BitTask_Lib:getBitTask(nTask)
	-- ������1500
	if(nCount == nLimit)then
		tbAwardTemplet:Give(%tbAward_Ext["award1500"], 1 , {%EVENT_LOG_TITLE, "ʹ��ˮ������ܱ����ɿ�������ܱ�1500"})
	end
	--�ر���
	if tbLog[nCount] then
		tbAwardTemplet:Give(%tbAward_Ext["awardspecial"], 1 , {%EVENT_LOG_TITLE, tbLog[nCount]})
	end
	--���ﵽ200ʱ��żȻ�����y
	if nRes == 1 then
			local tbLog50 =  %tbItemOtherAward["use50banhkem"][nCount] or "ʹ�ñ���ܱ��ķ���������"
			tbAwardTemplet:Give(%tbAward_Ext["awardnomal"], 1 , {%EVENT_LOG_TITLE, tbLog50})
	end
end
--ʹ���������ﺯ
function pActivity:UseCakeBirthday(nTask,nLimit)
	local tbAward = %tbAward_Ext["awardnomal"];
	local nCount = tbVNG_BitTask_Lib:getBitTask(nTask)
	-- ���ﵽ200ʱ��żȻ����
	if(nCount == nLimit)then
		tbAwardTemplet:Give(%tbAward_Ext["award200"], 1 , {%EVENT_LOG_TITLE, "ʹ�����յ����200"})
	end
	--���յ���ķ���������
	local tbLogAward =  %tbItemOtherAward["banhsinhnhat"][nCount] or "���յ���ķ���������"
	tbAwardTemplet:Give(tbAward, 1 , {%EVENT_LOG_TITLE, tbLogAward} )
end

function pActivity:DropItemRandom(nNpcIndex)
	tbDropTemplet:GiveAwardByList(nNpcIndex, PlayerIndex, %ITEM_DROP_MOTER, "DropMaterialBag", 1)
end
