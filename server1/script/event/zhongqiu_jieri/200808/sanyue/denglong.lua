--zhongchaolong

--����5���ӵĵ���


function main()	--�Ի����
	
	local tbSay = 
	{
		"�������̫Ư����",
		"��������ĵ���̫Ư����",
		"�����͵������ǿ���.",
		"�����������������Һ�����"
	}
	
	Say(tbSay[random(1,getn(tbSay))], 0)
end;

function OnTimer(nNpcIdx, nTimeOut)
	if (nTimeOut == nil or nTimeOut > 0 ) then
		DelNpc(nNpcIdx)
		return 0;
	end;
	DelNpc(nNpcIdx)
end;