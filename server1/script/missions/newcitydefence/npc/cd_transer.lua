----------------------------------------------------------------
--FileName:	transer.lua
--Creater:	firefox
--Date:		2005-
--Comment:	��ĩ�������ս��֮�������
--			���ܣ�ս���ڳ��򣬸�����Ҵ��͵�������
-----------------------------------------------------------------
Include("\\script\\missions\\newcitydefence\\head.lua")
--TASKID_FIRE_ADDR
function main()
	Say("����ս������������֪�Ҿͱ���ȥǰ���ˡ����ˣ�����ʲô����?", 2, "������Ҫ�ºͽ���˵�������غ�Ӫ!/sure2leave", "û�£���ֻ�������./OnCancel" )
end

function sure2leave()
	--bt_getsignpos(camp)
	local mapid = SubWorldIdx2ID( SubWorld )
	if ( mapid == tbDEFENCE_MAPID[1] ) then
		camp = 1;
	else
		camp = 2;
	end
	SetLogoutRV(0);
	SetRevPos(tbDEFENCE_SIGNMAP[camp], random(3))
	NewWorld(bt_getsignpos(camp))
end

function OnCancel()
end