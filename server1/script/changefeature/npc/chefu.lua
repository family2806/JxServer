-- ����Ի�
CurStation = 1;
Include("\\script\\global\\station.lua")

function main(sel)
	
	local mapid = SubWorldIdx2ID(SubWorld);
	local tbOpp = {"��·���ĵط�/WayPointFun", "��·���ĳ���/StationFun", };

	tinsert(tbOpp, "����Ҫ/OnCancel");
	Say("����: �뵽����?", getn(tbOpp), tbOpp);
end;

function OnCancel()
end;

