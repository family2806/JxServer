Include([[\script\missions\tong\tong_disciple\head.lua]]);
Include("\\script\\maps\\newworldscript_default.lua")

function OnNewWorld(szParam)
	if (GetGlbValue(GLB_DIS_PHASE) ~= 1) then	--ʱ���ѹ�
		Say("<color=yellow>����ܹ�<color>: �����ź����������ˣ����´λ������!", 0)
		NewWorld(GetTask(TK_LEAVERMAPID), GetTask(TK_LEAVERPOSX), GetTask(TK_LEAVERPOSY))
		return
	end
	
	local nPlayerCount = GetMSPlayerCount(DIS_PREPAREMISSIONID, 0);
	if (nPlayerCount >= DIS_ALL_MAXPLAYERCOUNT) then
		Talk(1, "", "<color=yellow>����ܹ�<color>: �ѹ����������ˣ�����´ΰ�!");
		NewWorld(GetTask(TK_LEAVERMAPID), GetTask(TK_LEAVERPOSX), GetTask(TK_LEAVERPOSY))
		return
	end;
	
	setplayerreadystate();	--������ҽ�����Ϸ��״̬
	
	AddMSPlayer(DIS_PREPAREMISSIONID, 1);
	OnNewWorldDefault(szParam)
end

function OnLeaveWorld(szParam)
	setplayerleaverstate();
	OnLeaveWorldDefault(szParam)
end
