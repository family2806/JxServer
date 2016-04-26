Include([[\script\missions\springfestival\festival_head.lua]]);
Include("\\script\\maps\\newworldscript_default.lua")

function OnNewWorld(szParam)
	if (GetGlbValue(GLB_FE_PHASE) ~= 1) then	--ʱ���ѹ�
		Say(FE_SIGNNPCNAME.."�Բ����������ˡ���ոտ�ʼ. ", 0)
		NewWorld(GetTask(TK_FE_LEAVERMAPID), GetTask(TK_FE_LEAVERPOSX), GetTask(TK_FE_LEAVERPOSY));
		return
	end
	
	local nPlayerCount = GetMSPlayerCount(FE_PREPAREMISSIONID, 0);
	if (nPlayerCount >= FE_ALL_MAXPLAYERCOUNT) then
		Say(FE_SIGNNPCNAME.."�μӻ�����ѹ��ˣ���μ��´εİ�!", 0);
		NewWorld(GetTask(TK_FE_LEAVERMAPID), GetTask(TK_FE_LEAVERPOSX), GetTask(TK_FE_LEAVERPOSY));
		return
	end;
	
	festival_setplayertoprepare();	--������ҽ�����Ϸ��״̬
	
	AddMSPlayer(FE_PREPAREMISSIONID, 1);
	OnNewWorldDefault(szParam)
end

function OnLeaveWorld(szParam)
	festival_setplayerleaverstate();
	OnLeaveWorldDefault(szParam)
end
