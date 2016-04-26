-- 文件名　：yirongmishu.lua
-- 创建者　：wangjingjun
-- 内容　　：易容秘术 包含多个面具的礼包类物品
-- 创建时间：2011-07-11 09:36:28

Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\dailogsys\\dailogsay.lua")

local tbMask = 
{
	{szName = "白盈盈面具", tbProp = {0,11,496,1,0,0}, nExpiredTime = 48*60},
	{szName = "白城郡主面具", tbProp = {0,11,497,1,0,0}, nExpiredTime = 48*60},
	{szName = "钟灵秀面具", tbProp = {0,11,498,1,0,0}, nExpiredTime = 48*60},
	{szName = "古柏面具", tbProp = {0,11,499,1,0,0}, nExpiredTime = 48*60},
	{szName = "刀双凤面具", tbProp = {0,11,500,1,0,0}, nExpiredTime = 48*60},
	{szName = "道清真人面具", tbProp = {0,11,501,1,0,0}, nExpiredTime = 48*60},
	{szName = "妙如面具", tbProp = {0,11,502,1,0,0}, nExpiredTime = 48*60},
	{szName = "端木睿面具", tbProp = {0,11,503,1,0,0}, nExpiredTime = 48*60},
	{szName = "东子面具", tbProp = {0,11,504,1,0,0}, nExpiredTime = 48*60},
	{szName = "唐不染面具", tbProp = {0,11,505,1,0,0}, nExpiredTime = 48*60},	-- 10
	{szName = "唐神面具", tbProp = {0,11,506,1,0,0}, nExpiredTime = 48*60},
	{szName = "唐天心面具", tbProp = {0,11,507,1,0,0}, nExpiredTime = 48*60},
	{szName = "家律鼻里面具", tbProp = {0,11,508,1,0,0}, nExpiredTime = 48*60},
	{szName = "何玲镖面具", tbProp = {0,11,509,1,0,0}, nExpiredTime = 48*60},
	{szName = "何人我面具", tbProp = {0,11,510,1,0,0}, nExpiredTime = 48*60},
	{szName = "下城面具", tbProp = {0,11,511,1,0,0}, nExpiredTime = 48*60},
	{szName = "白猪面具", tbProp = {0,11,512,1,0,0}, nExpiredTime = 48*60},
	{szName = "梅花鹿面具", tbProp = {0,11,513,1,0,0}, nExpiredTime = 48*60},
	{szName = "玄觉大师面具", tbProp = {0,11,514,1,0,0}, nExpiredTime = 48*60},
	{szName = "蓝灵公子面具", tbProp = {0,11,515,1,0,0}, nExpiredTime = 48*60},	-- 20
	{szName = "兰依依面具", tbProp = {0,11,516,1,0,0}, nExpiredTime = 48*60},
	{szName = "柳飘安面具", tbProp = {0,11,517,1,0,0}, nExpiredTime = 48*60},
	{szName = "柳青青面具", tbProp = {0,11,518,1,0,0}, nExpiredTime = 48*60},
	{szName = "龙十三家面具", tbProp = {0,11,519,1,0,0}, nExpiredTime = 48*60},
	{szName = "孟商良面具", tbProp = {0,11,520,1,0,0}, nExpiredTime = 48*60},
	{szName = "慕容安面具", tbProp = {0,11,521,1,0,0}, nExpiredTime = 48*60},
	{szName = "月瑶瑶面具", tbProp = {0,11,522,1,0,0}, nExpiredTime = 48*60},
	{szName = "片客面具", tbProp = {0,11,523,1,0,0}, nExpiredTime = 48*60},
	{szName = "新年侠客", tbProp = {0,11,524,1,0,0}, nExpiredTime = 48*60},
	{szName = "新年侠女", tbProp = {0,11,525,1,0,0}, nExpiredTime = 48*60},	-- 30
	{szName = "青年海棠面具", tbProp = {0,11,526,1,0,0}, nExpiredTime = 48*60},
	{szName = "成年海棠面具", tbProp = {0,11,527,1,0,0}, nExpiredTime = 48*60},
	{szName = "青年火忍面具", tbProp = {0,11,528,1,0,0}, nExpiredTime = 48*60},
	{szName = "成年火忍面具", tbProp = {0,11,529,1,0,0}, nExpiredTime = 48*60},
	{szName = "青年金丰面具", tbProp = {0,11,530,1,0,0}, nExpiredTime = 48*60},
	{szName = "成年金丰面具", tbProp = {0,11,531,1,0,0}, nExpiredTime = 48*60},
	{szName = "青年雷剑面具", tbProp = {0,11,532,1,0,0}, nExpiredTime = 48*60},
	{szName = "成年雷剑面具", tbProp = {0,11,533,1,0,0}, nExpiredTime = 48*60},
	{szName = "青年笑霜面具", tbProp = {0,11,534,1,0,0}, nExpiredTime = 48*60},
	{szName = "成年笑霜面具", tbProp = {0,11,535,1,0,0}, nExpiredTime = 48*60},	-- 40
	{szName = "清绝师太面具", tbProp = {0,11,536,1,0,0}, nExpiredTime = 48*60},
	{szName = "少年海棠面具", tbProp = {0,11,537,1,0,0}, nExpiredTime = 48*60},
	{szName = "少年火忍面具", tbProp = {0,11,538,1,0,0}, nExpiredTime = 48*60},
	{szName = "少年金丰面具", tbProp = {0,11,539,1,0,0}, nExpiredTime = 48*60},
	{szName = "少年雷剑面具", tbProp = {0,11,540,1,0,0}, nExpiredTime = 48*60},
	{szName = "少年笑霜面具", tbProp = {0,11,541,1,0,0}, nExpiredTime = 48*60},
	{szName = "苏词馨面具", tbProp = {0,11,542,1,0,0}, nExpiredTime = 48*60},
	{szName = "张孙正面具", tbProp = {0,11,543,1,0,0}, nExpiredTime = 48*60},
	{szName = "紫侠面具", tbProp = {0,11,544,1,0,0}, nExpiredTime = 48*60},
	{szName = "全机子面具", tbProp = {0,11,545,1,0,0}, nExpiredTime = 48*60},		-- 50	
	{szName = "亚洲象面具", tbProp = {0,11,546,1,0,0}, nExpiredTime = 48*60},
	{szName = "黄河象面具", tbProp = {0,11,547,1,0,0}, nExpiredTime = 48*60},
	{szName = "王佐面具", tbProp = {0,11,548,1,0,0}, nExpiredTime = 48*60},
	{szName = "安晓债面具", tbProp = {0,11,549,1,0,0}, nExpiredTime = 48*60},
	{szName = "燕朝面具", tbProp = {0,11,550,1,0,0}, nExpiredTime = 48*60},
	{szName = "照一冕面具", tbProp = {0,11,551,1,0,0}, nExpiredTime = 48*60},
	{szName = "妙一面具", tbProp = {0,11,552,1,0,0}, nExpiredTime = 48*60},
	{szName = "段木里面具", tbProp = {0,11,553,1,0,0}, nExpiredTime = 48*60},
	{szName = "唐浩面具", tbProp = {0,11,554,1,0,0}, nExpiredTime = 48*60},
	{szName = "嫦娥面具", tbProp = {0,11,555,1,0,0}, nExpiredTime = 48*60},		-- 60	
	{szName = "凌霄子面具", tbProp = {0,11,556,1,0,0}, nExpiredTime = 48*60},
	{szName = "丽折梅面具", tbProp = {0,11,557,1,0,0}, nExpiredTime = 48*60},
	{szName = "春牛面具", tbProp = {0,11,558,1,0,0}, nExpiredTime = 48*60},
}

function showMask(nIndex, nPlayerIndex, nItemIndex)
	local szTitle = "请选择您需要的面具"
	local tbOpt = {}
	local nMaskCount = getn(%tbMask)
	local nShowIndex = 0
	local nPerCount = 10
	
	nIndex = max(1, nIndex)
	nIndex = min(nIndex, nMaskCount)
	nShowIndex = nIndex
	
	for i=1,nPerCount do
		if nShowIndex > nMaskCount then
			break
		end
		tinsert(tbOpt, {%tbMask[nShowIndex].szName, queren, {nShowIndex, nPlayerIndex, nItemIndex}})
		nShowIndex = nShowIndex + 1	
	end
	
	tinsert(tbOpt, {"上一页", showMask, {nIndex - nPerCount, nPlayerIndex, nItemIndex}})
	if nShowIndex + 1 < nMaskCount then
		tinsert(tbOpt, {"下一页", showMask, {nShowIndex, nPlayerIndex, nItemIndex}})
	end
	tinsert(tbOpt, {"离开", cancel})
	
	CreateNewSayEx(szTitle, tbOpt)
end

function queren(nIndex, nPlayerIndex, nItemIndex)
	local nWidth = 1
	local nHeight = 1
	local nCount = 1
	if CountFreeRoomByWH(nWidth, nHeight, nCount) < nCount then
		Say(format("为确保大侠的财产安全，请留下 %d %dx%d 装备空位", nCount, nWidth, nHeight))
		return 
	end
	
	if CallPlayerFunction(nPlayerIndex, IsMyItem, nItemIndex) ~= 1 then
		return 
	end
	if CallPlayerFunction(nPlayerIndex, RemoveItemByIndex, nItemIndex) ~= 1 then
		WriteLog("放弃易容秘术失败")
		return 
	end
	-- 赠送选定的面具
	CallPlayerFunction(nPlayerIndex, tbAwardTemplet.GiveAwardByList, tbAwardTemplet, %tbMask[nIndex], "使用易容秘术", 1)
end

function main(nItemIndex)
	showMask(1, PlayerIndex, nItemIndex)
	return 1
end