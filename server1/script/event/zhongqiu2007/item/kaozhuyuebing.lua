--中秋2007活动 烤猪月饼
--by 小浪多多
--2007-09-07

Include("\\script\\event\\zhongqiu2007\\head.lua")

function main(sel)
	local ndate = tonumber(GetLocalDate("%y%m%d%H%M"))
	if ndate > 0710312400 then
		Say("烤猪月饼已过期.",0)
		return 0
	end
	if check_level() == 0 then
		Say(tb_content["szlevel"],0)
		return 1
	end
	if check_pay() == 0 then
		Say(tb_content["szpay"],0)
		return 1
	end
	local ncurexp = GetTask(TSK_ZHONGQIU2007)
	if ncurexp >= NZHONGQIU2007_MAX then
		Say("从中秋月饼获得的经验值已超过上限.",0)
		return 1
	end
	local nexp = 3000000
	if (ncurexp + nexp) >= NZHONGQIU2007_MAX then
		nexp = NZHONGQIU2007_MAX - ncurexp
	end
	SetTask(TSK_ZHONGQIU2007,(ncurexp+nexp))
	AddOwnExp(nexp)
	Msg2Player(format("获得 <color=yellow>%s<color> 经验值",nexp))
	WriteLog(format("[zhongqiu2007_kaozhu]\t Date:%s\t Account:%s\t Name:%s\t GetExp:%s",GetLocalDate("%y-%m-%d %H:%M:%S"),GetAccount(),GetName(),nexp));
end