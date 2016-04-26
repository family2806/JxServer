--锦囊事件 物品类

--by zhongchaolong 2008-10-30
-- 需要增加事情在Dailog里增加对话入口
-- 并在事件处理完毕后需要 手动调用 减少使用次数的指令‘
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\lib\\baseclass.lua")
Include("\\script\\task\\system\\task_string.lua");


--新增事件的头文件


Include("\\script\\activitysys\\g_activity.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\task\\killmonster\\killmonster.lua")
if not tbItemJingnianshijian then
	tbItemJingnianshijian = tbBaseClass:new()
end


local nMaxUseCount = 1000 --默认最大使用次数
local nExpiredTime = 20090907



--在这里增加事件对话入口
function tbItemJingnianshijian:Dailog(nItemIndex)
	local szMsg = self.szDescLink.."使用锦囊事件."
	local tbOpt = {}	
	tinsert(tbOpt, "放弃/OnCancel")
	
	Describe(szMsg, getn(tbOpt), tbOpt);
end

function tbItemJingnianshijian:_init()
	self.PARAM_ID_USEDATE	= 1
	self.PARAM_ID_USECOUNT 	= 2
	self.szDescLink			= "<link=image[0,0]:\\spr\\item\\script\\jingniangshijian.spr><link>" --不知道是读取文件信息好还是写死好
end


--如果物品是第一次使用，那么设上使用日期的限制和，最大使用次数
function tbItemJingnianshijian:ItemParamInit(nItemIndex)
	local nUseDate	= GetItemParam(nItemIndex, self.PARAM_ID_USEDATE);
	local nUseCount	= GetItemParam(nItemIndex, self.PARAM_ID_USECOUNT);
	
	if nUseDate == 0 and nUseCount == 0 then
		SetSpecItemParam(nItemIndex, self.PARAM_ID_USEDATE, %nExpiredTime );
		SetSpecItemParam(nItemIndex, self.PARAM_ID_USECOUNT, %nMaxUseCount);
		SyncItem(nItemIndex) --同步客户端
	end
end

--物品使用时
function tbItemJingnianshijian:OnUse(nItemIndex)
	
	self:ItemParamInit(nItemIndex);
	
	if self:CheckItem(nItemIndex) == nil then
		return 0
	end
	self:Dailog(nItemIndex)
	
	
	return 1
end

--检查物品是否过期， 不是自己的，物品耐久
function tbItemJingnianshijian:CheckItem(nItemIndex)
	
	if not nItemIndex  or  nItemIndex <= 0 then
		return nil;
	end
	if  tonumber(GetLocalDate("%Y%m%d")) >= GetItemParam(nItemIndex, 1) then
		Talk(1,"","该物品已过期");
		return nil
	end
	
	
	if IsMyItem(nItemIndex) ~= 1 then
		return 0
	end
	
	local ng, nd, np = GetItemProp(nItemIndex);
	
	if (ng ~= 6 or nd ~= 1 or np ~= 1833) then
		return 0
	end
	
	local nUseCount =  GetItemParam(nItemIndex, self.PARAM_ID_USECOUNT)
	if nUseCount < 1 then --耐久小于 1 删除
		RemoveItemByIndex(nItemIndex)
		Talk(1,"", "该物品已过保质期，变质了.")
		return nil
	end
	return 1
end

--减少使用次数
function tbItemJingnianshijian:ReduceUseCount(nItemIndex)
	if nItemIndex  and nItemIndex > 0 then 
		local ng, nd, np = GetItemProp(nItemIndex);
		
		if (ng == 6 and nd == 1 and np == 1833 and IsMyItem(nItemIndex) == 1) then
		
			local nUseCount =  GetItemParam(nItemIndex, self.PARAM_ID_USECOUNT)
			nUseCount = nUseCount - 1
			SetSpecItemParam(nItemIndex, self.PARAM_ID_USECOUNT, nUseCount)
			SyncItem(nItemIndex) --同步客户端
			if nUseCount < 1 then --用完了就删除
				RemoveItemByIndex(nItemIndex)
			end
		end
		
	end
end


function tbItemJingnianshijian:GetDesc(nItemIndex)
	local nUseDate	= GetItemParam(nItemIndex, self.PARAM_ID_USEDATE);

	local nUseCount	= GetItemParam(nItemIndex, self.PARAM_ID_USECOUNT);
	
	local nDate		= %nExpiredTime
	
	if nUseDate == 0 and nUseCount == 0 then
		nUseCount = %nMaxUseCount
	end
	
	return format("<color=green>使用次数还剩: %d<color>", nUseCount)
end
function OnCancel()
	
end

tbItemJingnianshijian:_init()