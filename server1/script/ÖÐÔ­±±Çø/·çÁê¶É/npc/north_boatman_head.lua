-- 风陵渡北岸船夫
Include("\\script\\event\\jiefang_jieri\\200904\\shuizei\\shuizei.lua");
Include("\\script\\lib\\common.lua");

local tbNorth_Boatman_Info	=
{
	[1]	= {szNpcname = "船夫甲", tbMap = {336, 1165, 3043}},
	[2]	= {szNpcname = "船夫乙", tbMap = {336, 1299, 2933}},
	[3]	= {szNpcname = "船夫丙", tbMap = {336, 1555, 2829}},
};

function north_boatman_main(nId)
	local szNpcname = %tbNorth_Boatman_Info[nId].szNpcname;
	tbBoatmanDialog	= {format("行，走咯!/#tosouth(%d)", nId), "暂时不走!/no"};
	local nDate = tonumber(GetLocalDate("%Y%m%d"));
--	if (nDate >= jf0904_act_dateS) then
--		tinsert(tbBoatmanDialog, 2, "我来交消灭水贼任务/fullfill_shuizei_act");
--	end
	Say(format("%s: 你想坐船到风陵渡南岸？给我200两白银就行.", szNpcname), getn(tbBoatmanDialog), unpack(tbBoatmanDialog));
end

function tosouth(nId)
	local tbMap 	= %tbNorth_Boatman_Info[nId].tbMap;
	local szNpcname	= %tbNorth_Boatman_Info[nId].szNpcname;
	
	if( GetCash() >= 200 ) then
		NewWorld(unpack(tbMap));
		Pay( 200 );
		DisabledUseTownP(0);
	else
		Talk(1,"",format("%s: 没有钱怎么坐船呢?", szNpcname));
	end
end

function no()
end