--by ��־ɽ [2006-09-12]
--2006����֮�������,��ͨ�������ڵ��Ͽ��Եõ�˫������
--Illustration: ���� -- lightcage au06- -- midautumn2006

if (not __H_ITEM_LIGHTCAGE__) then
	__H_ITEM_LIGHTCAGE__ = 1;
	
Include([[\script\event\mid_autumn06\head.lua]]);

AU06_MINUTE = 18 * 60;
--nIndex
tab_light = {
	{1241, "�ʵ�����", 10},
	{1242, "���ǵ���", 20},
	{1243, "������", 30},
	{1244, "������", 40},
	{1245, "�������", 50},
	{1246, "��ʵ���", 60}
}
--������ں���
function main(sel)
	local nDate = tonumber(GetLocalDate("%Y%m%d"));
	if (nDate >= 20061021 or nDate < AU06_BEGINDATE or gb_GetTask("midautumn2006_city_all", 1) ~= 0) then --
		Say("���ڻʱ�䣬����ʹ�á�", 0);
		return 1;
	end;
	
	if (au06_IsPayed_player() == 0) then
		Say("ֻ��50�����ϳ�ֵ��Ҳ��ܷ��õ�����", 0);
		return 1;
	end;
	
	local nCount = getn(tab_light);
	if (nIndex > nCount) then
		nIndex = nCount;
	elseif (nIndex < 1) then
		nIndex = 1;
	end;
	
	--��һ�������ڵ���
	w, x, y = GetWorldPos();
	world = SubWorldID2Idx(w);
	DropItem(world, x * 32, y * 32, -1, 6, 1, tab_light[nIndex][1], 1, 0, 0, 0);

	--���轱���͹���
	szName = tab_light[nIndex][2];
	time = tab_light[nIndex][3];
	if (GetItemParam(sel, 1) == 1) then
		AddSkillState(440, 1, 1, time * AU06_MINUTE);
	Msg2Player("��ʹ����һ��<color=yellow>"..szName.."<color>���������<color=yellow>"..time.."Сʱ<color>����˫��ʱ���<color=yellow>"..time.."Сʱ<color>120�����ܾ���˫��ʱ�䡣");
	else
		Msg2Player("��ʹ����һ��<color=yellow>"..szName.."<color>.");
	end;
	return 0
end


function IsPickable( nItemIndex, nPlayerIndex )
    if (1 == GetItemParam(nItemIndex, 1)) then
       return 1;
    end
    Msg2Player("<color=yellow> ɫ����˸����. <color>")
	return 0;
end

function PickUp( nItemIndex, nPlayerIndex )
    return 1;
end


end; --//end of __H_ITEM_LIGHTCAGE__
--AddSkillState(440, 20, 1,32400)--30�����ڻ��˫������ʱ�䡣