IncludeLib("BATTLE");
Include("\\script\\battles\\battlehead.lua")
Include("\\script\\battles\\boss\\head.lua")
Include("\\script\\battles\\modified_transport.lua")

--����Ա
function main()
	Say("���ǰ��: �������ǰ��,����Ҫʲô����˵?",2, "���ҵ�ǰ��!/transport", "û����./cancel");
end

--����
function transport()
	
	if GetMissionV(MS_TIMER1) < RUNGAME_TIME then 
		Say("���ǰ��: ս�»�δ�򿪣�����²�Ҫ���꣡!",1, "������Ѫ���ڣ���������֮����Ч���!/cancel");
		return
	end
	
	local RestTime =  GetGameTime() - BT_GetData(PL_LASTDEATHTIME) 
	if ( RestTime < TIME_PLAYER_REV) then
		Say((TIME_PLAYER_REV - RestTime) .. " ������ſ����뿪��Ӫ�����ٵ�һ��!", 0)
		return
	end
	
	local nArea = nil;
	local nCamp = BT_GetData(PL_BATTLECAMP);	 
	if nCamp == 1 then
		nArea = BT_GetGameData(GAME_CAMP1AREA);
	else
		nArea = BT_GetGameData(GAME_CAMP2AREA);	
	end	
	tbVNG_Transport:Dialog(nArea)
	 
end

--ȡ��
function cancel()
	return
end