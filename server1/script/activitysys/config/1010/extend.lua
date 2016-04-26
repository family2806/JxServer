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
			[50] 		= "使用2种冰淇淋饼50次",
	},
	["banhsinhnhat"] = {
			[50] 		= "使用武林传奇生日蛋糕50次",
			[100] 	= "使用武林传奇生日蛋糕100次",
			[150] 	= "使用武林传奇生日蛋糕150次",
			[200] 	= "使用武林传奇生日蛋糕200次",
	},
	["banhkem"] = {
			[100] 	= "使用2种冰淇淋饼100次",
			[200] 	= "使用2种冰淇淋饼200次",
			[300] 	= "使用2种冰淇淋饼300次",
			[400] 	= "使用2种冰淇淋饼00次",
			[500] 	= "使用2种冰淇淋饼500次",
			[600] 	= "使用2种冰淇淋饼600 次",
			[700] 	= "使用2种冰淇淋饼700次",
			[800] 	= "使用2种冰淇淋饼800次",
			[900] 	= "使用2种冰淇淋饼900次",
			[1000] 	= "使用2种冰淇淋饼1000次",
			[1100] 	= "使用2种冰淇淋饼1100次",
			[1200] 	= "使用2种冰淇淋饼1200次",
			[1300] 	= "使用2种冰淇淋饼1300次",
			[1400] 	= "使用2种冰淇淋饼1400次",
			[1500] 	= "使用2种冰淇淋饼1500次",
	},		
}
function pActivity:AddInitNpc()
	local tbNpcPos = {
		[1] = {78,1579,3208,},
	}
	local tbNpc = {	
			szName = "做饼师", 
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
--使用水果冰淇淋饼和巧克力冰淇淋饼函
function pActivity:UseCake(nTask,nLimit,nRes)
	local tbLog = %tbItemOtherAward["冰淇淋饼"]
	local nCount = tbVNG_BitTask_Lib:getBitTask(nTask)
	-- 奖励达1500
	if(nCount == nLimit)then
		tbAwardTemplet:Give(%tbAward_Ext["award1500"], 1 , {%EVENT_LOG_TITLE, "使用水果冰淇淋饼和巧克力冰淇淋饼1500"})
	end
	--特别奖励
	if tbLog[nCount] then
		tbAwardTemplet:Give(%tbAward_Ext["awardspecial"], 1 , {%EVENT_LOG_TITLE, tbLog[nCount]})
	end
	--当达到200时的偶然奖励﹜
	if nRes == 1 then
			local tbLog50 =  %tbItemOtherAward["use50banhkem"][nCount] or "使用冰淇淋饼的服务器奖励"
			tbAwardTemplet:Give(%tbAward_Ext["awardnomal"], 1 , {%EVENT_LOG_TITLE, tbLog50})
	end
end
--使用生日礼物函
function pActivity:UseCakeBirthday(nTask,nLimit)
	local tbAward = %tbAward_Ext["awardnomal"];
	local nCount = tbVNG_BitTask_Lib:getBitTask(nTask)
	-- 当达到200时的偶然奖励
	if(nCount == nLimit)then
		tbAwardTemplet:Give(%tbAward_Ext["award200"], 1 , {%EVENT_LOG_TITLE, "使用生日蛋糕达200"})
	end
	--生日蛋糕的服务器奖励
	local tbLogAward =  %tbItemOtherAward["banhsinhnhat"][nCount] or "生日蛋糕的服务器奖励"
	tbAwardTemplet:Give(tbAward, 1 , {%EVENT_LOG_TITLE, tbLogAward} )
end

function pActivity:DropItemRandom(nNpcIndex)
	tbDropTemplet:GiveAwardByList(nNpcIndex, PlayerIndex, %ITEM_DROP_MOTER, "DropMaterialBag", 1)
end
