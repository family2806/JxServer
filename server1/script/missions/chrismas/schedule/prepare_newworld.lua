Include([[\script\missions\chrismas\ch_head.lua]]);
Include("\\script\\maps\\newworldscript_default.lua")

function OnNewWorld(szParam)
	if (GetGlbValue(GLB_CH_PHASE) ~= 1) then	--ʱ���ѹ�
		Say("<color=yellow>ʥ������<color>: ������˼���������ˣ���ոոտ�ʼ���������ȥ", 0)
		NewWorld(GetTask(TK_LEAVERMAPID), GetTask(TK_LEAVERPOSX), GetTask(TK_LEAVERPOSY))
		return
	end
	
	local nPlayerCount = GetMSPlayerCount(CH_PREPAREMISSIONID, 0);
	if (nPlayerCount >= CH_ALL_MAXPLAYERCOUNT) then
		Talk(1, "", "<color=yellow>ʥ������<color>:�μӻ����̫���ˣ�����´�!");
		NewWorld(GetTask(TK_LEAVERMAPID), GetTask(TK_LEAVERPOSX), GetTask(TK_LEAVERPOSY))
		return
	end;
	
	setplayerreadystate();	--������ҽ�����Ϸ��״̬
	
	AddMSPlayer(CH_PREPAREMISSIONID, 1);
	OnNewWorldDefault(szParam)
end

function OnLeaveWorld(szParam)
	setplayerleaverstate();
	OnLeaveWorldDefault(szParam)
end
