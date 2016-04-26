Include("\\script\\dailogsys\\dailogsay.lua")

Include("\\script\\changefeature\\equip_tryon.lua")
tbFeatureNpc = {}


function tbFeatureNpc:SelectType()
	local szTitle = "请选择位置"
	
	
	local tbOpt = {}
	
	for key , value in tbEquipTryOn.tbTemplate do
		tinsert(tbOpt, {key, value.DailogMenu, {value, 1}})
	end
	
	tinsert(tbOpt, {"返回", self.Dialog, {self}})
	tinsert(tbOpt, {"结束对话"})
	
	CreateNewSayEx(szTitle, tbOpt)
end
	
function tbFeatureNpc:Dialog()
	
	local szTitle = "您好，大侠,老夫有什么能帮您的吗？ "
	local tbOpt = 
	{
		{"提前看装备外形", self.SelectType, {self}},
		{"更换装备外形要预付多少?", self.InjectToItem, {self}},
		{"删除目前效应", RestoreOwnFeature},
		{"怎么样更换装备外形?",  self.Explain, {self}},
		{"顺便寄过去"},
	}
	CreateNewSayEx(szTitle, tbOpt)
end

function tbFeatureNpc:Explain()
	local szTitle = "本店可以按照需要制作 '装备外形' 收集够需要的材料，如精炼石及需要更换的装备，带到老夫这里，我将帮你更换想要的外形装备。所以，我只需要帮你更换外形装备，不用更换装备的强弱是吧？."
	local tbOpt = 
	{
		{"返回", self.Dialog, {self}},
		{"结束对话"},
	}
	CreateNewSayEx(szTitle, tbOpt)
end

function tbFeatureNpc:InjectToItem()
	local szTitle = "请选择位置"
	
	
	local tbOpt = {}
	
	for key , value in tbEquipTryOn.tbTemplate do
		tinsert(tbOpt, {key, value.AskFeatureNo, {value}})
	end
	
	tinsert(tbOpt, {"返回", self.Dialog, {self}})
	tinsert(tbOpt, {"结束对话"})
	
	CreateNewSayEx(szTitle, tbOpt)
end

function main()
	return tbFeatureNpc:Dialog()
end
