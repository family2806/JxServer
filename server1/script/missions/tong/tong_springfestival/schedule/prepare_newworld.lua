Include("\\script\\missions\\tong\\tong_springfestival\\head.lua");
Include("\\script\\maps\\newworldscript_default.lua")

function OnNewWorld(szParam)
	if (GetGlbValue(GLB_SF_PHASE) ~= 1) then	--ʱ���ѹ�
		Say("����ܹ�".."�����ź����������ˣ�����һ�λ��!", 0)
		NewWorld(GetTask(TK_LEAVERMAPID), GetTask(TK_LEAVERPOSX), GetTask(TK_LEAVERPOSY));
		return
	end
	
	local nPlayerCount = GetMSPlayerCount(SF_PREPAREMISSIONID, 0);
	if (nPlayerCount >= SF_ALL_MAXPLAYERCOUNT) then
		Say("����ܹ�".."�μӻ�������ѹ��ˣ����´βμӰ�!", 0);
		NewWorld(GetTask(TK_LEAVERMAPID), GetTask(TK_LEAVERPOSX), GetTask(TK_LEAVERPOSY));
		return
	end;
	
	festival_setplayertoprepare();	--������ҽ�����Ϸ��״̬
	
	AddMSPlayer(SF_PREPAREMISSIONID, 1);
	OnNewWorldDefault(szParam)
end

function OnLeaveWorld(szParam)
	festival_setplayerleaverstate();
	OnLeaveWorldDefault(szParam)
end
