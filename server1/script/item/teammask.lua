function  main(nItem)
	Say("<#>������߿��԰Ѷ���ȫ���Ա���ͬһģ��2��Сʱ��Ҫʹ����", 2, "�ţ�����Ҫͳһװ��/#yes("..nItem..")", "�Ȳ�ʹ��/no");
	return 1
end

function yes(nItem)
	if(GetTeamSize() <= 0) then
		Msg2Player("�㲻�ڶ����У��޷�ʹ�ô˵���");
		return 1
	end
	local teamid = GetTeam();
	local name = GetName()
	local nfeature = GetItemParam(nItem, 1);
	if RemoveItemByIndex(nItem) ~= 1 then
		return
	end	
	ChangeTeamFeature(teamid, nfeature, 129600);
	Msg2Team(name.."ʹ���˶�����ߣ���Ա�����ͬһģ��������2Сʱ");
end

function GetDesc(nItem)
	local nNpcSettingIdx = GetItemParam(nItem, 1)
	local nAction = random(0, 13)
	local szSpr = GetMaskActionSpr(nNpcSettingIdx, nAction)
	if (not szSpr)then 
		return ""
	end
	return "<spr="..szSpr..">"
end

function no()
end