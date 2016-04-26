--美人献花，08妇女节活动
--
--
Include("\\script\\task\\task_addplayerexp.lua")
if tbclassname == nil then
	tbclassname = {}
end
funv_jieri_meiren = tbclassname
funv_jieri_meiren.ndatestart = 8030800
funv_jieri_meiren.ndateend = 8033124
funv_jieri_meiren.ntask = 1878
funv_jieri_meiren.LIMIT_LEVEL = 50
funv_jieri_meiren.tbitem =
{
	meigui = {g=6,d=1,p=1681,szname="玫瑰花束",nexp=0.001,limit=25},
	juhua = {g=6,d=1,p=1682,szname="菊花束",nmanexp=1000000,nmaleexp=1500000,limit=125},
}
function main()
	local ndate = tonumber(GetLocalDate("%y%m%d%H"))
	if ndate < funv_jieri_meiren.ndatestart or ndate > funv_jieri_meiren.ndateend then
		Say("暂时没有活动.",0)
		return
	end
	Say("难道各位大侠想要送我什么花吗?",3,"我想送玫瑰花./#funv_jieri_meiren:zengsongmeigui(1)","我想送菊花./#funv_jieri_meiren:zengsongjuhua(1)","离开/NoChoice")
end

function funv_jieri_meiren:zengsongmeigui(sel)
	if self:check_level() == 0 then
		Say("50级以上充值的人物才可以送花.",0)
		return
	end
	if self:check_pay() == 0 then
		Say("50级以上充值的人物才可以送花.",0)
		return
	end
	local ntaskmeigui = self:getTaskByte(self.ntask,3)
	local tbmeigui = self.tbitem.meigui
	if ntaskmeigui >= tbmeigui.limit then
		Say("每个人物最多只能送给美人25束玫瑰.",0)
		return
	end
	local nmeigui = CalcEquiproomItemCount(tbmeigui.g,tbmeigui.d,tbmeigui.p,-1)
	local nsum = 0
	if nmeigui < 1 then
		Say("你忘记带玫瑰花了.",0)
		return
	end
	ConsumeEquiproomItem(1,tbmeigui.g,tbmeigui.d,tbmeigui.p,-1)
	local n_transcount = ST_GetTransLifeCount();
	local nexp = tl_getUpLevelExp((GetLevel()+1), n_transcount) * tbmeigui.nexp
	AddOwnExp(nexp)
	Msg2Player(format("恭喜, 你获得 <color=yellow>%d<color> 经验",nexp))
	self:addTaskByte(self.ntask,3,1)
end

function funv_jieri_meiren:zengsongjuhua(sel)
	if self:check_level() == 0 then
		Say("50级以上充值的人物才可以送花.",0)
		return
	end
	if self:check_pay() == 0 then
		Say("50级以上充值的人物才可以送花.",0)
		return
	end
	local ntaskjuhua = self:getTaskByte(self.ntask,4)
	local tbjuhua = self.tbitem.juhua
	if ntaskjuhua >= tbjuhua.limit then
		Say("每个人物最多只能送给美人125束菊花.",0)
		return
	end
	local njuhua = CalcEquiproomItemCount(tbjuhua.g,tbjuhua.d,tbjuhua.p,-1)
	local nsum = 0
	if njuhua < 1 then
		Say("你忘记带菊花了.",0)
		return
	end
	ConsumeEquiproomItem(1,tbjuhua.g,tbjuhua.d,tbjuhua.p,-1)
	local nexp = 0
	if GetSex() == 0 then
		nexp = tbjuhua.nmanexp
	else
		nexp = tbjuhua.nmaleexp
	end
	AddOwnExp(nexp)
	Msg2Player(format("恭喜，你得到<color=yellow>%d<color> 经验",nexp))
	self:addTaskByte(self.ntask,4,1)
end


function tbclassname:check_level()		--判断等级
	if GetLevel() < tbclassname.LIMIT_LEVEL then
		return 0
	end 
	return 1
end

function tbclassname:check_pay()		--判断充值用户
	if GetExtPoint(0) <= 0 then
		return 0
	end 
	return 1
end

--任务变量字节获得
function tbclassname:getTaskByte(The_Task_ID,theByte)
	return GetByte(GetTask(The_Task_ID),theByte);
end

--任务变量字节增加
function tbclassname:addTaskByte(The_Task_ID,theByte,Inc_Num)
	SetTask(The_Task_ID,SetByte(GetTask(The_Task_ID),theByte,GetByte(GetTask(The_Task_ID),theByte)+Inc_Num));
end