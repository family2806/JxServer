if MODEL_GAMESERVER == 1 then
	IncludeLib("TONG")
	Include("\\script\\tong\\tong_header.lua")
end

function  main(nItem)
	local _Name, nTongID = GetTongName()
	if(nTongID == 0) then
		Msg2Player("�㲻�ڰ���У��޷�ʹ�ô˵���");
		return 1
	end
	local figure = TONGM_GetFigure(nTongID, GetName())
	if (figure == TONG_MASTER or figure == TONG_ELDER)then
		Say("<#>�����߿��԰Ѱ��ȫ�����߳�Ա���ͬһģ��3��Сʱ��Ҫʹ����", 2, "�ţ�����Ҫͳһװ��/#yes("..nItem..")", "�Ȳ�ʹ��/no");
		return 1
	else
		Msg2Player("��ȷǰ����ַǳ��ϣ��޷�ʹ�ô˵���");
		return 1
	end
end

function yes(nItem)
	local a,b = GetTongName();
	if(b == 0) then
		Msg2Player("�㲻�ڰ���У��޷�ʹ�ô˵���");
		return 1
	end
	local figure = TONGM_GetFigure(b, GetName())
	if (figure ~= TONG_MASTER and figure ~= TONG_ELDER)then
		Msg2Player("��ȷǰ����ַǳ��ϣ��޷�ʹ�ô˵���");
		return 1
	end	
	local name = GetName();
	local nfeature  = GetItemParam(nItem, 1);
	if RemoveItemByIndex(nItem) ~= 1 then
		return
	end
	TONG_ChangeAllMemberFeature(b,nfeature,194400)
	Msg2Tong(b, name.."ʹ���˰����ߣ����߰���Ա�����ͬһģ��������3Сʱ");
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