----------------------------------------------------------------
--FileName:	npcdeath.lua
--Creater:	firefox
--Date:		2005-11-25
--Comment:	��ĩ�������ս��֮�������
--			���ܣ��سǷ�ʿ�������������ű�
-----------------------------------------------------------------
Include("\\script\\missions\\newcitydefence\\head.lua")

function OnDeath(nNpcIndex)
	SetMissionV( MS_SHOUCHENGWEIBING, GetMissionV( MS_SHOUCHENGWEIBING ) - 1 )
	if (rank == 2) then
		SetMissionV( MS_SHOUCHENGJIANGJUN, GetMissionV( MS_SHOUCHENGJIANGJUN ) - 1)
		Msg2MSAll(MISSIONID, "�س�ս��:<color=pink>1 ���ҷ��سǽ�������.")
	end
	if (GetMissionV( MS_SHOUCHENGJIANGJUN ) <= 0) then
		Msg2MSAll(MISSIONID, "�س�ս��:<color=pink>�ҷ��سǽ�������.")
		CloseMission( MISSIONID )
	end
end