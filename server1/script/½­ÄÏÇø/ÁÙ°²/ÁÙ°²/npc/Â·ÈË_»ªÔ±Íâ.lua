-- 临安　路人　华员外
-- by：Dan_Deng(2003-09-16)
-- edit by 小浪多多
Include("\\script\\event\\zhongqiu2007\\picture_head.lua")
function main()
	local ndate = tonumber(GetLocalDate("%y%m%d%H%M"))
	if ndate > 0709220000 and ndate < 0710312400 then
		SetTaskTemp(TSK_TEMP,1)
		Describe("华员外: 中秋已到, 只需收集够 6 <color=red>云游画碎片<color> 合成一张完整的带来给我,我将送给大侠1个 <color=red>供月芙蓉<color>.",2,"兑换供月芙蓉月饼/makeItemUI","只是路过/NoChoice")
	else
		if (random(0,1) == 0) then
			Talk(1,"","华员外：我虽不是官场中人，但是朝中大员都与我甚熟，只要有银子，还怕办不成事？")
		else
			Talk(1,"","华员外：人人都想做官，要知道仕途艰险，那及得上我这样逍遥自在！")
		end
	end
end;
