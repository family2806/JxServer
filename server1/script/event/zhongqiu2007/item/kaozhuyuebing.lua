--����2007� �����±�
--by С�˶��
--2007-09-07

Include("\\script\\event\\zhongqiu2007\\head.lua")

function main(sel)
	local ndate = tonumber(GetLocalDate("%y%m%d%H%M"))
	if ndate > 0710312400 then
		Say("�����±��ѹ���.",0)
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
		Say("�i�������±���õľ���ֵ�ѳ�������.",0)
		return 1
	end
	local nexp = 3000000
	if (ncurexp + nexp) >= NZHONGQIU2007_MAX then
		nexp = NZHONGQIU2007_MAX - ncurexp
	end
	SetTask(TSK_ZHONGQIU2007,(ncurexp+nexp))
	AddOwnExp(nexp)
	Msg2Player(format("��� <color=yellow>%s<color> ����ֵ",nexp))
	WriteLog(format("[zhongqiu2007_kaozhu]\t Date:%s\t Account:%s\t Name:%s\t GetExp:%s",GetLocalDate("%y-%m-%d %H:%M:%S"),GetAccount(),GetName(),nexp));
end