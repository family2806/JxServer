-- ����ɱ�������
Include("\\script\\event\\jiefang_jieri\\200904\\shuizei\\shuizei.lua");
Include("\\script\\lib\\common.lua");

local tbNorth_Boatman_Info	=
{
	[1]	= {szNpcname = "�����", tbMap = {336, 1165, 3043}},
	[2]	= {szNpcname = "������", tbMap = {336, 1299, 2933}},
	[3]	= {szNpcname = "�����", tbMap = {336, 1555, 2829}},
};

function north_boatman_main(nId)
	local szNpcname = %tbNorth_Boatman_Info[nId].szNpcname;
	tbBoatmanDialog	= {format("�У��߿�!/#tosouth(%d)", nId), "��ʱ����!/no"};
	local nDate = tonumber(GetLocalDate("%Y%m%d"));
--	if (nDate >= jf0904_act_dateS) then
--		tinsert(tbBoatmanDialog, 2, "����������ˮ������/fullfill_shuizei_act");
--	end
	Say(format("%s: ����������������ϰ�������200����������.", szNpcname), getn(tbBoatmanDialog), unpack(tbBoatmanDialog));
end

function tosouth(nId)
	local tbMap 	= %tbNorth_Boatman_Info[nId].tbMap;
	local szNpcname	= %tbNorth_Boatman_Info[nId].szNpcname;
	
	if( GetCash() >= 200 ) then
		NewWorld(unpack(tbMap));
		Pay( 200 );
		DisabledUseTownP(0);
	else
		Talk(1,"",format("%s: û��Ǯ��ô������?", szNpcname));
	end
end

function no()
end