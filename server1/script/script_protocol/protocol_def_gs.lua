if MODEL_GAMESERVER ~= 1 then
	return
end

Include("\\script\\protocol.lua")
local Def = 
{
	{
		"emSCRIPT_PROTOCOL_ECHO", --协议号枚举
		"",--文件名
		"ScriptProtocol:Echo",--处理函数
		nil, --参数格式定义
	},
	{
		"emSCRIPT_PROTOCOL_EQUIP_RANK",
		"\\script\\misc\\rank\\equip_value_rank.lua",
		"SendRankData",
	},
	{
		"emSCRIPT_PROTOCOL_STORES_REQUEST_ITEM",
		"\\script\\item\\dynamic_shop\\dynamic_shop_gs.lua",
		"DynamicShop:SendItem",
		{OBJTYPE_NUMBER}
	},
	{	-- 客户端申请显示一个表格窗口，类似宋金、七城大战的即时战报
		"emSCRIPT_PROTOCOL_REQUESTTABLE",
		"\\script\\requesttable.lua",
		"RequestTable",
	},
	{
		"emSCRIPT_PROTOCOL_BATTLE",
		"\\script\\missions\\battle\\protocol_gs.lua",
		"proc_protocol",
		{OBJTYPE_NUMBER, OBJTYPE_NUMBER}
	},
	{
		"emSCRIPT_PROTOCOL_BINGO_MACHINE",
		"\\script\\event\\bingo_machine\\bingo_machine_gs.lua",
		"BingoMachine:ProcProtocol",
		{OBJTYPE_STRING, OBJTYPE_NUMBER, OBJTYPE_NUMBER},
	},
	{
		"emSCRIPT_PROTOCOL_BINGO_GET_COIN",
		"\\script\\event\\bingo_machine\\bingo_machine_gs.lua",
		"BingoMachine:GetCoin",
		{OBJTYPE_STRING},
	},
	{
		"emSCRIPT_PROTOCAL_HuoYueDu_Award",
		"\\script\\huoyuedu\\award.lua",
		"tbHuoYueDu:GiveAward",
		{OBJTYPE_NUMBER},
	},
	{
		"emSCRIPT_PROTOCOL_OPEN_CREDITS_SHOP",
		"\\script\\missions\\arena\\npc\\officer.lua",
		"open_credits_shop",
		{},
	},
	{
		"emSCRIPT_PROTOCOL_SIGNUP_AREAN",
		"\\script\\missions\\arena\\protocol.lua",
		"apply_signup",
		{},
	},
	
	{
		"emSCRIPT_PROTOCOL_QIANCHONGLOU",
		"\\script\\missions\\qianchonglou\\challenger.lua",
		"tbPlayerHandle:ProcessProtocol",
		{OBJTYPE_NUMBER, OBJTYPE_TABLE},
		
	},	
}

ScriptProtocol:RegProtocolSet(Def)


function ScriptProtocol:SendData(szEnum, nHandle)
	if (type(self[szEnum]) == "number") then
		SendScriptData(self[szEnum], nHandle)
	end
end