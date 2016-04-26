--中原南区 襄阳府 路人16郭员外对话
-- edit by 小浪多多

Include("\\script\\event\\zhongqiu2007\\picture_head.lua")
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")
function main(sel)
	if allbrother_0801_CheckIsDialog(183) == 1 then
		allbrother_0801_FindNpcTaskDialog(183)
		return 0;
	end
	local ndate = tonumber(GetLocalDate("%y%m%d%H%M"))
	if ndate > 0709220000 and ndate < 0710312400 then
		SetTaskTemp(TSK_TEMP,2)
		Describe("郭员外：中秋到了，需要收集够6 <color=red>块仙羽画碎片<color>合成一幅完整的画带来给我，我将送你一个 <color=red>奉月果蓉<color>.",2,"换奉月果蓉月饼/makeItemUI","顺便路过/NoChoice")
	else
		Describe("我已将全部家产捐献给朝廷了，国家有难，匹夫有责。我只是贡献区区之力，与沙场上倒下的战士相比，根本不算什么。",1,"知道了/NoChoice")
	end
end;
