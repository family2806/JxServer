-- Į�����;�
-- ���ú��͵�Į����ԭ��ս������
-- Edit: �ӷ���
-- Date: 2007-06-06 19:47
Include("\\script\\maps\\checkmap.lua");

function main()
	local pMapID, pMx, pMy = GetWorldPos();
	if GetFightState()>=1 or (IsCityMap(pMapID)~=1 and IsFreshmanMap(pMapID)~=1 and pMapID ~= 175)  then
		Msg2Player("<color=yellow>Į�����Ͳ�ֻ���ڳ��з�ս���������ִ��Լ���ɽ��ʹ��<color>");
		return 1;
	end;
	--DinhHQ
	--20110407: �ڴ���30����ʹ��Į������
	if pMapID == 957 then
		Msg2Player("<color=yellow>Į�����Ͳ�ֻ���ڳ��з�ս���������ִ��Լ���ɽ��ʹ��<color>");
		return 1;
	end
	local tbPos = {
		{1265,2493},
		{1281,2502},
		{1291,2546},
		{1289,2482},
	};
	local nrand = random(getn(tbPos));
	NewWorld(341, tbPos[nrand][1], tbPos[nrand][2]);
	SetFightState(0);
	SetRevPos(175,1)	--�趨����������Ϊ��ɽ��
	return 0;
end;