
-- ====================== 文件信息 ======================

-- 剑侠情缘online 对话字符串处理文件
-- Edited by peres
-- 2005/09/01 PM 16:40

-- 只有他和她两个人
-- 他们相爱
-- 她记得
-- 他的手抚摩在她的皮肤上的温情
-- 他的亲吻像鸟群在天空掠过
-- 他在她身体里面的暴戾和放纵
-- 他入睡时候的样子充满纯真
-- 她记得，清晨她醒过来的一刻，他在她的身边
-- 她睁着眼睛，看曙光透过窗帘一点一点地照射进来
-- 她的心里因为幸福而疼痛

-- ======================================================


-- 字符串处理功能库
Include("\\script\\lib\\string.lua");

-- 同伴系统的支持
IncludeLib("PARTNER");

function TaskSay(caption, option)
	local str = caption;
	local strGenKey = strsub(str, 1, 5);
	if strGenKey=="<dec>" then
		str = strsub(str, 6, strlen(str));
		str = SetTaskSayColor(str);  -- 转化关键字
		Describe(str, getn(option), option)
	else
		str = SetTaskSayColor(str);  -- 转化关键字
		Say(str, getn(option), option)
	end;
end;

function TaskSayList(caption, ...)
	TaskSay(caption, arg)
end

-- 用传进来的文字构造一段对话数组并执行
function CreateTaskSay(tb)
	local option = {}
	for i = 2, getn(tb) do
		tinsert(option, tb[i])
	end
	TaskSay(tb[1], option)
end;

KEY_TASKSAY = {
	key_left 	= "{{",					-- "<color=yellow>" 简化标识
	key_right	= "}}",					-- "<color>" 简化标识
	key_sex		= "<sex>",				-- 性别标识
	key_pan		= "<pan>",				-- 同伴图像连接标识
	key_npc		= "<npc>",				-- 对话人物 NPC 的图像和姓名连接标识
	txt_left	= "<color=yellow>",
	txt_right	= "<color>"
}

-- 用于处理文本内的关键字，如：性别标识、同伴图像连接标识、重点颜色标识等。
function SetTaskSayColor(str)
	local strPan = CreatePartnerStringLink()
	local strNpc = CreateNpcStringLink()
	local strSex = GetPlayerSex();
				
	PushString(str)
	-- 处理重点标识颜色
	ReplaceString(KEY_TASKSAY.key_left, KEY_TASKSAY.txt_left)
	ReplaceString(KEY_TASKSAY.key_right, KEY_TASKSAY.txt_right)	
	
	-- 处理性别标识
	ReplaceString(KEY_TASKSAY.key_sex, strSex)
	
	-- 处理同伴标识
	ReplaceString(KEY_TASKSAY.key_pan, strPan)
	
	-- 处理 NPC 名字标识
	ReplaceString(KEY_TASKSAY.key_npc, strNpc)

	return PopString()
end;


-- 用于处理一堆选项的对话函数 Say(""...);
function SelectSay(strSay)
	if (getn(strSay) < 2) then
		return
	end
	local caption = SetTaskSayColor(strSay[1])
	local option = {}
	for i = 2, getn(strSay) do
		tinsert(option, strSay[i])
	end
	Say(caption, getn(option), option)
end;


-- 用于处理一堆选项的 Describe 函数
function SelectDescribe(strSay)
	if (getn(strSay) < 2) then
		return
	end
	local caption = SetTaskSayColor(strSay[1])
	local option = {}
	for i = 2, getn(strSay) do
		tinsert(option, strSay[i])
	end
	Describe(caption, getn(option), option)
end


-- 子函数，用于扩展对话 TALK 函数的功能
function TalkEx(fun,szMsg)

	local num = getn(szMsg);
	local szmsg = "";
	PushString(szmsg)
	for i=1,num-1 do
		-- szmsg = szmsg..format("%q",szMsg[i])..",";
		AppendString(format("%q",szMsg[i]))
		AppendString(",")
	end;
	szmsg = PopString()
	szmsg = szmsg .. format("%q",SetTaskSayColor(szMsg[num]));
	szmsg = "Talk("..num..","..format("%q",fun)..","..szmsg..")";
	dostring(szmsg);
	
end;


-- 构造用以 Describe 面版显示的同伴连接图像
function CreatePartnerStringLink()

local partnerindex,partnerstate = PARTNER_GetCurPartner()       -- 获得召唤出同伴的index,同伴状态为召出或为不召出
local nSettingIdx = PARTNER_GetSettingIdx(partnerindex)         -- 获取同伴的设置 ID

local strLink = "<#><link=image[0,8]:#npcspr:?NPCSID="..tostring(nSettingIdx).."?ACTION="..tostring(0)..">";

	if partnerindex<1 or partnerstate==0 then
		return "";
	end;

	-- 最后返回带同伴姓名的图像连接字符串
	return strLink..PARTNER_GetName(partnerindex).."<link>: ";

end;


-- 构造用以 Describe 面版显示的 NPC 连接图像
function CreateNpcStringLink()

local nNpcIndex = GetLastDiagNpc();  -- 得到最后对话的 NPC INDEX

local nSettingIdx = GetNpcSettingIdx(nNpcIndex);  -- 得到该 NPC INDEX 的 NPCS SETTINGS

local NpcName = GetNpcName(nNpcIndex);  -- 得到此 NPC 的姓名

local strLink = "<#><link=image[0,8]:#npcspr:?NPCSID="..tostring(nSettingIdx).."?ACTION="..tostring(0)..">";


	if nNpcIndex==0 or nNpcIndex==nil then
		return "";
	end;
	
	return strLink.."<<"..NpcName..">><link>: ";

end;


-- 子函数，用以获取玩家的性别，直接返回字符串
function GetPlayerSex()

local mySex -- 用以显示人物性别的字符

	if (GetSex() == 0) then
		mySex = "公子";
	elseif (GetSex() == 1) then
		mySex = "女侠";
	end
	
	return mySex;
	
end;
