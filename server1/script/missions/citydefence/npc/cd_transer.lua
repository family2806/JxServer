----------------------------------------------------------------
--FileName:	transer.lua
--Creater:	firefox
--Date:		2005-
--Comment:	��ĩ�������ս��֮�������
--			���ܣ�ս���ڳ��򣬸�����Ҵ��͵�������
-----------------------------------------------------------------
Include("\\script\\missions\\citydefence\\head.lua")
--TASKID_FIRE_ADDR
function main()
	Say("����:ս�Ƽ��ң���֪���Ҿͱ���ȥǰ���ˣ����ˣ�����ʲôҪ˵��",2,"������Ҫ������Ҫ�ͽ���˵�������ҵ���Ӫ��/sure2leave", "ûʲô����ֻ�������./OnCancel" )
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