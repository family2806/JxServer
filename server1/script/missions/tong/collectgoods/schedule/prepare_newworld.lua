Include([[\script\missions\tong\collectgoods\head.lua]]);
Include("\\script\\maps\\newworldscript_default.lua")

function OnNewWorld(szParam)
	if (GetGlbValue(GLB_COLLG_PHASE) ~= 1) then	--ʱ���ѹ�
		Say("<color=yellow>����ܹ�<color>: ���ǲ�����˼����·���Ѿ���һЩ�������ˣ��Ժ�Ż����������һ�ΰ�.", 0)
		Msg2Player("����ڽ��У������һ�ΰ�.");
		NewWorld(GetTask(TK_LEAVERMAPID), GetTask(TK_LEAVERPOSX), GetTask(TK_LEAVERPOSY))
		return
	end
	
	local nPlayerCount = GetMSPlayerCount(COLLG_PREPAREMISSIONID, 0);
	if (nPlayerCount >= COLLG_ALL_MAXPLAYERCOUNT) then
		Talk(1, "", "<color=yellow>����ܹ�<color>:�ѹ��̼���������ˣ������һ�ΰ�!");
		NewWorld(GetTask(TK_LEAVERMAPID), GetTask(TK_LEAVERPOSX), GetTask(TK_LEAVERPOSY))
		return
	end;
	
	collg_setplayerreadystate();	--������ҽ�����Ϸ��״̬
	AddMSPlayer(COLLG_PREPAREMISSIONID, 1);
	OnNewWorldDefault(szParam)
end

function OnLeaveWorld(szParam)
	collg_setplayerleaverstate();
	OnLeaveWorldDefault(szParam)
end
