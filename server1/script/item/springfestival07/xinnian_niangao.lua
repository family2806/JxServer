--�������
--p=1342	����ʲ�����	100w����
--p=1343	�𻨰ٹ����	200w����
--p=1344	�����������	500w����
--��������2007-3-6

Include("\\script\\item\\springfestival07\\xinnian_head.lua")

function main(nItemIdx)
	if (isTakeXinNianItem(nItemIdx) ~= 1) then
		return 1;
	end;
	
	local _, _, np = GetItemProp(nItemIdx);
	local nCurExp = GetTask(TSK_XINNIANNIANGAO_MAXEXP);
	if (nCurExp >= XINNIAN_MAXEXP) then
		Say("Ng��i ch�u kh�ng �t n�m cao , l�i nh�n th�y n�m cao m�t ch�t c�ng kh�ng mu�n �n r�i . ", 0);
		return 1;
	end;
	
	if (np == 1342) then
		nAddExp = 1000000;
	elseif (np == 1343) then
		nAddExp = 2000000;
	elseif (np == 1344) then
		nAddExp = 5000000;
	else
		return 1;
	end;
	
	local szmsg = format("Ng��i thu ���c %d kinh nghi�m tr� gi� ",nAddExp);
	if (nCurExp + nAddExp > XINNIAN_MAXEXP) then
		nAddExp = XINNIAN_MAXEXP - nCurExp;
		szmsg = format("Ng��i thu ���c %d kinh nghi�m tr� gi� , c�ng n�a kh�ng mu�n �n n�m cao li�u ",nAddExp);
	end;
	
	AddOwnExp(nAddExp);
	SetTask(TSK_XINNIANNIANGAO_MAXEXP, nCurExp+nAddExp);
	Msg2Player(szmsg);
	WriteLog(format("[ n�m m�i n�m cao ]\t%s\tName:%s\tAccount:%s\t s� d�ng m�t %s ��t ���c %d kinh nghi�m ",GetLocalDate("%Y-%m-%d %H:%M:%S"), GetName(), GetAccount(), GetItemName(nItemIdx),nAddExp));
end;