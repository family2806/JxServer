--��ɽ��ְ�ܡ�����
-- by��Dan_Deng(2003-09-16)

CurStation = 7
Include("\\script\\global\\station.lua")

function main(sel)
	Say("���������ˣ�Ҫ�������ȥ��?", 4, "�����ĵط�/WayPointFun", "�����ĳ���/StationFun","����ԭ��/TownPortalFun", "����Ҫ/OnCancel")
end;

function  OnCancel()
   Talk(1,"","��Ǯ�ͻ���")
end;
